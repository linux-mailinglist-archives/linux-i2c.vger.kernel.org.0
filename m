Return-Path: <linux-i2c+bounces-2575-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E4A88A265
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 14:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8BFE2C7F36
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 13:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C4F1B48A3;
	Mon, 25 Mar 2024 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkXBLBgH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F0C13B7A2;
	Mon, 25 Mar 2024 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711353249; cv=none; b=CI/ySSwZp1NGEe0B6KGrUPi/1qd2DpukSFy4GJQVooCBNhg0QVM8AbW+8j32LSyvwFQpBf7PkTDRs3sMYcZpIJK0T4SYyaLVju5ACpbOcu6JZ3pXruG4PsLLf8xSpUR44LKXz3Ay+TVg0fETc2bTlQymZjVPxMHiK6CTYQxNesg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711353249; c=relaxed/simple;
	bh=G9pVMPBkGeSCKm7GL4349gPmBncBHLw8Di6BWoQcag0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z00wCssCiL3CXGVeYUn/rDXjqAI8cTU490+KtIKY8v+TElyrI4M2j0jYx2flfVJ2MVA6W3TbDzL6XokV6YoaqcjS5TZNLWXo0stoGvvUKv+cyA0ZmIuwrDUaTzYGeOr8+izCEY8h2TTqfwrHS3jb9uYgyOycVreAvep5n0jr7f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkXBLBgH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711353246; x=1742889246;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=G9pVMPBkGeSCKm7GL4349gPmBncBHLw8Di6BWoQcag0=;
  b=fkXBLBgH37ph5Q0oYqWWbQJliLEsV/7J0cRb9rnT+QtQitFB1LufvUhR
   6RbAy21oMDg0XwBl2NbcQeU1Th3VwscKlE20dvZ5f7JIhKFElboWiyf9v
   AoMfPWHhEa189te3dE2STHMcSX1XKpuZC/9kgI4CzPJ9m6PRNtlvqDuaL
   nN6V2ei/lTfqgAXmfQoLN8yhfvu93Vj4NIIYgfA1T9W0hCDNpKb9uxXQX
   Dhv3JxCOHVocNU6iEtQTMeJHdCB5MGLVPKCuloulscTuDe93TllMdzTgy
   OXt8/kHxgpiBw8R+45tukcx9r+bXhkr1PvtE/TQn9JXL8uBNH5WKpQr2p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6199169"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6199169"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 00:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="16197266"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP; 25 Mar 2024 00:53:46 -0700
Message-ID: <1f1e59a4-359e-4679-8ea9-3d915a930e91@linux.intel.com>
Date: Mon, 25 Mar 2024 09:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Elie Morisse <syniurge@gmail.com>,
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Jean-Marie Verdun <verdun@hpe.com>,
 Nick Hawkins <nick.hawkins@hpe.com>, Yicong Yang <yangyicong@hisilicon.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Ajay Gupta <ajayg@nvidia.com>, Peter Korsgaard <peter@korsgaard.com>,
 Andrew Lunn <andrew@lunn.ch>, Robert Richter <rric@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Vignesh R <vigneshr@ti.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Vladimir Zapolskiy <vz@mleia.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Conghui Chen <conghui.chen@intel.com>, Viresh Kumar
 <viresh.kumar@linaro.org>, Michal Simek <michal.simek@amd.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 virtualization@lists.linux.dev
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/24 3:25 PM, Wolfram Sang wrote:
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/i2c/busses/i2c-amd-mp2-plat.c      |  2 +-
>   drivers/i2c/busses/i2c-at91-master.c       |  2 +-
>   drivers/i2c/busses/i2c-at91-slave.c        |  8 ++++----
>   drivers/i2c/busses/i2c-axxia.c             | 10 +++++-----
>   drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  2 +-
>   drivers/i2c/busses/i2c-designware-master.c |  2 +-
>   drivers/i2c/busses/i2c-designware-slave.c  |  8 ++++----
>   drivers/i2c/busses/i2c-diolan-u2c.c        |  2 +-
>   drivers/i2c/busses/i2c-exynos5.c           |  4 ++--
>   drivers/i2c/busses/i2c-gxp.c               | 12 ++++++------
>   drivers/i2c/busses/i2c-hisi.c              |  4 ++--
>   drivers/i2c/busses/i2c-img-scb.c           |  2 +-
>   drivers/i2c/busses/i2c-imx.c               | 12 ++++++------
>   drivers/i2c/busses/i2c-jz4780.c            |  2 +-
>   drivers/i2c/busses/i2c-kempld.c            |  2 +-
>   drivers/i2c/busses/i2c-meson.c             |  4 ++--
>   drivers/i2c/busses/i2c-mlxbf.c             |  8 ++++----
>   drivers/i2c/busses/i2c-mt65xx.c            |  2 +-
>   drivers/i2c/busses/i2c-mxs.c               |  2 +-
>   drivers/i2c/busses/i2c-nomadik.c           |  2 +-
>   drivers/i2c/busses/i2c-npcm7xx.c           | 12 ++++++------
>   drivers/i2c/busses/i2c-nvidia-gpu.c        |  4 ++--
>   drivers/i2c/busses/i2c-ocores.c            |  8 ++++----
>   drivers/i2c/busses/i2c-octeon-platdrv.c    |  2 +-
>   drivers/i2c/busses/i2c-omap.c              |  4 ++--
>   drivers/i2c/busses/i2c-opal.c              |  4 ++--
>   drivers/i2c/busses/i2c-pasemi-core.c       |  2 +-
>   drivers/i2c/busses/i2c-pnx.c               |  2 +-
>   drivers/i2c/busses/i2c-pxa.c               | 12 ++++++------
>   drivers/i2c/busses/i2c-qcom-cci.c          |  2 +-
>   drivers/i2c/busses/i2c-qcom-geni.c         |  2 +-
>   drivers/i2c/busses/i2c-robotfuzz-osif.c    |  2 +-
>   drivers/i2c/busses/i2c-rzv2m.c             |  8 ++++----
>   drivers/i2c/busses/i2c-s3c2410.c           |  4 ++--
>   drivers/i2c/busses/i2c-stm32f7.c           | 14 +++++++-------
>   drivers/i2c/busses/i2c-tegra-bpmp.c        |  4 ++--
>   drivers/i2c/busses/i2c-tegra.c             |  4 ++--
>   drivers/i2c/busses/i2c-thunderx-pcidrv.c   |  2 +-
>   drivers/i2c/busses/i2c-virtio.c            |  2 +-
>   drivers/i2c/busses/i2c-wmt.c               |  2 +-
>   drivers/i2c/busses/i2c-xiic.c              |  2 +-
>   41 files changed, 95 insertions(+), 95 deletions(-)
> 

> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index c7e56002809a..14c61b31f877 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -832,7 +832,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>   }
>   
>   static const struct i2c_algorithm i2c_dw_algo = {
> -	.master_xfer = i2c_dw_xfer,
> +	.xfer = i2c_dw_xfer,
>   	.functionality = i2c_dw_func,
>   };
>   
> diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
> index 2e079cf20bb5..b47ad6b16814 100644
> --- a/drivers/i2c/busses/i2c-designware-slave.c
> +++ b/drivers/i2c/busses/i2c-designware-slave.c
> @@ -58,7 +58,7 @@ static int i2c_dw_init_slave(struct dw_i2c_dev *dev)
>   	return 0;
>   }
>   
> -static int i2c_dw_reg_slave(struct i2c_client *slave)
> +static int i2c_dw_reg_target(struct i2c_client *slave)
>   {
>   	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
>   
> @@ -83,7 +83,7 @@ static int i2c_dw_reg_slave(struct i2c_client *slave)
>   	return 0;
>   }
>   
> -static int i2c_dw_unreg_slave(struct i2c_client *slave)
> +static int i2c_dw_unreg_target(struct i2c_client *slave)
>   {
>   	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
>   
> @@ -214,8 +214,8 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
>   
>   static const struct i2c_algorithm i2c_dw_algo = {
>   	.functionality = i2c_dw_func,
> -	.reg_slave = i2c_dw_reg_slave,
> -	.unreg_slave = i2c_dw_unreg_slave,
> +	.reg_target = i2c_dw_reg_target,
> +	.unreg_target = i2c_dw_unreg_target,
>   };

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

