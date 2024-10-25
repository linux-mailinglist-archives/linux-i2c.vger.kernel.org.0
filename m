Return-Path: <linux-i2c+bounces-7583-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DD89B036C
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 15:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3529286571
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 13:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5829D1632F8;
	Fri, 25 Oct 2024 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQQ62ScE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0010D1632CC;
	Fri, 25 Oct 2024 13:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729861755; cv=none; b=lfme9izDOGN0h6ef0pEXPSCGMtSfdZPQH35AUFEdp7kDoaOv6Wy1juIdg7ZM5HzfkI08cW/fs1fI7X5LU0BkPUB80mQzWf7MVArzIbqadYXqQT2e4tUO+aMYEY1Bvor3LJcNwSMGARvLmINpcW61HQKQY6rOWkv29kipwzaz3PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729861755; c=relaxed/simple;
	bh=4wDls+2U9u7E/oTjcbhUIo+Hcl2wtZNK/R0xxUAAYaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIGqi2pW6pTep7Qmwu5T/O5keXh/yg4hOEiBbqhjyrmVXie785CJe0UXLE/GYpXINAkNJUrGgN/7VQmnaXfctfr08mgio0twOaWWNd+++gzYM87OiChQSKRabbtAKdgwhHt0DGWwbiMsK0Vliqi8moA5sk6Rl3cETAStnNlSr30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQQ62ScE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729861753; x=1761397753;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4wDls+2U9u7E/oTjcbhUIo+Hcl2wtZNK/R0xxUAAYaY=;
  b=TQQ62ScE5p7/xvjRoXCa/uA/IhIJcabKssr0YUcvmVZ00d4/CDOMtrjt
   t0UHsgJTF5jhb6dvAfFD6XDG+CB+qdvMuilkV3XlBlNR1ENUIgU8jpc+0
   arDdLqkFJ44FKCwKNo59+8CFhPtePksRzAPAvcbDhXr8nA4CEA0trZSVB
   Rk8o9yuCkeLOel7ACCwHtVJ4YN0QSKclQYafgC6g4pm9rac3yRPGp3fpX
   Q9biS+SaAqYkkO37/DFVzSz9GdjyzgZhzZuNq3MxOqduLwMiWx7m4Uzh+
   /zEv5So1fs1Y4wr2yqF6LC+qBUXEP/0X1mzyoZlUvuNvDl0M2qRkNPooB
   g==;
X-CSE-ConnectionGUID: LlidjXrMSny53ncwjKRWdQ==
X-CSE-MsgGUID: HpeH8Uc9SkuWhrafg3e20A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40635252"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40635252"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 06:09:12 -0700
X-CSE-ConnectionGUID: 5hqWMtaBTJGY36OpaLDukg==
X-CSE-MsgGUID: qIXHk4yWQiK6uozZ7Hns0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80827167"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by orviesa010.jf.intel.com with ESMTP; 25 Oct 2024 06:09:10 -0700
Message-ID: <2c5a8b81-7841-4b5f-84ae-2a34120aa242@linux.intel.com>
Date: Fri, 25 Oct 2024 16:09:09 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Add ACPI HID for DWAPB I2C controller
 on FUJITSU-MONAKA
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Yoshihiro Furudera <fj5100bi@fujitsu.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241024071553.3073864-1-fj5100bi@fujitsu.com>
 <Zxn_Ye-JmxSKuhkq@smile.fi.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Zxn_Ye-JmxSKuhkq@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/24 11:03 AM, Andy Shevchenko wrote:
> On Thu, Oct 24, 2024 at 07:15:53AM +0000, Yoshihiro Furudera wrote:
>> Enable DWAPB I2C controller support on FUJITSU-MONAKA.
>> This will be used in the FUJITSU-MONAKA server scheduled
>> for shipment in 2027.
>>
>> The DSDT information obtained when verified using an
>> in-house simulator is presented below.
>>
>>       Device (SMB0)
>>       {
>>           Name (_HID, "FUJI200B")  // _HID: Hardware ID
>>           Name (_UID, Zero)  // _UID: Unique ID
>>           ...
>>           Name (_CRS, ResourceTemplate ()
>>           {
>>               Memory32Fixed (ReadWrite,
>>                   0x2A4B0000,         // Address Base
>>                   0x00010000,         // Address Length
>>                   )
>>               Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
>>               {
>>                   0x00000159,
>>               }
>>           })
>>           ...
>>       }
>>
>> The expression SMB0 is used to indicate SMBus HC#0,
>> a string of up to four characters.
>>
>> Created the SMB0 object according to the following
>> specifications:
>>
>> ACPI Specification
>> 13.2. Accessing the SMBus from ASL Code
>> https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/13_ACPI_System_Mgmt_Bus_Interface_Spec/accessing-the-smbus-from-asl-code.html
>>
>> IPMI Specification
>> Example 4: SSIF Interface(P574)
>> https://www.intel.co.jp/content/www/jp/ja/products/docs/servers/ipmi/ipmi-second-gen-interface-spec-v2-rev1-1.html
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

