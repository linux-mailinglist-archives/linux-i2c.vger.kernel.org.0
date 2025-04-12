Return-Path: <linux-i2c+bounces-10285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B20A86F36
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 21:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77CE0189F487
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 19:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208C722128A;
	Sat, 12 Apr 2025 19:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBmsSMZ1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49CA18FDB2;
	Sat, 12 Apr 2025 19:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744487472; cv=none; b=pKDKJVfa/3haKoFB0YZcUsq+hDH0Tnt5LW1NmSJ+UOBSe8lzpHxHD3Ltw+FzF7MkF3ZKd30yQvag9dVmze/dbtPtczdS6Q6lk7EgJ5rl6ShkF5WxNMsoI+xLp5EvrvNmfeYTemfFMT3mF1zH/ShpKcH22WI3KXR7qNYo9G+McBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744487472; c=relaxed/simple;
	bh=bo+MmRbeatX1J6EUnNoSjjAUPvlicSbpXWCZNAAKCPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AnF1zl+qeXtnHNUvpqoyvNk94nLtO3eyp2/PJ5bekB/kcc+LhhGHCL/F/RhR0r+K2Ry3jh27ptflyyUOqecc89WUKV4NvVDLeBM8k8zInxyv673k7aGujIfweY0ftLn9xSioj15yTqSFsvbSSzCY7aNUjaewE/JLfnOM7l5YIrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBmsSMZ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D92C4CEE3;
	Sat, 12 Apr 2025 19:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744487472;
	bh=bo+MmRbeatX1J6EUnNoSjjAUPvlicSbpXWCZNAAKCPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eBmsSMZ1ok1I5SUdFg7o5XvAFVATPkdfEe3zmg6iUtHOV2/7tqqxpHEzA8YxMxjmn
	 ZwenFlImLb/JvZc4M67TMl598vtCmzLkOr66rQi0Jd4o2HlGG5VPF/KslaYkKfGoox
	 0aCHJtHkCY8ddm7n8pIgEugx1K6VIRxu+/bc26caGCGCKNSD2vNPC/mBc5URtkmBHJ
	 Z6egN91Et/MFEKBRrA1DNVmA87oDypB+ElLbZo11zCf5kTv/9nuDZFwYoDt48yuM2/
	 gMwkyAxjiIKMpPkMmosmUBFmVvi1zaoRYTzCBOZ53+9pAENJOhJMLDJ+OHKnAXUu6M
	 O/TvqjKK8TMwg==
Message-ID: <5509f044-912b-4d10-bdeb-95ec52002b06@kernel.org>
Date: Sat, 12 Apr 2025 14:51:09 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR
 definition to amd_node.h
To: Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>
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
 <dc564c29-38fc-4b9d-8b1c-c6f890b2333c@kernel.org>
 <20250411124157.GDZ_kOFfsGgY4zUXA5@fat_crate.local>
 <Z_rCuLD56IZ4hsNw@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <Z_rCuLD56IZ4hsNw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/12/25 14:44, Ingo Molnar wrote:
> 
> * Borislav Petkov <bp@alien8.de> wrote:
> 
>> On Fri, Apr 11, 2025 at 07:09:56AM -0500, Mario Limonciello wrote:
>>> I was aiming for a header that we would conceivably use in all these places
>>> anyway.
>>>
>>> Can you suggest a more fitting existing header?  A new one felt too heavy
>>> for a single register define.
>>
>> No, the logic is: put it in the *right* header. Not in the "whatever-works"
>> header.
> 
> Yeah, it's the Linux kernel equivalent of: 'if you touch it, you own it',
> a.k.a. 'no good deed goes unpunished'. ;-)
> 

Ya.

>> So you can easily add a
>>
>> arch/x86/include/asm/platform.h
>>
>> header which contains exactly platform stuff. And FCH sounds like a platform
>> thing to me. Or at least southbridge or whatever that thing is called now. It
>> certainly ain't part of the CPU so platform should be more fitting.
>>
>> Unless someone has a better idea...
> 
> Yeah, so I think we can create a brand new <asm/amd_sb.h> header or so,
> because it's an AMD SB800 southbridge chipset register? We already have
> <asm/amd_nb.h>.
> 
> 'platform' might be a bit too generic and fungible I think: often the
> northbridge and the CPU is considered part of a 'platform' too.
> 
> Thanks,
> 
> 	Ingo

SB800 is pre-Zen stuff.  It's "before my time" - I guess that's the 
precursor to FCH being in the SoC but has the same functionality.

So I'm thinking <asm/amd_fch.h>.

