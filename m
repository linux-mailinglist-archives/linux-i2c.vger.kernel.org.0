Return-Path: <linux-i2c+bounces-1846-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A380C858806
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 22:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0781B2D430
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 21:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DDE14600A;
	Fri, 16 Feb 2024 21:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=o2.pl header.i=@o2.pl header.b="fEoOZrRJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0791D13B28A
	for <linux-i2c@vger.kernel.org>; Fri, 16 Feb 2024 21:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708118803; cv=none; b=KpfZrK7gxxVtla5YJrIb6n2jkPe+IFrkrdSkmDPwLM49RGRZaSYoiGM5cA/x/e08gTgrr1wRSGyytJIk9qhCErDCpCtwDFP8ZifJDdEG/SgvJAprI94BnmB0m7HmrzlMHVeyV+EnGMkTesm5rfHlo5xoTwDvDEgse+arJWmAzEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708118803; c=relaxed/simple;
	bh=vIJEL7CbUVuJ5NoMQt5ManfshOXEdBki/VegX3TJQpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEq2IgZJ3umoC4P2BzBb7sBnGAho7eJTzS7mDQxgw2oTLPLddQ7dYAywSlq3bDz1G33vbDLe7AL4O7xUIS6woy1A+UufLQX7NaF+Hv4hnL45AVnnIi7x4YblHZZz1n2ALRiMlytDKhfb4ftkspMpWsoGDaO3JVuT2JuKF5V2GbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (1024-bit key) header.d=o2.pl header.i=@o2.pl header.b=fEoOZrRJ; arc=none smtp.client-ip=193.222.135.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 25088 invoked from network); 16 Feb 2024 22:19:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1708118399; bh=Q4cvTn+OjHbTSfCP4AlHayDKYqdCAA/rUJ5rdOEe5JM=;
          h=Subject:To:Cc:From;
          b=fEoOZrRJCm8hpDYWqN63H+W2PX06WhO4aNnT1YxO6f2skyISAJpj7/17SR7a4ff+O
           HtUwtc3HACHKpsDF1U2yEUBvh716w+R4i0eSrlgqInARw1j0wOuCEDMcUKjNP1PdE6
           YmBu7oEuDA4aaLvAnQVI53mIdvI2lnxkuhVitWTE=
Received: from aafh184.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.137.184])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rafael@kernel.org>; 16 Feb 2024 22:19:58 +0100
Message-ID: <041e0f89-ad58-4df0-aa1e-e0d92065e5a9@o2.pl>
Date: Fri, 16 Feb 2024 22:19:56 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] acpi,pci: warn about duplicate IRQ routing entries
 returned from _PRT
Content-Language: en-GB
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Len Brown <lenb@kernel.org>, Jean Delvare <jdelvare@suse.de>,
 Borislav Petkov <bp@alien8.de>
References: <20240216184946.GA1349514@bhelgaas>
 <520eaafc-e723-49d4-8a6b-375fc64dd511@o2.pl>
 <CAJZ5v0iVTAg+tmuVQJwN0pv77arUsF5fGF2CYaug7xgqiYC_vA@mail.gmail.com>
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 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
 TANkZ3QqXNX2
In-Reply-To: <CAJZ5v0iVTAg+tmuVQJwN0pv77arUsF5fGF2CYaug7xgqiYC_vA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 69a51b667a1284e92c04d63a45060fe1
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [ITPA]                               

W dniu 16.02.2024 o 21:51, Rafael J. Wysocki pisze:

> On Fri, Feb 16, 2024 at 9:20 PM Mateusz Jończyk <mat.jonczyk@o2.pl> wrote:
>> W dniu 16.02.2024 o 19:49, Bjorn Helgaas pisze:
>>> On Fri, Feb 16, 2024 at 07:26:06PM +0100, Rafael J. Wysocki wrote:
>>>> On Tue, Dec 26, 2023 at 1:50 PM Mateusz Jończyk <mat.jonczyk@o2.pl> wrote:
>>>>> On some platforms, the ACPI _PRT function returns duplicate interrupt
>>>>> routing entries. Linux uses the first matching entry, but sometimes the
>>>>> second matching entry contains the correct interrupt vector.
>>>>>
>>>>> As a debugging aid, print a warning to dmesg if duplicate interrupt
>>>>> routing entries are present. This way, we could check how many models
>>>>> are affected.
>>>>>
>>>>> This happens on a Dell Latitude E6500 laptop with the i2c-i801 Intel
>>>>> SMBus controller. This controller is nonfunctional unless its interrupt
>>>>> usage is disabled (using the "disable_features=0x10" module parameter).
>>>>>
>>>>> After investigation, it turned out that the driver was using an
>>>>> incorrect interrupt vector: in lspci output for this device there was:
>>>>>         Interrupt: pin B routed to IRQ 19
>>>>> but after running i2cdetect (without using any i2c-i801 module
>>>>> parameters) the following was logged to dmesg:
>>>>>
>>>>>         [...]
>>>>>         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>>>>>         i801_smbus 0000:00:1f.3: Transaction timeout
>>>>>         i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
>>>>>         i801_smbus 0000:00:1f.3: Transaction timeout
>>>>>         irq 17: nobody cared (try booting with the "irqpoll" option)
>>>>>
>>>>> Existence of duplicate entries in a table returned by the _PRT method
>>>>> was confirmed by disassembling the ACPI DSDT table.

[snip]

>>> And neither of the two _PRT entries yields a working i801 device?
>> Unpatched Linux uses the first matching entry, but the second one gives
>> a working i801 device. The point is to print a warning message to see
>> how many devices are affected and whether it is safe to switch the code
>> to use the last matching entry in all instances.
>>
>> Therefore I used dev_warn().
> I don't quite see a connection between the above and the log level.

OK, so I'll use dev_info() then.

Greetings,
Mateusz


