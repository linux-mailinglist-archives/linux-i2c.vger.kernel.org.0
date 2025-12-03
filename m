Return-Path: <linux-i2c+bounces-14387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A80CA1DCF
	for <lists+linux-i2c@lfdr.de>; Wed, 03 Dec 2025 23:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4458300418A
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Dec 2025 22:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AF02E9EC6;
	Wed,  3 Dec 2025 22:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxpJ2Mla"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06C42D8DD9;
	Wed,  3 Dec 2025 22:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764802127; cv=none; b=DWLTh0xWIPttc/Wv024Bt3KUpREvj0Vrxq73crPEsXOmKGVJuZeoRtNWDlXXLt75fGqy9zPztEoZhdc1REBadPd6THVEGUhlL6yjLp25Uh/7Qcx4fkackPUzHz8roYHvnthxZxnTXdWvaXf8mKOk1OTV93bUh0fwLERuPofA/Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764802127; c=relaxed/simple;
	bh=tymJv/clMIhryQKr0qljGJrmVTsR3odBiq+iNwBeUv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Udn4TGARDPV/tGcbQoq75y1pLuAWW1+OVTzXReqp+buHD7fxOV3BLNbh83tZTb88sNlnZtefu1UAVuwLvQgcx6r+jf+B9Kpu6ZL4bSlU0wDSpQhXufdyMff1PqfHEeJWMsFuMKKOClDTpyn0q9aTanXJ0vlwKAwAQyOjpS7dh6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxpJ2Mla; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764802125; x=1796338125;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tymJv/clMIhryQKr0qljGJrmVTsR3odBiq+iNwBeUv0=;
  b=VxpJ2MlaacWFW6ijtIqJ4vl+i11vGV0v8awGGBde/D6G4myED3+N6iDT
   SF158xvvpixs0gQXsv3+/FokllieQAg2jvDug2qB7fzUlmf1GuTF6yGbR
   TxRaaPTeu6SddZ/DurfyyZjWhFzoVqz7lc6MaTBGytc8Bwx0sCNBkZCev
   aphhIhNgZVMiMYRS1oHns/kp9nrlHapIv5z4mC3UFzFMEQHZPJXRABa5M
   TsCIYOr09/LtLyshGpBKmz1WwsrlqJJNQd2t7JNJr0iS8Q7+jxANPb7wm
   8CtBuD48d1nA4Zv5er57AnV2219YT4iby2KmYjnJ0AJIyiApNOFONIwXR
   A==;
X-CSE-ConnectionGUID: 3Hj/oGgiS4OCKMh1clLNJw==
X-CSE-MsgGUID: bPNQ4ODKSl6DZgumsZY4Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77135069"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="77135069"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 14:48:45 -0800
X-CSE-ConnectionGUID: sZjm4yIGQU25k28g4ENMYw==
X-CSE-MsgGUID: WfFN5FAeRg2CxiE7WXh/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="195229109"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO [10.125.108.28]) ([10.125.108.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 14:48:43 -0800
Message-ID: <2c457a46-2b7f-4d66-8555-3b3cb52afe64@intel.com>
Date: Wed, 3 Dec 2025 15:48:41 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dmaengine: Add cleanup FREE defines for
 dma_async_tx_descriptor
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, carlos.song@nxp.com
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
 <20251003-dma_chan_free-v2-1-564946b6c563@nxp.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20251003-dma_chan_free-v2-1-564946b6c563@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/3/25 9:26 AM, Frank Li wrote:
> Add cleanup FREE defines for dma_async_tx_descriptor to support automatic
> cleanup and simplify error handling.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Check patch report exceed 100 chars, but it's still better put into one
> line to keep consistent with other DEFINE_FREE and better readablity
> 
> change in v2
> - remove surpoiouse remove empty line
> ---
>  include/linux/dmaengine.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 99efe2b9b4ea9844ca6161208362ef18ef111d96..27fa1646a807c49c781e1bce9e3e7d9a3c66f41d 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -5,6 +5,7 @@
>  #ifndef LINUX_DMAENGINE_H
>  #define LINUX_DMAENGINE_H
>  
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/uio.h>
> @@ -1612,6 +1613,8 @@ static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
>  	return desc->desc_free(desc);
>  }
>  
> +DEFINE_FREE(dma_async_tx_descriptor, struct dma_async_tx_descriptor *, if (_T) dmaengine_desc_free(_T))

maybe free_dma_async_tx may be clearer as the name vs dma_async_tx_descriptor.

DJ

> +
>  /* --- DMA device --- */
>  
>  int dma_async_device_register(struct dma_device *device);
> 


