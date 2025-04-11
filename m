Return-Path: <linux-i2c+bounces-10266-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C53A85CB0
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 14:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B6027B5BD5
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 12:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1116629AB09;
	Fri, 11 Apr 2025 12:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKJfHHJy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B2229AAF3;
	Fri, 11 Apr 2025 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373547; cv=none; b=VNFp7FvdhmQXeACqwpSSdt1XCBvCTOpuZPv+H7YKXdqg5R8KLUF+Y+YxrGbOvpMNpcqo1CUqEy8UEBoW0SGSB+dsnh7sqg3EogQhzqnQ63+Pr0BmtyQe1Ak2lKTMSCbPmKjXNnGlrIQkcdcIKWkaKi88Za3cfsJfpWanmnU7fik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373547; c=relaxed/simple;
	bh=OgiHmzAMJV/c6pK5hif8A/swuofjSwyYdjGM252Al4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PM/HmtBuz1gR3L3gc4Vrd28iFAoRGR+gHSKDFEvUo+uMYJy9b9l/KSReZX1zP7JuHlafM/rEeqTjpKjfCZFx3vXRSIxy0nu97il+Ljnsit0XtbjIy5dCkGeAWD/MavZT5zIsv6kkkWJpauULBcfFLXo0ukkNFizgz8vSHVWjqXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKJfHHJy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E57C4CEE7;
	Fri, 11 Apr 2025 12:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373547;
	bh=OgiHmzAMJV/c6pK5hif8A/swuofjSwyYdjGM252Al4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZKJfHHJyYcGvqjYidnEdh8euHtbuinPbP6cdaZSEqUi7bzcfkPnSL7swwOH6yxhAX
	 gDwsQFbMZlI3PEgWeNs1Iy5e5391s9T6ySobR+MoHlCuICPMlTDuKbgJkeRONmQtaO
	 ypN3kLxkdU1k2t3ob0oH5U7EsKYn+tsr/ZxWKDzsysLrwf5JLLxgV2XpT6Aqgp0G/H
	 xc2nw8/ryVcV/TTlYoEN6Sb9QAVsPAh/EVfIj7+wgECvkB9pUh7BXO1tNUZ40qI5mu
	 E7GeeGlSTAlib3jzC6EeFR+64GVoEQ1TQlFCtNmB20/uWKWdwVcaqRNaNBSTE3d21e
	 YEBTcy/yLl3xA==
Message-ID: <42b7547d-c1f7-4509-a381-7bf0a485a5f5@kernel.org>
Date: Fri, 11 Apr 2025 07:12:24 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] x86/CPU/AMD: Print the reason for the last reset
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
 <20250410200202.2974062-5-superm1@kernel.org>
 <20250411120617.GMZ_kFucLFQQ7LJkys@fat_crate.local>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250411120617.GMZ_kFucLFQQ7LJkys@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/11/25 07:06, Borislav Petkov wrote:
> On Thu, Apr 10, 2025 at 03:02:02PM -0500, Mario Limonciello wrote:
>> +static __init int print_s5_reset_status_mmio(void)
>> +{
>> +	void __iomem *addr;
>> +	unsigned long value;
>> +	int bit = -1;
>> +
>> +	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
>> +		return 0;
>> +
>> +	addr = ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
>> +	if (!addr)
>> +		return 0;
> 
> newline.
> 
>> +	value = ioread32(addr);
>> +	iounmap(addr);
>> +
>> +	do {
>> +		bit = find_next_bit(&value, BITS_PER_LONG, bit + 1);
>> +	} while (!s5_reset_reason_txt[bit]);
> 
> What's the idea here? The highest bit is the most fitting one?
> 
> So why don't you do fls() or so?

The idea was to walk all the bits and pick the first one that has a 
string associated with it.  I was finding that sometimes the reserved 
bits are set which would get you a NULL pointer deref.

> 
>> +	pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
>> +		value, s5_reset_reason_txt[bit]);
> 
> What's guaranteeing that s5_reset_reason_txt[bit] is still set here?
> 
> I'd suggest you check it again and never trust the hw because we'll be fixing
> a null ptr here at some point otherwise...
> 

Right; I was worried about that too but find_next_bit() will return the 
size argument when it doesn't find anything.

So that should be s5_reset_reason_txt[32] which has the "Unknown" string.


