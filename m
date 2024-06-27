Return-Path: <linux-i2c+bounces-4394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3A391A546
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 13:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D189B2474F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 11:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F385014F9D7;
	Thu, 27 Jun 2024 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ans.pl header.i=@ans.pl header.b="X1knxlpK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.emenem.pl (cmyk.emenem.pl [217.79.154.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5B14A09E;
	Thu, 27 Jun 2024 11:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.79.154.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487787; cv=none; b=TT23p0FV4fSOUF3gvxg3UfxGO34SOhh9HkDJ7188U1Hia9Z90/5Lj9Kn6YrkRFcSX4AQIVCM9R225IIKmlOWEthCW7aMS2t46plgOlsBpUy8WNOtylD8hZ2He0/r2yIkWV427jSWi5nAukuk+RkXqfX5olrDXIciWDzbIdfJBSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487787; c=relaxed/simple;
	bh=tiOzdOJNp6ZKRMHsXI8GpXUZGI0r7SB4Baz6mN7VoIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oeqICeZr0h8KQVYGMOLRpNNF1qTqEZU12ocqRdxSFIdm+1H9+37+iQ3KTK6QwwbU/xXuVQ+RzrRAMdW9N5+WEEIja67IsxnoblPzm6vhLnpYz3Ddpkr0usdKt3zj5AnM2tLJpLMof4v0sSi82UJJACl909Z4l1wmFC09iZIYO6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ans.pl; spf=none smtp.mailfrom=ans.pl; dkim=pass (1024-bit key) header.d=ans.pl header.i=@ans.pl header.b=X1knxlpK; arc=none smtp.client-ip=217.79.154.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ans.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ans.pl
X-Virus-Scanned: amavisd-new at emenem.pl
Received: from [192.168.1.10] (c-98-45-176-131.hsd1.ca.comcast.net [98.45.176.131])
	(authenticated bits=0)
	by cmyk.emenem.pl (8.17.1.9/8.17.1.9) with ESMTPSA id 45RBTH4j006413
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 27 Jun 2024 13:29:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ans.pl; s=20190507;
	t=1719487761; bh=OAR1dkJB/scQxeekWuNbHAxMyX4sPBdqtNAKZRpb41A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=X1knxlpKKSV0bU+QboHBTRRoor8IPwrMgCKT6D3ii9KNL5fWCKfEfkxllte/9TA64
	 rU+iATDr08dckCJjASNozc60h0C2AIIXFYkFmRoHl4JvOGn8x+ySQAPPk9sPPVjP/r
	 9cGwjFXMXxV4IU8kimSqla84JrLSdBhGzmHgY4zA=
Message-ID: <9541ab9f-0f13-4856-85f0-14615b77142f@ans.pl>
Date: Thu, 27 Jun 2024 04:29:16 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor
 in the SPD case" - "sysfs: cannot create duplicate filename"
To: Guenter Roeck <linux@roeck-us.net>,
        Heiner Kallweit
 <hkallweit1@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>
Cc: stable@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>
 <0dfa2919-98eb-4433-acb4-aa1830787c9b@roeck-us.net>
 <77c1b740-9e6d-40f7-83f0-9a949366f1c9@ans.pl>
 <97c497ae-44f7-4cec-b7d9-f639e4597571@roeck-us.net>
 <797c8371-dff3-4112-9733-4d3119670dbf@gmail.com>
 <5a4e1cd6-5770-423b-9a25-a0fbfd93014a@roeck-us.net>
From: =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?= <ole@ans.pl>
Content-Language: en-US
In-Reply-To: <5a4e1cd6-5770-423b-9a25-a0fbfd93014a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.06.2024 at 20:45, Guenter Roeck wrote:
> On 6/24/24 13:58, Heiner Kallweit wrote:
> [ ... ]
>>
>> Too me the issue also looks like a race. According to the OP's logs:
>> - jc42 at 0x18 is instantiated successfully
>> - jc42 at 0x19 returns -EBUSY. This is what is expected if the device
>>    has been instantiated otherwise already.
>> - jc42 at 0x1a returns -EEXIST. Here two instantiations of the the same
>>    device seem to collide.
>> - jc42 at 0x1b returns -EBUSY, like at 0x19.
>>
>> So it looks like referenced change isn't wrong, but reveals an
>> underlying issue with device instantiation races.
> 
> It isn't just a race, though. Try to unload the at24 (or ee1004 driver
> for DDR4) and load it again, and you'll see the -EBUSY errors. Problem
> is that instantiating those drivers _always_ triggers the call to
> i2c_new_client_device() even if the jc42 device is already instantiated.
> Unloading the spd/eeprom driver doesn't unload the jc42 driver,
> so -EBUSY will be seen if the spd/eeprom driver is loaded again.
> 
> I have not been able to reproduce the backtrace with my systems, but those
> are all with AMD CPUs using the piix4 driver, so timing is likely different.
> Another difference is that my systems (with DDR4) use the ee1004 driver.
> That driver instantiates the jc42 devices under a driver lock, so it is
> guaranteed that a single instantiation doesn't interfere with other
> instantiations running in parallel.

Right, sorry for not mentioning this in the original report:

[    0.269013] pci 0000:00:1f.3: [8086:1c22] type 00 class 0x0c0500
[    0.269098] pci 0000:00:1f.3: reg 0x10: [mem 0xc3a02000-0xc3a020ff 64bit]
[    0.269186] pci 0000:00:1f.3: reg 0x20: [io  0x3000-0x301f]
[    0.334962] pci 0000:00:1f.3: Adding to iommu group 7
[    7.874736] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt

$ lspci -s 0000:00:1f.3 -vvnn
00:1f.3 SMBus [0c05]: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller [8086:1c22] (rev 04)
        Subsystem: Dell Device [1028:04de]
        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin C routed to IRQ 19
        IOMMU group: 7
        Region 0: Memory at c3a02000 (64-bit, non-prefetchable) [size=256]
        Region 4: I/O ports at 3000 [size=32]
        Kernel driver in use: i801_smbus

Krzysztof


