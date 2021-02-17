Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87EA531DAE7
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Feb 2021 14:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbhBQNqa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Feb 2021 08:46:30 -0500
Received: from mga11.intel.com ([192.55.52.93]:49319 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231748AbhBQNq0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Feb 2021 08:46:26 -0500
IronPort-SDR: AGNfUCZ4eQmR1OyD13cQ5ZkA21767Y9Z/Gl4fpy30PzY09PX2RH0J29+/bYgQVRhQ1qOwoGtYs
 4VM0ui33Z5LA==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="179687483"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="179687483"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 05:44:40 -0800
IronPort-SDR: V7ayCDOY8nnXq9NkW+ZHBLE6NemCXzcUqKAiDmar80O1x3cENFgF3lrNvMoRPtTV/rXjRc2/d8
 4ZzHff33vwCw==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="494108194"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 05:44:34 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lCN83-005iZj-Ne; Wed, 17 Feb 2021 15:44:31 +0200
Date:   Wed, 17 Feb 2021 15:44:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        helgaas@kernel.org, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] Documentation: devres: Add
 pcim_alloc_irq_vectors()
Message-ID: <YC0dv5zlymiwlH0P@smile.fi.intel.com>
References: <20210216160249.749799-1-zhengdejin5@gmail.com>
 <20210216160249.749799-3-zhengdejin5@gmail.com>
 <YCv8nCX0ZdAb+CHm@rocinante>
 <20210217105004.GA766103@nuc8i5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210217105004.GA766103@nuc8i5>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 17, 2021 at 06:50:04PM +0800, Dejin Zheng wrote:
> On Tue, Feb 16, 2021 at 06:10:52PM +0100, Krzysztof Wilczyński wrote:

...

> > Having said that, people might ask - how does it simplify the error
> > handling path?
> > 
> > You might have to back this with a line of two to explain how does the
> > change achieved that, so that when someone looks at the commit message
> > it would be clear what the benefits of the change were.

> The device-managed function is a conventional concept that every developer
> knows. So don't worry about this. And I really can't explain its operation
> mechanism to you in a sentence or two. If you are really interested, you
> can read the relevant code.

I tend on agree on the above. It would be enough to spell it clearly that it's
part of devres API (Managed Device Resource) and we are fine.

-- 
With Best Regards,
Andy Shevchenko


