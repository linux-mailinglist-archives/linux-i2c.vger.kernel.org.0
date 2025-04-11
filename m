Return-Path: <linux-i2c+bounces-10265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC85FA85C8E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 14:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CE851B846BE
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 12:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BAA329CB48;
	Fri, 11 Apr 2025 12:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1PQ0DU0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCD729CB35;
	Fri, 11 Apr 2025 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373399; cv=none; b=nXHKr29yNU/rMnevZA/oKiYPGrvJPERtIJ1EEV3XERwzT1kb1OjOR2qW3JBmdBlK6PrNiPY8R7i8045CykswMqchxG70w2jnTjDVuQJCVfls6S8dOEmqr4+uM4e7ioEIrLhZEMpfF/Q4Y9GUyaHgaTNA/pTX9DkZtXxgq90V9b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373399; c=relaxed/simple;
	bh=jB3cdHnD5PFtfwchWWHYOzMV3tNT07jCumA17HRyPZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJVoS+GwjeKSULmBkNVMdvGUS9ZlYIOuUIwaTxVB5R2ADNK/ZquspPTFhCWiiAYM+BaE/qvMNcc2NkJiZXpz/fnGuf8BEahSjuGEiplzeVejKwfI7aT/7B0Uq9jtZuMMZlHi3lhIS/GZwqr1KIgxi+GKw2Ues+DmZ7Bw4k2jMSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1PQ0DU0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9E1C4AF09;
	Fri, 11 Apr 2025 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373399;
	bh=jB3cdHnD5PFtfwchWWHYOzMV3tNT07jCumA17HRyPZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F1PQ0DU0c3bRUeMui9G6QG8PjXlVzEqbKSy7GpIQx2m33+ffSJSmPg7B57SxLzbey
	 OsDl1/VTo60VoVhm5/AM+Ea1eEZNooR+TD/61AONybXlgmuqk3cTbjbF/c+YNtsRAh
	 mgQdL2wtq3se797yrjNd74d/Gm95Aigrm0ylV/b9vuienYlwAhqAoBsxQIHXQHeQOZ
	 OZgFtoc76jDk9TsXpbHyxzmtCzXVt9cLWH/j7DInjiZTUASPzIkzSgRrC+9ewysGqT
	 gfnB9H3wkNz2sp3vLfVsWJsIgqvwSVOh947TgTVUf7kJx+CGXUsc1nj8f6aQzIqs/k
	 uYdkbMdCFuavg==
Message-ID: <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org>
Date: Fri, 11 Apr 2025 07:09:56 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR
 definition to amd_node.h
To: Borislav Petkov <bp@alien8.de>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
 "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>
References: <20250410200202.2974062-1-superm1@kernel.org>
 <20250410200202.2974062-3-superm1@kernel.org>
 <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250411114908.GLZ_kBtN94h79EEN6j@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/11/25 06:49, Borislav Petkov wrote:
> On Thu, Apr 10, 2025 at 03:02:00PM -0500, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> SB800_PIIX4_FCH_PM_ADDR is used to indicate the base address for the
>> FCH PM registers.  Multiple drivers may need this base address, so
>> move it to a common header location and rename accordingly.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   arch/x86/include/asm/amd_node.h |  2 ++
>>   drivers/i2c/busses/i2c-piix4.c  | 12 ++++++------
>>   2 files changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/amd_node.h b/arch/x86/include/asm/amd_node.h
>> index 23fe617898a8f..f4993201834ea 100644
>> --- a/arch/x86/include/asm/amd_node.h
>> +++ b/arch/x86/include/asm/amd_node.h
>> @@ -19,6 +19,8 @@
>>   
>>   #include <linux/pci.h>
>>   
>> +#define FCH_PM_BASE		0xFED80300
> 
> Is that even related to amd_node?
> 
> Or should it be in some x86...platform.h header?
> 

I was aiming for a header that we would conceivably use in all these 
places anyway.

Can you suggest a more fitting existing header?  A new one felt too 
heavy for a single register define.


