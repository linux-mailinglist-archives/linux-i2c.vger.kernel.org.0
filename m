Return-Path: <linux-i2c+bounces-11347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF4CAD3BBF
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 16:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C3B516308D
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 14:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5515A21FF4B;
	Tue, 10 Jun 2025 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+qh8jev"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB99921ADBA;
	Tue, 10 Jun 2025 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749567224; cv=none; b=bFSBT4k+ckV21wli3YVurURRMh01HNUdbNucADEG+pUFigvYUrnVC03WYikPfdzaQmtEWOtvCz2/LOCmkEk545BQ83d4zVx4c78EQulY0PyV1dArYeM0zY3ayGf739d6xQPLnyWpRFqXrXGSLExmiVgN/TaIuNATBDGEDBPzn7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749567224; c=relaxed/simple;
	bh=D8oBuhkz5TcYD7TDo/ChhAEaqGOauhMGzMwHg078OFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PR7K4+nxZKjEpVvTXaGNXpyfhxfBor4OttVRmzMdOV+7MTRxU10hYDfmGGbudEe5oVX2rqCnRbztNus7eE8yYQuXN2nG80ssewFww6kSkVrKmvupsYqivIt5wlTA0numcCVGtMIMS6ijZx+sSwa4nt6TlCpdO+uZ85rzYNQRCMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+qh8jev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C5CC4CEED;
	Tue, 10 Jun 2025 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749567223;
	bh=D8oBuhkz5TcYD7TDo/ChhAEaqGOauhMGzMwHg078OFo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T+qh8jevVpXz6Ho7YmvXD8xON+9O31WEPh0rRdKrnR/ms5r6JwO2sYroEODP9pyZ5
	 giR/XOWDXaDqgWOIIxCFhNQThnLbSojmKfDA+i4SXCG8EYgtTFLK1TCk7SqP0Mk7l4
	 4dPhtDlYsm81rJ+KjBgsmUc/1q/SWPyT9UhlUW3Cyg2QziB+RtLZyxGFZ97+JGP//5
	 EAA5RS9FxQOM8mikEXbTkF142n6K7HIm2pf0amkVuu637/KmiKZkWFTY7Wq2dgu08P
	 M6QJwn8JWSZ06MiRMSPMQu9c/PFdId0iRsyw9M/R7bvG1TAjC/7zH8sRzdbYaat1Sz
	 m5/wSeyeebkQg==
Message-ID: <30a7f1a6-1e04-4fc5-9bea-e2b5956b28b7@kernel.org>
Date: Tue, 10 Jun 2025 16:53:34 +0200
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
 <24febda9-6360-459f-82d3-6fba9ed9be83@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <24febda9-6360-459f-82d3-6fba9ed9be83@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10-Jun-25 16:12, Mario Limonciello wrote:
> On 6/10/2025 2:24 AM, Huacai Chen wrote:
>> On Tue, Jun 10, 2025 at 5:16 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>
>>> Hi Mario,
>>>
>>> CC mips, loongarch
>>>
>>> On Wed, 23 Apr 2025 at 01:49, Mario Limonciello <superm1@kernel.org> wrote:
>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>
>>>> PIIX4 and compatible controllers are only for X86. As some headers are
>>>> being moved into x86 specific headers PIIX4 won't compile on non-x86.
>>>>
>>>> Suggested-by: Ingo Molnar <mingo@kernel.org>
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> Thanks for your patch, which is now commit 7e173eb82ae97175
>>> ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86")
>>> in v6.16-rc1.
>>>
>>>> --- a/drivers/i2c/busses/Kconfig
>>>> +++ b/drivers/i2c/busses/Kconfig
>>>> @@ -200,7 +200,7 @@ config I2C_ISMT
>>>>
>>>>   config I2C_PIIX4
>>>>          tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
>>>> -       depends on PCI && HAS_IOPORT
>>>> +       depends on PCI && HAS_IOPORT && X86
>>>
>>> Are you sure this south-bridge is not used on non-x86 platforms?
>>> It is enabled in several non-x86 defconfigs:
>>>
>>>      arch/loongarch/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=y
>>>      arch/mips/configs/ip27_defconfig:CONFIG_I2C_PIIX4=m
>>>      arch/mips/configs/loongson2k_defconfig:CONFIG_I2C_PIIX4=y
>>>      arch/mips/configs/loongson3_defconfig:CONFIG_I2C_PIIX4=y
>>>
>>> The loongarch and loongson entries are probably bogus, but I wouldn't
>>> be surprised if the SGI Onyx and Origin do use Intel south-bridges.
>> Loongson can use AMD SB700/SB800 south bridges, which have I2C_PIIX4.
> 
> Well we could revert this patch, but it's going to be a compile failure because of 624b0d5696a89b138408d385899dd35372db324b and other patches that go on top of that.
> 
> My current leaning is we make a dummy fch.h header for these archs with #defines for 0.

Move "fch.h" to include/linux/platform/x86/ so that it is available on all arches
and if necessary ifdef out anything x86 specific in the C-code referencing it ?

Regards,

Hans



