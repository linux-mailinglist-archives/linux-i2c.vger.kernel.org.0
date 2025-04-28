Return-Path: <linux-i2c+bounces-10661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC70A9F551
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 18:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79524168960
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 16:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C9527A12E;
	Mon, 28 Apr 2025 16:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaZyEU+a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B54714EC5B;
	Mon, 28 Apr 2025 16:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856855; cv=none; b=RmyX4V7MuV03Wg0x8TzUdDUjmL14giuRKn4lANJHc7jMrqkxw86FIJwC+fF4ItPF/290fK1m56AhPlm1oGtUkJisOUqWqQP9zc0OLwWuEAa1WuvnV9ldb3htvQy9tDLJArEKfBDmOz5GENlkGckoHOMaN33cMIqdkZP09GKBVfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856855; c=relaxed/simple;
	bh=dieXJtGrsIb7S0Z/o5b2skI3aa8C+cWrhhwXmEj18w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWIJ/x+O3suYHqyc4x3EzeJIa4GUP9lT6oOpoXoPU5/C1++7NZ6vzIYFNvThTZzH3Wd/ZAwq48fPgzmk2h/AQnHGmvh/WIuU4nTusKSrIpyRL1hoL6WcYfaCN2ThwB4fNBXqPGzb9XfBkl52QZ2T3JUFg+26d0k+PPiEPZnQDvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaZyEU+a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C3DC4CEE4;
	Mon, 28 Apr 2025 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745856854;
	bh=dieXJtGrsIb7S0Z/o5b2skI3aa8C+cWrhhwXmEj18w4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aaZyEU+ave1e6P7101soHdSaiB3jtUwSkxF2MqNcRUCnSi5RvjV34OoRqVvrZQmZC
	 EL9LSSPOCGHLT7U8lDmj5xaCrZiqkKZd8lg4wmomn+ndjJ4fD7qCW/1dbgZOfxWuD0
	 yJyyxYsGP56eeJGjepr/XCphxMq1cJy/IOYja5GWbgmc2LjeUamaUZfkPyzK//siBU
	 5WB2Folb7/dJtPFkqJfgXHkq4rdT2MjwkbudqINKQ/ownhjiCiVy35Y1acfZ0Sevzj
	 73m2vS6TOZXh+5zXCJLRJI07RBrXegkOqCIbmbXp8/kG+nVdi9RkJjK6FqWep5QqfX
	 RhT2uwGofrOjw==
Message-ID: <9d8abfc3-062e-4566-bf2f-42881ad36402@kernel.org>
Date: Mon, 28 Apr 2025 11:14:09 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] AMD Zen debugging documentation
To: Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
 "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250422234830.2840784-1-superm1@kernel.org>
 <87frhysyyp.fsf@trenco.lwn.net>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <87frhysyyp.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/2025 10:02 AM, Jonathan Corbet wrote:
> Mario Limonciello <superm1@kernel.org> writes:
> 
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Introduce documentation for debugging some issues on AMD zen hardware.
>> As one of the debugging techniques read and add information for
>> S5_RESET_STATUS register.
> 
> I've been assuming that this work will go through the x86 tree; please
> let me know if you'd like me to pick it up instead.
> 
> Thanks,
> 
> jon

I think that's probably easier, patch 5 needs patch 1.

Can you drop a tag for patch 1 and patch 5 (from doc perspective) so 
that Ingo can pull them through?

