Return-Path: <linux-i2c+bounces-10709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD5EAA54B1
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 21:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E65F1BA2FF7
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 19:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4949B1E47CC;
	Wed, 30 Apr 2025 19:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6+7VyHI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE85F3D76;
	Wed, 30 Apr 2025 19:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746041567; cv=none; b=IauCc9Cc+0bm4Jev1XWBAm+LGCQZOXxrXXyRP3i+L4KTweI/Nm/x4DTMJiZMTxTOQF5BhhAEZlrfEBTUWL3ikQM/1QBg78CpyF5DXssO1Qmm45QR+eJ6HOJDhsAuC/Q17BzZ9dF4T8q06mNxC3aW5E/1rJq36YwdiqXe5nlg5+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746041567; c=relaxed/simple;
	bh=eto3ig9zOdbipNWtSXdSig+DyQCl3cdu9O7NHaZG3K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D5LJYHaCrExfezbnbGxzXF4GxWEVTgF+lgu6tnONbDQJMyge+tw6eDCTi4bpeJc76385MfgCYvt4K5MxN+X4yTHjMo4nj/306nivZPGbAUcR8G6r2U7ejmRYBm/9umiXJ/aKD86qjDeWQTl82kM3LBLitBxB+jFlh/UAmRHjCmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6+7VyHI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8230EC4CEE7;
	Wed, 30 Apr 2025 19:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746041566;
	bh=eto3ig9zOdbipNWtSXdSig+DyQCl3cdu9O7NHaZG3K0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M6+7VyHI87AqgVw6moUQ8QGECLano4KjwwKDXD57m404YDGwi/WjET4Fdoj43/6I1
	 HAyV8UJTWr8eQiyADBBrIZM5uhGkACd0PeDfB8y4eRDhrzruVewnE6Z2/8PRdr8QTL
	 1wQSc+iF/qpfnaDtKxiUi9XffgNZLjjBVzdk7E60lf3ycm/4ZcROFOsoWGSQcTqoaL
	 osHOPIrKVrK6MR0SQDq9riZiniaeph8FavKVU1CrclIutVLYtZIqm3mtdT6otzIDbc
	 1MRKUo9wJB3//E+ZtxWKArBV2dujwrDQo/IZ5JbQokfPBb+OWA9e1KRAsiwmjppYgY
	 3W12rBy/fgTDw==
Message-ID: <4bf62335-2e67-43c5-b2dc-4b0bed0521ed@kernel.org>
Date: Wed, 30 Apr 2025 14:32:44 -0500
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
 <35bae46e-3b57-438a-a561-c93868120dcb@kernel.org>
 <20250430192538.GGaBJ5MuS4CEKa4kIX@fat_crate.local>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250430192538.GGaBJ5MuS4CEKa4kIX@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/2025 2:25 PM, Borislav Petkov wrote:
> On Wed, Apr 30, 2025 at 02:17:43PM -0500, Mario Limonciello wrote:
>> Well with that approach once you got a known bit set you broke the loop and
>> would print a message for that known bit.  But if you have two bits set you
>> either need another loop or you only get one message print.
> 
> So I gather you want to print for *each* set bit?
> 
> If so:
> 
> 	for (i = 0; i <= ARRAY_SIZE(s5_reset_reason_txt); i++) {
> 		if (!(value & BIT(i)))
> 			continue;
> 
> 		if (s5_reset_reason_txt[i])
> 			pr_info(...);
> 	}
> 
> Still a lot easier instead of calling some function and dealing with from
> which bit to start etc etc.
> 
> 

This would work, but would still need to track if "no" known bits were 
set to emit an "unknown" message.

So the loops end up being for() and check a bit or while (true) and 
find_next_bit() and otherwise identical.

At that point does it really buy much more than the while (true) 
approach and find_next_bit()?

