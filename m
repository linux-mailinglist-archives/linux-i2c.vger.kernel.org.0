Return-Path: <linux-i2c+bounces-3132-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1782A8B1CDC
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 10:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C939C282F4B
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 08:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB97A6EB56;
	Thu, 25 Apr 2024 08:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzvRNchD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0358817BAA;
	Thu, 25 Apr 2024 08:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714033990; cv=none; b=L0fWWPM5KmzJsa11LgDCIoRnPBmCHIQgsn3+gn5nGpe0EKjCuLxsvbxyeuML+Jb+fcYdCeW9R/tMJOvU67pcNkWjhKMelfe+rJnbFf1E4sePaa7QhPUEfU/7LpC47NGM+2bUqMvDCa6cUaAc9XnuC/WXao1dP4g2W8uWBxMEJS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714033990; c=relaxed/simple;
	bh=4DkN2l8gkUSZtinE2eNxNSMW88fKkz++DbovXDGMTsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPs68sClRLdNOE/UWRcvrpFZglRObhDnJGwNPn+HSilDT6nbIdov+0AJIySFmyp49FMKdIjbaaAPeufbDw/g/1KbT7fLt97WGINDGOtpp+q4GABzh0kj9bW0bozzeWuAw1POc/45uiNmroKrU9eKjMSutaCkI1gjuiND5W80ruU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzvRNchD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714033989; x=1745569989;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4DkN2l8gkUSZtinE2eNxNSMW88fKkz++DbovXDGMTsg=;
  b=VzvRNchDHpLSqTQNohWtyFMkFuTpqawqbJF81oVYkOGmihz1c/nvZXTk
   ldwUHdP4SZdICVFjXJICoil+iIGVBAIRb8NfOuO8BFG/pOuCPwUKZzRxN
   DWnSMAAWsORORvzNmiLermBfkmbjyRi7kc+zVc2tNFQjOTH828JmTtJk8
   Au2l2B0tvxzWRF7Z0aXl597tp9kwnbU7Rethz3xJeKn5BvNDASqz+zNCK
   z87YYS4OsHochgpxjZYMfUO6tckf66o2jY0ai95OxMg8JCjbg7GEb2lbb
   RSSPNT1r0FNGN4hTtLj2gOf1gPCj7N9zaqN0SfwgxftkC0cSVFS8IwXFr
   Q==;
X-CSE-ConnectionGUID: fsroxyC0SIOpXgK9+60NyA==
X-CSE-MsgGUID: 7FIHw7jBSaS5+n8crgn7qQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20317505"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="20317505"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 01:33:08 -0700
X-CSE-ConnectionGUID: uUcqACFWTmiIFBsib+QgvQ==
X-CSE-MsgGUID: ORuMhv9RS1+iB5yeCRSKPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="48253104"
Received: from ehlflashnuc2.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2024 01:33:03 -0700
Message-ID: <59b7ba5a-14a8-497e-8cf8-53bdf4e8cb8e@linux.intel.com>
Date: Thu, 25 Apr 2024 11:33:02 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] i2c: designware: Create shared header hosting driver
 name
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <20240423233622.1494708-2-florian.fainelli@broadcom.com>
 <ZihLSKe_BHxasBql@surfacebook.localdomain>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZihLSKe_BHxasBql@surfacebook.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 2:59 AM, Andy Shevchenko wrote:
> Tue, Apr 23, 2024 at 04:36:19PM -0700, Florian Fainelli kirjoitti:
>> We have a number of drivers that reference the string "i2c_designware"
>> yet this is copied all over the places with opportunities for this
>> string being mis-used. Create a shared header that defines this as a
>> constant that other drivers can reference.
> 
> ...
> 
>>   #include <linux/i2c.h>
>> +#include <linux/i2c-designware.h>
> 
> Can it be hidden in the subfolder?
> 
> ...
> 
>> -#define DRIVER_NAME "i2c-designware-pci"
>> +#define DRIVER_NAME I2C_DESIGNWARE_NAME "-pci"
> 
> Oh, this makes all the things hard to read.
> 
>>   /* Work with hotplug and coldplug */
>> -MODULE_ALIAS("i2c_designware-pci");
>> +MODULE_ALIAS(DRIVER_NAME);
> 
> I believe we shouldn't use MODULE_ALIAS() without real justification.
> 
I think MODULE_ALIAS() is even needless here since this device is not 
added from another driver but loaded only for known PCI IDs in device table.

