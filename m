Return-Path: <linux-i2c+bounces-2202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA158729BB
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 22:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CC3FB270AB
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 21:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2250412BF13;
	Tue,  5 Mar 2024 21:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kb1Gk1AG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42C712BEBE
	for <linux-i2c@vger.kernel.org>; Tue,  5 Mar 2024 21:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709675355; cv=none; b=K25AwpcQlP0dI6uPEWXV5qUdMTwMwZnaruz9LnIgoq+20WQDflwJHfUxttE+f27xJvVD1cny+WHr5DXXhArONL/VAIVhH9ExU3nAQgTex9tE0iwVjO4fMlHRJ7bFJpiZeq894XUGAhzNvMVA/ISWbLWsF5a3K387Gwu5Ogh0fCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709675355; c=relaxed/simple;
	bh=UmZuR+bE69N/bEoNhcODYyJrh76ZF/usAuHxMKaxdhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PA7qZYXY/sPy9JMiUMuMoecS3GerrvEE53GPloTfS4Vj/lUv/r8AP3kHpbmZyIjW1THAC9x9YrwzHa/8SO1DFgjN63cwiZuY9BGLlfCjIcCl11DvgGPnWPufhtHYQxLQiWvKScSGSKjnSZPUANaZVZFx8dGE6AR33BDRBxf0nBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kb1Gk1AG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC21C433C7;
	Tue,  5 Mar 2024 21:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709675355;
	bh=UmZuR+bE69N/bEoNhcODYyJrh76ZF/usAuHxMKaxdhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kb1Gk1AGZ+u5FDQzS5pZI0vUcU1ixraiA5x1CfwN2H1A7XPbiyoPfF7sDxZ9nsdIu
	 RW8YE2s2tiUhsnyVYhIkXiICct1cEAlzuW3MfUOwZqd0iGP42B7rEIALDhGIGQr9Ch
	 0a5Wrynlbd4xjPea/44Wdbixt37+j1Xugz1CWCgcBYrwsYurfJK75J45e9QUopNuKR
	 IoXGBU3haz/ZXZXth58GFieHGdX2XQkHtaKPQCLrARdjodqPQeIwyPUX7UaW5aQd9M
	 Ek4HscGgsBLCbsHF1uFltYDa1g18t3DC3gLrYBiy/klZW/rixRhRfBzcHhrraDaENE
	 Diioj02DWQgtQ==
Date: Tue, 5 Mar 2024 22:49:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-i2c@vger.kernel.org, syniurge@gmail.com, 
	shyam-sundar.s-k@amd.com, Raju.Rangoju@amd.com, basavaraj.natikar@amd.com, wsa@kernel.org
Subject: Re: [PATCH -next] i2c: amd-mp2: drop free_irq() of
 devm_request_irq() allocated irq
Message-ID: <uensfkhuzcmelmrp52shp64k6k3gzianbhnbppojyenk5enmvs@ljrglx7khzg2>
References: <20221103121146.99836-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103121146.99836-1-yangyingliang@huawei.com>

Hi Yang,

long time since this patch has been sent.

On Thu, Nov 03, 2022 at 08:11:46PM +0800, Yang Yingliang wrote:
> irq allocated with devm_request_irq() will be freed in devm_irq_release(),
> using free_irq() in ->remove() will causes a dangling pointer, and a
> subsequent double free. So remove the free_irq() in the error path and
> remove path.

the patch looks correct, but that's not the reason because we
haven't called devm_request_irq() yet.

In theory we shouldn't even need the privdata->dev_irq variable
and we can safely remove it.

In any case, I still would like to have an ack from Elie and
Shyam.

Andi

> Fixes: 969864efae78 ("i2c: amd-mp2: use msix/msi if the hardware supports")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/i2c/busses/i2c-amd-mp2-pci.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> index 143165300949..ef7370d3dbea 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> @@ -327,13 +327,11 @@ static int amd_mp2_pci_init(struct amd_mp2_dev *privdata,
>  			      amd_mp2_irq_isr, irq_flag, dev_name(&pci_dev->dev), privdata);
>  	if (rc) {
>  		pci_err(pci_dev, "Failure requesting irq %i: %d\n", privdata->dev_irq, rc);
> -		goto free_irq_vectors;
> +		goto err_dma_mask;
>  	}
>  
>  	return rc;
>  
> -free_irq_vectors:
> -	free_irq(privdata->dev_irq, privdata);
>  err_dma_mask:
>  	pci_clear_master(pci_dev);
>  err_pci_enable:
> @@ -376,7 +374,6 @@ static void amd_mp2_pci_remove(struct pci_dev *pci_dev)
>  	pm_runtime_forbid(&pci_dev->dev);
>  	pm_runtime_get_noresume(&pci_dev->dev);
>  
> -	free_irq(privdata->dev_irq, privdata);
>  	pci_clear_master(pci_dev);
>  
>  	amd_mp2_clear_reg(privdata);
> -- 
> 2.25.1
> 

