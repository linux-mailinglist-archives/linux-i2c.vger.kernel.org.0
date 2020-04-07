Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABDD1A123D
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgDGQ4J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:56:09 -0400
Received: from mga04.intel.com ([192.55.52.120]:27905 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbgDGQ4J (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Apr 2020 12:56:09 -0400
IronPort-SDR: nsUHeCQOTtKd2+wgwUz9dfQkgo2vsfdHfILwfpW4hZiWlCFw4R/faFtTgpMJzfUoBgUuabwfAm
 yqe6lEjlm4fw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 09:56:07 -0700
IronPort-SDR: YKqw7IJZIbnXpTnkUrnMft+/VeegHfN+UmzF0cStQx8x2Z54EFBvaGfW3i+uytMaWqLC/5yLRU
 cxwBY6TJ2gKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,355,1580803200"; 
   d="scan'208";a="275160916"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 07 Apr 2020 09:55:56 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jLrW0-00GTap-OF; Tue, 07 Apr 2020 19:55:56 +0300
Date:   Tue, 7 Apr 2020 19:55:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
        nsekhar@ti.com, bgolaszewski@baylibre.com,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        baruch@tkos.co.il, wsa+renesas@sang-engineering.com,
        kgene@kernel.org, krzk@kernel.org, paul@crapouillou.net,
        vz@mleia.com, khilman@baylibre.com, matthias.bgg@gmail.com,
        gregory.clement@bootlin.com, rrichter@marvell.com,
        afaerber@suse.de, manivannan.sadhasivam@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
        baohua@kernel.org, linus.walleij@linaro.org, mripard@kernel.org,
        wens@csie.org, ardb@kernel.org, michal.simek@xilinx.com,
        gcherian@marvell.com, jun.nie@linaro.org, shawnguo@kernel.org,
        rayagonda.kokatanur@broadcom.com, lori.hikichi@broadcom.com,
        nishkadg.linux@gmail.com, kstewart@linuxfoundation.org,
        allison@lohutok.net, gregkh@linuxfoundation.org,
        tglx@linutronix.de, bigeasy@linutronix.de, info@metux.net,
        hslester96@gmail.com, narmstrong@baylibre.com,
        martin.blumenstingl@googlemail.com, qii.wang@mediatek.com,
        drinkcat@chromium.org, hsinyi@chromium.org, fparent@baylibre.com,
        opensource@jilayne.com, swinslow@gmail.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 00/28] convert to devm_platform_ioremap_resource
Message-ID: <20200407165556.GK3676135@smile.fi.intel.com>
References: <20200407163741.17615-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407163741.17615-1-zhengdejin5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 08, 2020 at 12:37:13AM +0800, Dejin Zheng wrote:
> this patch sets use devm_platform_ioremap_resource() to simplify code,
> which contains platform_get_resource() and devm_ioremap_resource(). so
> use it to replace the platform_get_resource() and
> devm_ioremap_resource().

Please, use something like below next time when you generate Cc list:

	scripts/get_maintainer.pl --git --git-min-percent=67 ...

P.S. I have no idea why my name in this Cc list.

> Dejin Zheng (28):
>   i2c: img-scb: convert to devm_platform_ioremap_resource
>   i2c: mv64xxx: convert to devm_platform_ioremap_resource
>   i2c: owl: convert to devm_platform_ioremap_resource
>   i2c: exynos5: convert to devm_platform_ioremap_resource
>   i2c: mt65xx: convert to devm_platform_ioremap_resource
>   i2c: designware: convert to devm_platform_ioremap_resource
>   i2c: zx2967: convert to devm_platform_ioremap_resource
>   i2c: xlp9xx: convert to devm_platform_ioremap_resource
>   i2c: xiic: convert to devm_platform_ioremap_resource
>   i2c: synquacer: convert to devm_platform_ioremap_resource
>   i2c: rk3x: convert to devm_platform_ioremap_resource
>   i2c: qup: convert to devm_platform_ioremap_resource
>   i2c: meson: convert to devm_platform_ioremap_resource
>   i2c: hix5hd2: convert to devm_platform_ioremap_resource
>   i2c: emev2: convert to devm_platform_ioremap_resource
>   i2c: jz4780: convert to devm_platform_ioremap_resource
>   i2c: altera: convert to devm_platform_ioremap_resource
>   i2c: axxia: convert to devm_platform_ioremap_resource
>   i2c: bcm-iproc: convert to devm_platform_ioremap_resource
>   i2c: davinci: convert to devm_platform_ioremap_resource
>   i2c: digicolor: convert to devm_platform_ioremap_resource
>   i2c: lpc2k: convert to devm_platform_ioremap_resource
>   i2c: sirf: convert to devm_platform_ioremap_resource
>   i2c: stu300: convert to devm_platform_ioremap_resource
>   i2c: sun6i-p2wi: convert to devm_platform_ioremap_resource
>   i2c: xlr: convert to devm_platform_ioremap_resource
>   i2c: bcm-kona: convert to devm_platform_ioremap_resource
>   i2c: octeon-platdrv: convert to devm_platform_ioremap_resource
> 
>  drivers/i2c/busses/i2c-altera.c             | 4 +---
>  drivers/i2c/busses/i2c-axxia.c              | 4 +---
>  drivers/i2c/busses/i2c-bcm-iproc.c          | 8 ++------
>  drivers/i2c/busses/i2c-bcm-kona.c           | 4 +---
>  drivers/i2c/busses/i2c-davinci.c            | 4 +---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 8 ++------
>  drivers/i2c/busses/i2c-digicolor.c          | 4 +---
>  drivers/i2c/busses/i2c-emev2.c              | 4 +---
>  drivers/i2c/busses/i2c-exynos5.c            | 4 +---
>  drivers/i2c/busses/i2c-hix5hd2.c            | 4 +---
>  drivers/i2c/busses/i2c-img-scb.c            | 4 +---
>  drivers/i2c/busses/i2c-jz4780.c             | 4 +---
>  drivers/i2c/busses/i2c-lpc2k.c              | 4 +---
>  drivers/i2c/busses/i2c-meson.c              | 4 +---
>  drivers/i2c/busses/i2c-mt65xx.c             | 7 ++-----
>  drivers/i2c/busses/i2c-mv64xxx.c            | 4 +---
>  drivers/i2c/busses/i2c-octeon-platdrv.c     | 4 +---
>  drivers/i2c/busses/i2c-owl.c                | 4 +---
>  drivers/i2c/busses/i2c-qup.c                | 4 +---
>  drivers/i2c/busses/i2c-rk3x.c               | 4 +---
>  drivers/i2c/busses/i2c-sirf.c               | 4 +---
>  drivers/i2c/busses/i2c-stu300.c             | 4 +---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c         | 4 +---
>  drivers/i2c/busses/i2c-synquacer.c          | 4 +---
>  drivers/i2c/busses/i2c-xiic.c               | 4 +---
>  drivers/i2c/busses/i2c-xlp9xx.c             | 4 +---
>  drivers/i2c/busses/i2c-xlr.c                | 4 +---
>  drivers/i2c/busses/i2c-zx2967.c             | 4 +---
>  28 files changed, 31 insertions(+), 92 deletions(-)
> 
> -- 
> 2.25.0
> 

-- 
With Best Regards,
Andy Shevchenko


