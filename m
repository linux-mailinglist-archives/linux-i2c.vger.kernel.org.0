Return-Path: <linux-i2c+bounces-15244-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C537DD386FB
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 21:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66B7C308599E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 20:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15A339A7E0;
	Fri, 16 Jan 2026 20:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="HxwPvHmd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83D839E6E3
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594378; cv=none; b=qB0oJ/wHXnSir0UJ0bmMSJTiPFsxnEjt/U+sXS9EZx4hJ1kM+UgHLuFiYeoxxnkUgCaCXQ9RlYfVDC48nLP5YxkPGSKejTm6Jw/gc8hHy4GFey7hySeGm+hqoigPOB/4Tz6vbcIGad5dwIgTQvsH+lpgO7tV1kOc78oCnzGixdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594378; c=relaxed/simple;
	bh=zLO74AQRRhv6b2SwuidBKaYwkKHYtwbUsw11WJWSWjg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=M3//pl20GtFIeTejqhMAxqFUlChSRFMbUl97bi51VjUs7jqbmQiPx7q7SvfoRZiwET3HIW5O9+SbdsmtNaLHO+/Xy6mkZby+BSSU+EquAYKLZRCbRUlQBRK0PPe5zcfJX46zC4qnSTKc3oVvuiKPUXU/dcyzntw70CT4pzQkKUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=HxwPvHmd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a137692691so15747175ad.0
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 12:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768594375; x=1769199175; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0CbbXgsbOfBJ8N7OtD9ZcjSFwk0Z5dOnisL/uMONXk=;
        b=HxwPvHmdaKBRpoR0hkBgE4KUPfc3ZkthH0qNtCvVPoM0KuWVjR1Neh2+r08uQzw40e
         I6gMEt5p1G3a50tkE1lbzEr2G0jD8BzqUQRd1weIq4sCT+Z72q8WA75g1I25AdEg9zUA
         kJjtLsaMHfd2MdtrR/USpFzzSqwa5lN+gQmm8QXONmvE/iHvxGxhsya9PhxychjG5TSA
         8vKkMo/IGNg8jT30PMTtfytF5xo4lqte9CNnMaK+u00fKN/oiRN+AHoRvEOqiZhLaWZO
         MkDPBw+q5iPD+SStnEAwmGpuX3kzL6mIYw82iEmHlIxopJkGKyyza0YFBdSxn/3u9aSC
         FhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768594375; x=1769199175;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W0CbbXgsbOfBJ8N7OtD9ZcjSFwk0Z5dOnisL/uMONXk=;
        b=ER/QYQz2yik9pm8r9Z/8X2vZjifL9Vi6X22MC5nIZoAOvblmrTjM1daIbQ32fAkDtH
         /PbVMuKLOoxgdDXVDsg/mxkj7kzrft/7qfacBIJCE6mooEXUZc3y+kF/ml2E8wcsUJMX
         Dl8YFMshnBG9wP2QgQLCSeFlRkG+oVF6ooI8WLEbMG7aC/ndibirepig6l0DMT9+3ZRn
         3Yd4KfKsB5YDt6RSjmTsfbFWOqdGT3mbcTKKCwlviRBpXgH89tuXZc4C1awo+iG9EFnC
         UVbD7Hsj4Vcml9T4vsJbsl/Juwonko5cBAxlVCrPvpz05F91pjC060c5Fs8u/RsAyzwa
         ubVw==
X-Forwarded-Encrypted: i=1; AJvYcCWfFCJm+CzR55O3G1gYUpm132rOt/stml5ZhBFUlK1k6pWqssfCH2jmcGqpRsFOsjDIfecUfc7f/s0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVjAPhhHaiTfkXiHO7lPkQcQj3BW/XBgeA3UDOEJVOTsmr5YAP
	7bMnCugu2ZkelVsOq+KoLOz1pIGJ5Oo8SMNZaqW3Z/bMzWOIrmm5fc7S3uUzpenwSOI=
X-Gm-Gg: AY/fxX7hDAGmiqxswFmhDSSRREOf+FzZ3K4ZvTZpx5h0LO0zDZxpDmah5Wu0PkQi5SW
	WIXJrt6orW2LHnFcT42UXQFCvmdoowYUIaD1vmTORqvM/hseYA7PYlOISn/6N4nPg+y08H7pLXB
	1/ElGoIB3uMbnV2p0G66Vf9ciwoNOoD08o9bWF0UD8832FWp/R+qXWQ2MnGMDwN/oiEnyI4lhBJ
	e0BakbCQSEKYwPBFHGKR3dNZ81RJwBCoabdZGRFHp3R9KJguYKBNP2M1mPtDWM0eYPIKv80JcnA
	+1U6nA3WhRNF9J4bhFawUHBHlreep5fiqHqQ21waX2Btvlsr/fNCNMIoBLbNJ/k47WlE5rzSIzY
	WCbaOkNty4q283jIQ1XVGoNvWSaidv9Kucw/1mps33pp4eF/5ggqF3I+lf2xYIr+1pOQmFVqVAV
	AZTP2mcx8+//0cyTRa2XDFz15uZZPK1FC01Qso2tleN9vR1/z6i/4z1VbiHvsR3drVJoQPbcs=
X-Received: by 2002:a17:902:da8d:b0:29f:2b8a:d3d with SMTP id d9443c01a7336-2a71751a47cmr39358445ad.4.1768594374971;
        Fri, 16 Jan 2026 12:12:54 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm27613535ad.88.2026.01.16.12.12.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Jan 2026 12:12:54 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] i2c: xiic: add ACPI support
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <4c3f28e1-69a2-410b-abe7-ed163e97eedd@amd.com>
Date: Fri, 16 Jan 2026 12:12:43 -0800
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C89C33BE-55F1-4588-ABFC-EE9B79FBAC0D@nexthop.ai>
References: <20260115002846.25389-1-abdurrahman@nexthop.ai>
 <aWjlTKrM34lfDsfC@shikoro> <AAB5CE7A-9264-4CE1-8A49-2FD3043B0A80@nexthop.ai>
 <4c3f28e1-69a2-410b-abe7-ed163e97eedd@amd.com>
To: Michal Simek <michal.simek@amd.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)



> On Jan 15, 2026, at 11:30=E2=80=AFPM, Michal Simek =
<michal.simek@amd.com> wrote:
>=20
>=20
>=20
> On 1/15/26 20:04, Abdurrahman Hussain wrote:
>>> On Jan 15, 2026, at 5:02=E2=80=AFAM, Wolfram Sang =
<wsa+renesas@sang-engineering.com> wrote:
>>>=20
>>> On Thu, Jan 15, 2026 at 12:28:46AM +0000, Abdurrahman Hussain wrote:
>>>> Use generic device property accessors.
>>>> Make the clock optional assuming it's managed by firmware.
>>>>=20
>>>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>>=20
>>> On which hardware has this been tested?
>>>=20
>> This was tested on nexthop.ai data-center NH-4010 switch with Xilinx =
based FPGA.
>> The following ACPI ASL fragment was used to describe the device:
>>             Device (I2C2) {
>>                 Name (_HID, "PRP0001")
>>                 Name (_CRS, ResourceTemplate () {
>>                     Memory32Fixed (ReadWrite, 0x80a40400, 0x00000200)
>>                     GpioInt (Level, ActiveHigh, Exclusive, PullNone, =
0,
>>                         "\\_SB.PCI0.GPP5.FPGA") { 10 }
>>                 })
>>                 Name (_DSD, Package () {
>>                     ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>>                     Package () {
>>                        Package () { "compatible", "xlnx,axi-iic-2.1" =
},
>>                        Package () { "single-master", 1 },
>>                     }
>>                 })
>>             }
>=20
> can you share more details about cpu and bootflow?
>=20
> Thanks,
> Michal
>=20

Hi Michal,

This is an AMD Ryzen Embedded V3C48 platform with Xilinx Artix 7 FPGA =
with multiple I2C and SPI IP blocks.

The FPGA sits on PCIE bus and has all the IP blocks memory mapped. I2C =
blocks also generate PCI MSI interrupts and we have implemented a custom =
irq_chip/gpio driver that creates the irq_domain hierarchy.

Adding these changes allowed us to benefit from the existing ACPI device =
enumeration in the kernel and re-use the existing drivers.

Thanks,
Abdurrahman=

