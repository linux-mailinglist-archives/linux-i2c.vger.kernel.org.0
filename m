Return-Path: <linux-i2c+bounces-10707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F90AA5499
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 21:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A58B34655A8
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 19:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B667A270ECB;
	Wed, 30 Apr 2025 19:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrUBXtTB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622BD26FD9D;
	Wed, 30 Apr 2025 19:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746040668; cv=none; b=nyx/JQ19HFGyU33of/enqkFJkaeCDCS1xfpdU8aqdR/TAnQ0JSW8CmR+Y1oED0cOu/PtAmcNc0HYgYzyN8VV+vyXWTTg40Bn6I4I7kN9qSle9vsJmc0bvrPrX56NiV5WvpcVLrwdoTP24DCM5HieG+hS9jUigmS8hz66RGfFAgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746040668; c=relaxed/simple;
	bh=vRAapF99D6lcXdd9RT4RqWfXXje3DRJWsR+L8eOLh10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPY5hnynRvb92jb4K4xIbYS57ud+1lfnk7h5Ig8eIDJqlmgCjVtM/HsW2Acdj0UTrB+LRM5+mFKLvNrDO125EhqgOwZF8AI2ag6T286PdvNXLXw7JpI55y6LSgfKEG7Fx7GTlPPeFudKMR3wzr9UVhjBGD7Ik7rdETs04o83/Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrUBXtTB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78883C4CEEA;
	Wed, 30 Apr 2025 19:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746040665;
	bh=vRAapF99D6lcXdd9RT4RqWfXXje3DRJWsR+L8eOLh10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qrUBXtTBISUwNSo21NcrlMSLR3qV4cUuTrPkTmvxNpTaK2u1YUCA5J446KpqFZ7H1
	 3LIXnmKhACIYob5y0j23H8uiHoBUJ0OPOnpKa3UGdjpYJPG/ptOZQPnn0OxetBaCft
	 2RJgjLDBEYQMwCtjwCX5QYKQyQNKRDjmzWnewY0bWCWBrzjYfuTZHY6fHsERQ6obpX
	 kITECqwxeRQcjcWGC7ZrZSWsjzAN5ela2rCVx7ntSJ7OdVJhOr/3uuMc37yAb21Lh7
	 v7o81qjhwYwFs11pFioLsWP26yYnPL+r8Pw5zQLfutptlh/SlQbnIzN7WR2IwPRKEc
	 v2jWvfATAK8sA==
Message-ID: <35bae46e-3b57-438a-a561-c93868120dcb@kernel.org>
Date: Wed, 30 Apr 2025 14:17:43 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] x86/CPU/AMD: Print the reason for the last reset
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
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-6-superm1@kernel.org>
 <20250430190333.GIaBJ0BWuMdZ1KNVQ7@fat_crate.local>
 <e80be47b-5f8d-409c-8c3d-cd1af46944d0@kernel.org>
 <20250430191025.GFaBJ1oQjxCuig1vS6@fat_crate.local>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250430191025.GFaBJ1oQjxCuig1vS6@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/2025 2:10 PM, Borislav Petkov wrote:
> On Wed, Apr 30, 2025 at 02:05:44PM -0500, Mario Limonciello wrote:
>> On 4/30/2025 2:03 PM, Borislav Petkov wrote:
>>> On Tue, Apr 22, 2025 at 06:48:30PM -0500, Mario Limonciello wrote:
>>>> +	/* Iterate on each bit in the 'value' mask: */
>>>> +	while (true) {
>>>> +		bit = find_next_bit(&value, BITS_PER_LONG, bit + 1);
>>>> +
>>>> +		/* Reached the end of the word, no more bits: */
>>>> +		if (bit >= BITS_PER_LONG) {
>>>> +			if (!nr_reasons)
>>>> +				pr_info("x86/amd: Previous system reset reason [0x%08lx]: Unknown\n", value);
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		if (!s5_reset_reason_txt[bit])
>>>> +			continue;
>>>> +
>>>> +		nr_reasons++;
>>>> +		pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
>>>> +			value, s5_reset_reason_txt[bit]);
>>>> +	}
>>>
>>> What happened to that simpler idea:
>>>
>>> https://lore.kernel.org/r/20250411125050.GEZ_kQKtYBfEMDQuXU@fat_crate.local
>>>
>>
>> This one was more advantageous in that if multiple bits were set for any
>> reason we could get messages for all of them printed.
> 
> I don't understand - you dump an array element for every bit now too...
> 

Well with that approach once you got a known bit set you broke the loop 
and would print a message for that known bit.  But if you have two bits 
set you either need another loop or you only get one message print.

