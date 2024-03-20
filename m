Return-Path: <linux-i2c+bounces-2451-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA1C88126A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 14:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E2D4B23DD8
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 13:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14414122D;
	Wed, 20 Mar 2024 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTD5N/yk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C78741211
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710941858; cv=none; b=utHsKxn7fWqCY9SvPIrOgRyq28exkhJ7v+3Q7MNBvw6HKJGNCJ9Qiq+8tZIcUBOw7DqZfwr/KmOwxH5yQYTuu3lVva451Ee5VWPu1zgtvHW/A9UXaUeO6YN+2Q418augfTWmTnobN89HneBDhO8DcjI+Dv4iFMKBPJGFGSl2ALc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710941858; c=relaxed/simple;
	bh=q4KUFuQdIaeYzYqOfs6WoFUSFTMTE6kZMbnS/CHr47M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qw4rkBazHtBY8CXcAH16rNrfZJT3sDfn5TaDFBic4UWT23INbkCoYaSrNPfrrXi+uPsA3ZoN6I2kYhw0/lfgFX1Yx3oKieZJAwT/6hkbzNZm3ABR2vkB+jd/7sB53EgD8DnVodSqohIs1A1iJg9qp4mEOT8SYZ7/vim9g/OsEBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTD5N/yk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710941857; x=1742477857;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=q4KUFuQdIaeYzYqOfs6WoFUSFTMTE6kZMbnS/CHr47M=;
  b=UTD5N/ykV0NyDVLfxoIzUBEyMnzLM6vKcMD/oGlTi11JpkJZSIvORjJj
   g4NmGuN/tbx419lYzF+8fU9CLn+3w1y0S0jOboPZZIM5965/lb48UVHjg
   +mhamLSCnkY14I0G82MII+njMb/2ynbo8wyL1u2JUso+x9YibsddQOKF9
   VfPrj+zXHBB0PKdAePt/aXYwfTcZHMaKSnWkOS3cycCMVtdvR7e8oM27v
   Bnv5nZV8WCot/JRypt7f2jrHM8mV/1K30Ql8NGIVuc+WEAu3k6zNRSzWQ
   oNI2bEFvprp2fcRfqdBsiW57hMPY6ivFJJg40sBGr3I2qaC5oMDFS00IB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5736616"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5736616"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 06:37:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="18894194"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2024 06:37:35 -0700
Message-ID: <af547aab-e957-4dbf-922d-e2ad13e19877@linux.intel.com>
Date: Wed, 20 Mar 2024 15:37:34 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com>
 <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

+ Andy

On 3/20/24 2:27 PM, Heiner Kallweit wrote:
> On 19.03.2024 22:11, Heiner Kallweit wrote:
>> On a N100-based mini pc I see the following. I found older reports with the same symptom,
>> but root cause seems to be different.
>>
>> - Interrupt 27 is not shared in my case
>> - I checked register values on entering the ISR. Interrupt mask and DW_IC_RAW_INTR_STAT
>>    are both 0.
>> - After an interrupt storm of 100,000 interrupts the interrupt gets disabled
>> - The issue affects channel 0 only
>>
>> If not the I2C IP, then who else can touch the interrupt line?
> 
> I noticed that after including INTEL_IDMA64 in my config the problem no longer occurs.
> So there seems to be a dependency. Should it be reflected in Kconfig, e.g.
> make MFD_INTEL_LPSS dependent on INTEL_IDMA64, or let it imply INTEL_IDMA64?
> 
Hmm.. interesting. I'd say BIOS perhaps has left the IDMA active and is 
generating interrupts until the idma64 driver acknowledges it.

There should not be generic dependency since the i2c_designware is not 
using the DMA and a quick test on one platform where idma64 and 
i2c_designware are sharing the same interrupt without 
CONFIG_INTEL_IDMA64 not set didn't show similar behavior.

Andy: Do you have any additional ideas or debug hints to this?

