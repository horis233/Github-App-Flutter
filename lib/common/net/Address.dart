import 'package:gsy_github_app_flutter/common/config/Config.dart';

///Address
class Address {
  static const String host = "https://api.github.com/";
  static const String hostWeb = "https://github.com/";
  static const String graphicHost = 'https://ghchart.rshah.org/';

  ///Auth post
  static getAuthorization() {
    return "${host}authorizations";
  }

  ///search get
  static search(q, sort, order, type, page, [pageSize = Config.PAGE_SIZE]) {
    if (type == 'user') {
      return "${host}search/users?q=$q&page=$page&per_page=$pageSize";
    }
    if (sort == null) {
      sort = "best%20match";
    }
    if (order == null) {
      order = "desc";
    }
    if (page == null) {
      page = 1;
    }
    if (pageSize == null) {
      pageSize = Config.PAGE_SIZE;
    }
    return "${host}search/repositories?q=$q&sort=$sort&order=$order&page=$page&per_page=$pageSize";
  }

  ///search topic tag
  static searchTopic(topic) {
    return "${host}search/repositories?q=topic:$topic&sort=stars&order=desc";
  }

  ///user repo get
  static userRepos(userName, sort) {
    if (sort == null) {
      sort = 'pushed';
    }
    return "${host}users/$userName/repos?sort=$sort";
  }

  ///repo details get
  static getReposDetail(reposOwner, reposName) {
    return "${host}repos/$reposOwner/$reposName";
  }

  ///repo actions get
  static getReposEvent(reposOwner, reposName) {
    return "${host}networks/$reposOwner/$reposName/events";
  }

  ///repo fork get
  static getReposForks(reposOwner, reposName) {
    return "${host}repos/$reposOwner/$reposName/forks";
  }

  ///repo star get
  static getReposStar(reposOwner, reposName) {
    return "${host}repos/$reposOwner/$reposName/stargazers";
  }

  ///repo watch get
  static getReposWatcher(reposOwner, reposName) {
    return "${host}repos/$reposOwner/$reposName/subscribers";
  }

  ///repo commit get
  static getReposCommits(reposOwner, reposName) {
    return "${host}repos/$reposOwner/$reposName/commits";
  }

  ///repo commit info get
  static getReposCommitsInfo(reposOwner, reposName, sha) {
    return "${host}repos/$reposOwner/$reposName/commits/$sha";
  }

  ///repo issue get
  static getReposIssue(reposOwner, reposName, state, sort, direction) {
    if (state == null) {
      state = 'all';
    }
    if (sort == null) {
      sort = 'created';
    }
    if (direction == null) {
      direction = 'desc';
    }
    return "${host}repos/$reposOwner/$reposName/issues?state=$state&sort=$sort&direction=$direction";
  }

  ///repo release get
  static getReposRelease(reposOwner, reposName) {
    return "${host}repos/$reposOwner/$reposName/releases";
  }

  ///repo tag get
  static getReposTag(reposOwner, reposName) {
    return "${host}repos/$reposOwner/$reposName/tags";
  }

  ///repo contributors get
  static getReposContributors(reposOwner, reposName) {
    return "${host}repos/$reposOwner/$reposName/contributors";
  }

  ///repo issue comment get
  static getIssueComment(reposOwner, reposName, issueNumber) {
    return "${host}repos/$reposOwner/$reposName/issues/$issueNumber/comments";
  }

  ///repo issue get
  static getIssueInfo(reposOwner, reposName, issueNumber) {
    return "${host}repos/$reposOwner/$reposName/issues/$issueNumber";
  }

  ///add issue comment post
  static addIssueComment(reposOwner, reposName, issueNumber) {
    return "${host}repos/$reposOwner/$reposName/issues/$issueNumber/comments";
  }

  ///edit issue put
  static editIssue(reposOwner, reposName, issueNumber) {
    return "${host}repos/$reposOwner/$reposName/issues/$issueNumber";
  }

  ///lock issue put
  static lockIssue(reposOwner, reposName, issueNumber) {
    return "${host}repos/$reposOwner/$reposName/issues/$issueNumber/lock";
  }

  ///create issue post
  static createIssue(reposOwner, reposName) {
    return "${host}repos/$reposOwner/$reposName/issues";
  }

  ///search issue
  static repositoryIssueSearch(q) {
    return "${host}search/issues?q=$q";
  }

  ///edit commit patch, delete
  static editComment(reposOwner, reposName, commentId) {
    return "${host}repos/$reposOwner/$reposName/issues/comments/$commentId";
  }

  ///self star get
  static myStar(sort) {
    if (sort == null) {
      sort = 'updated';
    }
    return "${host}users/starred?sort=$sort";
  }

  ///user star get
  static userStar(userName, sort) {
    if (sort == null) {
      sort = 'updated';
    }
    return "${host}users/$userName/starred?sort=$sort";
  }

  ///star put
  static resolveStarRepos(reposOwner, repos) {
    return "${host}user/starred/$reposOwner/$repos";
  }

  ///subscription watch put
  static resolveWatcherRepos(reposOwner, repos) {
    return "${host}user/subscriptions/$reposOwner/$repos";
  }

  ///repos owner repo  get
  static reposData(reposOwner, repos) {
    return "${host}repos/$reposOwner/$repos/contents";
  }

  ///the data under repo get
  static reposDataDir(reposOwner, repos, path, [branch = 'master']) {
    return "${host}repos/$reposOwner/$repos/contents/$path" + ((branch == null) ? "" : ("?ref=" + branch));
  }

  ///README file address get
  static readmeFile(reposNameFullName, curBranch) {
    return host + "repos/" + reposNameFullName + "/" + "readme" + ((curBranch == null) ? "" : ("?ref=" + curBranch));
  }

  ///self info get
  static getMyUserInfo() {
    return "${host}user";
  }

  ///user info get
  static getUserInfo(userName) {
    return "${host}users/$userName";
  }

  ///follow get
  static doFollow(name) {
    return "${host}user/following/$name";
  }

  ///user follow get
  static getUserFollow(userName) {
    return "${host}users/$userName/following";
  }

  ///self follower get
  static getMyFollower() {
    return "${host}user/followers";
  }

  ///user follower get
  static getUserFollower(userName) {
    return "${host}users/$userName/followers";
  }

  ///create fork post
  static createFork(reposOwner, reposName) {
    return "${host}repos/$reposOwner/$reposName/forks";
  }

  ///branch get
  static getBranches(reposOwner, reposName) {
    return "${host}repos/$reposOwner/$reposName/branches";
  }

  ///fork get
  static getForkUser(reposOwner, reposName, sort) {
    if (sort == null) {
      sort = 'newest';
    }
    return "${host}repos/$reposOwner/$reposName/forks?sort=$sort";
  }

  ///readme get
  static getReadme(reposOwner, reposName) {
    return "${host}repos/$reposOwner/$reposName/readme";
  }

  ///event get
  static getEventReceived(userName) {
    return "${host}users/$userName/received_events";
  }

  ///user relative event get
  static getEvent(userName) {
    return "${host}users/$userName/events";
  }

  ///group member
  static getMember(orgs) {
    return "${host}orgs/$orgs/members";
  }

  ///get user organization
  static getUserOrgs(userName) {
    return "${host}users/$userName/orgs";
  }

  ///通知 get
  static getNotifation(all, participating) {
    if (all == null && participating == null) {
      return "${host}notifications";
    }
    if (all == null) {
      all = false;
    }
    if (participating == null) {
      participating = false;
    }
    return "${host}notifications?all=$all&participating=$participating";
  }

  ///patch
  static setNotificationAsRead(threadId) {
    return "${host}notifications/threads/$threadId";
  }

  ///put
  static setAllNotificationAsRead() {
    return "${host}notifications";
  }

  ///trending get
  static trending(since, languageType) {
    if (languageType) {
      return "https://github.com/trending/$languageType?since=$since";
    }
    return "https://github.com/trending?since=$since";
  }

  ///paging get
  static getPageParams(tab, page, [pageSize = Config.PAGE_SIZE]) {
    if (page != null) {
      if (pageSize != null) {
        return "${tab}page=$page&per_page=$pageSize";
      } else {
        return "${tab}page=$page";
      }
    } else {
      return "";
    }
  }
}