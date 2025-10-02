Return-Path: <linux-i2c+bounces-13369-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FF2BB51BB
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 22:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DD6519E5A60
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 20:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5C02882BE;
	Thu,  2 Oct 2025 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mqrvZs0/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-65.smtpout.orange.fr [80.12.242.65])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E099288C89;
	Thu,  2 Oct 2025 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759435830; cv=none; b=XQMxEFl7MPdXuQP5uGdsOW5WxIr4Tt9seo4qnqwTMU+X673uN+xqpF+H3JtUGwUCo9cf3PVpbrQCKTMstl65Nd+VXaZkAvfR4LzmMHugYJHcTsZxFsAxDZKvw4MDErqnIYkqFGFelm4e38rwoe15AnUN0UMyzZGvxAtbM/O5r8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759435830; c=relaxed/simple;
	bh=/CHUa9Xd4pwC9zO/0R+e2oG/3o8T8zscmEl6eoWn9w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1bRKfdqyCXrmvzw74WWYlY5YrtRcVxpp0I2uNy/WwZlzs3HgJAv3615mx6+4x6qvItrEnY+wzcwK1eXq2i6pmUoMawUEuca7Ijvp3mOjqgtV48Es1CQpBjmpHDq05SfrEN7eYg5LJEFNYaS3gSqqY7JcxRTEc/F2xYt5tbh8ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=mqrvZs0/; arc=none smtp.client-ip=80.12.242.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id 4Pd2vGIoXKUOX4Pd2vw55W; Thu, 02 Oct 2025 22:10:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1759435819;
	bh=p541rxmb4NTJ3zK+jdMrAbP4PuUbxpsXgirt6z/FgyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=mqrvZs0/GJVIsSsTT/xyhVFH3DlBOMHg5jMuGqM9Scd1cH6BTFiiLML4IvdKrK3E0
	 SN1z+dwKwmcuFyZG4qSK7OSjnZ7cT0Fl5277HXnNWX1ZUlCmEex+DbUHCr6kCUTIsk
	 H5K9XBY3m1oH7encXKlcjaZ3S2h+5IKMzKzV49Rj7tb5TcZm+WRkQ0bhCBw59QDlEc
	 AlD3vIxa1Sqtgy1Q9MNatcaywkMx7qcelGsEI27Ivs80d+9BFqhsBE3978/d2y+k6i
	 QbYi2y20FCZtrQYkHs89q8tfmD4NpvNNEKUZpdh+LkiOjEhflLlfaDs2t15zSE/byL
	 h7hUO7BbrWxDg==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 02 Oct 2025 22:10:19 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <3c07c2f0-d069-46d1-b2a6-e2c071198cb6@wanadoo.fr>
Date: Thu, 2 Oct 2025 22:10:16 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: lpi2c: Use cleanup helper for
 dma_async_tx_descriptor error handling
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, carlos.song@nxp.com
References: <20251002-dma_chan_free-v1-0-4dbf116c2b19@nxp.com>
 <20251002-dma_chan_free-v1-2-4dbf116c2b19@nxp.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20251002-dma_chan_free-v1-2-4dbf116c2b19@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/10/2025 à 21:49, Frank Li a écrit :
> Use the cleanup helper to simplify dma_async_tx_descriptor error handling.
> 
> No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 03b5a7e8c361abe1d75fb4d31f9614bbc6387d93..b1d035ca8002e9648b67bfe4d674578373394710 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -722,7 +722,7 @@ static void lpi2c_dma_callback(void *data)
>   
>   static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>   {
> -	struct dma_async_tx_descriptor *rx_cmd_desc;
> +	struct dma_async_tx_descriptor *rx_cmd_desc __free(dma_async_tx_descriptor) = NULL;
>   	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
>   	struct dma_chan *txchan = dma->chan_tx;
>   	dma_cookie_t cookie;
> @@ -746,10 +746,11 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>   	cookie = dmaengine_submit(rx_cmd_desc);
>   	if (dma_submit_error(cookie)) {
>   		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
> -		goto submit_err_exit;
> +		return dma_submit_error(cookie);

I don't know if it matters or not, but this may change the returned 
value in this error handling path.

>   	}
>   
>   	dma_async_issue_pending(txchan);
> +	retain_and_null_ptr(rx_cmd_desc);
>   
>   	return 0;
>   
> @@ -757,12 +758,6 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>   	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>   			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>   	return -EINVAL;
> -
> -submit_err_exit:
> -	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
> -			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);

dma_unmap_single() is not needed anymore?

> -	dmaengine_desc_free(rx_cmd_desc);
> -	return -EINVAL;
>   }
>   
>   static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
> 


