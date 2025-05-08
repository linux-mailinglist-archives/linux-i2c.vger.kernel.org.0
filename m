Return-Path: <linux-i2c+bounces-10897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C5BAAF937
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 13:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 776DB1C204C1
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 11:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFDF22425B;
	Thu,  8 May 2025 11:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXTKhO8j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12FF35280;
	Thu,  8 May 2025 11:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746705362; cv=none; b=GLtzRA6Pr0tR6mB1JwcvFRppqnnHNJ31LSSZLZZjwO4eddfkAYUXJV2ai50o2niqctshHL6G2fCrWZrS0mEYqiuleR632ir3YzhuvFbQiDZei3NvjM6LrOh1h4JHRaJbPHk83ekWfr0p8ewfiRzQH0rUXIJPCRuPth9ati/CCRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746705362; c=relaxed/simple;
	bh=WhV7qfCeaJTOCc2Bz6hIHso6klJhA/nzuOO+FMim/1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRVxGZk+2IAO9HYPAwxY61oLAQhjKU36ApmWv1UY0LJBwPvqrJl7BmHvEQcpm88aWo6QLTRSiPVtst11l5QBhk9jJzzNDqSFwT4WOoQeWzdx6MQ/81zcdJuVfhGMw0HE05NdxJAkvw299DFPp9HDjzIt+y716RsGQx8f8UzIchA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXTKhO8j; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746705361; x=1778241361;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WhV7qfCeaJTOCc2Bz6hIHso6klJhA/nzuOO+FMim/1A=;
  b=TXTKhO8jDq/TVjc+Xprjqv9hExurJG4d9/CFNZFgP62YEMm5TBCSdJN/
   gAOHK0UHI0gefO4CknSM1sWmosar4x0F61I0gAVWn44lxR9Rwvpdo1+SF
   IEU79tGQkT//fpyWJMXpEp37KgtTBLhyawJ7frERzLKljwUfBw+mHCK2L
   /gXwNd/+MiPC0Dpd8n/x3fsa32c6wSKgRKnSZFVFdnMGv/gHmSn2EjomO
   faRvHc8HhkQlnEztLZ6S8+ChyvJnlELr3Hk7b3+rgNNl0FBdxmoJj8MYG
   8W0jnfnP/Nzmrt60aXuFdnFpL37a99I+7u+dxfx56JGS7V5SbvBfgHeZF
   A==;
X-CSE-ConnectionGUID: yC8WOvJWTKWlTBvWm+XDkg==
X-CSE-MsgGUID: I/JIM4zcT3Sz9uzL2kvrNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59114386"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="59114386"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 04:56:00 -0700
X-CSE-ConnectionGUID: HBfJVvzrT0G9DvK/tuyNJQ==
X-CSE-MsgGUID: Oq/KER5ISxSIONZxO1crmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="167342931"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 May 2025 04:55:58 -0700
Message-ID: <fc3703cd-50b7-4b6e-8073-23bd636ff61f@linux.intel.com>
Date: Thu, 8 May 2025 14:55:57 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [1/1] i2c: designware: Ensure runtime suspend is invoked during
 rapid slave unregistration and registration
To: EnDe Tan <ende.tan@starfivetech.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "jsd@semihalf.com" <jsd@semihalf.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 "endeneer@gmail.com" <endeneer@gmail.com>
References: <20250412023303.378600-1-ende.tan@starfivetech.com>
 <6e155241-3403-49df-8f0d-5aa63e2e74ab@linux.intel.com>
 <NTZPR01MB10182E9F6E50D679A6EAC3B4F8B92@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
 <6a3b756f-6fbd-4ee5-b511-c5a32e4a6a34@linux.intel.com>
 <2l2tpeictfp3o2kcq5fquqkm3nyjijq65ejanafrshh7icc5c4@guynosug2ve7>
 <NTZPR01MB1018FD0E9913437D4B34E751F88B2@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <NTZPR01MB1018FD0E9913437D4B34E751F88B2@NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 11:30 AM, EnDe Tan wrote:
> Hi Andi and Jarkko, thank you for the feedback.
> 
>> -----Original Message-----
>> From: Andi Shyti <andi.shyti@kernel.org>
>> Sent: Tuesday, 6 May, 2025 5:49 AM
>> To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> Cc: EnDe Tan <ende.tan@starfivetech.com>; linux-i2c@vger.kernel.org;
> ...
>>> Good explanation and could you add it the commit log together with the
>>> example?
>>
>> If you want you can paste the new commit log as reply to this e-mail.
> 
> Here is the new commit log, feel free to let me know if further changes are required:
> 
> Replaced pm_runtime_put() with pm_runtime_put_sync_suspend() to ensure
> the runtime suspend is invoked immediately when unregistering a slave.
> This prevents a race condition where suspend was skipped when
> unregistering and registering slave in quick succession.
> 
> For example, consider the rapid sequence of
> `delete_device -> new_device -> delete_device -> new_device`.
> In this sequence, it is observed that the dw_i2c_plat_runtime_suspend() might
> not be invoked after `delete_device` operation.
> 
> This is because after `delete_device` operation, when the
> pm_runtime_put() is about to trigger suspend, the following `new_device`
> operation might race and cancel the suspend.
> 
> If that happens, during the `new_device` operation,
> dw_i2c_plat_runtime_resume() is skipped (since there was no suspend), which
> means `i_dev->init()`, i.e. i2c_dw_init_slave(), is skipped.
> Since i2c_dw_init_slave() is skipped, i2c_dw_configure_fifo_slave() is
> skipped too, which leaves `DW_IC_INTR_MASK` unconfigured. If we inspect
> the interrupt mask register using devmem, it will show as zero.
> 
> Example shell script to reproduce the issue:
> ```
>    #!/bin/sh
> 
>    SLAVE_LADDR=0x1010
>    SLAVE_BUS=13
>    NEW_DEVICE=/sys/bus/i2c/devices/i2c-$SLAVE_BUS/new_device
>    DELETE_DEVICE=/sys/bus/i2c/devices/i2c-$SLAVE_BUS/delete_device
> 
>    # Create initial device
>    echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
>    sleep 2
> 
>    # Rapid sequence of
>    # delete_device -> new_device -> delete_device -> new_device
>    echo $SLAVE_LADDR > $DELETE_DEVICE
>    echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
>    echo $SLAVE_LADDR > $DELETE_DEVICE
>    echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
> 
>    # Using devmem to inspect IC_INTR_MASK will show as zero
> ```
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

