Return-Path: <linux-i2c+bounces-10270-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4468A85EE2
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 15:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB7081B8186D
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 13:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6773C19DF61;
	Fri, 11 Apr 2025 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KO59uPJr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7CD19005D;
	Fri, 11 Apr 2025 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377959; cv=none; b=FSyJtf49GwUXyfdFvc+C+ktrS/oOf3qbs5U4Jws9pP3Cqnr/p7RfjI9U0jXT4FuWUJsad7OKSueb2yD8EaMScW+dEshemeu10hFGX17JI1pmTPk/uyFRyVJjULs6z68Rb76Lh+W3whZDk4NL0rg/ZbEQRAybdtHKiqpTjcGXovk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377959; c=relaxed/simple;
	bh=YacvS452bdujPx0/+c9q8F6L4dCyA32XvwEotJeih94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MlcaM5R05zngDBy3iyEtvPzHQlCmNxd2OV6aYXQbls43fl8HH/BCJ1E6xo6fD2ZaDPsmgdoCziE0od1cXV1/l9c1viz+sycdmjHO7qLYbPiCh4GrC8Ly1nFZXyYzwWUYHjeKsQVYv5F3QKuAbwVO6czyVFvnsIz0nKmFCXIaiaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KO59uPJr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BEAC4CEE5;
	Fri, 11 Apr 2025 13:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744377958;
	bh=YacvS452bdujPx0/+c9q8F6L4dCyA32XvwEotJeih94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KO59uPJrDp4sEDCFT5+zO3cbTKTBg8OFpJ8hF1oI3BVmhSHvdnVJa/fgd8l4n58AC
	 mE38BIO/61xpTroy9LUKV25x+QVWOCK2VB0OZujHpseVFa1fi7nfj0CiW3o7gX9vj1
	 rKXJiIKH+AQHIXiN/pKyU5z/VpK5epBu0KvZpNbPlwQeyu9f8SCocS3Smx/1oMuRNO
	 niOQqcQd/3CAVyf9h/9deAXH3gwHK4zJiHiPEerLvlIV7gn2mx603Zk8chtv5h8Way
	 H9Z+7YMGXQ9u4vsJgrt6Q0bTysK5D3pqG8rk4tw+T8OO2yxIh7xKQ27270I3QsO5n6
	 uToXGAHylexAA==
Message-ID: <f7e66377-4616-4e3e-aa2d-ccd512411f21@kernel.org>
Date: Fri, 11 Apr 2025 08:25:55 -0500
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
 <42b7547d-c1f7-4509-a381-7bf0a485a5f5@kernel.org>
 <20250411125050.GEZ_kQKtYBfEMDQuXU@fat_crate.local>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250411125050.GEZ_kQKtYBfEMDQuXU@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/11/25 07:50, Borislav Petkov wrote:
> On Fri, Apr 11, 2025 at 07:12:24AM -0500, Mario Limonciello wrote:
>> The idea was to walk all the bits and pick the first one that has a string
>> associated with it.  I was finding that sometimes the reserved bits are set
>> which would get you a NULL pointer deref.
> 
> Uff, that needs a comment at least.
> 
> But you can write it a lot simpler instead:
> 
> 	for (i = 0; i <= ARRAY_SIZE(s5_reset_reason_txt); i++) {
> 		if (!(value & BIT(i)))
> 			continue;
> 
> 		if (s5_reset_reason_txt[i])
> 			break;
> 	}
> 
> Simple loop, simple statements and all easy. :-)
> 
>> Right; I was worried about that too but find_next_bit() will return the size
>> argument when it doesn't find anything.
>>
>> So that should be s5_reset_reason_txt[32] which has the "Unknown" string.
> 
> Yeah, that definitely needs a comment above it.
> 

Thanks; I'll take your simpler solution and leave a comment above the 
!(value & BIT(i)) check about skipping reserved bits.

