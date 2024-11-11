Return-Path: <linux-i2c+bounces-7918-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0799C3DEC
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 13:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADE821C21671
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 12:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA145189BA4;
	Mon, 11 Nov 2024 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SETk7WdP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D9415539A;
	Mon, 11 Nov 2024 12:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731326684; cv=none; b=lU2nQuAslojJZisb+6lRztGWVuaGxIrmkpF6Y6v4limHly1Hbr9TVFarjWWRoAZNs8Lfhhrw+FDnPTHCXisjolcRBw56iBOng+K72jEEBc9KHV4HeNryzkstEIj6JBJ0BnoXfgf/NZ3YQZV/nm55vGlUyz9o16Bd2RLVNe7qTeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731326684; c=relaxed/simple;
	bh=XDMRgofP1EQDz+AMrkp03fxhwMShxc3/uITnZtP9/hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGdX3JpGGlpX9Ilzvp2ctiG5B2ARZHu80l4sQkQAw/70LjHoW1/h8YiFSCqLNiVo+FEZdYcvxh7IUbTd7IRyBZhB+jmUNKf4aXVgmgq/0vjyOj9bkpl4LHfNjzfqUBETdRubWr/nZy+xuyT4YzkOaBi0+cMesy3s087tKRX2nyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SETk7WdP; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7187e0041d5so2594751a34.2;
        Mon, 11 Nov 2024 04:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731326682; x=1731931482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOhBF4mPrU4dB2Iuq+imlClyfFR5aLjqfJMpZx/Fwwo=;
        b=SETk7WdPZL0kfwm9spYaK5uxBqFZCl/zrfMtD2pz+Zx5de3/46oFiWQLP0ZAKJBqCl
         4Athe6D1PLPtF2SN7iU0yeI0wU44qGzwNboxV1CKWG6MBimk4bPF8x3sBgLq9wN4hjnV
         2ThZUv5YWSY76iXXWG7TpbIYgowyXF0557qwHq4+C+ZDYxhwkjWZ2Eb8xT3Sz5Drx+/f
         hg9mBPCy3OySXDCxyz9HPerTzTbdsQ9ri2krpbwPEvg/ZHFSrKE5ptwVMESjsGBEGTbH
         nCpIufnoJdeTd/pz5S2DtFdAYFVG8LRwCBpwWL22aFCl6Z3v7e3AmJ6mSznq1TiS0Zs6
         HjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731326682; x=1731931482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOhBF4mPrU4dB2Iuq+imlClyfFR5aLjqfJMpZx/Fwwo=;
        b=O92rCuxiYmPphZfLbn2705Tn+ClDASZbjxw76GCzC8+9Smb++6JJ/H0u9I+h+O7Aqe
         pYwplZ1dMdPZJQ1fd07ypT3Or8mUuTrSPI+u8/5qcVUhYT3Gzja4T1O2D4Vxo6d+6pWx
         be9986B8WuPYhazh5pnCZixMlIfBVFHTk9ip2Z0A0GtIUuBAGeWqvAexbIWx/pfNxEHJ
         KQlCuYsEjZZr/D+9s/tdSmt8TP2ABAdYegjYYL66SmEQ+slfiSc4oKoRk69k5Ezl6z2X
         6SVQmpGbRa/5ao1nbV56eqz0PLKUD3DJmEvIAWAxYhl0/BmgT/TvFoEkKNGIY7TaHFSp
         BRaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO44TCZocbFYqHzCPZtxJkBl/+12o7jMxAgQmgAuzRss1uLuiyBJYWXrKgcT9ZlPDz7yVulPHhN/k1@vger.kernel.org, AJvYcCWHOve5D5bwIc8VyTHYJiSmer6iov2bajhP3H1+Fm2KGmuVC8wSSnNDxPwLybEiwXDoZfJ97t6PFpDu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy7KTDASK47tTs+H4ObaikghSQIEMqu90QdE4CNdRxPJSgdqsk
	WMTtYeYl+2m8ivqh+deXIMZKML957qMOFN0Ja73MaIs+MmSJ/t8UrHsmKlIgJCmJudYBoRHLHOm
	Oj+PJWGsWypE0GHIcFUKSnFsNbIIc1vw72Ms=
X-Google-Smtp-Source: AGHT+IEDhSYNCJ/eKcicgFK7x/kTNvlQvG7YPtuUhlMVlBge5oJSDBwDM7huxviQjknKhH5uxr+uv/2AapuFbE1QWF8=
X-Received: by 2002:a05:6358:72a2:b0:1c3:7415:693d with SMTP id
 e5c5f4694b2df-1c641e749a2mr395840355d.5.1731326682184; Mon, 11 Nov 2024
 04:04:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACSj6VX77y6K9FNFZn-rMvEL9XSPS6rFDt-STGf1UxgkuS6msw@mail.gmail.com>
 <Zy3P7ld7UUL8XCrR@smile.fi.intel.com> <7fc0f59b8264e965efc96c0aa0ba4c31@dev.tdt.de>
 <CACSj6VW7WKv5tiAkLCvSujENJvXq1Mc7_7vtkQsRSz3JGY0i3Q@mail.gmail.com> <Zy4IRAeLvoku4LfL@smile.fi.intel.com>
In-Reply-To: <Zy4IRAeLvoku4LfL@smile.fi.intel.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Mon, 11 Nov 2024 15:09:55 +0300
Message-ID: <CACSj6VU1pxDeJaGT6qsA4_ftn_z0rqDicTTB1Hert5Zc1fF0OA@mail.gmail.com>
Subject: Re: Adding I2C devices to the SMBus (PIIX4) via the ACPI SSDT overlay method
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Florian Eckert <fe@dev.tdt.de>, linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I needed some time to recompile my kernel.
I've verified your patch for the jc42 driver and it works as expected.
Now the driver correctly connects to the I2C device and the hwmon
directory created in the sysfs.
Thanks for the help!

I've also sent a patchset for the piix4 documentation update as you've
requested. Please review.

Best regards,
Konstantin Aladyshev

On Fri, Nov 8, 2024 at 3:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Nov 08, 2024 at 02:48:44PM +0300, Konstantin Aladyshev wrote:
> > Thanks for the help!
>
>
> > $ cat /sys/bus/acpi/devices/device\:25/path
>
> These cat:s you made are mostly useless in this case. And you should look=
 for
> the real device folders in sysfs and firmware_node links there.
>
> ...
>
> > However I was using the at24 device only as an example.
> > My real target device is jc42
> > (https://github.com/torvalds/linux/blob/906bd684e4b1e517dd424a354744c5b=
0aebef8af/drivers/hwmon/jc42.c#L600).
>
> > Does it mean that jc42 driver doesn't support ACPI binding?
>
> Kinda. I just sent a patch, please test and provide your Tested-by if it =
helps.
>
> ...
>
> > Just in case here is my SSDT:
> > ```
> > DefinitionBlock ("jc42.aml", "SSDT", 5, "", "JC42", 1)
> > {
> >     External (_SB_.PCI0.SMBS, DeviceObj)
> >
> >     Scope (\_SB_.PCI0.SMBS)
> >     {
> >         Device (SMB0) {
> >             Name (_ADR, 0)
> >         }
> >         Device (SMB1) {
> >             Name (_ADR, 1)
> >         }
> >         Device (SMB2) {
> >             Name (_ADR, 2)
> >         }
> >     }
> >
> >     Scope (\_SB.PCI0.SMBS)
>
> While this works, we expect Scope to be under the respective host control=
ler, i.e.
>
>      Scope (\_SB.PCI0.SMBS.SMB0)
>
> in your case.
>
> >     {
> >         Device (JC42) {
> >             Name (_HID, "PRP0001")
> >             Name (_DDN, "JC42 Temperature sensor")
> >             Name (_CRS, ResourceTemplate () {
> >                 I2cSerialBusV2 (
> >                     0x001c,              // I2C Slave Address
> >                     ControllerInitiated,
> >                     400000,              // Bus speed
> >                     AddressingMode7Bit,
> >                     "\\_SB.PCI0.SMBS.SMB0",   // Link to ACPI I2C host
> > controller
> >                     0
> >                 )
> >             })
> >
> >             Name (_DSD, Package () {
> >                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> >                 Package () {
> >                     Package () { "compatible", Package() {
> > "jedec,jc-42.4-temp" } },
> >                 }
> >             })
> >         }
> >     }
> > }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

