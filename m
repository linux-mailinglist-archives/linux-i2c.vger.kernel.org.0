Return-Path: <linux-i2c+bounces-11352-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD19AD4244
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 20:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 176957A46C8
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 18:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C1024A074;
	Tue, 10 Jun 2025 18:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vA7GkvRD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1962494ED;
	Tue, 10 Jun 2025 18:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581541; cv=none; b=lq0ikA85+tyCceUMgZc3JJcd3plvaQPwyW1Li2bnrXbwnDDN0oVKT08wAqEki7eWSCjCkMB5pkm3G4cKrdzgqBNyJ7dpAKkr1GG0W6x5oyUhQV7f6bWMBjuzOWxQsecYqahtJWLCik0WtGGJETS9JgzwA4ekjFaXtZyakLxjByQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581541; c=relaxed/simple;
	bh=D+SLbgwqbHoCj3oO6CuUATPS7+/ovg9hSc1l4QTqaYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUdSZlgNbakGE74uAxvzuEBDUmd8u+DiaE4TIX1z42j7krFDM1NSRH1CnI3pVZclSI+LflsyAQvtEbpqYPx9nEisB4I6DsQG7d01dzNsSrdDGn65scZA+qzhHSZ4DYXSiMyYAITl8UJzudglWI58lx6C3u77iH/8905OI3WU7lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vA7GkvRD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B038CC4CEED;
	Tue, 10 Jun 2025 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749581540;
	bh=D+SLbgwqbHoCj3oO6CuUATPS7+/ovg9hSc1l4QTqaYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vA7GkvRDeNEkKZ0x5bgHWPa6SW5jph1vEukaxaD/VWMWQ9v8MOTFfBFJILKH7RQ2j
	 4Eskbu/gmfN+5YecJCn4f/6ZRenm+JRYNbTqWwUHVMt4VWXMzy4Frl+Ddj3M1locN6
	 myC1gTAqyBgcCWfgpz6nrOERV+fDUBk9T0SOgMq9iNJ+32XL33mxFzeAOABtmM7nMk
	 AlKb713enWkTQZ8GU0RYGLpbOWIeZxA+Egofn5N/aUtwWZQ1b2OQ8UFZWT+NUp1usr
	 dGZJxlzGmP8OewvVNvjXQv/BqvB6KjJA0foVAWqZPJW/2HYRxCqMFfcIPMDPA4JzRW
	 OBD4PW275/DCA==
Message-ID: <d237b434-1add-4686-95c0-fd167bc9e6c0@kernel.org>
Date: Tue, 10 Jun 2025 20:52:13 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] i2c: piix4: Depends on X86
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mario Limonciello <superm1@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>,
 "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-3-superm1@kernel.org>
 <CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com>
 <CAAhV-H70LXsDYMA7wz4x828rEFoJsNX0=m8F73Ge9=yfpzBpZQ@mail.gmail.com>
 <24febda9-6360-459f-82d3-6fba9ed9be83@kernel.org>
 <30a7f1a6-1e04-4fc5-9bea-e2b5956b28b7@kernel.org>
 <1e06c620-8f8e-4ddf-8356-0782bccd63a2@kernel.org>
 <CAMuHMdXtrJn0i5ehBSq85+gTZ7fmeeQ=r-8fzV4GRFvmgOY1DQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CAMuHMdXtrJn0i5ehBSq85+gTZ7fmeeQ=r-8fzV4GRFvmgOY1DQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

On 10-Jun-25 18:59, Geert Uytterhoeven wrote:
> Hi Hans,
> 
> On Tue, 10 Jun 2025 at 16:55, Hans de Goede <hansg@kernel.org> wrote:
>> On 10-Jun-25 16:53, Hans de Goede wrote:
>>> On 10-Jun-25 16:12, Mario Limonciello wrote:
>>>> On 6/10/2025 2:24 AM, Huacai Chen wrote:
>>>>> On Tue, Jun 10, 2025 at 5:16 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>>> On Wed, 23 Apr 2025 at 01:49, Mario Limonciello <superm1@kernel.org> wrote:
>>>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>>
>>>>>>> PIIX4 and compatible controllers are only for X86. As some headers are
>>>>>>> being moved into x86 specific headers PIIX4 won't compile on non-x86.
>>>>>>>
>>>>>>> Suggested-by: Ingo Molnar <mingo@kernel.org>
>>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>
>>>>>> Thanks for your patch, which is now commit 7e173eb82ae97175
>>>>>> ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86")
>>>>>> in v6.16-rc1.
>>>>>>
>>>>>>> --- a/drivers/i2c/busses/Kconfig
>>>>>>> +++ b/drivers/i2c/busses/Kconfig
>>>>>>> @@ -200,7 +200,7 @@ config I2C_ISMT
>>>>>>>
>>>>>>>   config I2C_PIIX4
>>>>>>>          tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
>>>>>>> -       depends on PCI && HAS_IOPORT
>>>>>>> +       depends on PCI && HAS_IOPORT && X86
>>>>>>
>>>>>> Are you sure this south-bridge is not used on non-x86 platforms?
>>>>>> It is enabled in several non-x86 defconfigs:
>>>>>>
>>>>>>      arch/loongarch/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=y
>>>>>>      arch/mips/configs/ip27_defconfig:CONFIG_I2C_PIIX4=m
>>>>>>      arch/mips/configs/loongson2k_defconfig:CONFIG_I2C_PIIX4=y
>>>>>>      arch/mips/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=y
>>>>>>
>>>>>> The loongarch and loongson entries are probably bogus, but I wouldn't
>>>>>> be surprised if the SGI Onyx and Origin do use Intel south-bridges.
>>>>> Loongson can use AMD SB700/SB800 south bridges, which have I2C_PIIX4.
>>>>
>>>> Well we could revert this patch, but it's going to be a compile failure because of 624b0d5696a89b138408d385899dd35372db324b and other patches that go on top of that.
>>>>
>>>> My current leaning is we make a dummy fch.h header for these archs with #defines for 0.
>>>
>>> Move "fch.h" to include/linux/platform/x86/ so that it is available on all arches
>>> and if necessary ifdef out anything x86 specific in the C-code referencing it ?
>>
>> Correction that should be include/linux/platform_data/x86/
> 
> Is that a good location?

It is a location typically used for x86 headers which we want to be
available when not building on x86 too.

> It is not x86-specific, and I see no platform_data (struct) definitions in
> arch/x86/include/asm/amd/fch.h?

If it is not x86 specific then maybe just include/linux/amd_fch.h ?

Anyways I don't really give much about the exact name, the essence of
my suggestion is that we can fix this by moving fch.h to some place
(and maybe a new name) under include/linux so that the header is also
available when not building for x86.

Regards,

Hans





> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


