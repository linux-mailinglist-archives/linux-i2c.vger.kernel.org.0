Return-Path: <linux-i2c+bounces-14404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F5CCA4389
	for <lists+linux-i2c@lfdr.de>; Thu, 04 Dec 2025 16:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD19631B0EE1
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Dec 2025 15:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8942D73A2;
	Thu,  4 Dec 2025 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wx7rG9Rb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B926A2D5944;
	Thu,  4 Dec 2025 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860877; cv=none; b=rHbuugRGHjc3YPLZRagqgGhJYIs0lTq+SA8G33l7kpwMkLARPGs9vL+XoF7r5y8Jemh4LKoX8GZ+YfCaC2XjNtTGRGAn3dhY8oDTny1kkrEE7OhiL1bHTq56DtMFbd0q5zu6Uy80+rc+YfIWvEexceTBSEhICgQ8B/hKniRZKO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860877; c=relaxed/simple;
	bh=urTFeoWVXYP1UTfnvMJ4zX48iZOPpLh61uW/on3qHz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nzg7KX12+k5JVd2qBOre7c6Maev8iB6oos4WCRgGs59YW6CiAQo0kfqDiqU97MO0JS8NV2PvVDY8cb97Yyd0sUNERyW8mlCs6m6xzZKL4PuizrXw++OpXUkxnr6kVpD8oR6ySCALVCTEebQPyb2VSntws7px99QIEK/myUZk28E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wx7rG9Rb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764860876; x=1796396876;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=urTFeoWVXYP1UTfnvMJ4zX48iZOPpLh61uW/on3qHz8=;
  b=Wx7rG9RbI8MGnZ79ky1Bhf7kBvxni3ZcfrGYX8Zv3DwJQ1iNTKunkZI+
   7BDHGDltPU4a7Uxulp26Vd1ZBQRhprxoro8R2MXvC3oQyXR8+G8TAOKVW
   Y70Tygspgk5BOp+S26vXjPloM0jU3rfIaSyt2VYP57VIIgKLmyQnkh1oc
   HPUolhpFC7sk8X8/+6DpW5M7+lwxl51s7HPeR8CbJJjjhwsPOVsUhQYXF
   THEaQvIcH6bkcqR56P7WCdekRW5doQJfXfaurQpFfKTPRC7nbNMKMZkws
   YduPxF7sirzlKAP7+qhkraor4xctUiy8Xugk3sqZVHqS0KjaKe6HzUmrH
   w==;
X-CSE-ConnectionGUID: SUgmjBv1TxCM8m4/hwN85g==
X-CSE-MsgGUID: 8cJDPFyMSae3oKSiTEmkxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84280110"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="84280110"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 07:07:55 -0800
X-CSE-ConnectionGUID: umuhlK09QZSlWjUQcvTnGg==
X-CSE-MsgGUID: c3jQ5apMR2yDCSI9T6vksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="194072801"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.108.95]) ([10.125.108.95])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 07:07:54 -0800
Message-ID: <77ff15d7-cdb9-46f7-9f05-97aff2dc8ee9@intel.com>
Date: Thu, 4 Dec 2025 08:07:53 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dmaengine: Add cleanup FREE defines for
 dma_async_tx_descriptor
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
 <20251003-dma_chan_free-v2-1-564946b6c563@nxp.com>
 <2c457a46-2b7f-4d66-8555-3b3cb52afe64@intel.com>
 <aTDkODHZg0JfrZJC@lizhi-Precision-Tower-5810>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <aTDkODHZg0JfrZJC@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/3/25 6:30 PM, Frank Li wrote:
> On Wed, Dec 03, 2025 at 03:48:41PM -0700, Dave Jiang wrote:
>>
>>
>> On 10/3/25 9:26 AM, Frank Li wrote:
>>> Add cleanup FREE defines for dma_async_tx_descriptor to support automatic
>>> cleanup and simplify error handling.
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>> Check patch report exceed 100 chars, but it's still better put into one
>>> line to keep consistent with other DEFINE_FREE and better readablity
>>>
>>> change in v2
>>> - remove surpoiouse remove empty line
>>> ---
>>>  include/linux/dmaengine.h | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
>>> index 99efe2b9b4ea9844ca6161208362ef18ef111d96..27fa1646a807c49c781e1bce9e3e7d9a3c66f41d 100644
>>> --- a/include/linux/dmaengine.h
>>> +++ b/include/linux/dmaengine.h
>>> @@ -5,6 +5,7 @@
>>>  #ifndef LINUX_DMAENGINE_H
>>>  #define LINUX_DMAENGINE_H
>>>
>>> +#include <linux/cleanup.h>
>>>  #include <linux/device.h>
>>>  #include <linux/err.h>
>>>  #include <linux/uio.h>
>>> @@ -1612,6 +1613,8 @@ static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
>>>  	return desc->desc_free(desc);
>>>  }
>>>
>>> +DEFINE_FREE(dma_async_tx_descriptor, struct dma_async_tx_descriptor *, if (_T) dmaengine_desc_free(_T))
>>
>> maybe free_dma_async_tx may be clearer as the name vs dma_async_tx_descriptor.
> 
> If that, 'dmaengine_desc_free' is better because avoid create new name for
> it.

That works too.

> 
> Frank
>>
>> DJ
>>
>>> +
>>>  /* --- DMA device --- */
>>>
>>>  int dma_async_device_register(struct dma_device *device);
>>>
>>
> 


