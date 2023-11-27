Return-Path: <linux-i2c+bounces-485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C777FAEB8
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 00:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 332E4281752
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 23:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6800A49F7D;
	Mon, 27 Nov 2023 23:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bslYKD5t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2633248CDD
	for <linux-i2c@vger.kernel.org>; Mon, 27 Nov 2023 23:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32217C433C8;
	Mon, 27 Nov 2023 23:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701129278;
	bh=a4P4BVbYULK6L0Qcy9l2Nr9bwz51FMIOg7cjJS/nXYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bslYKD5tUGWZ5VSkxmL+cLa+gMT+XtEYLO9BWapWvLceaa88PssY9/4CTV+dXRCvd
	 6IhiiX/Q1brdnbjkBXsNvfclpuDKcKLrQqWFwFysyOsGdJvgD9nNsWXS88+anMvXVx
	 F5MUM6tfr9M206FhKnogoEANUBjVlokkcCVzQJja+aky1jjL+tZB+SeQmcglrLPKsh
	 dtTityQ7Ek4LW3WNsgx2UsghXr488n4T2gc7M0bNTNy7++qqucyG+MivIGAAz7ZbnB
	 wIt0MurNIjj4i48Vk3piofcL3x+LfTZZD7fDkYMWB6X035SsUTqgEErQZMh6clNjmB
	 yF+F9SwCzWz8g==
Date: Tue, 28 Nov 2023 00:54:34 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 07/24] i2c: designware: Add missing 'c' into PCI IDs
 variable name
Message-ID: <20231127235434.p6c6lxcjbxkerhoj@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-8-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-8-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:41:49PM +0200, Andy Shevchenko wrote:
> Add missing 'c' into i2c_designware_pci_ids variable name.
> 
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-designware-pcidrv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index e67956845c19..ed2f9e7ba5d3 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -355,7 +355,7 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
>  	i2c_del_adapter(&dev->adapter);
>  }
>  
> -static const struct pci_device_id i2_designware_pci_ids[] = {
> +static const struct pci_device_id i2c_designware_pci_ids[] = {
>  	/* Medfield */
>  	{ PCI_VDEVICE(INTEL, 0x0817), medfield },
>  	{ PCI_VDEVICE(INTEL, 0x0818), medfield },
> @@ -403,16 +403,16 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
>  	{ PCI_VDEVICE(ATI,  0x7464), navi_amd },
>  	{ 0,}
>  };
> -MODULE_DEVICE_TABLE(pci, i2_designware_pci_ids);
> +MODULE_DEVICE_TABLE(pci, i2c_designware_pci_ids);
>  
>  static struct pci_driver dw_i2c_driver = {
>  	.name		= DRIVER_NAME,
> -	.id_table	= i2_designware_pci_ids,
>  	.probe		= i2c_dw_pci_probe,
>  	.remove		= i2c_dw_pci_remove,
>  	.driver         = {
>  		.pm     = &i2c_dw_pm_ops,
>  	},
> +	.id_table	= i2c_designware_pci_ids,

why this change?

Thanks,
Andi

>  };
>  module_pci_driver(dw_i2c_driver);
>  
> -- 
> 2.43.0.rc1.1.gbec44491f096
> 

