Return-Path: <linux-i2c+bounces-6610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 978B19762FB
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 09:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAB651C20C4A
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 07:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138CC198A05;
	Thu, 12 Sep 2024 07:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hINX42mJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C985D190665
	for <linux-i2c@vger.kernel.org>; Thu, 12 Sep 2024 07:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726126813; cv=none; b=UuKEqWyKQbxJiVEDPWkjDislBCqXxVhEMbrLsv6zpriTlf46X3Xc87Hf9NgyKbs/n8yzD8i2PA4Ht52nRnHiqdKUAs55mv9prX6C69NcfT/1PKmhULAbKfY8zUju6cvvcn9R9DvS27HNFiuaU9dgtw9bxBZ3nyVrUuSuVWRvmy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726126813; c=relaxed/simple;
	bh=i/DBehjrGFlJ25CyRT3tH3Du0PWoOxpQ7BSmSKZigj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h84ia3ud/cWXN85IKkrnvDFgMAAYzBdcRbNj0zN+QbDY4t5Go5El6W9xCOpGGKMJRy6yyFdSHnehGIr0nrQZPlDfP7lQAL91y6yLrsZb9ygi7vjIT/YW5S4IciMwxrSLm3uwEbkIllts6poL/8JuIt0gMpthx0Y1YnHevMfjMVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hINX42mJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FF5C4CECE;
	Thu, 12 Sep 2024 07:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726126813;
	bh=i/DBehjrGFlJ25CyRT3tH3Du0PWoOxpQ7BSmSKZigj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hINX42mJkJ2DHGEozCKlZVkWZVeL8+8Q3Vs9mUgr3Wt/3JmJTNfmh8Oe4j50aiNrt
	 qDnhYeXUJTYFPHTPwps5b729bHckDzY9RMSMdP1m1rzhGzQNqhuySKGQoB8r7ZxWnI
	 T/b8cFB7FxXaRd9nyHa3Q/K5jo74NvadX9lT1GJRPil9TvGsn6RtaYQ5/ghHk2Of6m
	 +pvB8Hs95shiOM3vjUCUcbFbZqbM+Xbf0L5Jg5zlpYYmOLGcTfdxN2Lepv6umGOzzU
	 JbAEvL3cWBuZMMmRJldhgo57xlhBccl8jRypis92J/iPmIXb1aCgs6FPRTpwPN97Tl
	 TcygEQg9E4Szw==
Date: Thu, 12 Sep 2024 09:40:09 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	Sanket.Goswami@amd.com
Subject: Re: [PATCH v4 3/8] i2c: piix4: Export i2c_piix4 driver functions as
 library
Message-ID: <xog6iyhri64cml2p53ncja6lxpt256eqceru4jxi7ee4esnb2j@xrbmeheorofv>
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
 <20240911115407.1090046-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240911115407.1090046-4-Shyam-sundar.S-k@amd.com>

Hi Shyam,

On Wed, Sep 11, 2024 at 05:24:02PM GMT, Shyam Sundar S K wrote:
> Export the following i2c_piix4 driver functions as a library so that the
> AMD ASF driver can utilize these core functionalities from the i2c_piix4
> driver:
> 
> - piix4_sb800_region_request(): Request access to a specific SMBus region
> on the SB800 chipset.
> 
> - piix4_sb800_region_release(): Release the previously requested SMBus
> region on the SB800 chipset.
> 
> - piix4_transaction(): Handle SMBus transactions between the SMBus
> controller and connected devices.
> 
> - piix4_sb800_port_sel(): Select the appropriate SMBus port on the SB800
> chipset.
> 
> By making these functions available as a library, enable the AMD ASF
> driver to leverage the established mechanisms in the i2c_piix4 driver,
> promoting code reuse and consistency across different drivers.

...

> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
> index 2c2a466e2f85..174cce254e96 100644
> --- a/drivers/i2c/busses/i2c-piix4.c
> +++ b/drivers/i2c/busses/i2c-piix4.c
> @@ -153,8 +153,7 @@ struct i2c_piix4_adapdata {
>  	struct sb800_mmio_cfg mmio_cfg;
>  };
>  
> -static int piix4_sb800_region_request(struct device *dev,
> -				      struct sb800_mmio_cfg *mmio_cfg)
> +int piix4_sb800_region_request(struct device *dev, struct sb800_mmio_cfg *mmio_cfg)

I’m not entirely happy with this change, or the others above. If
someone runs a git bisect, they would be confused by not seeing
this change described in the commit log.

While it's true that the accepted line length is now 100
characters, the 80-character limit is still preferred (and
personally, I prefer 80, though that’s just my opinion).

This change doesn’t seem necessary, so please amend it along with
the others below in the next version.

Thanks,
Andi

>  {
>  	if (mmio_cfg->use_mmio) {
>  		void __iomem *addr;
> @@ -192,9 +191,9 @@ static int piix4_sb800_region_request(struct device *dev,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(piix4_sb800_region_request);
>  
> -static void piix4_sb800_region_release(struct device *dev,
> -				       struct sb800_mmio_cfg *mmio_cfg)
> +void piix4_sb800_region_release(struct device *dev, struct sb800_mmio_cfg *mmio_cfg)
>  {
>  	if (mmio_cfg->use_mmio) {
>  		iounmap(mmio_cfg->addr);
> @@ -205,6 +204,7 @@ static void piix4_sb800_region_release(struct device *dev,
>  
>  	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
>  }
> +EXPORT_SYMBOL_GPL(piix4_sb800_region_release);
>  
>  static bool piix4_sb800_use_mmio(struct pci_dev *PIIX4_dev)
>  {
> @@ -514,7 +514,7 @@ static int piix4_setup_aux(struct pci_dev *PIIX4_dev,
>  	return piix4_smba;
>  }
>  
> -static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
> +int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
>  {
>  	int temp;
>  	int result = 0;
> @@ -587,6 +587,7 @@ static int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short p
>  		inb_p(SMBHSTDAT1));
>  	return result;
>  }
> +EXPORT_SYMBOL_GPL(piix4_transaction);
>  
>  /* Return negative errno on error. */
>  static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
> @@ -740,7 +741,7 @@ static void piix4_imc_wakeup(void)
>  	release_region(KERNCZ_IMC_IDX, 2);
>  }
>  
> -static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
> +int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
>  {
>  	u8 smba_en_lo, val;
>  
> @@ -762,6 +763,7 @@ static int piix4_sb800_port_sel(u8 port, struct sb800_mmio_cfg *mmio_cfg)
>  
>  	return (smba_en_lo & piix4_port_mask_sb800);
>  }
> +EXPORT_SYMBOL_GPL(piix4_sb800_port_sel);
>  
>  /*
>   * Handles access to multiple SMBus ports on the SB800.

...

