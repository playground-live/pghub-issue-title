require 'pghub/base'
require 'pghub/issue_title/version'

class IssueUrlNotFound < StandardError; end

module Pghub
  module IssueTitle
    class << self
      def post(issue_path, input)
        issue_client = GithubAPI.new(issue_path_from(input))
        content = issue_client.get_title

        comment_client = GithubAPI.new(issue_path)
        comment_client.post(content)
      end

      private

      def issue_path_from(input)
        reg_organization         = %r{#{Pghub.config.github_organization}\/}
        ref_issue_url            = %r{ref https:\/\/github.com\/#{Pghub.config.github_organization}\/.+\/\d+}
        ref_completion_issue_url = %r{ref #(\d+)}

        if input.match(ref_issue_url).present?
          matched_word = input.match(ref_issue_url)[0]
          issue_url = matched_word.match(reg_organization).post_match
        elsif input.match(ref_completion_issue_url).present?
          issue_num = input.match(ref_completion_issue_url)[1]
          data = issue_path.split('/')
          data[data.length - 1] = issue_num
          issue_url = data.join('/')
        else
          raise IssueUrlNotFound, 'issue_url is not found.'
        end

        issue_url.gsub(/pull/, 'issues')
      end
    end
  end
end
