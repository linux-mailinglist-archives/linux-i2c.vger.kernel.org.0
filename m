Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CAF33AC851
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jun 2021 12:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbhFRKDI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Jun 2021 06:03:08 -0400
Received: from mga02.intel.com ([134.134.136.20]:20412 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232553AbhFRKDG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Jun 2021 06:03:06 -0400
IronPort-SDR: /K5YjHuk7cdga+czhL4InLIIpySyQ0tRspGoChJRXfVqhp+RuBBJwRDxmrRG2E/LYrLKV88TeJ
 ev0CMuwrYbkA==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="193659193"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; 
   d="scan'208";a="193659193"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2021 03:00:57 -0700
IronPort-SDR: 5gdfw7IuCHm/YLPTg4K/dBM62CuMxNb7JWSCYMa71bVWYnVFOyYu4OCNjIT6DXZ8053gWgdzHe
 xoIJAgLxSW1w==
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; 
   d="scan'208";a="416401095"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2021 03:00:51 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1luBIt-003ZLy-Lb; Fri, 18 Jun 2021 13:00:47 +0300
Date:   Fri, 18 Jun 2021 13:00:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jamin Lin <jamin_lin@aspeedtech.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>, Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Mike Rapoport <rppt@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        ChiaWei Wang <chiawei_wang@aspeedtech.com>,
        Troy Lee <troy_lee@aspeedtech.com>,
        Steven Lee <steven_lee@aspeedtech.com>
Subject: Re: [PATCH 3/3] i2c:support new register set for ast2600
Message-ID: <YMxuz03aTijWH6uj@smile.fi.intel.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-4-jamin_lin@aspeedtech.com>
 <YMslyzUKp/7J0ncu@smile.fi.intel.com>
 <20210618035855.GB31659@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618035855.GB31659@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 18, 2021 at 11:58:55AM +0800, Jamin Lin wrote:
> The 06/17/2021 10:36, Andy Shevchenko wrote:
> > On Thu, Jun 17, 2021 at 05:43:40PM +0800, Jamin Lin wrote:
> > > Add i2c new driver to support new register set for AST2600.
> > > AST2600 support three modes for data transfer which are
> > > byte mode, buffer mode and dma mode, respectively.
> > > The global driver of i2c is used to set the new register
> > > mode and define the base clock frequency
> > > of baseclk_1~baseclk_4.

> >  - shrink the code base by at least ~15% (it's possible), i.e. -200 LOCs
> Can you describe it more detail?
> Do you mean I should separate the patch file to fix size limitation? 

No. Based on my brief review you introduce to many redundant LOCs (lines of
code). Remove them, refactor the code, make it small and neat and easy to read
and understand. It is possible to achieve!

> >  - rethink how you do calculations and bit operations
> >  - better code style
> >
> Thanks for your review and very good suggestion
> I will update them and sent patch again.
> By the way, I received test failed email from Robot due to compiling
> warning. I will fix them, too.

-- 
With Best Regards,
Andy Shevchenko


