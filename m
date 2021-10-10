Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5E742834D
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Oct 2021 21:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbhJJTYW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 Oct 2021 15:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbhJJTYV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 Oct 2021 15:24:21 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D69C06161C;
        Sun, 10 Oct 2021 12:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=x6CwcmPbUPfmUYETToBP1qbHRKqr4+7yeB4/xu8is44=; b=oK5et9c79wUYggmWFTX056Ergx
        9AJIY5Hb7El3eJdjbvXslvNYFCzGHh0Q9L/HnX4uxYlBktIIwPw3YiqGzLwhHN3anVwOZj+Cn+ivu
        s22g9inW86aJDzRpwPVh16+hmnHhKxVOyv1dAV/8RsADKl4GYSI+seH1C5uYShF+nk3WmqGVNXPxP
        tlNvD3i0NLGh6VK0nYfpfy+/QbuTMkC7G4XpJS6paHcPUsHCbglatgUjU6IA0uLfNWWOZKbP9U5Ni
        lfdLE7GMcKnWKBPoZieOYLahhmTjlgBmmoHuFsErAPeR2QOoPnJa8eR2/j+YwVlNBlqDsvfa/wAsG
        WbSJ9h8Q==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mZeOs-007IpE-Bu; Sun, 10 Oct 2021 19:22:22 +0000
Subject: Re: [PATCH v3 05/11] clk: Introduce clk-tps68470 driver
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
 <20211010185707.195883-6-hdegoede@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2c4a0997-1f32-0ed1-ad2e-bfce1afd85f1@infradead.org>
Date:   Sun, 10 Oct 2021 12:22:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211010185707.195883-6-hdegoede@redhat.com>
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
> This commit adds a driver for the clocks provided by the tps68470,
> and is designed to bind to the platform_device registered by the
> intel_skl_int3472 module.
> 
> This is based on this out of tree driver written by Intel:
> https://github.com/intel/linux-intel-lts/blob/4.14/base/drivers/clk/clk-tps68470.c
> with various cleanups added.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Update the comment on why a subsys_initcall is used to register the drv
> - Fix trailing whitespice on line 100
> ---
>   drivers/clk/Kconfig          |   6 +
>   drivers/clk/Makefile         |   1 +
>   drivers/clk/clk-tps68470.c   | 256 +++++++++++++++++++++++++++++++++++
>   include/linux/mfd/tps68470.h |  11 ++
>   4 files changed, 274 insertions(+)
>   create mode 100644 drivers/clk/clk-tps68470.c
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c5b3dc97396a..7dffecac83d1 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -169,6 +169,12 @@ config COMMON_CLK_CDCE706
>   	help
>   	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
>   
> +config COMMON_CLK_TPS68470
> +	tristate "Clock Driver for TI TPS68470 PMIC"
> +	depends on I2C && REGMAP_I2C && INTEL_SKL_INT3472
> +	help
> +	 This driver supports the clocks provided by TPS68470

End that sentence with a period (full stop): '.'.

Also it should be indented with one tab + 2 spaces.

-- 
~Randy
