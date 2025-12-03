Return-Path: <linux-i2c+bounces-14388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24278CA1DD5
	for <lists+linux-i2c@lfdr.de>; Wed, 03 Dec 2025 23:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83E7B3007978
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Dec 2025 22:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2724C2DEA9B;
	Wed,  3 Dec 2025 22:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLp6iHDW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B19482EB;
	Wed,  3 Dec 2025 22:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764802333; cv=none; b=Mjwf20wX25+EkNKe+1aFZPy4fTajh57M1xeHANqI866HDsCq56T4rWIdB8/bZhFCucMAQz5/7/drcEHb4nqN17jO6ZZEu3GM5irnnBnDM5PY+6A0DfWAHnbO6vskln+RQBh3jx+4UwK6TDIs4WttNGVAKpwhA5wZvGtU3AbUs54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764802333; c=relaxed/simple;
	bh=J7zI0uZIaYifzCeFY1jzSs++/SMtxwmTWF7MhGyaStk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjghIg+m8JzQqfIfuPzJ1D+q5gHUzziObp0pKLs9xgDmjvqA3LZvsCMGVz2crP2mtlsc8sY0UYjUKV35b9Fogll5gR7z2PH1tRMt9zDaRxtKeNt1qGojURItW6jpoDHON9RRyuY16HC+xOP+Ow9TZ31XfKFT0YffLeqCgM40MQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLp6iHDW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764802332; x=1796338332;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J7zI0uZIaYifzCeFY1jzSs++/SMtxwmTWF7MhGyaStk=;
  b=lLp6iHDWVLsVMwhtVR9m0cKOhP7NjPy4kmTqJ5MOYNs5ElbGKg44+bRl
   ArCy9eZi3Fsm9PaB6xGo3CSCgv8fbncQ7yu4QKu1PxpGTO0EmoqHzwUrD
   Oob88ybywOgnCG4rIFaKc9WEk6RkY29n/Pcmzh4AmZAOpxaOwfcKiW2Vb
   sOi2R3ZspSj6yahTeBb3SJj6O2+NIrbQJeGhI0nl9DB5XgCcm9u0oWo21
   TA+ekskog2DHTz8YUYCrq+cn65buyPjWRDjctwOrLCM58KMEP+a/e2mvd
   JjHpNgXkWkfw0lC73byqnPZ33kFX48Ap4NVVt2OET1vGsd+asZpUKbFYK
   A==;
X-CSE-ConnectionGUID: I8/hq/3CTfi+U6+bFSzPtw==
X-CSE-MsgGUID: oPUu+iq+RLeRdqigta0pjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84413524"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="84413524"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 14:52:11 -0800
X-CSE-ConnectionGUID: PAUoZFRtR4i6DUhSo0WuFg==
X-CSE-MsgGUID: WOqu3ApoQvWqpsaXQdDexg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="232140090"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO [10.125.108.28]) ([10.125.108.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 14:52:10 -0800
Message-ID: <26b9cb6d-8370-4908-aed9-9c5b07e5fb82@intel.com>
Date: Wed, 3 Dec 2025 15:52:09 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: lpi2c: Use cleanup helper for
 dma_async_tx_descriptor error handling
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, carlos.song@nxp.com
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
 <20251003-dma_chan_free-v2-2-564946b6c563@nxp.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20251003-dma_chan_free-v2-2-564946b6c563@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/3/25 9:26 AM, Frank Li wrote:
> Use the cleanup helper to simplify dma_async_tx_descriptor error handling.
> 
> No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change v2
>  need goto unmap buffer.
> 
> desc_prepare_err_exit:
>         dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>                          dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>         return -EINVAL;
> 
> submit_err_exit:
>         dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>                          dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>         dmaengine_desc_free(rx_cmd_desc)
> 
> auto cleanup by __free, so whole error path submit_err_exit can be removed
> and use desc_prepare_err_exit label.
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 03b5a7e8c361abe1d75fb4d31f9614bbc6387d93..e31c2d81f59f18a09d34f79896a7fa4bb83c0a12 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -722,7 +722,7 @@ static void lpi2c_dma_callback(void *data)
>  
>  static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>  {
> -	struct dma_async_tx_descriptor *rx_cmd_desc;
> +	struct dma_async_tx_descriptor *rx_cmd_desc __free(dma_async_tx_descriptor) = NULL;
>  	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
>  	struct dma_chan *txchan = dma->chan_tx;
>  	dma_cookie_t cookie;
> @@ -746,10 +746,11 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>  	cookie = dmaengine_submit(rx_cmd_desc);
>  	if (dma_submit_error(cookie)) {
>  		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
> -		goto submit_err_exit;
> +		goto desc_prepare_err_exit;

Typically if you are introducing cleanup usage, you will want to remove all the goto usages. Otherwise it gets kinda messy having both styles. Although not sure how to do a cleanup macro with dma_unmap_*. Unless a local one where lpi2c_imx_dma also contains a ptr to the device. Then that may be doable. 

DJ>  	}
>  
>  	dma_async_issue_pending(txchan);
> +	retain_and_null_ptr(rx_cmd_desc);
>  
>  	return 0;
>  
> @@ -757,12 +758,6 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>  	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>  			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>  	return -EINVAL;
> -
> -submit_err_exit:
> -	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
> -			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
> -	dmaengine_desc_free(rx_cmd_desc);
> -	return -EINVAL;
>  }
>  
>  static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
> 


