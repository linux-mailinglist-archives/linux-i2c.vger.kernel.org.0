Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517D239443E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 16:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235340AbhE1Of4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 10:35:56 -0400
Received: from mga03.intel.com ([134.134.136.65]:18551 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232426AbhE1Of4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 10:35:56 -0400
IronPort-SDR: ZDUmCQWng+6srzxGvXbBJP376Ff1e+Ah+9zIuOTl83gPvhnDCjRqkIqwhzMrds0pwcL2zX7RVN
 HNBn/mDm0cKg==
X-IronPort-AV: E=McAfee;i="6200,9189,9998"; a="203001122"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="203001122"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 07:34:19 -0700
IronPort-SDR: mCew1Qr6BN0c9OArdarjbLKqFVBaxV6YOaThPPq21A6ZJV6X3j7sFEOBsTVXDJxpUeeipySz6N
 5twfoJCcjIjg==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="415307717"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2021 07:34:16 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lmdYz-00FLMQ-TT; Fri, 28 May 2021 17:34:13 +0300
Date:   Fri, 28 May 2021 17:34:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: adjust to removing i2c designware platform
 data
Message-ID: <YLD/ZQiX5VhpWJg7@smile.fi.intel.com>
References: <20210419061809.15045-1-lukas.bulwahn@gmail.com>
 <CAHp75Vfv0FQGXrmpDveOf-cBahoDK3uSPHjPU2RNh6mhFxN7vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vfv0FQGXrmpDveOf-cBahoDK3uSPHjPU2RNh6mhFxN7vQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 19, 2021 at 11:33:16AM +0300, Andy Shevchenko wrote:
> On Mon, Apr 19, 2021 at 9:38 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit 5a517b5bf687 ("i2c: designware: Get rid of legacy platform data")
> > removes ./include/linux/platform_data/i2c-designware.h, but misses to
> > adjust the SYNOPSYS DESIGNWARE I2C DRIVER section in MAINTAINERS.
> >
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> >
> >   warning: no file matches F: include/linux/platform_data/i2c-designware.h
> >
> > Remove the file entry to this removed file as well.
> 
> Oops, I was under the impression I grepped all occurrences, but I have not.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Thanks for the catch!

Wolfram, isn't it forgotten somehow?

-- 
With Best Regards,
Andy Shevchenko


