Return-Path: <linux-i2c+bounces-2829-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC3D89BBB1
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 11:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 556DC282910
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 09:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF6947F62;
	Mon,  8 Apr 2024 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/txA6WV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8BE47F4A
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712568631; cv=none; b=fvbSh5W20mQpPbX83dgLLy6F1Wl71dq2k/QPiZXe4UyHpl162tHmjuEeJ8/MtR1WV0lu8yOreg/XyPcgOwE1DGiJLB1xlrjQpAFm6YGt4VXzlEIunT3uyQc/d/kUoHHvUlFpwzMZwwCphDtydbiQrBizEShtGckab1H+1ZAvaOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712568631; c=relaxed/simple;
	bh=P24/uUI2t35l6v8xeXfYYCdNlO4Ii4Tbd8HftEwsUDg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=aq+qOMQKA+rlg65fiCaFABeWn/WqrfLwHQ3l9lbadt+vg+5BWP9Ww69L/U92SeaEz5bmX5KY+2h9hLElVhIHKz6RsZeHRMI3fS3vuu1uM5+mkiRtvNKYSevE3A+LY9UuJ1bxhCR3kesZDTB3cuC+E+VE77jr7ccVcEjm1xkRR/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/txA6WV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07CEC433F1;
	Mon,  8 Apr 2024 09:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712568631;
	bh=P24/uUI2t35l6v8xeXfYYCdNlO4Ii4Tbd8HftEwsUDg=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=L/txA6WV2oR1st+A6SOgulGDXdlkDRJ+BGIUI8WTHs1g2i1ft9EL8eHy2SXFRIxON
	 VLXya/nGnwoua7A3cv3+i/OfuUS0cOgAKPV17Q2PV6eBKF7C3xBdJ2Uovm+NutDVm0
	 1efoSn2aVUZiBB6OXKZ/HXdyMqBhRSW7jnmSiR8eJzPL0I1fQ2eF0Wtz9jRljBB73s
	 fHP9goqFBc4bmpfVMRcXR5tsLOhd2l/jFRYvVenjKv0rnCaw2gpPPJpo1nuhjTV+39
	 /CklYJcMg43pQ4M6etFgHwr2oyw1jynscKdzUY3oR58BJ/vwh4Hj0QnRGhKRmG+/Lb
	 b78abvCnhjBTA==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id D48491200066;
	Mon,  8 Apr 2024 05:30:29 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 08 Apr 2024 05:30:29 -0400
X-ME-Sender: <xms:NbkTZvPbs-GLshZcTY3VD2wKCiUdy8-f2OKGUhIAWhtaY5FDSeqsCQ>
    <xme:NbkTZp8UK3ch08ensVktjh-3jjvlzy41KcuO6yey4WLBVGOEC9KpCF-9cAVz3zurw
    5ItLwntD62JdgY3sQU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudegiedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpedvtddtffejfeeggefgleefgfeghfehfeefffetgffgleegudevveet
    hfefjeevkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudej
    tddvgedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusg
    druggv
X-ME-Proxy: <xmx:NbkTZuT50k1e7G1nAt3nY0HNVZERAnO79AVodEI7ypNaGjWnYaX2mg>
    <xmx:NbkTZjuqagqfFXOGjc5dJOeZzSnUqWgOnjooV-FnV-71rTCEgjVVAg>
    <xmx:NbkTZndBA5nFQgHmwmLlfRKjpnJn3IMJTcUJIXvEkSzNfoMWqM1HqQ>
    <xmx:NbkTZv1lzh-Urjl3rGfsfVOzV3_ZAR7WALh9OF3xSxXmka6vXzsVow>
    <xmx:NbkTZj9MXNjzlcqfkdqHwxz2nt5AY16J5WYsVXmnz2Pfq29V2rkNdsCG>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 87932B6008D; Mon,  8 Apr 2024 05:30:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-368-gc733b1d8df-fm-20240402.001-gc733b1d8
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <01fe2d77-4539-4695-9001-21a9a131760b@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdVUQ2WgtpYPYfO2T=itMmZ7w=geREqDtsP8Q3ODh9rxdw@mail.gmail.com>
References: <20240405101009.2807447-1-schnelle@linux.ibm.com>
 <20240405101009.2807447-2-schnelle@linux.ibm.com>
 <CAMuHMdVUQ2WgtpYPYfO2T=itMmZ7w=geREqDtsP8Q3ODh9rxdw@mail.gmail.com>
Date: Mon, 08 Apr 2024 11:30:08 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>
Cc: "Andi Shyti" <andi.shyti@kernel.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 "Heiko Carstens" <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: add HAS_IOPORT dependencies
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024, at 10:50, Geert Uytterhoeven wrote:
> Hi Niklas,
>
> On Fri, Apr 5, 2024 at 12:10=E2=80=AFPM Niklas Schnelle <schnelle@linu=
x.ibm.com> wrote:
>> In a future patch HAS_IOPORT=3Dn will disable inb()/outb() and friend=
s at
>> compile time. We thus need to add HAS_IOPORT as dependency for those
>> drivers using them.
>>
>> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
>> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
>> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
>> ---
>> Note: This patch does not depend any not-yet-mainline HAS_IOPORT chan=
ges
>> and may be merged via subsystem specific trees at your earliest
>> convenience.
>>
>> v1 - v2:
>> - Removed HAS_IOPORT dependency for I2C_PARPORT
>
> Thanks for your patch, which is now commit 53f44c1005ba6421 ("i2c: add
> HAS_IOPORT dependencies") in i2c-host/i2c/i2c-host (next-20240408).
>
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -885,6 +885,7 @@ config I2C_NPCM
>>
>>  config I2C_OCORES
>>         tristate "OpenCores I2C Controller"
>> +       depends on HAS_IOPORT
>
> This restricts the driver to platforms that select HAS_IOPORT, while
> the driver supports both MMIO and IOPORT.
>
> At least for
> arch/xtensa/configs/audio_kc705_defconfig:CONFIG_I2C_OCORES=3Dy
> the HAS_IOPORT dependency does not seem to be met.
>
> I think the IOPORT part in i2c-ocores.c should be protected by
> "#ifdef HAS_IOPORT" first, so the driver can still be built on platfor=
ms
> that do not support IOPORT.

Good catch! I sent a fixup for this driver now.

    Arnd

