Return-Path: <linux-i2c+bounces-1822-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7158578E9
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 10:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C9CFB238BB
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 09:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42FE1BC2D;
	Fri, 16 Feb 2024 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dBUWI9sq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C0A7EF;
	Fri, 16 Feb 2024 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708076095; cv=none; b=hLH/ABOxypgObomPyzthKgO8l+VS4NZeuOqzSslCRV7HcSlpC/N6Inrp1wMLZ0cZl+9nYvVDHEcA6G2maDtRdCOsviFHokWd9ono/+OGd7OZiqqFsLLroNEcaw3fcSrGBjrBjyJEGHCCufqcY8O5jUtdE7z862YotWenwrMUVsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708076095; c=relaxed/simple;
	bh=1YBMhyXg6FfqZDDTNlBB8NV7CO4pFTFpO0iIm3Yk2Ew=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIGWPv8RANfEEyctCvNrvHOMg3JdgL2lKX45dzIVZI0ukv4Temy6R+k2Fyq6Rbuef3M631C41wIyYaI8Hed05Pr9ibGu/RsUPwKyFhuJT0h2O8mI2vE2E9zeKijWID8xXlkd3r/7ap++2Zz6UwpYyasXbT0tdqSKelLPZd9bpac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dBUWI9sq; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41G9YDeq060094;
	Fri, 16 Feb 2024 03:34:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708076053;
	bh=vKwAOmyTIKWOUkF+ltd/wXRNBHA5NjPfXEM/pH4HgCE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dBUWI9sql6TnlUIEOGFAg4vS8BWuS/JbhwS9gC86EL1cddmuNSFGe21Sbp3oVpOUP
	 guWZf54EVOiiV7PHE/3ylqvfDNUbduYWyeri/qgOwP1hrmJr4N9Wh83De+L3D/jKfk
	 gwQR04D2czoTUO9EfIQm7q2LFvd15n95Q8GRlAZQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41G9YDLg057428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Feb 2024 03:34:13 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 03:34:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 03:34:12 -0600
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41G9YB1G048944;
	Fri, 16 Feb 2024 03:34:12 -0600
Date: Fri, 16 Feb 2024 15:04:11 +0530
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
Subject: Re: [PATCH v3 15/18] PCI: cadence: extract link setup sequence from
 cdns_pcie_host_setup()
Message-ID: <72300ba5-1db2-4bbb-a797-d1b547001ddb@ti.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-15-5c2e4a3fac1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v3-15-5c2e4a3fac1f@bootlin.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 24/02/15 04:18PM, Thomas Richard wrote:
> The function cdns_pcie_host_setup() mixes probe structure and link setup.
> 
> The link setup must be done during the resume sequence. So extract it from
> cdns_pcie_host_setup() and create a dedicated function.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

LGTM.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

> ---
>  drivers/pci/controller/cadence/pcie-cadence-host.c | 39 ++++++++++++++--------
>  drivers/pci/controller/cadence/pcie-cadence.h      |  6 ++++
>  2 files changed, 32 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index 5b14f7ee3c79..93d9922730af 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -497,6 +497,30 @@ static int cdns_pcie_host_init(struct device *dev,
>  	return cdns_pcie_host_init_address_translation(rc);
>  }
>  
> +int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +	struct device *dev = rc->pcie.dev;
> +	int ret;
> +
> +	if (rc->quirk_detect_quiet_flag)
> +		cdns_pcie_detect_quiet_min_delay_set(&rc->pcie);
> +
> +	cdns_pcie_host_enable_ptm_response(pcie);
> +
> +	ret = cdns_pcie_start_link(pcie);
> +	if (ret) {
> +		dev_err(dev, "Failed to start link\n");
> +		return ret;
> +	}
> +
> +	ret = cdns_pcie_host_start_link(rc);
> +	if (ret)
> +		dev_dbg(dev, "PCIe link never came up\n");
> +
> +	return 0;
> +}
> +
>  int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  {
>  	struct device *dev = rc->pcie.dev;
> @@ -533,20 +557,9 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  		return PTR_ERR(rc->cfg_base);
>  	rc->cfg_res = res;
>  
> -	if (rc->quirk_detect_quiet_flag)
> -		cdns_pcie_detect_quiet_min_delay_set(&rc->pcie);
> -
> -	cdns_pcie_host_enable_ptm_response(pcie);
> -
> -	ret = cdns_pcie_start_link(pcie);
> -	if (ret) {
> -		dev_err(dev, "Failed to start link\n");
> -		return ret;
> -	}
> -
> -	ret = cdns_pcie_host_start_link(rc);
> +	ret = cdns_pcie_host_link_setup(rc);
>  	if (ret)
> -		dev_dbg(dev, "PCIe link never came up\n");
> +		return ret;
>  
>  	for (bar = RP_BAR0; bar <= RP_NO_BAR; bar++)
>  		rc->avail_ib_bar[bar] = true;
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
> index 373cb50fcd15..4c687aeb810e 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -515,10 +515,16 @@ static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
>  }
>  
>  #ifdef CONFIG_PCIE_CADENCE_HOST
> +int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc);
>  int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
>  void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
>  			       int where);
>  #else
> +static inline int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
> +{
> +	return 0;
> +}
> +
>  static inline int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  {
>  	return 0;
> 
> -- 
> 2.39.2
> 
> 

