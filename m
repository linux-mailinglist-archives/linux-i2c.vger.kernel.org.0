Return-Path: <linux-i2c+bounces-11346-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5443CAD3ADA
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 16:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC201179826
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 14:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534D129B226;
	Tue, 10 Jun 2025 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDvadfL4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A1529B8F5;
	Tue, 10 Jun 2025 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564754; cv=none; b=nqEu1+15qGZ96gdK+1Bx2YQm3hGMSBHIkK5XXEbsqrFBRA8LPTUNUR3YeY9XaZMDaVNpRbZJzk9Sos39yJgnrvjb5u+F3NsmQT4YvDYwXHPnl9ACxLSRlBjhwANbRBSxhqw3HpZP7rcHMtY1+89yIusoLDjYftcL+0jzUswD/P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564754; c=relaxed/simple;
	bh=eMKse3olgDDTdTVEulDHGZT76bFnjfTCsl3tj8Z5nvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIFUMSQ7mGeYiZkKdqhHrmuJlOtiVDOyvAnZ6HwGU1avlEkjcsGxhTp7hGdzgPUrtzjk1Ju6YxYRldLrkcFvl7+/77Wx6wSyoQavCNvYUQc5Mf2nDAI9Q+gPAe08OVIwxMyX7ZgAWPYp/UD/yKlzATdCqhuPYxUqviyLJuDeQOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDvadfL4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5397BC4CEED;
	Tue, 10 Jun 2025 14:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749564753;
	bh=eMKse3olgDDTdTVEulDHGZT76bFnjfTCsl3tj8Z5nvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iDvadfL44uEdOn0RtAKvFUzmjA3P8wkt05S4itlgj9uHWgynwMccowZQoFOu++QFD
	 mcO3mvOL0NAsin3bQOp1h/ZCUlyHQ7oF95a6pd4BXFE848ngnZ/kbV4NzdmmP1wPDf
	 +yJYT56/8HzKLHsFkoz4bVY/bh1bycU0oA9nM3IQe9O73TQETn9ejg5v9TbCXY7XlL
	 j/uk/x99ebbbgoC8rj/LqcgfuDB2K4uUCu7+rBgVsN0GTiJWd1HAkRtT8HqrFPZXKN
	 eyHu8r5vNhJXkO1hgX/cidteEiZ+OJRZGChy0yn/mmeNtajyWF7kIDt6PVFpJ3d8SS
	 TgTABlY1obp+g==
Message-ID: <24febda9-6360-459f-82d3-6fba9ed9be83@kernel.org>
Date: Tue, 10 Jun 2025 07:12:31 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] i2c: piix4: Depends on X86
To: Huacai Chen <chenhuacai@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Borislav Petkov <bp@alien8.de>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>,
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
 "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20250422234830.2840784-1-superm1@kernel.org>
 <20250422234830.2840784-3-superm1@kernel.org>
 <CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com>
 <CAAhV-H70LXsDYMA7wz4x828rEFoJsNX0=m8F73Ge9=yfpzBpZQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAAhV-H70LXsDYMA7wz4x828rEFoJsNX0=m8F73Ge9=yfpzBpZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/2025 2:24 AM, Huacai Chen wrote:
> On Tue, Jun 10, 2025 at 5:16 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>
>> Hi Mario,
>>
>> CC mips, loongarch
>>
>> On Wed, 23 Apr 2025 at 01:49, Mario Limonciello <superm1@kernel.org> wrote:
>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> PIIX4 and compatible controllers are only for X86. As some headers are
>>> being moved into x86 specific headers PIIX4 won't compile on non-x86.
>>>
>>> Suggested-by: Ingo Molnar <mingo@kernel.org>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Thanks for your patch, which is now commit 7e173eb82ae97175
>> ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86")
>> in v6.16-rc1.
>>
>>> --- a/drivers/i2c/busses/Kconfig
>>> +++ b/drivers/i2c/busses/Kconfig
>>> @@ -200,7 +200,7 @@ config I2C_ISMT
>>>
>>>   config I2C_PIIX4
>>>          tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
>>> -       depends on PCI && HAS_IOPORT
>>> +       depends on PCI && HAS_IOPORT && X86
>>
>> Are you sure this south-bridge is not used on non-x86 platforms?
>> It is enabled in several non-x86 defconfigs:
>>
>>      arch/loongarch/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=y
>>      arch/mips/configs/ip27_defconfig:CONFIG_I2C_PIIX4=m
>>      arch/mips/configs/loongson2k_defconfig:CONFIG_I2C_PIIX4=y
>>      arch/mips/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=y
>>
>> The loongarch and loongson entries are probably bogus, but I wouldn't
>> be surprised if the SGI Onyx and Origin do use Intel south-bridges.
> Loongson can use AMD SB700/SB800 south bridges, which have I2C_PIIX4.

Well we could revert this patch, but it's going to be a compile failure 
because of 624b0d5696a89b138408d385899dd35372db324b and other patches 
that go on top of that.

My current leaning is we make a dummy fch.h header for these archs with 
#defines for 0.

Any thoughts?

> 
> Huacai
> 
>>
>>>          select I2C_SMBUS
>>>          help
>>>            If you say yes to this option, support will be included for the Intel
>>
>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
>> --
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                  -- Linus Torvalds
>>


