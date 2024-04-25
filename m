Return-Path: <linux-i2c+bounces-3143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A218B2247
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 15:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8352CB231C7
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 13:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA90F149C4B;
	Thu, 25 Apr 2024 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJD6JBgB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A280A149C44;
	Thu, 25 Apr 2024 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714050727; cv=none; b=TuKUlgihAE+WCMHYbjN0st0Zo5LCleeS+cZRCeCXp3ZLACTnvEfD75kqt88EUCeUGU1+K0m+QNaR5kex++uwc9wiMh+fv3FqN5P86ko06kwbc/+nXXCALa99WbDPQgDypLVL1J2zwlSbTW0mAWbmd6dIXnv3xBqsEHXV3I6+YZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714050727; c=relaxed/simple;
	bh=6oZ89fNLVqBFlw2FqXYow9IUd50x0ChIAGq7WZrSWb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAIbOgKkWZSE/NRVExmdIG9ykJqigN10Li3t5qOOM0dNHsEe+g8I8mGOJOilZB1Juv5ulpKXqE2My4iHvoirSseAZT8Awt9dyrky9Oa0dOkGSugDeXD+Y067G/qwLwkSFi2vpb+bz7InsKAV1s9sj2RcUtc+87qI7ZymmhAQ1Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJD6JBgB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714050726; x=1745586726;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6oZ89fNLVqBFlw2FqXYow9IUd50x0ChIAGq7WZrSWb8=;
  b=JJD6JBgBGFhGEhO0E2Tbaf5masdI2+xUR1EccyJtiHWcoetP0Jv8Xgh2
   BZpwiaSiXkuRt/0KAjeyxESLMUZOv8bt5f1keWElTgqF8qJJyEVuqm7DM
   8usw7LKalCq8GG3Vk+nWMeSC8+NWmzetAFFR6z5Lp4sY1L4e+6oye9EVO
   rmHQCU8qHt53b6x6UT2woqHr9IvQEylVvo1HATeYk4CsCA8WXNyafjtHO
   rywqBo/8Vfb5PCIMAHNoWagsHTID/S2i3AHJq5FK3gtN2vDQ+nmWfu0AR
   NIFYgZqGvrVGGWutYBOziQjpoheQrw7+Jl5t/Eo6hsVd4gmYm6n2Ha1Vj
   w==;
X-CSE-ConnectionGUID: qGJhRqLnTmqE67o8RNBtPg==
X-CSE-MsgGUID: you8vt16Q4KW4dBFnUJbeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="27190441"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="27190441"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 06:12:04 -0700
X-CSE-ConnectionGUID: gJLLNdAVRh+rRxXktGAXqg==
X-CSE-MsgGUID: OlnglW8xS+6HlMR2Clurrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="56010371"
Received: from ehlflashnuc2.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by orviesa002.jf.intel.com with ESMTP; 25 Apr 2024 06:11:59 -0700
Message-ID: <62e58960-f568-459d-8690-0c9c608a4d9f@linux.intel.com>
Date: Thu, 25 Apr 2024 16:11:58 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Define i2c_designware in a header file
Content-Language: en-US
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Lee Jones <lee@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Duanqiang Wen <duanqiangwen@net-swift.com>,
 "open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
 "open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
References: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/24 3:26 AM, Florian Fainelli wrote:
> This patch series depends upon the following two patches being applied:
> 
> https://lore.kernel.org/all/20240422084109.3201-1-duanqiangwen@net-swift.com/
> https://lore.kernel.org/all/20240422084109.3201-2-duanqiangwen@net-swift.com/
> 
> There is no reason why each driver should have to repeat the
> "i2c_designware" string all over the place, because when that happens we
> see the reverts like the above being necessary.
> 
> Changes in v2:
> 
> - avoid changing i2c-designware-pcidrv.c more than necessary
> - move constant to include/linux/platform_data/i2c-designware.h
> - add comments as to how this constant is used and why
> 
> Florian Fainelli (4):
>    i2c: designware: Create shared header hosting driver name
>    mfd: intel-lpss: Utilize i2c-designware.h
>    mfd: intel_quark_i2c_gpio: Utilize i2c-designware.h
>    net: txgbe: Utilize i2c-designware.h
> 
>   MAINTAINERS                                    |  1 +
>   drivers/i2c/busses/i2c-designware-pcidrv.c     |  3 ++-
>   drivers/i2c/busses/i2c-designware-platdrv.c    |  5 +++--
>   drivers/mfd/intel-lpss.c                       |  3 ++-
>   drivers/mfd/intel_quark_i2c_gpio.c             |  5 +++--
>   drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c |  7 ++++---
>   include/linux/platform_data/i2c-designware.h   | 11 +++++++++++
>   7 files changed, 26 insertions(+), 9 deletions(-)
>   create mode 100644 include/linux/platform_data/i2c-designware.h
> 
I have mixed feeling about this set will it help maintaining and 
developing new code or do the opposite. Surely misnaming as referenced 
above can happen but I think it's not too common pattern while having 
single define header put under include/ feels added burden.

Also I personally like explicit strings put into MODULE_ALIAS() since 
they are easier to grep from sources and modules.alias file when 
debugging autoloading issues. So change like below makes that debugging 
one step more labor.

-MODULE_ALIAS("platform:i2c_designware");
+MODULE_ALIAS("platform:" I2C_DESIGNWARE_NAME);

