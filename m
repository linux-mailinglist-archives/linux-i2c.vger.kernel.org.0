Return-Path: <linux-i2c+bounces-2483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4FD886461
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 01:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 943311F22EF7
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 00:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382D638B;
	Fri, 22 Mar 2024 00:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="insSwIgc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8274376;
	Fri, 22 Mar 2024 00:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711067653; cv=none; b=HuCR724bT9dwPF5Qs9TexwHwbUIz3lGLGEE8lRBzEsDtbrGBfJwWhYo89QU+8tPDSbFnccP7TPL43qHwUsLjgiC8QBGdu9NMtZajRN4ZtGBy2BepcrIMGAbzxON5+VONsye0UCKpCDESv/ybxNYSDYFjaWbhg0kUQjvmjSncZ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711067653; c=relaxed/simple;
	bh=g9qE9ZrvmfY+JWl+GB2nOwlauim2SCg0XAFY9dp141o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foAlPsVxqlqFMnrieovn8gCapIe70QTps/d0LScRVb9f90BbBDbFvFFy3MDFgcpPyxkfCc8/CavtCapU7pgEnx7bU+SY26TGUa7htkSBdT3kxjBn5wDmQRlZ0/4odQ/N9X+ksg7OLVi1kr9lMZr/1VLTBWjvQQ5t/MfdU6Knt/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=insSwIgc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C52AC433C7;
	Fri, 22 Mar 2024 00:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711067652;
	bh=g9qE9ZrvmfY+JWl+GB2nOwlauim2SCg0XAFY9dp141o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=insSwIgc5eVFdeUDQ31YJ8tkkKRoUG9RiYQBMa0DbILuoAhtJYpRA6sA/ROkKbvJc
	 MJ05Rh30x5+efK4EPiGCWItDc9Oxmwi/38pfkpyOkFoEmqLzznQFnh7HrFtBf3lOSr
	 lmEorMp/Kk6yVOQ1/MRgTy1rQwuH0aieW5Qvbhl5SbMmpbEROOPoQcfINqmhrX6xDn
	 EvQy96DxrIv9uirqpprhCAmqlSTOIFq+tHJALBrFCvQF9ZQqSVFXB/IlDqJ7LEG8u6
	 J2Py5un9z313MiCgPi8OWCn/kUmNa4sw5geF+6c8r8uTRbG627KvrAglAONHoaH5mX
	 xUl0xQWKvYGcg==
Date: Fri, 22 Mar 2024 01:34:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Piyush Malgujar <pmalgujar@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sgarapati@marvell.com, cchavva@marvell.com, jannadurai@marvell.com
Subject: Re: [PATCH v4 4/4] i2c: thunderx: Adding ioclk support
Message-ID: <kjba6tkjbdekmxsv4mz7wq4gmgd4grwwhzjlvjcyzyosvdts26@ahzdkylavaxy>
References: <20240223125725.1709624-1-pmalgujar@marvell.com>
 <20240223125725.1709624-5-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223125725.1709624-5-pmalgujar@marvell.com>

Hi Piyush,

On Fri, Feb 23, 2024 at 04:57:25AM -0800, Piyush Malgujar wrote:
> Read the ioclk property as reference clock if sclk not
> present in acpi table to make it SOC agnostic.
> In case, it's not populated from dts/acpi table, use 800MHz
> as default clock.

Why change from 700MHz to 800MHz?

> Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
> ---
>  drivers/i2c/busses/i2c-thunderx-pcidrv.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> index 31f11b77ab663626967c86086a03213876bf4a07..15cf794a776533d1b0dbb08597fc0d9acf791b44 100644
> --- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
> @@ -27,7 +27,7 @@
>  
>  #define PCI_DEVICE_ID_THUNDER_TWSI	0xa012
>  
> -#define SYS_FREQ_DEFAULT		700000000
> +#define SYS_FREQ_DEFAULT		800000000
>  #define OTX2_REF_FREQ_DEFAULT		100000000
>  
>  #define TWSI_INT_ENA_W1C		0x1028
> @@ -100,7 +100,8 @@ static void thunder_i2c_clock_enable(struct device *dev, struct octeon_i2c *i2c)
>  		i2c->sys_freq = clk_get_rate(i2c->clk);
>  	} else {
>  		/* ACPI */
> -		device_property_read_u32(dev, "sclk", &i2c->sys_freq);
> +		if (device_property_read_u32(dev, "sclk", &i2c->sys_freq))
> +			device_property_read_u32(dev, "ioclk", &i2c->sys_freq);
>  	}
>  
>  skip:
> @@ -182,7 +183,6 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
>  	if (!i2c->twsi_base)
>  		return -EINVAL;
>  
> -	thunder_i2c_clock_enable(dev, i2c);

This change and the related goto's are not described in the
commit message. How are they related to this patch?

Andi

>  	ret = device_property_read_u32(dev, "clock-frequency", &i2c->twsi_freq);
>  	if (ret)
>  		i2c->twsi_freq = I2C_MAX_STANDARD_MODE_FREQ;
> @@ -196,12 +196,12 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
>  
>  	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX);
>  	if (ret < 0)
> -		goto error;
> +		return ret;
>  
>  	ret = devm_request_irq(dev, pci_irq_vector(pdev, 0), octeon_i2c_isr, 0,
>  			       DRV_NAME, i2c);
>  	if (ret)
> -		goto error;
> +		return ret;
>  
>  	ret = octeon_i2c_init_lowlevel(i2c);
>  	if (ret)
> @@ -213,6 +213,9 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
>  	 */
>  	if (octeon_i2c_is_otx2(pdev) && IS_LS_FREQ(i2c->twsi_freq))
>  		i2c->sys_freq = OTX2_REF_FREQ_DEFAULT;
> +	else
> +		thunder_i2c_clock_enable(dev, i2c);
> +
>  	octeon_i2c_set_clock(i2c);
>  
>  	i2c->adap = thunderx_i2c_ops;
> @@ -240,6 +243,8 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
>  
>  error:
>  	thunder_i2c_clock_disable(dev, i2c->clk);
> +	if (!IS_LS_FREQ(i2c->twsi_freq))
> +		thunder_i2c_clock_disable(dev, i2c->clk);
>  	return ret;
>  }
>  
> -- 
> 2.43.0
> 

