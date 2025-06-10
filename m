Return-Path: <linux-i2c+bounces-11348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DC4AD3BD9
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 16:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1AA93AA888
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 14:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D024322A7E1;
	Tue, 10 Jun 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl51QyIk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C47F20766E;
	Tue, 10 Jun 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749567333; cv=none; b=W0BYVU+VsITKgHosIqHoO/yFa0/FiUFJEeIovKnWatFb5tJmAztrQT5GD2sNQI9qWZN5mp+QF+6H5K1t9fVYxptuME7tHEnO3hHyGZfCQMQbESyYaGSoRMRkOIYmFIJ3IFUmh/pSpbXbwFUxxnD0iAWaf2nIurhx2S4gmfS/PLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749567333; c=relaxed/simple;
	bh=o2qFIwCJqf1Owe8LoAFDkXI9Um7ln94fm/Lg5eVi6/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bx9EOMPQtbJQdtFI/G7pCkMzFjEsL34G+8Uasi+UCanKVNzerCkHVeCNPxUDyrvGEUEowCJ3wEAr55CA8opNl2CThOhzNhFc1NUR5s7OopLAvX2Ez0E/AqMcO4Dtjo/c2NAg2NX1pejnM4+r7bAdpV63VrQzY/x3gMb0HMQjdqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl51QyIk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04298C4CEED;
	Tue, 10 Jun 2025 14:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749567333;
	bh=o2qFIwCJqf1Owe8LoAFDkXI9Um7ln94fm/Lg5eVi6/s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sl51QyIkRvKqYv018SvVzJZZ1IvNREg1v8VuuTS4bBTEiwLbyujGGldADwF5xT8tN
	 SwjGfmnT5myotfQhC5x4VXrpEz/YFGqll2BfRcnKFSia9CrNGOqdZ5x8ccvlz2uxVb
	 UXW0bTsrTa7YiQxKBaApgGFE6hwBBrIwbbnkTigUEfAxqhrdMjJNMMpw5at6o0uOmd
	 a7ZkgXr+IpLI3P2/qTFKDhtIHzvJ3lxNLJNv986w2tgeProeOj3fue8Hw3hXi0hjzq
	 TLBCNnQNk8lokn5M4NexbgYJAE0pKDPb2DYn3/w5kdi8Mm2p3l5sg7FTewow6ayy4X
	 HevTJcwJF1WjQ==
Message-ID: <1e06c620-8f8e-4ddf-8356-0782bccd63a2@kernel.org>
Date: Tue, 10 Jun 2025 16:55:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] i2c: piix4: Depends on X86
To: Mario Limonciello <superm1@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
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
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <30a7f1a6-1e04-4fc5-9bea-e2b5956b28b7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10-Jun-25 16:53, Hans de Goede wrote:
> Hi,
> 
> On 10-Jun-25 16:12, Mario Limonciello wrote:
>> On 6/10/2025 2:24 AM, Huacai Chen wrote:
>>> On Tue, Jun 10, 2025 at 5:16 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>
>>>> Hi Mario,
>>>>
>>>> CC mips, loongarch
>>>>
>>>> On Wed, 23 Apr 2025 at 01:49, Mario Limonciello <superm1@kernel.org> wrote:
>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>
>>>>> PIIX4 and compatible controllers are only for X86. As some headers are
>>>>> being moved into x86 specific headers PIIX4 won't compile on non-x86.
>>>>>
>>>>> Suggested-by: Ingo Molnar <mingo@kernel.org>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>
>>>> Thanks for your patch, which is now commit 7e173eb82ae97175
>>>> ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86")
>>>> in v6.16-rc1.
>>>>
>>>>> --- a/drivers/i2c/busses/Kconfig
>>>>> +++ b/drivers/i2c/busses/Kconfig
>>>>> @@ -200,7 +200,7 @@ config I2C_ISMT
>>>>>
>>>>>   config I2C_PIIX4
>>>>>          tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
>>>>> -       depends on PCI && HAS_IOPORT
>>>>> +       depends on PCI && HAS_IOPORT && X86
>>>>
>>>> Are you sure this south-bridge is not used on non-x86 platforms?
>>>> It is enabled in several non-x86 defconfigs:
>>>>
>>>>      arch/loongarch/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=y
>>>>      arch/mips/configs/ip27_defconfig:CONFIG_I2C_PIIX4=m
>>>>      arch/mips/configs/loongson2k_defconfig:CONFIG_I2C_PIIX4=y
>>>>      arch/mips/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=y
>>>>
>>>> The loongarch and loongson entries are probably bogus, but I wouldn't
>>>> be surprised if the SGI Onyx and Origin do use Intel south-bridges.
>>> Loongson can use AMD SB700/SB800 south bridges, which have I2C_PIIX4.
>>
>> Well we could revert this patch, but it's going to be a compile failure because of 624b0d5696a89b138408d385899dd35372db324b and other patches that go on top of that.
>>
>> My current leaning is we make a dummy fch.h header for these archs with #defines for 0.
> 
> Move "fch.h" to include/linux/platform/x86/ so that it is available on all arches
> and if necessary ifdef out anything x86 specific in the C-code referencing it ?

Correction that should be include/linux/platform_data/x86/

Regards,

Hans



