Return-Path: <linux-i2c+bounces-6232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 475B396D1DD
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 10:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2B6DB22D66
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 08:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CB6197A92;
	Thu,  5 Sep 2024 08:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbWOCf0z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1A01925A6;
	Thu,  5 Sep 2024 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725524306; cv=none; b=s8ul5FRrQyKm2eLJ5LGfXOQ6FUPvgcc9bk6FV2YwRXXBWVNw4aVRoye34oe3sd6pRm5t6ycNk5Lo1Ib5EGzfZRH2anwn/043bqQnQKRsg8ZUxvWeyh/z/CuCXeqeibreJfjzJI5Lwq/YIyNcDt9sZ115gCk4tn5mJHg6m3PCAc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725524306; c=relaxed/simple;
	bh=MxbG1NFAO2hA0Y81lnNJT1+jSGtQoe5Vz9VbrJuDz5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klfIVnh783b8Getoq+PeutTX7+3z7AxTbAtvqcrWZjsXwIpeycZvA89xDKJ4Mp5pOm962dFDrtfHFIGgMTvi69h27g5/LJN/DEn7QIg7V52QqbeMWxHBMuad/jStWxBTgnGm/8sK35hUSl4DYdKLOnaeYeVBMUpZfe2oFcCLE8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbWOCf0z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725524306; x=1757060306;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MxbG1NFAO2hA0Y81lnNJT1+jSGtQoe5Vz9VbrJuDz5M=;
  b=RbWOCf0zlHu9mzAfpffAKif9gEAVyE6l/sahEeqTtkWhXoad6SKvotzM
   B1ay6NWX0uzkbqNwTYMsHzGdVSXRwRZ8183CLqVhqGMJU6ErMGwhhTke/
   dq6XVzq4D1FR08hxywpqUEyV/P/F4vtsfMlj0V7FoVE8V4co2HNOvRM85
   Ky1rRSyVEGXq0UV7PFC/gJ6bQjBks0J/6gFAGZ/4OdMX2iLDzYqHdGCqL
   slpJUHtif6VdjDQyS5E5v9AQ+UXUPLEavW1PXCNcWaQMItecaWN1eocsl
   K8mysfHbVAmUniJL4W9WOz8v+Bi/97JOUZjsO0gd7ZicW1/lGa0DfF0O5
   g==;
X-CSE-ConnectionGUID: yCpuFiYVRciI4kcF83NInA==
X-CSE-MsgGUID: 2wY6n/g5QfeFcwBnOeUDxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24383584"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="24383584"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 01:18:24 -0700
X-CSE-ConnectionGUID: zUECY1JsTCytv0zNGU91zg==
X-CSE-MsgGUID: 3BzHH7e7Syqb+WqtcOa6iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="65242627"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP; 05 Sep 2024 01:18:16 -0700
Message-ID: <6cbdf44e-7346-4463-a622-7810706d5419@linux.intel.com>
Date: Thu, 5 Sep 2024 11:18:14 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] i2c: designware: Group all DesignWare drivers
 under a single option
To: Andi Shyti <andi.shyti@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, UNGLinuxDriver@microchip.com,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
 <3phynd24wmymhqugikbdwdzoa6vlzxwv5a6n6bk4446atbf7nu@c2kb766j3pcc>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <3phynd24wmymhqugikbdwdzoa6vlzxwv5a6n6bk4446atbf7nu@c2kb766j3pcc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/24 12:01 AM, Andi Shyti wrote:
> Hi Jarkko, Andy,
> 
> ...
> 
>> Heikki Krogerus (7):
>>    ARC: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>>    ARM: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>>    arm64: defconfig: enable I2C_DESIGNWARE_CORE with
>>      I2C_DESIGNWARE_PLATFORM
>>    mips: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>>    RISC-V: configs: enable I2C_DESIGNWARE_CORE with
>>      I2C_DESIGNWARE_PLATFORM
>>    net: txgbe: Fix I2C Kconfig dependencies
>>    i2c: designware: Group all DesignWare drivers under a single option
> 
> I believe you know this code already, do you mind giving it an
> ack?
> 
To the patches 1-7/7 in this set:

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

