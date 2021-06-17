Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66813AB17C
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jun 2021 12:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbhFQKjT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Jun 2021 06:39:19 -0400
Received: from mga14.intel.com ([192.55.52.115]:47103 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229868AbhFQKjS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Jun 2021 06:39:18 -0400
IronPort-SDR: HMqzS92VmNmeOyLbr1mce4LCXsK/Z44uRQ+iCsOiMHeKiAgENrS1my1qNzX9KoV7TYJnEGF1Ka
 WD5uO9bt47RQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="206163266"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="206163266"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 03:37:10 -0700
IronPort-SDR: 2PuCF4bAZ+esssDVmmcjwCVsseGKNTfBNg7OYii1MRpg6OfOV1PUiZnSC5HZrbj40EdeeCwvl5
 rHTKc6JGGrYw==
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="404609716"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 03:37:04 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ltpON-003Hgz-VB; Thu, 17 Jun 2021 13:36:59 +0300
Date:   Thu, 17 Jun 2021 13:36:59 +0300
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
        chiawei_wang@aspeedtech.com, troy_lee@aspeedtech.com,
        steven_lee@aspeedtech.com
Subject: Re: [PATCH 3/3] i2c:support new register set for ast2600
Message-ID: <YMslyzUKp/7J0ncu@smile.fi.intel.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-4-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617094424.27123-4-jamin_lin@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 17, 2021 at 05:43:40PM +0800, Jamin Lin wrote:
> Add i2c new driver to support new register set for AST2600.
> AST2600 support three modes for data transfer which are
> byte mode, buffer mode and dma mode, respectively.
> The global driver of i2c is used to set the new register
> mode and define the base clock frequency
> of baseclk_1~baseclk_4.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  drivers/i2c/busses/Kconfig              |   11 +
>  drivers/i2c/busses/Makefile             |    1 +
>  drivers/i2c/busses/ast2600-i2c-global.c |  205 +++
>  drivers/i2c/busses/ast2600-i2c-global.h |   25 +
>  drivers/i2c/busses/i2c-new-aspeed.c     | 1796 +++++++++++++++++++++++

I commented _something_ (but read comments carefully, they will cover much
more). The overall it seems you have to:
 - shrink the code base by at least ~15% (it's possible), i.e. -200 LOCs
 - rethink how you do calculations and bit operations
 - better code style

-- 
With Best Regards,
Andy Shevchenko


