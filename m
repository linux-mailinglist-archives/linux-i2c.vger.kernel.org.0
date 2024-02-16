Return-Path: <linux-i2c+bounces-1823-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D153A857904
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 10:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DBB4B2236A
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 09:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3662F1BC3C;
	Fri, 16 Feb 2024 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BnB709Va"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AC01CF8D;
	Fri, 16 Feb 2024 09:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708076332; cv=none; b=fKpE5tdr98yayKp1YwtQU3n/AcO9RyoO5AJVVFvqKzgdvGjVcS1wkiQVtd5quFQsgJHUeBT0PZK6JD/9+HGDtH3G0KWRG6hG+HnSe+Xim//4uqPBBYkbMSstPycq8uplh8yW4Crb8UbzeVgEcTkktGroA3EkgYe88USNQFmZW8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708076332; c=relaxed/simple;
	bh=BI7W8ax5vDQ9g4imMHP9uQdZchATZ8kJHQ4HB2NFSEk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBebHXLiJ0rwAjTJk4Vli/fK9MBOB74KPVB+avLSuloYx5RDZAhF0HlvGNtBoJZTVx3uWWXhecU4ayGtSxeM/DBAf4oh3F3uG0E+jmOCTH67G91m3YNslOb5QFkA+Rbx9IXxaV7zgscMbjRwkI0qrBL756ah7NPTPwXDvaEsPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BnB709Va; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41G9c4mh039207;
	Fri, 16 Feb 2024 03:38:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708076284;
	bh=6XOEg8zy1Ye8mh1OrIsHQBS2ropjPUF/TdSRHdzFTPs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BnB709Vai88haM0St4nI4UMag9wWITE+Pc+ukqHFPxnMaKm9y9IOqa2MIblOfcn6s
	 usVFAeDzo2ZrDW+ESAw5g2yr3H8ixoXg+7lLLMxbJQmW6TVaOTogyPZNx6zt79/HCO
	 DXd2aphzfTeJsAZcmmYEZb6JTW1dbl8+PXBobaI4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41G9c4rx051568
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Feb 2024 03:38:04 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Feb 2024 03:38:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Feb 2024 03:38:04 -0600
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41G9c3ha054061;
	Fri, 16 Feb 2024 03:38:04 -0600
Date: Fri, 16 Feb 2024 15:08:02 +0530
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
Subject: Re: [PATCH v3 16/18] PCI: cadence: set cdns_pcie_host_init() global
Message-ID: <fd7315fe-bb3d-444d-a5d3-9f91dc88f105@ti.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-16-5c2e4a3fac1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v3-16-5c2e4a3fac1f@bootlin.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 24/02/15 04:18PM, Thomas Richard wrote:
> During the resume sequence of the host, cdns_pcie_host_init() needs to be
> called, so set it global.
> 
> The dev function parameter is removed, as it isn't used.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

> ---
>  drivers/pci/controller/cadence/pcie-cadence-host.c | 5 ++---
>  drivers/pci/controller/cadence/pcie-cadence.h      | 6 ++++++
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index 93d9922730af..8af95e9da7ce 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -485,8 +485,7 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
>  	return cdns_pcie_host_map_dma_ranges(rc);
>  }
>  
> -static int cdns_pcie_host_init(struct device *dev,
> -			       struct cdns_pcie_rc *rc)
> +int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
>  {
>  	int err;
>  
> @@ -564,7 +563,7 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
>  	for (bar = RP_BAR0; bar <= RP_NO_BAR; bar++)
>  		rc->avail_ib_bar[bar] = true;
>  
> -	ret = cdns_pcie_host_init(dev, rc);
> +	ret = cdns_pcie_host_init(rc);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
> index 4c687aeb810e..d55dfd173f22 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -516,6 +516,7 @@ static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
>  
>  #ifdef CONFIG_PCIE_CADENCE_HOST
>  int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc);
> +int cdns_pcie_host_init(struct cdns_pcie_rc *rc);
>  int cdns_pcie_host_setup(struct cdns_pcie_rc *rc);
>  void __iomem *cdns_pci_map_bus(struct pci_bus *bus, unsigned int devfn,
>  			       int where);
> @@ -525,6 +526,11 @@ static inline int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
>  	return 0;
>  }
>  
> +static inline int cdns_pcie_host_init(struct cdns_pcie_rc *rc)
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

