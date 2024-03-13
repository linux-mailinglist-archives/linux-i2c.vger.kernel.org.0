Return-Path: <linux-i2c+bounces-2348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFFC87A316
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 07:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B36F0B21B6F
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 06:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4D114A97;
	Wed, 13 Mar 2024 06:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="km6Clk7q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDAD1170A;
	Wed, 13 Mar 2024 06:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710312706; cv=none; b=XiBoEZkzhHmP9yCm5qE80QHcQf5Hp54Ur0FRnzs/k6Q5yB2j4sLae2oOr3LKIW7uVu+nXISyKzFF4ZIJjJcjjfCuLXWmMLKr16HSBCVopN3YAjgo/2x2b5qXf3xH0LekrZ0y9lQTM0xC3FTD0FXspN3AMefftfCZGJdRJPCs58g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710312706; c=relaxed/simple;
	bh=qV+who9BCOcvHst6HiD77hsq69Fk4GtrUpMmKKkjj00=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYqRJ9HnYEnCjXGBFwVNfxO5zOrBvF/PLQ3MQ2ZuMhL1SAhZYH/kVe0W4ND3Am3r7yMV3FJeeNgF7YxiwkDZATaDHISCGTzNsoeeUHwEleVAMHig/Nt7404fuZrWYVWE6pyoRESLwHhutLvEA543z40RHHP21N41zJHG6dddDDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=km6Clk7q; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42D6pBSN009136;
	Wed, 13 Mar 2024 01:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710312671;
	bh=rzD+EzX/k7d5q06olV4JiQMj7NEc0ZLvW6rR4gLdO+Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=km6Clk7qp/+sN3+TgPu6pY/9+6Y4NqK55vGuGGeuzCQE07yYflykG9/SNVsFWTjyK
	 DHzTupyUxpiXmEFCei2+2g7Sg9HNbR+VcOrIuHFluhVAXESUuymUmH541bvrq171xZ
	 ZmcuNa5Rvcr0NnqaOTr/IWF6QnHGy9odQ3zclXBQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42D6pBXi064923
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Mar 2024 01:51:11 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Mar 2024 01:51:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Mar 2024 01:51:10 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42D6pAAW097772;
	Wed, 13 Mar 2024 01:51:10 -0500
Date: Wed, 13 Mar 2024 12:21:09 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Thomas Richard <thomas.richard@bootlin.com>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, Tony Lindgren
	<tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Vignesh R
	<vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik
	<jmkrzyszt@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>, Peter Rosin
	<peda@axentia.se>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lorenzo
 Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-pci@vger.kernel.org>, <gregory.clement@bootlin.com>,
        <theo.lebrun@bootlin.com>, <thomas.petazzoni@bootlin.com>,
        <u-kumar1@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v4 18/18] PCI: j721e: Add suspend and resume support
Message-ID: <e4fc0b47-6a7f-4cc5-bb69-77655f775486@ti.com>
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
 <20240102-j7200-pcie-s2r-v4-18-6f1f53390c85@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102-j7200-pcie-s2r-v4-18-6f1f53390c85@bootlin.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On Mon, Mar 04, 2024 at 04:36:01PM +0100, Thomas Richard wrote:
> From: Théo Lebrun <theo.lebrun@bootlin.com>
> 
> Add suspend and resume support. Only the rc mode is supported.
> 
> During the suspend stage PERST# is asserted, then deasserted during the
> resume stage.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

> ---
>  drivers/pci/controller/cadence/pci-j721e.c | 86 ++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index 9af4fd64c1f9..a1f1232e8ee5 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -7,6 +7,8 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/io.h>
> @@ -22,6 +24,8 @@
>  #include "../../pci.h"
>  #include "pcie-cadence.h"
>  
> +#define cdns_pcie_to_rc(p) container_of(p, struct cdns_pcie_rc, pcie)
> +
>  #define ENABLE_REG_SYS_2	0x108
>  #define STATUS_REG_SYS_2	0x508
>  #define STATUS_CLR_REG_SYS_2	0x708
> @@ -588,6 +592,87 @@ static void j721e_pcie_remove(struct platform_device *pdev)
>  	pm_runtime_disable(dev);
>  }
>  
> +static int j721e_pcie_suspend_noirq(struct device *dev)
> +{
> +	struct j721e_pcie *pcie = dev_get_drvdata(dev);
> +
> +	if (pcie->mode == PCI_MODE_RC) {
> +		gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> +		clk_disable_unprepare(pcie->refclk);
> +	}
> +
> +	cdns_pcie_disable_phy(pcie->cdns_pcie);
> +
> +	return 0;
> +}
> +
> +static int j721e_pcie_resume_noirq(struct device *dev)
> +{
> +	struct j721e_pcie *pcie = dev_get_drvdata(dev);
> +	struct cdns_pcie *cdns_pcie = pcie->cdns_pcie;
> +	int ret;
> +
> +	ret = j721e_pcie_ctrl_init(pcie);
> +	if (ret < 0)
> +		return ret;
> +
> +	j721e_pcie_config_link_irq(pcie);
> +
> +	/*
> +	 * This is not called explicitly in the probe, it is called by
> +	 * cdns_pcie_init_phy().
> +	 */
> +	ret = cdns_pcie_enable_phy(pcie->cdns_pcie);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (pcie->mode == PCI_MODE_RC) {
> +		struct cdns_pcie_rc *rc = cdns_pcie_to_rc(cdns_pcie);
> +
> +		ret = clk_prepare_enable(pcie->refclk);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * "Power Sequencing and Reset Signal Timings" table in
> +		 * PCI EXPRESS CARD ELECTROMECHANICAL SPECIFICATION, REV. 3.0
> +		 * indicates PERST# should be deasserted after minimum of 100us
> +		 * once REFCLK is stable. The REFCLK to the connector in RC
> +		 * mode is selected while enabling the PHY. So deassert PERST#
> +		 * after 100 us.
> +		 */
> +		if (pcie->reset_gpio) {
> +			fsleep(100);
> +			gpiod_set_value_cansleep(pcie->reset_gpio, 1);
> +		}
> +
> +		ret = cdns_pcie_host_link_setup(rc);
> +		if (ret < 0) {
> +			clk_disable_unprepare(pcie->refclk);
> +			return ret;
> +		}
> +
> +		/*
> +		 * Reset internal status of BARs to force reinitialization in
> +		 * cdns_pcie_host_init().
> +		 */
> +		for (enum cdns_pcie_rp_bar bar = RP_BAR0; bar <= RP_NO_BAR; bar++)
> +			rc->avail_ib_bar[bar] = true;
> +
> +		ret = cdns_pcie_host_init(rc);
> +		if (ret) {
> +			clk_disable_unprepare(pcie->refclk);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static DEFINE_NOIRQ_DEV_PM_OPS(j721e_pcie_pm_ops,
> +			       j721e_pcie_suspend_noirq,
> +			       j721e_pcie_resume_noirq);
> +
>  static struct platform_driver j721e_pcie_driver = {
>  	.probe  = j721e_pcie_probe,
>  	.remove_new = j721e_pcie_remove,
> @@ -595,6 +680,7 @@ static struct platform_driver j721e_pcie_driver = {
>  		.name	= "j721e-pcie",
>  		.of_match_table = of_j721e_pcie_match,
>  		.suppress_bind_attrs = true,
> +		.pm	= pm_sleep_ptr(&j721e_pcie_pm_ops),
>  	},
>  };
>  builtin_platform_driver(j721e_pcie_driver);
> 
> -- 
> 2.39.2
> 
> 

