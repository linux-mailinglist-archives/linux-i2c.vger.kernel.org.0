Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B42CA17B9A6
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 10:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgCFJ4O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 04:56:14 -0500
Received: from mga04.intel.com ([192.55.52.120]:53557 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbgCFJ4O (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Mar 2020 04:56:14 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2020 01:56:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,521,1574150400"; 
   d="scan'208";a="264410624"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2020 01:56:13 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jA9iJ-007K5R-7x; Fri, 06 Mar 2020 11:56:15 +0200
Date:   Fri, 6 Mar 2020 11:56:15 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v1 3/5] i2c: mux: pca954x: Drop useless validation for
 optional GPIO descriptor
Message-ID: <20200306095615.GR1224808@smile.fi.intel.com>
References: <20200305155352.39095-1-andriy.shevchenko@linux.intel.com>
 <20200305155352.39095-3-andriy.shevchenko@linux.intel.com>
 <3a0bd56d-0efb-e1cf-c050-05deefc4433a@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a0bd56d-0efb-e1cf-c050-05deefc4433a@axentia.se>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 05, 2020 at 09:19:05PM +0000, Peter Rosin wrote:
> On 2020-03-05 16:53, Andy Shevchenko wrote:
> > There is no need to perform a check for optional GPIO descriptor.
> > If it's NULL, the API can handle it correctly.
> 
> But, the removed test is not only (needlessly) protecting the optional
> descriptor, it also shortcuts the udelays. I think it is valid to
> skip those pointless udelays when no reset is happening anyway. Not
> that it matters all that much when the delays are as short as this, but
> I simply think it looks sensible to skip the delays when that are not
> needed.

Perhaps moving it to a helper where we may leave the check.

> So, I do not think this change is an improvement.

I have no strong opinion, I simple will drop it then.
Thank you for review!

-- 
With Best Regards,
Andy Shevchenko


