Return-Path: <linux-i2c+bounces-1480-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCECD83E426
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F16111C23261
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB9D24B2B;
	Fri, 26 Jan 2024 21:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inziZ7Od"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB5325547;
	Fri, 26 Jan 2024 21:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706305419; cv=none; b=C9dQMVyB7gbSL8+AJ8iUEd0RFdVlAyIWXBpbCXcYfLIzGIXp7C1M5uhjOOFtG0mqwnyoTWxcLSE9fq1Mose1p3+stWMRNSjq+jVW5MWExW9n3E3PPhr0WKqzTawIITdZ3TSO6thRDJ1GTCu7bqcvpAIu1Ocz5jbMjYHoH+ugY1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706305419; c=relaxed/simple;
	bh=dGrX54JKc+ouW6Qe0kG/VCojouMRzfaNqMwu+WvsiFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SYMuWaMovCEMM5gjnvBUH/+UXePHlAjCI2gjA5SPFZLreE/5Qnb2LbQMLhXsqaC2N3rfINOB0w8RQ3JlMim2qO351c0KZjb1aRMao/wQH9zjFlgNhPwZSyC6vYb9yHuMKLn+terewkCjHPNPjDmwezrsxG/DNKUyJrxnCk9HU3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inziZ7Od; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961A3C433C7;
	Fri, 26 Jan 2024 21:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706305418;
	bh=dGrX54JKc+ouW6Qe0kG/VCojouMRzfaNqMwu+WvsiFc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=inziZ7Od0BGG1wapyJIji2rltHuK546vmXLekUOdBNw/zMUrSH2tgyR1YKfQmJn4M
	 N1+zl9watQThzgAgk8RE2pO0XK1QnC0cHtdKlrKTitAUps1IeWFw6GfOy5bjUe+Hv+
	 V+Cdi+n9V0pzYBeo0IYDQf8PmsTZaH7cv7hgX1k11+wZCP0KsvSbIyiB4LF7xSSMs+
	 aye2qeqK6Fr+cledVAy1shXdxvxjyXid+UmGLvgkZvxC3UgJ76iEE5eOGXe5LlWYE0
	 RvRtKuc/RdIa+w13sopOKhLWhybqs1dTXcw0lfTDT2P9mqOdlcBua7lRghb3vl5Ed6
	 IeFIC4kPDDvOg==
Date: Fri, 26 Jan 2024 15:43:36 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Tom Joseph <tjoseph@cadence.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com
Subject: Re: [PATCH v2 13/15] PCI: cadence: add resume support to
 cdns_pcie_host_setup()
Message-ID: <20240126214336.GA453589@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102-j7200-pcie-s2r-v2-13-8e4f7d228ec2@bootlin.com>

In subject, capitalize "Add ..." to follow historical convention.
Also the other driver/pci/ patches.

On Fri, Jan 26, 2024 at 03:36:55PM +0100, Thomas Richard wrote:
> From: Théo Lebrun <theo.lebrun@bootlin.com>
> 
> That function mixes probe structure init and hardware config.
> The whole hardware config part must be done at resume after a suspend to
> ram.
> We therefore pass it a boolean flag determining if we are at probe or at
> resume.

s/That function/cdns_pcie_host_setup()/ so the commit log stands
alone even without the subject line.

s/ram/RAM/

Add blank line between paragraphs (or rewrap into a single paragraph).

This is pretty similar but slightly different from the DWC pattern:

  imx6_pcie_probe
    ... do structure init ...
    if (RC)
      dw_pcie_host_init
	pp->ops->init
	  imx6_pcie_host_init

  imx6_pcie_resume_noirq
    imx6_pcie_host_init

  j721e_pcie_probe
    j721e_pcie_ctrl_init
    if (RC)
      cdns_pcie_host_setup(true)

  j721e_pcie_resume_noirq
    j721e_pcie_ctrl_init
    if (RC)
      cdns_pcie_host_setup(false)

It'd be super nice to have them the same.  Passing in a "probe" flag
works but seems a little harder to read in cdns_pcie_host_setup() and
you have to keep track of what it means in the callers.

> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>  drivers/pci/controller/cadence/pci-j721e.c         |  2 +-
>  drivers/pci/controller/cadence/pcie-cadence-host.c | 49 ++++++++++++----------
>  drivers/pci/controller/cadence/pcie-cadence-plat.c |  2 +-
>  drivers/pci/controller/cadence/pcie-cadence.h      |  4 +-
>  4 files changed, 30 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index 2c87e7728a65..9b343a46da11 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -509,7 +509,7 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  			gpiod_set_value_cansleep(gpiod, 1);
>  		}
>  
> -		ret = cdns_pcie_host_setup(rc);
> +		ret = cdns_pcie_host_setup(rc, true);
>  		if (ret < 0) {
>  			clk_disable_unprepare(pcie->refclk);
>  			goto err_pcie_setup;
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index 5b14f7ee3c79..dd4d876a9138 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -497,14 +497,14 @@ static int cdns_pcie_host_init(struct device *dev,
>  	return cdns_pcie_host_init_address_translation(rc);
>  }
>  
> -int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
> +int cdns_pcie_host_setup(struct cdns_pcie_rc *rc, bool probe)
>  {
>  	struct device *dev = rc->pcie.dev;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct device_node *np = dev->of_node;
>  	struct pci_host_bridge *bridge;
>  	enum cdns_pcie_rp_bar bar;
> -	struct cdns_pcie *pcie;
> +	struct cdns_pcie *pcie = &rc->pcie;
>  	struct resource *res;
>  	int ret;
>  
> @@ -512,26 +512,27 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  	if (!bridge)
>  		return -ENOMEM;
>  
> -	pcie = &rc->pcie;
> -	pcie->is_rc = true;
> +	if (probe) {
> +		pcie->is_rc = true;
>  
> -	rc->vendor_id = 0xffff;
> -	of_property_read_u32(np, "vendor-id", &rc->vendor_id);
> +		rc->vendor_id = 0xffff;
> +		of_property_read_u32(np, "vendor-id", &rc->vendor_id);
>  
> -	rc->device_id = 0xffff;
> -	of_property_read_u32(np, "device-id", &rc->device_id);
> +		rc->device_id = 0xffff;
> +		of_property_read_u32(np, "device-id", &rc->device_id);
>  
> -	pcie->reg_base = devm_platform_ioremap_resource_byname(pdev, "reg");
> -	if (IS_ERR(pcie->reg_base)) {
> -		dev_err(dev, "missing \"reg\"\n");
> -		return PTR_ERR(pcie->reg_base);
> -	}
> +		pcie->reg_base = devm_platform_ioremap_resource_byname(pdev, "reg");
> +		if (IS_ERR(pcie->reg_base)) {
> +			dev_err(dev, "missing \"reg\"\n");
> +			return PTR_ERR(pcie->reg_base);
> +		}
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
> -	rc->cfg_base = devm_pci_remap_cfg_resource(dev, res);
> -	if (IS_ERR(rc->cfg_base))
> -		return PTR_ERR(rc->cfg_base);
> -	rc->cfg_res = res;
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
> +		rc->cfg_base = devm_pci_remap_cfg_resource(dev, res);
> +		if (IS_ERR(rc->cfg_base))
> +			return PTR_ERR(rc->cfg_base);
> +		rc->cfg_res = res;
> +	}
>  
>  	if (rc->quirk_detect_quiet_flag)
>  		cdns_pcie_detect_quiet_min_delay_set(&rc->pcie);
> @@ -555,12 +556,14 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  	if (ret)
>  		return ret;
>  
> -	if (!bridge->ops)
> -		bridge->ops = &cdns_pcie_host_ops;
> +	if (probe) {
> +		if (!bridge->ops)
> +			bridge->ops = &cdns_pcie_host_ops;
>  
> -	ret = pci_host_probe(bridge);
> -	if (ret < 0)
> -		goto err_init;
> +		ret = pci_host_probe(bridge);
> +		if (ret < 0)
> +			goto err_init;
> +	}
>  
>  	return 0;
>  
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-plat.c b/drivers/pci/controller/cadence/pcie-cadence-plat.c
> index 0456845dabb9..071423091668 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-plat.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-plat.c
> @@ -86,7 +86,7 @@ static int cdns_plat_pcie_probe(struct platform_device *pdev)
>  			goto err_get_sync;
>  		}
>  
> -		ret = cdns_pcie_host_setup(rc);
> +		ret = cdns_pcie_host_setup(rc, true);
>  		if (ret)
>  			goto err_init;
>  	} else {
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
> index 373cb50fcd15..3b0da889ed64 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -515,11 +515,11 @@ static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
>  }
>  
>  #ifdef CONFIG_PCIE_CADENCE_HOST
> -int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
> +int cdns_pcie_host_setup(struct cdns_pcie_rc *rc, bool probe);
>  void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
>  			       int where);
>  #else
> -static inline int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
> +static inline int cdns_pcie_host_setup(struct cdns_pcie_rc *rc, bool probe)
>  {
>  	return 0;
>  }
> 
> -- 
> 2.39.2
> 

