Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A581F17B249
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 00:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgCEXhX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 18:37:23 -0500
Received: from mga06.intel.com ([134.134.136.31]:11064 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbgCEXhX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Mar 2020 18:37:23 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Mar 2020 15:37:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,519,1574150400"; 
   d="scan'208";a="441743586"
Received: from tthayer-hp-z620.an.intel.com (HELO [10.122.105.146]) ([10.122.105.146])
  by fmsmga006.fm.intel.com with ESMTP; 05 Mar 2020 15:37:19 -0800
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH v2 3/3] i2c: drivers: Use generic definitions for bus
 frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Elie Morisse <syniurge@gmail.com>,
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
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20200227122129.65516-1-andriy.shevchenko@linux.intel.com>
 <20200227122129.65516-3-andriy.shevchenko@linux.intel.com>
From:   Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <05d2d6a3-8a78-314c-9bed-a9313761695c@linux.intel.com>
Date:   Thu, 5 Mar 2020 17:37:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200227122129.65516-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On 2/27/20 6:21 AM, Andy Shevchenko wrote:
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
>    squash to one patch (Wolfram)
>    used MAX in the definition names (Wolfram)
>    dropped HZ_PER_*
>    added collected tags
> 
>   drivers/i2c/busses/i2c-altera.c             |  6 ++--
>   drivers/i2c/busses/i2c-amd-mp2-plat.c       | 27 +++++++++------
>   drivers/i2c/busses/i2c-aspeed.c             |  2 +-
>   drivers/i2c/busses/i2c-axxia.c              |  4 +--
>   drivers/i2c/busses/i2c-bcm-iproc.c          | 14 ++++----
>   drivers/i2c/busses/i2c-bcm-kona.c           |  8 ++---
>   drivers/i2c/busses/i2c-cadence.c            |  7 ++--
>   drivers/i2c/busses/i2c-designware-platdrv.c | 37 ++++++++++++---------
>   drivers/i2c/busses/i2c-digicolor.c          |  3 +-
>   drivers/i2c/busses/i2c-diolan-u2c.c         | 12 +++----
>   drivers/i2c/busses/i2c-exynos5.c            | 18 ++++------
>   drivers/i2c/busses/i2c-hix5hd2.c            | 10 +++---
>   drivers/i2c/busses/i2c-img-scb.c            |  4 +--
>   drivers/i2c/busses/i2c-imx-lpi2c.c          | 16 +++------
>   drivers/i2c/busses/i2c-imx.c                |  5 +--
>   drivers/i2c/busses/i2c-lpc2k.c              |  6 ++--
>   drivers/i2c/busses/i2c-mt65xx.c             | 21 +++++-------
>   drivers/i2c/busses/i2c-mv64xxx.c            |  6 ++--
>   drivers/i2c/busses/i2c-mxs.c                |  4 +--
>   drivers/i2c/busses/i2c-nomadik.c            |  8 ++---
>   drivers/i2c/busses/i2c-owl.c                |  9 ++---
>   drivers/i2c/busses/i2c-qup.c                | 11 ++----
>   drivers/i2c/busses/i2c-rcar.c               |  2 +-
>   drivers/i2c/busses/i2c-riic.c               |  6 ++--
>   drivers/i2c/busses/i2c-rk3x.c               | 12 +++----
>   drivers/i2c/busses/i2c-s3c2410.c            |  4 +--
>   drivers/i2c/busses/i2c-sh_mobile.c          |  9 ++---
>   drivers/i2c/busses/i2c-sirf.c               |  3 +-
>   drivers/i2c/busses/i2c-sprd.c               |  9 ++---
>   drivers/i2c/busses/i2c-st.c                 |  6 ++--
>   drivers/i2c/busses/i2c-stm32f4.c            |  6 ++--
>   drivers/i2c/busses/i2c-stm32f7.c            | 24 ++++++-------
>   drivers/i2c/busses/i2c-stu300.c             |  6 ++--
>   drivers/i2c/busses/i2c-synquacer.c          |  6 ++--
>   drivers/i2c/busses/i2c-tegra.c              | 18 ++++------
>   drivers/i2c/busses/i2c-uniphier-f.c         |  6 ++--
>   drivers/i2c/busses/i2c-uniphier.c           |  7 ++--
>   drivers/i2c/busses/i2c-xlp9xx.c             |  8 ++---
>   38 files changed, 168 insertions(+), 202 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index 1de23b4f3809..20ef63820c77 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -147,7 +147,7 @@ static void altr_i2c_init(struct altr_i2c_dev *idev)
>   		  (ALTR_I2C_THRESHOLD << ALTR_I2C_CTRL_TCT_SHFT);
>   	u32 t_high, t_low;
>   
> -	if (idev->bus_clk_rate <= 100000) {
> +	if (idev->bus_clk_rate <= I2C_MAX_STANDARD_MODE_FREQ) {
>   		tmp &= ~ALTR_I2C_CTRL_BSPEED;
>   		/* Standard mode SCL 50/50 */
>   		t_high = divisor * 1 / 2;
> @@ -423,10 +423,10 @@ static int altr_i2c_probe(struct platform_device *pdev)
>   				       &idev->bus_clk_rate);
>   	if (val) {
>   		dev_err(&pdev->dev, "Default to 100kHz\n");
> -		idev->bus_clk_rate = 100000;	/* default clock rate */
> +		idev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;	/* default clock rate */
>   	}
>   
> -	if (idev->bus_clk_rate > 400000) {
> +	if (idev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ) {
>   		dev_err(&pdev->dev, "invalid clock-frequency %d\n",
>   			idev->bus_clk_rate);
>   		return -EINVAL;


Reviewed-by: Thor Thayer <thor.thayer@linux.intel.com>

Thanks
<snip>
