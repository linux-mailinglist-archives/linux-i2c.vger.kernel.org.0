Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF9742834B
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Oct 2021 21:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbhJJTYW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 Oct 2021 15:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbhJJTYV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 Oct 2021 15:24:21 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC04C061570;
        Sun, 10 Oct 2021 12:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=e8qJp5bjbNO6ynu1OK5lYW1OQ2T1qe9KTd0R+wZzlt4=; b=vIjjsceIoWNloIdi8ydyjvkpoY
        8fKAWBW1Qaf+pQfrqBnQwkGLRsJGAqOOqWoVt/mSZ4ZMVCQ3PMAW6+AmJ+5uCfHt7WbtcI4XL9ANo
        UKX9afNtbzzfA+tD0qKjz1LWJT/fKFqLu6XCIgjM864j7zrzkmTHyLya/euzEyFPq5l0+dIOSGoQv
        qOHMtmIRR5Boqd83WZjc+9xtI6UBNwS0hLgqhgxLsuKvY0t3Poo+65EiXqct8orrkphzDhitb7CD6
        qjBF5tdQttpDyiZ19OkxM5YpT/oSdPlAC6uV6vVBFKuJ58t28pazm2HbNFTmLcL6IQ3uOscfBWReu
        pMGTJyOA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mZeOp-007Ip4-OJ; Sun, 10 Oct 2021 19:22:19 +0000
Subject: Re: [PATCH v3 04/11] regulator: Introduce tps68470-regulator driver
To:     Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211010185707.195883-1-hdegoede@redhat.com>
 <20211010185707.195883-5-hdegoede@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9f326a0f-02bb-4132-3f34-0c9282b88526@infradead.org>
Date:   Sun, 10 Oct 2021 12:22:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211010185707.195883-5-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/10/21 11:57 AM, Hans de Goede wrote:
> The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
> the kernel the Regulators and Clocks are controlled by an OpRegion
> driver designed to work with power control methods defined in ACPI, but
> some platforms lack those methods, meaning drivers need to be able to
> consume the resources of these chips through the usual frameworks.
> 
> This commit adds a driver for the regulators provided by the tps68470,
> and is designed to bind to the platform_device registered by the
> intel_skl_int3472 module.
> 
> This is based on this out of tree driver written by Intel:
> https://github.com/intel/linux-intel-lts/blob/4.14/base/drivers/regulator/tps68470-regulator.c
> with various cleanups added.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Update the comment on why a subsys_initcall is used to register the drv
> - Make struct regulator_ops const
> ---
>   drivers/regulator/Kconfig              |   9 ++
>   drivers/regulator/Makefile             |   1 +
>   drivers/regulator/tps68470-regulator.c | 193 +++++++++++++++++++++++++
>   3 files changed, 203 insertions(+)
>   create mode 100644 drivers/regulator/tps68470-regulator.c
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 4fd13b06231f..d107af5bff6c 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1339,6 +1339,15 @@ config REGULATOR_TPS65912
>   	help
>   	    This driver supports TPS65912 voltage regulator chip.
>   
> +config REGULATOR_TPS68470
> +	tristate "TI TPS68370 PMIC Regulators Driver"
> +	depends on INTEL_SKL_INT3472
> +	help
> +	  This driver adds support for the TPS68470 PMIC to register
> +	  regulators against the usual framework.
> +
> +	  The module will be called "tps68470-regulator"

End the final sentence with a period (a.k.a. full stop).

-- 
~Randy
