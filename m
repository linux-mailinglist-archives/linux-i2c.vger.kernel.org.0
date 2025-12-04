Return-Path: <linux-i2c+bounces-14405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD67DCA43A1
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 16:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1051731DDAC6
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 15:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271732D8398;
	Thu,  4 Dec 2025 15:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5YSqXS6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15DF2D73A3;
	Thu,  4 Dec 2025 15:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860958; cv=none; b=mHxsyHfPFHZmwW1j7i/rLzmi4Ybt+QMEC8x1Lip5KE6efXI3CANSAq+QsiBS0wJM+x+iNSErIK/8dPcRPlOfz1GbKVH5OVrrB7Mqfrxd0ufC5c/k3tY+NTgivLKtkdyzqJzUYOvyBHFUl3I1GJ0UxIQIviR8xkAL+PGqg129nN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860958; c=relaxed/simple;
	bh=0sFsd5k8Q0vVJXdJf/IRTs0ofL7IMrAGQDQFMFrLC5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVMoTTH/H/zSbyAYibFqPCIHjPsBGjvKNfIBD/KZAFU91RVQPY4DW8hdgmtBjE3bw4h1DfMqBF2IZlGzEQ99njnHeoubegiq/wDmdkhkwk8k/MiLF7AWhX5P1oCvo/JJSf0aI5JVLuJ8jthWS+tqM7EO6wPr1THlb/VmJfOZHl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5YSqXS6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764860956; x=1796396956;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0sFsd5k8Q0vVJXdJf/IRTs0ofL7IMrAGQDQFMFrLC5c=;
  b=A5YSqXS6229/46i2HBFEUrGLtht86vv5ZlzRvjGxHuIfZCQrQ89a+XZL
   Ej3fs1V1XoK1Jb8WySn+ZHbVpkxbXcJY/hTOjF5hiyVBqI8V63UhZsRae
   p8f38LJB58GYYvzUnDI3AaYxj+TukNcfH/o9jdYyi4vQtg5DJ75GmDdEI
   q8fN1nWHVf3YfFJaslzrEOMbb32uTD9icnAEa7o4GX2ZPX22UnlyigKEh
   HnJTU0SmC01OdkSLXR9fm48bw3utSVBJBpdlQgAD15N9/bKpSsAbTi6L/
   +C77IPqkh1ermiiOwMVWA/Xvw+AbNbY/g5oEsTL1oZpdRKKEeBwEDUI0y
   Q==;
X-CSE-ConnectionGUID: sZyyFIKeTzKuC0eXfSIaYQ==
X-CSE-MsgGUID: Q/Ve1D6RSxq0Cw1A4q1RYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84280663"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="84280663"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 07:09:14 -0800
X-CSE-ConnectionGUID: ea1+yHXsTTKRqWUCFFHAag==
X-CSE-MsgGUID: FMlvhaqoQ2q5MO16oqZAdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="194073418"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.108.95]) ([10.125.108.95])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 07:09:13 -0800
Message-ID: <3a065c54-f043-4c94-ac52-ef5b48a0dc71@intel.com>
Date: Thu, 4 Dec 2025 08:09:12 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: lpi2c: Use cleanup helper for
 dma_async_tx_descriptor error handling
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 carlos.song@nxp.com
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
 <20251003-dma_chan_free-v2-2-564946b6c563@nxp.com>
 <26b9cb6d-8370-4908-aed9-9c5b07e5fb82@intel.com>
 <aTDjmdfUk94R3Dyk@lizhi-Precision-Tower-5810>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <aTDjmdfUk94R3Dyk@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/3/25 6:27 PM, Frank Li wrote:
> On Wed, Dec 03, 2025 at 03:52:09PM -0700, Dave Jiang wrote:
>>
>>
>> On 10/3/25 9:26 AM, Frank Li wrote:
>>> Use the cleanup helper to simplify dma_async_tx_descriptor error handling.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>> change v2
>>>  need goto unmap buffer.
>>>
>>> desc_prepare_err_exit:
>>>         dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>>>                          dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>>>         return -EINVAL;
>>>
>>> submit_err_exit:
>>>         dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>>>                          dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>>>         dmaengine_desc_free(rx_cmd_desc)
>>>
>>> auto cleanup by __free, so whole error path submit_err_exit can be removed
>>> and use desc_prepare_err_exit label.
>>> ---
>>>  drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++--------
>>>  1 file changed, 3 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
>>> index 03b5a7e8c361abe1d75fb4d31f9614bbc6387d93..e31c2d81f59f18a09d34f79896a7fa4bb83c0a12 100644
>>> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
>>> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
>>> @@ -722,7 +722,7 @@ static void lpi2c_dma_callback(void *data)
>>>
>>>  static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>>>  {
>>> -	struct dma_async_tx_descriptor *rx_cmd_desc;
>>> +	struct dma_async_tx_descriptor *rx_cmd_desc __free(dma_async_tx_descriptor) = NULL;
>>>  	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
>>>  	struct dma_chan *txchan = dma->chan_tx;
>>>  	dma_cookie_t cookie;
>>> @@ -746,10 +746,11 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>>>  	cookie = dmaengine_submit(rx_cmd_desc);
>>>  	if (dma_submit_error(cookie)) {
>>>  		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
>>> -		goto submit_err_exit;
>>> +		goto desc_prepare_err_exit;
>>
>> Typically if you are introducing cleanup usage, you will want to remove all the goto usages. Otherwise it gets kinda messy having both styles. Although not sure how to do a cleanup macro with dma_unmap_*. Unless a local one where lpi2c_imx_dma also contains a ptr to the device. Then that may be doable.
> 
> dma_unmap() patch at
> https://lore.kernel.org/imx/aPZbuY5bLpkoO2J%2F@lizhi-Precision-Tower-5810/
> 
> The first patch need be pickup and dma umap firstly.  Then I can remove all
> goto.

perfect


> 
> Frank
> 
>>
>> DJ>  	}
>>>
>>>  	dma_async_issue_pending(txchan);
>>> +	retain_and_null_ptr(rx_cmd_desc);
>>>
>>>  	return 0;
>>>
>>> @@ -757,12 +758,6 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
>>>  	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>>>  			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>>>  	return -EINVAL;
>>> -
>>> -submit_err_exit:
>>> -	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
>>> -			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>>> -	dmaengine_desc_free(rx_cmd_desc);
>>> -	return -EINVAL;
>>>  }
>>>
>>>  static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
>>>
>>
> 


