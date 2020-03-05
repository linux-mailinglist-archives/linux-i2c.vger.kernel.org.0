Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8612417AA6F
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Mar 2020 17:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgCEQWz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 11:22:55 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:21494 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725938AbgCEQWz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Mar 2020 11:22:55 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 025GDcWA018220;
        Thu, 5 Mar 2020 17:21:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=LvBEUXCsVOTgxrzjAE0ag3c1os2BGH0KQX/PJr+ZV2M=;
 b=cfWcOi9Gn0emDPo39ZF3uHrz7nOdNRgfE0Zo4ktYOre1yzKGJG6yunCH6lYeZpmvflEi
 UJaIZjZZT293jHVhAVJt89tra2hlhMYFxQVgDYPwgY2F5EtNr7qCCNFR7gRLbGMmuWvI
 LMwOKqS0+l3ykVAOnxoCyb045SSdXu0xUXn4Rp111KEmzzfWwG7FNRNgj/G4NLLFO3Or
 JwEnC9NC4p3n/be3sbeqPnamTSReaUVGzTlJu1mZkntKxvOyEljS5zwohOhhp5f/5Asn
 cLzKWaSoxYFFJ+F7HZ3OIIVbD9nBCcp+62btTYP11SSlvpD1NaiTDUIwb5AKbnnCi9JM 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yfdyd9qyt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Mar 2020 17:21:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7685F10004A;
        Thu,  5 Mar 2020 17:21:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A12A2D376D;
        Thu,  5 Mar 2020 17:21:32 +0100 (CET)
Received: from [10.48.1.172] (10.75.127.47) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Mar
 2020 17:21:30 +0100
Subject: Re: [PATCH v2 3/3] i2c: drivers: Use generic definitions for bus
 frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>
CC:     Thor Thayer <thor.thayer@linux.intel.com>,
        Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <scott.branden@broadcom.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Guenter Roeck <linux@roeck-us.net>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Barry Song <baohua@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20200227122129.65516-1-andriy.shevchenko@linux.intel.com>
 <20200227122129.65516-3-andriy.shevchenko@linux.intel.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <5404d318-6475-23d8-2bc2-bdb34b2e1223@st.com>
Date:   Thu, 5 Mar 2020 17:21:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200227122129.65516-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-05_05:2020-03-05,2020-03-05 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy

For i2c-stm32f4.c and i2c-stm32f7.c

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks

On 2/27/20 1:21 PM, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
> 
> Cc: Thor Thayer <thor.thayer@linux.intel.com>
> Acked-by: Elie Morisse <syniurge@gmail.com>
> Acked-by: Nehal Shah <nehal-bakulchandra.shah@amd.com>
> Cc: Shyam Sundar S K <shyam-sundar.s-k@amd.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Acked-by: Scott Branden <scott.branden@broadcom.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Acked-by: Baruch Siach <baruch@tkos.co.il>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Cc: "Andreas Färber" <afaerber@suse.de>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Chris Brandt <chris.brandt@renesas.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> v2:
>   squash to one patch (Wolfram)
>   used MAX in the definition names (Wolfram)
>   dropped HZ_PER_*
>   added collected tags
> 
>  drivers/i2c/busses/i2c-altera.c             |  6 ++--
>  drivers/i2c/busses/i2c-amd-mp2-plat.c       | 27 +++++++++------
>  drivers/i2c/busses/i2c-aspeed.c             |  2 +-
>  drivers/i2c/busses/i2c-axxia.c              |  4 +--
>  drivers/i2c/busses/i2c-bcm-iproc.c          | 14 ++++----
>  drivers/i2c/busses/i2c-bcm-kona.c           |  8 ++---
>  drivers/i2c/busses/i2c-cadence.c            |  7 ++--
>  drivers/i2c/busses/i2c-designware-platdrv.c | 37 ++++++++++++---------
>  drivers/i2c/busses/i2c-digicolor.c          |  3 +-
>  drivers/i2c/busses/i2c-diolan-u2c.c         | 12 +++----
>  drivers/i2c/busses/i2c-exynos5.c            | 18 ++++------
>  drivers/i2c/busses/i2c-hix5hd2.c            | 10 +++---
>  drivers/i2c/busses/i2c-img-scb.c            |  4 +--
>  drivers/i2c/busses/i2c-imx-lpi2c.c          | 16 +++------
>  drivers/i2c/busses/i2c-imx.c                |  5 +--
>  drivers/i2c/busses/i2c-lpc2k.c              |  6 ++--
>  drivers/i2c/busses/i2c-mt65xx.c             | 21 +++++-------
>  drivers/i2c/busses/i2c-mv64xxx.c            |  6 ++--
>  drivers/i2c/busses/i2c-mxs.c                |  4 +--
>  drivers/i2c/busses/i2c-nomadik.c            |  8 ++---
>  drivers/i2c/busses/i2c-owl.c                |  9 ++---
>  drivers/i2c/busses/i2c-qup.c                | 11 ++----
>  drivers/i2c/busses/i2c-rcar.c               |  2 +-
>  drivers/i2c/busses/i2c-riic.c               |  6 ++--
>  drivers/i2c/busses/i2c-rk3x.c               | 12 +++----
>  drivers/i2c/busses/i2c-s3c2410.c            |  4 +--
>  drivers/i2c/busses/i2c-sh_mobile.c          |  9 ++---
>  drivers/i2c/busses/i2c-sirf.c               |  3 +-
>  drivers/i2c/busses/i2c-sprd.c               |  9 ++---
>  drivers/i2c/busses/i2c-st.c                 |  6 ++--
>  drivers/i2c/busses/i2c-stm32f4.c            |  6 ++--
>  drivers/i2c/busses/i2c-stm32f7.c            | 24 ++++++-------
>  drivers/i2c/busses/i2c-stu300.c             |  6 ++--
>  drivers/i2c/busses/i2c-synquacer.c          |  6 ++--
>  drivers/i2c/busses/i2c-tegra.c              | 18 ++++------
>  drivers/i2c/busses/i2c-uniphier-f.c         |  6 ++--
>  drivers/i2c/busses/i2c-uniphier.c           |  7 ++--
>  drivers/i2c/busses/i2c-xlp9xx.c             |  8 ++---
>  38 files changed, 168 insertions(+), 202 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index 1de23b4f3809..20ef63820c77 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -147,7 +147,7 @@ static void altr_i2c_init(struct altr_i2c_dev *idev)
>  		  (ALTR_I2C_THRESHOLD << ALTR_I2C_CTRL_TCT_SHFT);
>  	u32 t_high, t_low;
>  
> -	if (idev->bus_clk_rate <= 100000) {
> +	if (idev->bus_clk_rate <= I2C_MAX_STANDARD_MODE_FREQ) {
>  		tmp &= ~ALTR_I2C_CTRL_BSPEED;
>  		/* Standard mode SCL 50/50 */
>  		t_high = divisor * 1 / 2;
> @@ -423,10 +423,10 @@ static int altr_i2c_probe(struct platform_device *pdev)
>  				       &idev->bus_clk_rate);
>  	if (val) {
>  		dev_err(&pdev->dev, "Default to 100kHz\n");
> -		idev->bus_clk_rate = 100000;	/* default clock rate */
> +		idev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;	/* default clock rate */
>  	}
>  
> -	if (idev->bus_clk_rate > 400000) {
> +	if (idev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ) {
>  		dev_err(&pdev->dev, "invalid clock-frequency %d\n",
>  			idev->bus_clk_rate);
>  		return -EINVAL;
> diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
> index f5b3f00c6559..5e5b973cae4c 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
> @@ -201,32 +201,37 @@ static int i2c_amd_resume(struct amd_i2c_common *i2c_common)
>  }
>  #endif
>  
> +static const u32 supported_speeds[] = {
> +	I2C_MAX_HIGH_SPEED_MODE_FREQ,
> +	I2C_MAX_TURBO_MODE_FREQ,
> +	I2C_MAX_FAST_PLUS_MODE_FREQ,
> +	I2C_MAX_FAST_MODE_FREQ,
> +	I2C_MAX_STANDARD_MODE_FREQ,
> +};
> +
>  static enum speed_enum i2c_amd_get_bus_speed(struct platform_device *pdev)
>  {
>  	u32 acpi_speed;
>  	int i;
> -	static const u32 supported_speeds[] = {
> -		0, 100000, 400000, 1000000, 1400000, 3400000
> -	};
>  
>  	acpi_speed = i2c_acpi_find_bus_speed(&pdev->dev);
>  	/* round down to the lowest standard speed */
> -	for (i = 1; i < ARRAY_SIZE(supported_speeds); i++) {
> -		if (acpi_speed < supported_speeds[i])
> +	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
> +		if (acpi_speed >= supported_speeds[i])
>  			break;
>  	}
> -	acpi_speed = supported_speeds[i - 1];
> +	acpi_speed = i < ARRAY_SIZE(supported_speeds) ? supported_speeds[i] : 0;
>  
>  	switch (acpi_speed) {
> -	case 100000:
> +	case I2C_MAX_STANDARD_MODE_FREQ:
>  		return speed100k;
> -	case 400000:
> +	case I2C_MAX_FAST_MODE_FREQ:
>  		return speed400k;
> -	case 1000000:
> +	case I2C_MAX_FAST_PLUS_MODE_FREQ:
>  		return speed1000k;
> -	case 1400000:
> +	case I2C_MAX_TURBO_MODE_FREQ:
>  		return speed1400k;
> -	case 3400000:
> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
>  		return speed3400k;
>  	default:
>  		return speed400k;
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index a7be6f24450b..07c1993274c5 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -997,7 +997,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>  	if (ret < 0) {
>  		dev_err(&pdev->dev,
>  			"Could not read bus-frequency property\n");
> -		bus->bus_frequency = 100000;
> +		bus->bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
>  	}
>  
>  	match = of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);
> diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
> index 0214daa913ff..be3681d08a8d 100644
> --- a/drivers/i2c/busses/i2c-axxia.c
> +++ b/drivers/i2c/busses/i2c-axxia.c
> @@ -199,7 +199,7 @@ static int axxia_i2c_init(struct axxia_i2c_dev *idev)
>  	/* Enable Master Mode */
>  	writel(0x1, idev->base + GLOBAL_CONTROL);
>  
> -	if (idev->bus_clk_rate <= 100000) {
> +	if (idev->bus_clk_rate <= I2C_MAX_STANDARD_MODE_FREQ) {
>  		/* Standard mode SCL 50/50, tSU:DAT = 250 ns */
>  		t_high = divisor * 1 / 2;
>  		t_low = divisor * 1 / 2;
> @@ -765,7 +765,7 @@ static int axxia_i2c_probe(struct platform_device *pdev)
>  
>  	of_property_read_u32(np, "clock-frequency", &idev->bus_clk_rate);
>  	if (idev->bus_clk_rate == 0)
> -		idev->bus_clk_rate = 100000;	/* default clock rate */
> +		idev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;	/* default clock rate */
>  
>  	ret = clk_prepare_enable(idev->i2c_clk);
>  	if (ret) {
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index 30efb7913b2e..44be0926b566 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -858,25 +858,25 @@ static int bcm_iproc_i2c_cfg_speed(struct bcm_iproc_i2c_dev *iproc_i2c)
>  	if (ret < 0) {
>  		dev_info(iproc_i2c->device,
>  			"unable to interpret clock-frequency DT property\n");
> -		bus_speed = 100000;
> +		bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
>  	}
>  
> -	if (bus_speed < 100000) {
> +	if (bus_speed < I2C_MAX_STANDARD_MODE_FREQ) {
>  		dev_err(iproc_i2c->device, "%d Hz bus speed not supported\n",
>  			bus_speed);
>  		dev_err(iproc_i2c->device,
>  			"valid speeds are 100khz and 400khz\n");
>  		return -EINVAL;
> -	} else if (bus_speed < 400000) {
> -		bus_speed = 100000;
> +	} else if (bus_speed < I2C_MAX_FAST_MODE_FREQ) {
> +		bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
>  	} else {
> -		bus_speed = 400000;
> +		bus_speed = I2C_MAX_FAST_MODE_FREQ;
>  	}
>  
>  	iproc_i2c->bus_speed = bus_speed;
>  	val = iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
>  	val &= ~BIT(TIM_CFG_MODE_400_SHIFT);
> -	val |= (bus_speed == 400000) << TIM_CFG_MODE_400_SHIFT;
> +	val |= (bus_speed == I2C_MAX_FAST_MODE_FREQ) << TIM_CFG_MODE_400_SHIFT;
>  	iproc_i2c_wr_reg(iproc_i2c, TIM_CFG_OFFSET, val);
>  
>  	dev_info(iproc_i2c->device, "bus set to %u Hz\n", bus_speed);
> @@ -1029,7 +1029,7 @@ static int bcm_iproc_i2c_resume(struct device *dev)
>  	/* configure to the desired bus speed */
>  	val = iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
>  	val &= ~BIT(TIM_CFG_MODE_400_SHIFT);
> -	val |= (iproc_i2c->bus_speed == 400000) << TIM_CFG_MODE_400_SHIFT;
> +	val |= (iproc_i2c->bus_speed == I2C_MAX_FAST_MODE_FREQ) << TIM_CFG_MODE_400_SHIFT;
>  	iproc_i2c_wr_reg(iproc_i2c, TIM_CFG_OFFSET, val);
>  
>  	bcm_iproc_i2c_enable_disable(iproc_i2c, true);
> diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
> index 4e489a9d16fb..948cd6e13cf4 100644
> --- a/drivers/i2c/busses/i2c-bcm-kona.c
> +++ b/drivers/i2c/busses/i2c-bcm-kona.c
> @@ -722,16 +722,16 @@ static int bcm_kona_i2c_assign_bus_speed(struct bcm_kona_i2c_dev *dev)
>  	}
>  
>  	switch (bus_speed) {
> -	case 100000:
> +	case I2C_MAX_STANDARD_MODE_FREQ:
>  		dev->std_cfg = &std_cfg_table[BCM_SPD_100K];
>  		break;
> -	case 400000:
> +	case I2C_MAX_FAST_MODE_FREQ:
>  		dev->std_cfg = &std_cfg_table[BCM_SPD_400K];
>  		break;
> -	case 1000000:
> +	case I2C_MAX_FAST_PLUS_MODE_FREQ:
>  		dev->std_cfg = &std_cfg_table[BCM_SPD_1MHZ];
>  		break;
> -	case 3400000:
> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
>  		/* Send mastercode at 100k */
>  		dev->std_cfg = &std_cfg_table[BCM_SPD_100K];
>  		dev->hs_cfg = &hs_cfg_table[BCM_SPD_3P4MHZ];
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 1105aee6634a..89d58f7d2a25 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -104,9 +104,6 @@
>  
>  #define DRIVER_NAME		"cdns-i2c"
>  
> -#define CDNS_I2C_SPEED_MAX	400000
> -#define CDNS_I2C_SPEED_DEFAULT	100000
> -
>  #define CDNS_I2C_DIVA_MAX	4
>  #define CDNS_I2C_DIVB_MAX	64
>  
> @@ -949,8 +946,8 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>  
>  	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
>  			&id->i2c_clk);
> -	if (ret || (id->i2c_clk > CDNS_I2C_SPEED_MAX))
> -		id->i2c_clk = CDNS_I2C_SPEED_DEFAULT;
> +	if (ret || (id->i2c_clk > I2C_MAX_FAST_MODE_FREQ))
> +		id->i2c_clk = I2C_MAX_STANDARD_MODE_FREQ;
>  
>  	cdns_i2c_writereg(CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | CDNS_I2C_CR_MS,
>  			  CDNS_I2C_CR_OFFSET);
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 3b7d58c2fe85..04f76a6fa4af 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -99,16 +99,16 @@ static int dw_i2c_acpi_configure(struct platform_device *pdev)
>  	dw_i2c_acpi_params(pdev, "FMCN", &dev->fs_hcnt, &dev->fs_lcnt, &fs_ht);
>  
>  	switch (t->bus_freq_hz) {
> -	case 100000:
> +	case I2C_MAX_STANDARD_MODE_FREQ:
>  		dev->sda_hold_time = ss_ht;
>  		break;
> -	case 1000000:
> +	case I2C_MAX_FAST_PLUS_MODE_FREQ:
>  		dev->sda_hold_time = fp_ht;
>  		break;
> -	case 3400000:
> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
>  		dev->sda_hold_time = hs_ht;
>  		break;
> -	case 400000:
> +	case I2C_MAX_FAST_MODE_FREQ:
>  	default:
>  		dev->sda_hold_time = fs_ht;
>  		break;
> @@ -198,10 +198,10 @@ static void i2c_dw_configure_master(struct dw_i2c_dev *dev)
>  	dev->mode = DW_IC_MASTER;
>  
>  	switch (t->bus_freq_hz) {
> -	case 100000:
> +	case I2C_MAX_STANDARD_MODE_FREQ:
>  		dev->master_cfg |= DW_IC_CON_SPEED_STD;
>  		break;
> -	case 3400000:
> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
>  		dev->master_cfg |= DW_IC_CON_SPEED_HIGH;
>  		break;
>  	default:
> @@ -249,6 +249,13 @@ static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
>  		pm_runtime_put_noidle(dev->dev);
>  }
>  
> +static const u32 supported_speeds[] = {
> +	I2C_MAX_HIGH_SPEED_MODE_FREQ,
> +	I2C_MAX_FAST_PLUS_MODE_FREQ,
> +	I2C_MAX_FAST_MODE_FREQ,
> +	I2C_MAX_STANDARD_MODE_FREQ,
> +};
> +
>  static int dw_i2c_plat_probe(struct platform_device *pdev)
>  {
>  	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
> @@ -258,9 +265,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  	u32 acpi_speed;
>  	struct resource *mem;
>  	int i, irq, ret;
> -	static const int supported_speeds[] = {
> -		0, 100000, 400000, 1000000, 3400000
> -	};
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
> @@ -296,11 +300,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  	 * Some DSTDs use a non standard speed, round down to the lowest
>  	 * standard speed.
>  	 */
> -	for (i = 1; i < ARRAY_SIZE(supported_speeds); i++) {
> -		if (acpi_speed < supported_speeds[i])
> +	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
> +		if (acpi_speed >= supported_speeds[i])
>  			break;
>  	}
> -	acpi_speed = supported_speeds[i - 1];
> +	acpi_speed = i < ARRAY_SIZE(supported_speeds) ? supported_speeds[i] : 0;
>  
>  	/*
>  	 * Find bus speed from the "clock-frequency" device property, ACPI
> @@ -311,7 +315,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  	else if (acpi_speed || t->bus_freq_hz)
>  		t->bus_freq_hz = max(t->bus_freq_hz, acpi_speed);
>  	else
> -		t->bus_freq_hz = 400000;
> +		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
>  
>  	dev->flags |= (uintptr_t)device_get_match_data(&pdev->dev);
>  
> @@ -325,8 +329,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  	 * Only standard mode at 100kHz, fast mode at 400kHz,
>  	 * fast mode plus at 1MHz and high speed mode at 3.4MHz are supported.
>  	 */
> -	if (t->bus_freq_hz != 100000 && t->bus_freq_hz != 400000 &&
> -	    t->bus_freq_hz != 1000000 && t->bus_freq_hz != 3400000) {
> +	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
> +		if (t->bus_freq_hz == supported_speeds[i])
> +			break;
> +	}
> +	if (i == ARRAY_SIZE(supported_speeds)) {
>  		dev_err(&pdev->dev,
>  			"%d Hz is unsupported, only 100kHz, 400kHz, 1MHz and 3.4MHz are supported\n",
>  			t->bus_freq_hz);
> diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
> index 3adf72540db1..056a5c4f0833 100644
> --- a/drivers/i2c/busses/i2c-digicolor.c
> +++ b/drivers/i2c/busses/i2c-digicolor.c
> @@ -18,7 +18,6 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  
> -#define DEFAULT_FREQ		100000
>  #define TIMEOUT_MS		100
>  
>  #define II_CONTROL		0x0
> @@ -300,7 +299,7 @@ static int dc_i2c_probe(struct platform_device *pdev)
>  
>  	if (of_property_read_u32(pdev->dev.of_node, "clock-frequency",
>  				 &i2c->frequency))
> -		i2c->frequency = DEFAULT_FREQ;
> +		i2c->frequency = I2C_MAX_STANDARD_MODE_FREQ;
>  
>  	i2c->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, i2c);
> diff --git a/drivers/i2c/busses/i2c-diolan-u2c.c b/drivers/i2c/busses/i2c-diolan-u2c.c
> index 382f105e0fe3..b48b7888936f 100644
> --- a/drivers/i2c/busses/i2c-diolan-u2c.c
> +++ b/drivers/i2c/busses/i2c-diolan-u2c.c
> @@ -64,8 +64,6 @@
>  #define U2C_I2C_SPEED_2KHZ	242	/* 2 kHz, minimum speed */
>  #define U2C_I2C_SPEED(f)	((DIV_ROUND_UP(1000000, (f)) - 10) / 2 + 1)
>  
> -#define U2C_I2C_FREQ_FAST	400000
> -#define U2C_I2C_FREQ_STD	100000
>  #define U2C_I2C_FREQ(s)		(1000000 / (2 * (s - 1) + 10))
>  
>  #define DIOLAN_USB_TIMEOUT	100	/* in ms */
> @@ -87,7 +85,7 @@ struct i2c_diolan_u2c {
>  	int ocount;			/* Number of enqueued messages */
>  };
>  
> -static uint frequency = U2C_I2C_FREQ_STD;	/* I2C clock frequency in Hz */
> +static uint frequency = I2C_MAX_STANDARD_MODE_FREQ;	/* I2C clock frequency in Hz */
>  
>  module_param(frequency, uint, S_IRUGO | S_IWUSR);
>  MODULE_PARM_DESC(frequency, "I2C clock frequency in hertz");
> @@ -299,12 +297,12 @@ static int diolan_init(struct i2c_diolan_u2c *dev)
>  {
>  	int speed, ret;
>  
> -	if (frequency >= 200000) {
> +	if (frequency >= 2 * I2C_MAX_STANDARD_MODE_FREQ) {
>  		speed = U2C_I2C_SPEED_FAST;
> -		frequency = U2C_I2C_FREQ_FAST;
> -	} else if (frequency >= 100000 || frequency == 0) {
> +		frequency = I2C_MAX_FAST_MODE_FREQ;
> +	} else if (frequency >= I2C_MAX_STANDARD_MODE_FREQ || frequency == 0) {
>  		speed = U2C_I2C_SPEED_STD;
> -		frequency = U2C_I2C_FREQ_STD;
> +		frequency = I2C_MAX_STANDARD_MODE_FREQ;
>  	} else {
>  		speed = U2C_I2C_SPEED(frequency);
>  		if (speed > U2C_I2C_SPEED_2KHZ)
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index e7514c16b756..4bf3e175ae3e 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -164,13 +164,6 @@
>  #define HSI2C_MASTER_ID(x)			((x & 0xff) << 24)
>  #define MASTER_ID(x)				((x & 0x7) + 0x08)
>  
> -/*
> - * Controller operating frequency, timing values for operation
> - * are calculated against this frequency
> - */
> -#define HSI2C_HS_TX_CLOCK	1000000
> -#define HSI2C_FS_TX_CLOCK	100000
> -
>  #define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(100))
>  
>  enum i2c_type_exynos {
> @@ -264,6 +257,9 @@ static void exynos5_i2c_clr_pend_irq(struct exynos5_i2c *i2c)
>   * exynos5_i2c_set_timing: updates the registers with appropriate
>   * timing values calculated
>   *
> + * Timing values for operation are calculated against either 100kHz
> + * or 1MHz controller operating frequency.
> + *
>   * Returns 0 on success, -EINVAL if the cycle length cannot
>   * be calculated.
>   */
> @@ -281,7 +277,7 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
>  	unsigned int t_ftl_cycle;
>  	unsigned int clkin = clk_get_rate(i2c->clk);
>  	unsigned int op_clk = hs_timings ? i2c->op_clock :
> -		(i2c->op_clock >= HSI2C_HS_TX_CLOCK) ? HSI2C_FS_TX_CLOCK :
> +		(i2c->op_clock >= I2C_MAX_FAST_PLUS_MODE_FREQ) ? I2C_MAX_STANDARD_MODE_FREQ :
>  		i2c->op_clock;
>  	int div, clk_cycle, temp;
>  
> @@ -353,7 +349,7 @@ static int exynos5_hsi2c_clock_setup(struct exynos5_i2c *i2c)
>  	/* always set Fast Speed timings */
>  	int ret = exynos5_i2c_set_timing(i2c, false);
>  
> -	if (ret < 0 || i2c->op_clock < HSI2C_HS_TX_CLOCK)
> +	if (ret < 0 || i2c->op_clock < I2C_MAX_FAST_PLUS_MODE_FREQ)
>  		return ret;
>  
>  	return exynos5_i2c_set_timing(i2c, true);
> @@ -376,7 +372,7 @@ static void exynos5_i2c_init(struct exynos5_i2c *i2c)
>  					i2c->regs + HSI2C_CTL);
>  	writel(HSI2C_TRAILING_COUNT, i2c->regs + HSI2C_TRAILIG_CTL);
>  
> -	if (i2c->op_clock >= HSI2C_HS_TX_CLOCK) {
> +	if (i2c->op_clock >= I2C_MAX_FAST_PLUS_MODE_FREQ) {
>  		writel(HSI2C_MASTER_ID(MASTER_ID(i2c->adap.nr)),
>  					i2c->regs + HSI2C_ADDR);
>  		i2c_conf |= HSI2C_HS_MODE;
> @@ -748,7 +744,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	if (of_property_read_u32(np, "clock-frequency", &i2c->op_clock))
> -		i2c->op_clock = HSI2C_FS_TX_CLOCK;
> +		i2c->op_clock = I2C_MAX_STANDARD_MODE_FREQ;
>  
>  	strlcpy(i2c->adap.name, "exynos5-i2c", sizeof(i2c->adap.name));
>  	i2c->adap.owner   = THIS_MODULE;
> diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
> index 8497c7a95dd4..febc591efbef 100644
> --- a/drivers/i2c/busses/i2c-hix5hd2.c
> +++ b/drivers/i2c/busses/i2c-hix5hd2.c
> @@ -68,8 +68,6 @@
>  #define I2C_ARBITRATE_INTR	BIT(1)
>  #define I2C_OVER_INTR		BIT(0)
>  
> -#define HIX5I2C_MAX_FREQ	400000		/* 400k */
> -
>  enum hix5hd2_i2c_state {
>  	HIX5I2C_STAT_RW_ERR = -1,
>  	HIX5I2C_STAT_INIT,
> @@ -400,12 +398,12 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
>  
>  	if (of_property_read_u32(np, "clock-frequency", &freq)) {
>  		/* use 100k as default value */
> -		priv->freq = 100000;
> +		priv->freq = I2C_MAX_STANDARD_MODE_FREQ;
>  	} else {
> -		if (freq > HIX5I2C_MAX_FREQ) {
> -			priv->freq = HIX5I2C_MAX_FREQ;
> +		if (freq > I2C_MAX_FAST_MODE_FREQ) {
> +			priv->freq = I2C_MAX_FAST_MODE_FREQ;
>  			dev_warn(priv->dev, "use max freq %d instead\n",
> -				 HIX5I2C_MAX_FREQ);
> +				 I2C_MAX_FAST_MODE_FREQ);
>  		} else {
>  			priv->freq = freq;
>  		}
> diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
> index 20a4fbc53007..422097a31c95 100644
> --- a/drivers/i2c/busses/i2c-img-scb.c
> +++ b/drivers/i2c/busses/i2c-img-scb.c
> @@ -304,7 +304,7 @@ static struct img_i2c_timings timings[] = {
>  	/* Standard mode */
>  	{
>  		.name = "standard",
> -		.max_bitrate = 100000,
> +		.max_bitrate = I2C_MAX_STANDARD_MODE_FREQ,
>  		.tckh = 4000,
>  		.tckl = 4700,
>  		.tsdh = 4700,
> @@ -316,7 +316,7 @@ static struct img_i2c_timings timings[] = {
>  	/* Fast mode */
>  	{
>  		.name = "fast",
> -		.max_bitrate = 400000,
> +		.max_bitrate = I2C_MAX_FAST_MODE_FREQ,
>  		.tckh = 600,
>  		.tckl = 1300,
>  		.tsdh = 600,
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index c92b56485fa6..a1ae9b464ff9 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -75,12 +75,6 @@
>  #define I2C_CLK_RATIO	2
>  #define CHUNK_DATA	256
>  
> -#define LPI2C_DEFAULT_RATE	100000
> -#define STARDARD_MAX_BITRATE	400000
> -#define FAST_MAX_BITRATE	1000000
> -#define FAST_PLUS_MAX_BITRATE	3400000
> -#define HIGHSPEED_MAX_BITRATE	5000000
> -
>  #define I2C_PM_TIMEOUT		10 /* ms */
>  
>  enum lpi2c_imx_mode {
> @@ -152,13 +146,13 @@ static void lpi2c_imx_set_mode(struct lpi2c_imx_struct *lpi2c_imx)
>  	unsigned int bitrate = lpi2c_imx->bitrate;
>  	enum lpi2c_imx_mode mode;
>  
> -	if (bitrate < STARDARD_MAX_BITRATE)
> +	if (bitrate < I2C_MAX_FAST_MODE_FREQ)
>  		mode = STANDARD;
> -	else if (bitrate < FAST_MAX_BITRATE)
> +	else if (bitrate < I2C_MAX_FAST_PLUS_MODE_FREQ)
>  		mode = FAST;
> -	else if (bitrate < FAST_PLUS_MAX_BITRATE)
> +	else if (bitrate < I2C_MAX_HIGH_SPEED_MODE_FREQ)
>  		mode = FAST_PLUS;
> -	else if (bitrate < HIGHSPEED_MAX_BITRATE)
> +	else if (bitrate < I2C_MAX_ULTRA_SPEED_MODE_FREQ)
>  		mode = HS;
>  	else
>  		mode = ULTRA_FAST;
> @@ -578,7 +572,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
>  	ret = of_property_read_u32(pdev->dev.of_node,
>  				   "clock-frequency", &lpi2c_imx->bitrate);
>  	if (ret)
> -		lpi2c_imx->bitrate = LPI2C_DEFAULT_RATE;
> +		lpi2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
>  
>  	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
>  			       pdev->name, lpi2c_imx);
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 79d5b37fd8a1..66d7a01adc11 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -50,9 +50,6 @@
>  /* This will be the driver name the kernel reports */
>  #define DRIVER_NAME "imx-i2c"
>  
> -/* Default value */
> -#define IMX_I2C_BIT_RATE	100000	/* 100kHz */
> -
>  /*
>   * Enable DMA if transfer byte size is bigger than this threshold.
>   * As the hardware request, it must bigger than 4 bytes.\
> @@ -1203,7 +1200,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  		goto rpm_disable;
>  
>  	/* Set up clock divider */
> -	i2c_imx->bitrate = IMX_I2C_BIT_RATE;
> +	i2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
>  	ret = of_property_read_u32(pdev->dev.of_node,
>  				   "clock-frequency", &i2c_imx->bitrate);
>  	if (ret < 0 && pdata && pdata->bitrate)
> diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
> index deea18b14add..13b0c12e2dba 100644
> --- a/drivers/i2c/busses/i2c-lpc2k.c
> +++ b/drivers/i2c/busses/i2c-lpc2k.c
> @@ -396,7 +396,7 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
>  	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
>  				   &bus_clk_rate);
>  	if (ret)
> -		bus_clk_rate = 100000; /* 100 kHz default clock rate */
> +		bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
>  
>  	clkrate = clk_get_rate(i2c->clk);
>  	if (clkrate == 0) {
> @@ -407,9 +407,9 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
>  
>  	/* Setup I2C dividers to generate clock with proper duty cycle */
>  	clkrate = clkrate / bus_clk_rate;
> -	if (bus_clk_rate <= 100000)
> +	if (bus_clk_rate <= I2C_MAX_STANDARD_MODE_FREQ)
>  		scl_high = (clkrate * I2C_STD_MODE_DUTY) / 100;
> -	else if (bus_clk_rate <= 400000)
> +	else if (bus_clk_rate <= I2C_MAX_FAST_MODE_FREQ)
>  		scl_high = (clkrate * I2C_FAST_MODE_DUTY) / 100;
>  	else
>  		scl_high = (clkrate * I2C_FAST_MODE_PLUS_DUTY) / 100;
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 2152ec5f535c..47db2f2c17a6 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -56,9 +56,6 @@
>  #define I2C_DMA_4G_MODE			0x0001
>  
>  #define I2C_DEFAULT_CLK_DIV		5
> -#define I2C_DEFAULT_SPEED		100000	/* hz */
> -#define MAX_FS_MODE_SPEED		400000
> -#define MAX_HS_MODE_SPEED		3400000
>  #define MAX_SAMPLE_CNT_DIV		8
>  #define MAX_STEP_CNT_DIV		64
>  #define MAX_HS_STEP_CNT_DIV		8
> @@ -450,10 +447,10 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
>  	unsigned int best_mul;
>  	unsigned int cnt_mul;
>  
> -	if (target_speed > MAX_HS_MODE_SPEED)
> -		target_speed = MAX_HS_MODE_SPEED;
> +	if (target_speed > I2C_MAX_FAST_PLUS_MODE_FREQ)
> +		target_speed = I2C_MAX_FAST_PLUS_MODE_FREQ;
>  
> -	if (target_speed > MAX_FS_MODE_SPEED)
> +	if (target_speed > I2C_MAX_FAST_MODE_FREQ)
>  		max_step_cnt = MAX_HS_STEP_CNT_DIV;
>  	else
>  		max_step_cnt = MAX_STEP_CNT_DIV;
> @@ -514,9 +511,9 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>  	clk_src = parent_clk / i2c->clk_src_div;
>  	target_speed = i2c->speed_hz;
>  
> -	if (target_speed > MAX_FS_MODE_SPEED) {
> +	if (target_speed > I2C_MAX_FAST_MODE_FREQ) {
>  		/* Set master code speed register */
> -		ret = mtk_i2c_calculate_speed(i2c, clk_src, MAX_FS_MODE_SPEED,
> +		ret = mtk_i2c_calculate_speed(i2c, clk_src, I2C_MAX_FAST_MODE_FREQ,
>  					      &l_step_cnt, &l_sample_cnt);
>  		if (ret < 0)
>  			return ret;
> @@ -581,7 +578,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>  
>  	control_reg = mtk_i2c_readw(i2c, OFFSET_CONTROL) &
>  			~(I2C_CONTROL_DIR_CHANGE | I2C_CONTROL_RS);
> -	if ((i2c->speed_hz > MAX_FS_MODE_SPEED) || (left_num >= 1))
> +	if ((i2c->speed_hz > I2C_MAX_FAST_MODE_FREQ) || (left_num >= 1))
>  		control_reg |= I2C_CONTROL_RS;
>  
>  	if (i2c->op == I2C_MASTER_WRRD)
> @@ -590,7 +587,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>  	mtk_i2c_writew(i2c, control_reg, OFFSET_CONTROL);
>  
>  	/* set start condition */
> -	if (i2c->speed_hz <= I2C_DEFAULT_SPEED)
> +	if (i2c->speed_hz <= I2C_MAX_STANDARD_MODE_FREQ)
>  		mtk_i2c_writew(i2c, I2C_ST_START_CON, OFFSET_EXT_CONF);
>  	else
>  		mtk_i2c_writew(i2c, I2C_FS_START_CON, OFFSET_EXT_CONF);
> @@ -798,7 +795,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>  		}
>  	}
>  
> -	if (i2c->auto_restart && num >= 2 && i2c->speed_hz > MAX_FS_MODE_SPEED)
> +	if (i2c->auto_restart && num >= 2 && i2c->speed_hz > I2C_MAX_FAST_MODE_FREQ)
>  		/* ignore the first restart irq after the master code,
>  		 * otherwise the first transfer will be discarded.
>  		 */
> @@ -893,7 +890,7 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
>  
>  	ret = of_property_read_u32(np, "clock-frequency", &i2c->speed_hz);
>  	if (ret < 0)
> -		i2c->speed_hz = I2C_DEFAULT_SPEED;
> +		i2c->speed_hz = I2C_MAX_STANDARD_MODE_FREQ;
>  
>  	ret = of_property_read_u32(np, "clock-div", &i2c->clk_src_div);
>  	if (ret < 0)
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
> index febb7c7ea72b..9b8f1d8552ea 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -810,7 +810,7 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
>  	tclk = clk_get_rate(drv_data->clk);
>  
>  	if (of_property_read_u32(np, "clock-frequency", &bus_freq))
> -		bus_freq = 100000; /* 100kHz by default */
> +		bus_freq = I2C_MAX_STANDARD_MODE_FREQ; /* 100kHz by default */
>  
>  	if (of_device_is_compatible(np, "allwinner,sun4i-a10-i2c") ||
>  	    of_device_is_compatible(np, "allwinner,sun6i-a31-i2c"))
> @@ -846,14 +846,14 @@ mv64xxx_of_config(struct mv64xxx_i2c_data *drv_data,
>  	if (of_device_is_compatible(np, "marvell,mv78230-i2c")) {
>  		drv_data->offload_enabled = true;
>  		/* The delay is only needed in standard mode (100kHz) */
> -		if (bus_freq <= 100000)
> +		if (bus_freq <= I2C_MAX_STANDARD_MODE_FREQ)
>  			drv_data->errata_delay = true;
>  	}
>  
>  	if (of_device_is_compatible(np, "marvell,mv78230-a0-i2c")) {
>  		drv_data->offload_enabled = false;
>  		/* The delay is only needed in standard mode (100kHz) */
> -		if (bus_freq <= 100000)
> +		if (bus_freq <= I2C_MAX_STANDARD_MODE_FREQ)
>  			drv_data->errata_delay = true;
>  	}
>  
> diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
> index 89224913f578..ca7aa587b71f 100644
> --- a/drivers/i2c/busses/i2c-mxs.c
> +++ b/drivers/i2c/busses/i2c-mxs.c
> @@ -731,7 +731,7 @@ static void mxs_i2c_derive_timing(struct mxs_i2c_dev *i2c, uint32_t speed)
>  	 * This is compensated for by subtracting the respective constants
>  	 * from the values written to the timing registers.
>  	 */
> -	if (speed > 100000) {
> +	if (speed > I2C_MAX_STANDARD_MODE_FREQ) {
>  		/* fast mode */
>  		low_count = DIV_ROUND_CLOSEST(divider * 13, (13 + 6));
>  		high_count = DIV_ROUND_CLOSEST(divider * 6, (13 + 6));
> @@ -769,7 +769,7 @@ static int mxs_i2c_get_ofdata(struct mxs_i2c_dev *i2c)
>  	ret = of_property_read_u32(node, "clock-frequency", &speed);
>  	if (ret) {
>  		dev_warn(dev, "No I2C speed selected, using 100kHz\n");
> -		speed = 100000;
> +		speed = I2C_MAX_STANDARD_MODE_FREQ;
>  	}
>  
>  	mxs_i2c_derive_timing(i2c, speed);
> diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
> index 01a7d72e5511..e1e8d4ef9aa7 100644
> --- a/drivers/i2c/busses/i2c-nomadik.c
> +++ b/drivers/i2c/busses/i2c-nomadik.c
> @@ -396,7 +396,7 @@ static void setup_i2c_controller(struct nmk_i2c_dev *dev)
>  	 * 2 whereas it is 3 for fast and fastplus mode of
>  	 * operation. TODO - high speed support.
>  	 */
> -	div = (dev->clk_freq > 100000) ? 3 : 2;
> +	div = (dev->clk_freq > I2C_MAX_STANDARD_MODE_FREQ) ? 3 : 2;
>  
>  	/*
>  	 * generate the mask for baud rate counters. The controller
> @@ -420,7 +420,7 @@ static void setup_i2c_controller(struct nmk_i2c_dev *dev)
>  	if (dev->sm > I2C_FREQ_MODE_FAST) {
>  		dev_err(&dev->adev->dev,
>  			"do not support this mode defaulting to std. mode\n");
> -		brcr2 = i2c_clk/(100000 * 2) & 0xffff;
> +		brcr2 = i2c_clk / (I2C_MAX_STANDARD_MODE_FREQ * 2) & 0xffff;
>  		writel((brcr1 | brcr2), dev->virtbase + I2C_BRCR);
>  		writel(I2C_FREQ_MODE_STANDARD << 4,
>  				dev->virtbase + I2C_CR);
> @@ -949,10 +949,10 @@ static void nmk_i2c_of_probe(struct device_node *np,
>  {
>  	/* Default to 100 kHz if no frequency is given in the node */
>  	if (of_property_read_u32(np, "clock-frequency", &nmk->clk_freq))
> -		nmk->clk_freq = 100000;
> +		nmk->clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
>  
>  	/* This driver only supports 'standard' and 'fast' modes of operation. */
> -	if (nmk->clk_freq <= 100000)
> +	if (nmk->clk_freq <= I2C_MAX_STANDARD_MODE_FREQ)
>  		nmk->sm = I2C_FREQ_MODE_STANDARD;
>  	else
>  		nmk->sm = I2C_FREQ_MODE_FAST;
> diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> index b6b5a495118b..3ab8be62c581 100644
> --- a/drivers/i2c/busses/i2c-owl.c
> +++ b/drivers/i2c/busses/i2c-owl.c
> @@ -87,9 +87,6 @@
>  
>  #define OWL_I2C_MAX_RETRIES	50
>  
> -#define OWL_I2C_DEF_SPEED_HZ	100000
> -#define OWL_I2C_MAX_SPEED_HZ	400000
> -
>  struct owl_i2c_dev {
>  	struct i2c_adapter	adap;
>  	struct i2c_msg		*msg;
> @@ -419,11 +416,11 @@ static int owl_i2c_probe(struct platform_device *pdev)
>  
>  	if (of_property_read_u32(dev->of_node, "clock-frequency",
>  				 &i2c_dev->bus_freq))
> -		i2c_dev->bus_freq = OWL_I2C_DEF_SPEED_HZ;
> +		i2c_dev->bus_freq = I2C_MAX_STANDARD_MODE_FREQ;
>  
>  	/* We support only frequencies of 100k and 400k for now */
> -	if (i2c_dev->bus_freq != OWL_I2C_DEF_SPEED_HZ &&
> -	    i2c_dev->bus_freq != OWL_I2C_MAX_SPEED_HZ) {
> +	if (i2c_dev->bus_freq != I2C_MAX_STANDARD_MODE_FREQ &&
> +	    i2c_dev->bus_freq != I2C_MAX_FAST_MODE_FREQ) {
>  		dev_err(dev, "invalid clock-frequency %d\n", i2c_dev->bus_freq);
>  		return -EINVAL;
>  	}
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index 2d7dabe12723..fe39743df0de 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -136,13 +136,8 @@
>   */
>  #define TOUT_MIN			2
>  
> -/* I2C Frequency Modes */
> -#define I2C_STANDARD_FREQ		100000
> -#define I2C_FAST_MODE_FREQ		400000
> -#define I2C_FAST_MODE_PLUS_FREQ		1000000
> -
>  /* Default values. Use these if FW query fails */
> -#define DEFAULT_CLK_FREQ I2C_STANDARD_FREQ
> +#define DEFAULT_CLK_FREQ I2C_MAX_STANDARD_MODE_FREQ
>  #define DEFAULT_SRC_CLK 20000000
>  
>  /*
> @@ -1756,7 +1751,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
>  
>  nodma:
>  	/* We support frequencies up to FAST Mode Plus (1MHz) */
> -	if (!clk_freq || clk_freq > I2C_FAST_MODE_PLUS_FREQ) {
> +	if (!clk_freq || clk_freq > I2C_MAX_FAST_PLUS_MODE_FREQ) {
>  		dev_err(qup->dev, "clock frequency not supported %d\n",
>  			clk_freq);
>  		return -EINVAL;
> @@ -1861,7 +1856,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
>  	qup->in_fifo_sz = qup->in_blk_sz * (2 << size);
>  
>  	hs_div = 3;
> -	if (clk_freq <= I2C_STANDARD_FREQ) {
> +	if (clk_freq <= I2C_MAX_STANDARD_MODE_FREQ) {
>  		fs_div = ((src_clk_freq / clk_freq) / 2) - 3;
>  		qup->clk_ctl = (hs_div << 8) | (fs_div & 0xff);
>  	} else {
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 879f0e61a496..2b7e44fb127b 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -242,7 +242,7 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv, struct i2c_timin
>  	struct device *dev = rcar_i2c_priv_to_dev(priv);
>  
>  	/* Fall back to previously used values if not supplied */
> -	t->bus_freq_hz = t->bus_freq_hz ?: 100000;
> +	t->bus_freq_hz = t->bus_freq_hz ?: I2C_MAX_STANDARD_MODE_FREQ;
>  	t->scl_fall_ns = t->scl_fall_ns ?: 35;
>  	t->scl_rise_ns = t->scl_rise_ns ?: 200;
>  	t->scl_int_delay_ns = t->scl_int_delay_ns ?: 50;
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index 800414886f6b..4eccc0f69861 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -287,10 +287,10 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
>  
>  	pm_runtime_get_sync(riic->adapter.dev.parent);
>  
> -	if (t->bus_freq_hz > 400000) {
> +	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
>  		dev_err(&riic->adapter.dev,
> -			"unsupported bus speed (%dHz). 400000 max\n",
> -			t->bus_freq_hz);
> +			"unsupported bus speed (%dHz). %d max\n",
> +			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
>  		ret = -EINVAL;
>  		goto out;
>  	}
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 1a33007b03e9..978d069aba7e 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -539,9 +539,9 @@ static irqreturn_t rk3x_i2c_irq(int irqno, void *dev_id)
>   */
>  static const struct i2c_spec_values *rk3x_i2c_get_spec(unsigned int speed)
>  {
> -	if (speed <= 100000)
> +	if (speed <= I2C_MAX_STANDARD_MODE_FREQ)
>  		return &standard_mode_spec;
> -	else if (speed <= 400000)
> +	else if (speed <= I2C_MAX_FAST_MODE_FREQ)
>  		return &fast_mode_spec;
>  	else
>  		return &fast_mode_plus_spec;
> @@ -578,8 +578,8 @@ static int rk3x_i2c_v0_calc_timings(unsigned long clk_rate,
>  	int ret = 0;
>  
>  	/* Only support standard-mode and fast-mode */
> -	if (WARN_ON(t->bus_freq_hz > 400000))
> -		t->bus_freq_hz = 400000;
> +	if (WARN_ON(t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ))
> +		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
>  
>  	/* prevent scl_rate_khz from becoming 0 */
>  	if (WARN_ON(t->bus_freq_hz < 1000))
> @@ -758,8 +758,8 @@ static int rk3x_i2c_v1_calc_timings(unsigned long clk_rate,
>  	int ret = 0;
>  
>  	/* Support standard-mode, fast-mode and fast-mode plus */
> -	if (WARN_ON(t->bus_freq_hz > 1000000))
> -		t->bus_freq_hz = 1000000;
> +	if (WARN_ON(t->bus_freq_hz > I2C_MAX_FAST_PLUS_MODE_FREQ))
> +		t->bus_freq_hz = I2C_MAX_FAST_PLUS_MODE_FREQ;
>  
>  	/* prevent scl_rate_khz from becoming 0 */
>  	if (WARN_ON(t->bus_freq_hz < 1000))
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index c98ef4c4a0c9..5a5638e1daa1 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -835,11 +835,11 @@ static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *i2c, unsigned int *got)
>  	int freq;
>  
>  	i2c->clkrate = clkin;
> -	clkin /= 1000;		/* clkin now in KHz */
> +	clkin /= 1000;	/* clkin now in KHz */
>  
>  	dev_dbg(i2c->dev, "pdata desired frequency %lu\n", pdata->frequency);
>  
> -	target_frequency = pdata->frequency ? pdata->frequency : 100000;
> +	target_frequency = pdata->frequency ?: I2C_MAX_STANDARD_MODE_FREQ;
>  
>  	target_frequency /= 1000; /* Target frequency now in KHz */
>  
> diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
> index 82b3b795e0bd..d83ca4028fa0 100644
> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> @@ -145,9 +145,6 @@ struct sh_mobile_dt_config {
>  
>  #define IIC_FLAG_HAS_ICIC67	(1 << 0)
>  
> -#define STANDARD_MODE		100000
> -#define FAST_MODE		400000
> -
>  /* Register offsets */
>  #define ICDR			0x00
>  #define ICCR			0x04
> @@ -270,11 +267,11 @@ static int sh_mobile_i2c_init(struct sh_mobile_i2c_data *pd)
>  
>  	i2c_clk_khz = clk_get_rate(pd->clk) / 1000 / pd->clks_per_count;
>  
> -	if (pd->bus_speed == STANDARD_MODE) {
> +	if (pd->bus_speed == I2C_MAX_STANDARD_MODE_FREQ) {
>  		tLOW	= 47;	/* tLOW = 4.7 us */
>  		tHIGH	= 40;	/* tHD;STA = tHIGH = 4.0 us */
>  		tf	= 3;	/* tf = 0.3 us */
> -	} else if (pd->bus_speed == FAST_MODE) {
> +	} else if (pd->bus_speed == I2C_MAX_FAST_MODE_FREQ) {
>  		tLOW	= 13;	/* tLOW = 1.3 us */
>  		tHIGH	= 6;	/* tHD;STA = tHIGH = 0.6 us */
>  		tf	= 3;	/* tf = 0.3 us */
> @@ -851,7 +848,7 @@ static int sh_mobile_i2c_probe(struct platform_device *dev)
>  		return PTR_ERR(pd->reg);
>  
>  	ret = of_property_read_u32(dev->dev.of_node, "clock-frequency", &bus_speed);
> -	pd->bus_speed = (ret || !bus_speed) ? STANDARD_MODE : bus_speed;
> +	pd->bus_speed = (ret || !bus_speed) ? I2C_MAX_STANDARD_MODE_FREQ : bus_speed;
>  	pd->clks_per_count = 1;
>  
>  	/* Newer variants come with two new bits in ICIC */
> diff --git a/drivers/i2c/busses/i2c-sirf.c b/drivers/i2c/busses/i2c-sirf.c
> index fb7a046b3226..a459e00c6851 100644
> --- a/drivers/i2c/busses/i2c-sirf.c
> +++ b/drivers/i2c/busses/i2c-sirf.c
> @@ -62,7 +62,6 @@
>  #define SIRFSOC_I2C_STOP		BIT(6)
>  #define SIRFSOC_I2C_START		BIT(7)
>  
> -#define SIRFSOC_I2C_DEFAULT_SPEED 100000
>  #define SIRFSOC_I2C_ERR_NOACK      1
>  #define SIRFSOC_I2C_ERR_TIMEOUT    2
>  
> @@ -353,7 +352,7 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
>  	err = of_property_read_u32(pdev->dev.of_node,
>  		"clock-frequency", &bitrate);
>  	if (err < 0)
> -		bitrate = SIRFSOC_I2C_DEFAULT_SPEED;
> +		bitrate = I2C_MAX_STANDARD_MODE_FREQ;
>  
>  	/*
>  	 * Due to some hardware design issues, we need to tune the formula.
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index b432e7580458..123a42bfe3b1 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -337,9 +337,9 @@ static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq)
>  	writel(div1, i2c_dev->base + ADDR_DVD1);
>  
>  	/* Start hold timing = hold time(us) * source clock */
> -	if (freq == 400000)
> +	if (freq == I2C_MAX_FAST_MODE_FREQ)
>  		writel((6 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
> -	else if (freq == 100000)
> +	else if (freq == I2C_MAX_STANDARD_MODE_FREQ)
>  		writel((4 * apb_clk) / 1000000, i2c_dev->base + ADDR_STA0_DVD);
>  }
>  
> @@ -502,7 +502,7 @@ static int sprd_i2c_probe(struct platform_device *pdev)
>  	snprintf(i2c_dev->adap.name, sizeof(i2c_dev->adap.name),
>  		 "%s", "sprd-i2c");
>  
> -	i2c_dev->bus_freq = 100000;
> +	i2c_dev->bus_freq = I2C_MAX_STANDARD_MODE_FREQ;
>  	i2c_dev->adap.owner = THIS_MODULE;
>  	i2c_dev->dev = dev;
>  	i2c_dev->adap.retries = 3;
> @@ -516,7 +516,8 @@ static int sprd_i2c_probe(struct platform_device *pdev)
>  		i2c_dev->bus_freq = prop;
>  
>  	/* We only support 100k and 400k now, otherwise will return error. */
> -	if (i2c_dev->bus_freq != 100000 && i2c_dev->bus_freq != 400000)
> +	if (i2c_dev->bus_freq != I2C_MAX_STANDARD_MODE_FREQ &&
> +	    i2c_dev->bus_freq != I2C_MAX_FAST_MODE_FREQ)
>  		return -EINVAL;
>  
>  	ret = sprd_i2c_clk_init(i2c_dev);
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index 54e1fc8a495e..49794e8ec839 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -213,7 +213,7 @@ static inline void st_i2c_clr_bits(void __iomem *reg, u32 mask)
>   */
>  static struct st_i2c_timings i2c_timings[] = {
>  	[I2C_MODE_STANDARD] = {
> -		.rate			= 100000,
> +		.rate			= I2C_MAX_STANDARD_MODE_FREQ,
>  		.rep_start_hold		= 4400,
>  		.rep_start_setup	= 5170,
>  		.start_hold		= 4400,
> @@ -222,7 +222,7 @@ static struct st_i2c_timings i2c_timings[] = {
>  		.bus_free_time		= 5170,
>  	},
>  	[I2C_MODE_FAST] = {
> -		.rate			= 400000,
> +		.rate			= I2C_MAX_FAST_MODE_FREQ,
>  		.rep_start_hold		= 660,
>  		.rep_start_setup	= 660,
>  		.start_hold		= 660,
> @@ -835,7 +835,7 @@ static int st_i2c_probe(struct platform_device *pdev)
>  
>  	i2c_dev->mode = I2C_MODE_STANDARD;
>  	ret = of_property_read_u32(np, "clock-frequency", &clk_rate);
> -	if ((!ret) && (clk_rate == 400000))
> +	if (!ret && (clk_rate == I2C_MAX_FAST_MODE_FREQ))
>  		i2c_dev->mode = I2C_MODE_FAST;
>  
>  	i2c_dev->dev = &pdev->dev;
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index ba600d77a3f8..8bc9250aa99c 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -243,7 +243,7 @@ static void stm32f4_i2c_set_speed_mode(struct stm32f4_i2c_dev *i2c_dev)
>  		 * parent rate is not higher than 46 MHz . As a result val
>  		 * is at most 8 bits wide and so fits into the CCR bits [11:0].
>  		 */
> -		val = i2c_dev->parent_rate / (100000 << 1);
> +		val = i2c_dev->parent_rate / (I2C_MAX_STANDARD_MODE_FREQ << 1);
>  	} else {
>  		/*
>  		 * In fast mode, we compute CCR with duty = 0 as with low
> @@ -263,7 +263,7 @@ static void stm32f4_i2c_set_speed_mode(struct stm32f4_i2c_dev *i2c_dev)
>  		 * parent rate is not higher than 46 MHz . As a result val
>  		 * is at most 6 bits wide and so fits into the CCR bits [11:0].
>  		 */
> -		val = DIV_ROUND_UP(i2c_dev->parent_rate, 400000 * 3);
> +		val = DIV_ROUND_UP(i2c_dev->parent_rate, I2C_MAX_FAST_MODE_FREQ * 3);
>  
>  		/* Select Fast mode */
>  		ccr |= STM32F4_I2C_CCR_FS;
> @@ -807,7 +807,7 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
>  
>  	i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
>  	ret = of_property_read_u32(np, "clock-frequency", &clk_rate);
> -	if (!ret && clk_rate >= 400000)
> +	if (!ret && clk_rate >= I2C_MAX_FAST_MODE_FREQ)
>  		i2c_dev->speed = STM32_I2C_SPEED_FAST;
>  
>  	i2c_dev->dev = &pdev->dev;
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 378956ac6d1d..b9ed022c35d1 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -338,9 +338,9 @@ struct stm32f7_i2c_dev {
>   */
>  static struct stm32f7_i2c_spec i2c_specs[] = {
>  	[STM32_I2C_SPEED_STANDARD] = {
> -		.rate = 100000,
> -		.rate_min = 80000,
> -		.rate_max = 100000,
> +		.rate = I2C_MAX_STANDARD_MODE_FREQ,
> +		.rate_min = I2C_MAX_STANDARD_MODE_FREQ * 8 / 10,	/* 80% */
> +		.rate_max = I2C_MAX_STANDARD_MODE_FREQ,
>  		.fall_max = 300,
>  		.rise_max = 1000,
>  		.hddat_min = 0,
> @@ -350,9 +350,9 @@ static struct stm32f7_i2c_spec i2c_specs[] = {
>  		.h_min = 4000,
>  	},
>  	[STM32_I2C_SPEED_FAST] = {
> -		.rate = 400000,
> -		.rate_min = 320000,
> -		.rate_max = 400000,
> +		.rate = I2C_MAX_FAST_MODE_FREQ,
> +		.rate_min = I2C_MAX_FAST_MODE_FREQ * 8 / 10,		/* 80% */
> +		.rate_max = I2C_MAX_FAST_MODE_FREQ,
>  		.fall_max = 300,
>  		.rise_max = 300,
>  		.hddat_min = 0,
> @@ -362,9 +362,9 @@ static struct stm32f7_i2c_spec i2c_specs[] = {
>  		.h_min = 600,
>  	},
>  	[STM32_I2C_SPEED_FAST_PLUS] = {
> -		.rate = 1000000,
> -		.rate_min = 800000,
> -		.rate_max = 1000000,
> +		.rate = I2C_MAX_FAST_PLUS_MODE_FREQ,
> +		.rate_min = I2C_MAX_FAST_PLUS_MODE_FREQ * 8 / 10,	/* 80% */
> +		.rate_max = I2C_MAX_FAST_PLUS_MODE_FREQ,
>  		.fall_max = 100,
>  		.rise_max = 120,
>  		.hddat_min = 0,
> @@ -1927,14 +1927,14 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
>  	ret = device_property_read_u32(&pdev->dev, "clock-frequency",
>  				       &clk_rate);
> -	if (!ret && clk_rate >= 1000000) {
> +	if (!ret && clk_rate >= I2C_MAX_FAST_PLUS_MODE_FREQ) {
>  		i2c_dev->speed = STM32_I2C_SPEED_FAST_PLUS;
>  		ret = stm32f7_i2c_setup_fm_plus_bits(pdev, i2c_dev);
>  		if (ret)
>  			goto clk_free;
> -	} else if (!ret && clk_rate >= 400000) {
> +	} else if (!ret && clk_rate >= I2C_MAX_FAST_MODE_FREQ) {
>  		i2c_dev->speed = STM32_I2C_SPEED_FAST;
> -	} else if (!ret && clk_rate >= 100000) {
> +	} else if (!ret && clk_rate >= I2C_MAX_STANDARD_MODE_FREQ) {
>  		i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
>  	}
>  
> diff --git a/drivers/i2c/busses/i2c-stu300.c b/drivers/i2c/busses/i2c-stu300.c
> index 42e0a53e7fa4..ba6b60caa45e 100644
> --- a/drivers/i2c/busses/i2c-stu300.c
> +++ b/drivers/i2c/busses/i2c-stu300.c
> @@ -132,7 +132,7 @@ enum stu300_error {
>  #define NUM_ADDR_RESEND_ATTEMPTS 12
>  
>  /* I2C clock speed, in Hz 0-400kHz*/
> -static unsigned int scl_frequency = 100000;
> +static unsigned int scl_frequency = I2C_MAX_STANDARD_MODE_FREQ;
>  module_param(scl_frequency, uint,  0644);
>  
>  /**
> @@ -497,7 +497,7 @@ static int stu300_set_clk(struct stu300_dev *dev, unsigned long clkrate)
>  	dev_dbg(&dev->pdev->dev, "Clock rate %lu Hz, I2C bus speed %d Hz "
>  		"virtbase %p\n", clkrate, dev->speed, dev->virtbase);
>  
> -	if (dev->speed > 100000)
> +	if (dev->speed > I2C_MAX_STANDARD_MODE_FREQ)
>  		/* Fast Mode I2C */
>  		val = ((clkrate/dev->speed) - 9)/3 + 1;
>  	else
> @@ -518,7 +518,7 @@ static int stu300_set_clk(struct stu300_dev *dev, unsigned long clkrate)
>  		return -EINVAL;
>  	}
>  
> -	if (dev->speed > 100000) {
> +	if (dev->speed > I2C_MAX_STANDARD_MODE_FREQ) {
>  		/* CC6..CC0 */
>  		stu300_wr8((val & I2C_CCR_CC_MASK) | I2C_CCR_FMSM,
>  			   dev->virtbase + I2C_CCR);
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
> index 86026798b4f7..9099d0a67ace 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -67,10 +67,10 @@
>  
>  /* STANDARD MODE frequency */
>  #define SYNQUACER_I2C_CLK_MASTER_STD(rate)			\
> -	DIV_ROUND_UP(DIV_ROUND_UP((rate), 100000) - 2, 2)
> +	DIV_ROUND_UP(DIV_ROUND_UP((rate), I2C_MAX_STANDARD_MODE_FREQ) - 2, 2)
>  /* FAST MODE frequency */
>  #define SYNQUACER_I2C_CLK_MASTER_FAST(rate)			\
> -	DIV_ROUND_UP((DIV_ROUND_UP((rate), 400000) - 2) * 2, 3)
> +	DIV_ROUND_UP((DIV_ROUND_UP((rate), I2C_MAX_FAST_MODE_FREQ) - 2) * 2, 3)
>  
>  /* (clkrate <= 18000000) */
>  /* calculate the value of CS bits in CCR register on standard mode */
> @@ -602,7 +602,7 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
>  	i2c->adapter.nr = pdev->id;
>  	init_completion(&i2c->completion);
>  
> -	if (bus_speed < 400000)
> +	if (bus_speed < I2C_MAX_FAST_MODE_FREQ)
>  		i2c->speed_khz = SYNQUACER_I2C_SPEED_SM;
>  	else
>  		i2c->speed_khz = SYNQUACER_I2C_SPEED_FM;
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index cbc2ad49043e..9f06c520b4ec 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -123,10 +123,6 @@
>  #define I2C_THIGH_SHIFT				8
>  #define I2C_INTERFACE_TIMING_1			0x98
>  
> -#define I2C_STANDARD_MODE			100000
> -#define I2C_FAST_MODE				400000
> -#define I2C_FAST_PLUS_MODE			1000000
> -
>  /* Packet header size in bytes */
>  #define I2C_PACKET_HEADER_SIZE			12
>  
> @@ -737,8 +733,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
>  					I2C_CLK_DIVISOR_STD_FAST_MODE_SHIFT;
>  	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
>  
> -	if (i2c_dev->bus_clk_rate > I2C_STANDARD_MODE &&
> -	    i2c_dev->bus_clk_rate <= I2C_FAST_PLUS_MODE) {
> +	if (i2c_dev->bus_clk_rate > I2C_MAX_STANDARD_MODE_FREQ &&
> +	    i2c_dev->bus_clk_rate <= I2C_MAX_FAST_PLUS_MODE_FREQ) {
>  		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
>  		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
>  		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
> @@ -1341,7 +1337,7 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
>  	ret = of_property_read_u32(np, "clock-frequency",
>  				   &i2c_dev->bus_clk_rate);
>  	if (ret)
> -		i2c_dev->bus_clk_rate = 100000; /* default clock rate */
> +		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ; /* default clock rate */
>  
>  	multi_mode = of_property_read_bool(np, "multi-master");
>  	i2c_dev->is_multimaster_mode = multi_mode;
> @@ -1640,12 +1636,12 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	if (i2c_dev->bus_clk_rate > I2C_FAST_MODE &&
> -	    i2c_dev->bus_clk_rate <= I2C_FAST_PLUS_MODE)
> +	if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ &&
> +	    i2c_dev->bus_clk_rate <= I2C_MAX_FAST_PLUS_MODE_FREQ)
>  		i2c_dev->clk_divisor_non_hs_mode =
>  				i2c_dev->hw->clk_divisor_fast_plus_mode;
> -	else if (i2c_dev->bus_clk_rate > I2C_STANDARD_MODE &&
> -		 i2c_dev->bus_clk_rate <= I2C_FAST_MODE)
> +	else if (i2c_dev->bus_clk_rate > I2C_MAX_STANDARD_MODE_FREQ &&
> +		 i2c_dev->bus_clk_rate <= I2C_MAX_FAST_MODE_FREQ)
>  		i2c_dev->clk_divisor_non_hs_mode =
>  				i2c_dev->hw->clk_divisor_fast_mode;
>  	else
> diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
> index 4241aac79e7e..2b258d54d68c 100644
> --- a/drivers/i2c/busses/i2c-uniphier-f.c
> +++ b/drivers/i2c/busses/i2c-uniphier-f.c
> @@ -73,8 +73,6 @@
>  #define UNIPHIER_FI2C_BYTE_WISE		BIT(3)
>  #define UNIPHIER_FI2C_DEFER_STOP_COMP	BIT(4)
>  
> -#define UNIPHIER_FI2C_DEFAULT_SPEED	100000
> -#define UNIPHIER_FI2C_MAX_SPEED		400000
>  #define UNIPHIER_FI2C_FIFO_SIZE		8
>  
>  struct uniphier_fi2c_priv {
> @@ -537,9 +535,9 @@ static int uniphier_fi2c_probe(struct platform_device *pdev)
>  	}
>  
>  	if (of_property_read_u32(dev->of_node, "clock-frequency", &bus_speed))
> -		bus_speed = UNIPHIER_FI2C_DEFAULT_SPEED;
> +		bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
>  
> -	if (!bus_speed || bus_speed > UNIPHIER_FI2C_MAX_SPEED) {
> +	if (!bus_speed || bus_speed > I2C_MAX_FAST_MODE_FREQ) {
>  		dev_err(dev, "invalid clock-frequency %d\n", bus_speed);
>  		return -EINVAL;
>  	}
> diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
> index 0270090c0360..668b1fa2b0ef 100644
> --- a/drivers/i2c/busses/i2c-uniphier.c
> +++ b/drivers/i2c/busses/i2c-uniphier.c
> @@ -35,9 +35,6 @@
>  #define UNIPHIER_I2C_NOISE	0x1c	/* noise filter control */
>  #define UNIPHIER_I2C_SETUP	0x20	/* setup time control */
>  
> -#define UNIPHIER_I2C_DEFAULT_SPEED	100000
> -#define UNIPHIER_I2C_MAX_SPEED		400000
> -
>  struct uniphier_i2c_priv {
>  	struct completion comp;
>  	struct i2c_adapter adap;
> @@ -333,9 +330,9 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
>  	}
>  
>  	if (of_property_read_u32(dev->of_node, "clock-frequency", &bus_speed))
> -		bus_speed = UNIPHIER_I2C_DEFAULT_SPEED;
> +		bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
>  
> -	if (!bus_speed || bus_speed > UNIPHIER_I2C_MAX_SPEED) {
> +	if (!bus_speed || bus_speed > I2C_MAX_FAST_MODE_FREQ) {
>  		dev_err(dev, "invalid clock-frequency %d\n", bus_speed);
>  		return -EINVAL;
>  	}
> diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
> index 8a873975cf12..f678f8d9abd6 100644
> --- a/drivers/i2c/busses/i2c-xlp9xx.c
> +++ b/drivers/i2c/busses/i2c-xlp9xx.c
> @@ -71,8 +71,6 @@
>  #define XLP9XX_I2C_SLAVEADDR_ADDR_SHIFT		1
>  
>  #define XLP9XX_I2C_IP_CLK_FREQ		133000000UL
> -#define XLP9XX_I2C_DEFAULT_FREQ		100000
> -#define XLP9XX_I2C_HIGH_FREQ		400000
>  #define XLP9XX_I2C_FIFO_SIZE		0x80U
>  #define XLP9XX_I2C_TIMEOUT_MS		1000
>  #define XLP9XX_I2C_BUSY_TIMEOUT		50
> @@ -476,12 +474,12 @@ static int xlp9xx_i2c_get_frequency(struct platform_device *pdev,
>  
>  	err = device_property_read_u32(&pdev->dev, "clock-frequency", &freq);
>  	if (err) {
> -		freq = XLP9XX_I2C_DEFAULT_FREQ;
> +		freq = I2C_MAX_STANDARD_MODE_FREQ;
>  		dev_dbg(&pdev->dev, "using default frequency %u\n", freq);
> -	} else if (freq == 0 || freq > XLP9XX_I2C_HIGH_FREQ) {
> +	} else if (freq == 0 || freq > I2C_MAX_FAST_MODE_FREQ) {
>  		dev_warn(&pdev->dev, "invalid frequency %u, using default\n",
>  			 freq);
> -		freq = XLP9XX_I2C_DEFAULT_FREQ;
> +		freq = I2C_MAX_STANDARD_MODE_FREQ;
>  	}
>  	priv->clk_hz = freq;
>  
> 
