Return-Path: <linux-i2c+bounces-10359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB8DA8A34A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 17:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0C9D17A2F7
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 15:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB5D207DF4;
	Tue, 15 Apr 2025 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUfBTTAg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD25158858;
	Tue, 15 Apr 2025 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731952; cv=none; b=uB+hO1n+UaH26RrtZTqMAAzORBU9sj6iivOA8NwkGqrJHL7QuJ/P0pkgmRtNE1sHB7gO4MQDuFYVNi+icvNCF9e97zQngdAE8cOd/ISDqSm024u084dFEwWksQjyAoJmbQcaSW1Uk8/lkYsYCLzZxsnDvqUwpQWyN1zLRQ8MKdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731952; c=relaxed/simple;
	bh=zRSldPCJVlqhnsEjv+yhTbeJeFfRQcqt1STmF8DRZQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=deJuK7ais9yAvnrxRq/OLvGXflHWAIPWrm/VqqHZbmBNR38sCcNuZa0zCQyUSL9FTreAJ5z4I61NBBAZgvLLlG2IJQPT3FjHZp32vi3hPz2iqT7xXihaMZCJLvju/8hHYJwU2Jy3NCU94YIhxtg7Hh8n3StdZjS11W47cbGNvQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUfBTTAg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90150C4CEEB;
	Tue, 15 Apr 2025 15:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731951;
	bh=zRSldPCJVlqhnsEjv+yhTbeJeFfRQcqt1STmF8DRZQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fUfBTTAgeEWD5ZjJ0g+9PmXUsSFF3EeYefydlKIVVoq+i/ut9Dc+yb9Zlb5ofQQDS
	 REuyuovU68FGwZYmKsaXYUxyXRsqWkvKvjYnvCQSjB98Dqf/fChuXyz5E+iJglZl40
	 Y5YFQpUSpgc54OV4+UyHUR7UZbQ2ihpq1eDll2GEyfbRYl7q01oVPGIJ/EdzErXuDk
	 FpBw7o1llWXNbG1t7tasmzeFfnTE4QrcB5JtXZtF8pBZKbYj1gpJ8yu9HtujGMR5j2
	 yY3xif9pHG3CtmxMc6bRrQpHcF2E54WjxNOWuQBKhld+LICY2EHKn5y3ckFsNLvVdd
	 r7gMuZYVyYR1Q==
Message-ID: <c8d3c4c0-4ca4-4576-b38a-727d1803ee77@kernel.org>
Date: Tue, 15 Apr 2025 10:45:48 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] platform/x86/amd: pmc: use FCH_PM_BASE definition
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
 "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
References: <20250415002658.1320419-1-superm1@kernel.org>
 <20250415002658.1320419-5-superm1@kernel.org>
 <20250415151326.GA624550@yaz-khff2.amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250415151326.GA624550@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/2025 10:13 AM, Yazen Ghannam wrote:
> On Mon, Apr 14, 2025 at 07:26:57PM -0500, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> The s2idle mmio quirk uses a scratch register in the FCH.
>> Adjust the code to clarify that.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v4:
>>   * Use fch.h instead
>> ---
>>   arch/x86/include/asm/amd/fch.h            | 1 +
>>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 3 ++-
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/include/asm/amd/fch.h b/arch/x86/include/asm/amd/fch.h
>> index a5fd91ff92df3..9b32e8a03193e 100644
>> --- a/arch/x86/include/asm/amd/fch.h
>> +++ b/arch/x86/include/asm/amd/fch.h
>> @@ -8,5 +8,6 @@
>>   /* register offsets from PM base */
>>   #define FCH_PM_DECODEEN			0x00
>>   #define FCH_PM_DECODEEN_SMBUS0SEL	GENMASK(20, 19)
>> +#define FCH_PM_SCRATCH			0x80
>>   
>>   #endif
>> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>> index b4f49720c87f6..3c680d2029f62 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>> @@ -8,6 +8,7 @@
>>    * Author: Mario Limonciello <mario.limonciello@amd.com>
>>    */
>>   
>> +#include <asm/amd/fch.h>
> 
> Arch headers should go after linux headers, I think.
> 
> So that arch stuff can override generic stuff.
> 

Thanks - that's the same problem for the previous patch (i2c: piix4: 
Move SB800_PIIX4_FCH_PM_ADDR definition to amd/fch.) too then.

I'll fix it in the next spin.

>>   #include <linux/dmi.h>
>>   #include <linux/io.h>
>>   #include <linux/ioport.h>
> 
> Thanks,
> Yazen


