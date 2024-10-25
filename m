Return-Path: <linux-i2c+bounces-7562-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C409AF725
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 03:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47D731C2188C
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 01:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A48E552;
	Fri, 25 Oct 2024 01:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ju5ljXrW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021334C8C;
	Fri, 25 Oct 2024 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729820807; cv=none; b=cONBrSbtwWVIpu718tJxjFbwQXxxvPJ2ReRofEJtzeJ5UmLRCBa6wZHV+zuxoKlg+KIw1Vr39EoENX1o3noyGLFimzWCHRIhlJ8kWfVnHaODAD/lugDE7o404KQZBrKtgxJ2Ee62zBLo6dlhLG1dX38rsS4Vv/cg6nSmZyqQ4tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729820807; c=relaxed/simple;
	bh=lGkUgae0xnObq7vF7eXT0sX1bo3payxw/YGEnCH8+Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Um3OG4pQCd8Vzsar6cEMy5VmRUChsJR1Yme/c6s5qywklSn85baL4OC4SEXQn0ZmqOpnY8fWLtkJWYSybrwSkNCIpgxlplrSqsBVaGdh0hXl3Ex/ZFqzINiK+dOsjeH5W+DDL3aSanQi4pIQ/HTQdeF7Jls1n6alKsPphHQGHKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ju5ljXrW; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a0f198d38so205637666b.1;
        Thu, 24 Oct 2024 18:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729820802; x=1730425602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azbmPKYWqdzElTEWYEO+hcSdkrUk0KpOPE9hBOqu2hM=;
        b=ju5ljXrWaWwm8s6zceV9prwvMhm7Spwyql8w4i9/83EP4hGAuMkD4I8GHU/DxFv3jC
         SLT2T5k1jD9LcY3JCa3LiFrNxql87Kn/U0CHgxSQh5XLSdwx3vEvcVpzYEb+IppX5hUT
         ADRKD1friBI5RK2623RR9Aqfg/HzuRov6Kcg88GIW1ux43gG/O5KTjVWPF7LiMUrmVvP
         Vdyk6Ypk6DfHwGqB1JXNsiLoZUYjLs7jGC3iTa4yKGWekJLETwHRG0UGl8WAI6SopKhr
         tANnLeDHhXR2ua/KfjH0IPtu0e/+DTe3E7LZ2fV1sulesGV24ovZfiplGtLRLekIWDlq
         A3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729820802; x=1730425602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azbmPKYWqdzElTEWYEO+hcSdkrUk0KpOPE9hBOqu2hM=;
        b=UaG4tY/B7hgdPRj2UASru8veEVYXkGGYAXUBUMejcaiTvLVmr4ai1B5AHk5iAqGs2W
         yU3YD+JiuwgqA9dZ59/KgVWfF02brRpMu/itnLLKPPzqOgtRTgs2ewyPS34ne3hJK3jT
         RwaEvLd3fVYYA0N5HGAbzh+3DZTdLZHAukgfUmCd3s/6sI9IXP/AspPjEcWTb81D8qxt
         Qw7+taOhi/pu/2gc1EoQBSUYQWbmyYbMyIT811JCytfiZO/r1RkroKIsiwhGNfiPyXhk
         5AakO+YvdLAOHjcd9Q7uUVGTEtY0ij6OOIvSqLwkkiEXfTNDea4DXqJDq0DMxmNacZFH
         J6xw==
X-Forwarded-Encrypted: i=1; AJvYcCVbe2fLE3FR1li3Jv+9mYceEikKzRy8qYXQKE8YzBn60J2K9kzj9VGsXrAkIWVFUOh/R3bynHeAVXs=@vger.kernel.org, AJvYcCXGngyedGQwM0VilIxvVe5vJ0vE2RSPZw1O95MJ4RnvqFKRRvckxVMC4V+JWL9U5E4+FR6mOL8QFCaEE76J@vger.kernel.org
X-Gm-Message-State: AOJu0YyQXUboUl/QmfJOYP2ohlHQYh9EamR7VygqjZbnBD/MPEyhqnOr
	Z2tfxAQNFrWFDTTlnsQwm14hVtNoPEbdBxPhecZ04Wx6ZA3jnTco08UIKxZr0c0UiCNBHQIXGJB
	2UtUJFGMNDFZbUdtysDtJdMz9hw==
X-Google-Smtp-Source: AGHT+IF7p9fJzlSk0QEbox4mtDU389C/JLpNm7tTrZfbUz7FjaQ4SPU+FeB/PrVCHNfDK20fdxR/Bn5OLnUkx9tlW1o=
X-Received: by 2002:a17:906:c14b:b0:a9a:a32:bbe4 with SMTP id
 a640c23a62f3a-a9abf84d195mr660041366b.12.1729820802158; Thu, 24 Oct 2024
 18:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-4-kfting@nuvoton.com>
 <fh43vyo4oviet35jmihew5yew5ez3nyaqgsyntqtd7x7s5mdrv@ezpal3a4banw>
In-Reply-To: <fh43vyo4oviet35jmihew5yew5ez3nyaqgsyntqtd7x7s5mdrv@ezpal3a4banw>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 25 Oct 2024 09:46:30 +0800
Message-ID: <CACD3sJbzgnq1bKJXS59TA8MJE3o0N_bz_a9PTJdy5C0FdD8wRw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] i2c: npcm: use i2c frequency table
To: Andi Shyti <andi.shyti@kernel.org>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi:

Thank you for your comments.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:20=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> ...
>
> > -     /* 100KHz and below: */
> > -     if (bus_freq_hz <=3D I2C_MAX_STANDARD_MODE_FREQ) {
> > -             sclfrq =3D src_clk_khz / (bus_freq_khz * 4);
> > -
> > -             if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
> > -                     return -EDOM;
> > -
> > -             if (src_clk_khz >=3D 40000)
> > -                     hldt =3D 17;
> > -             else if (src_clk_khz >=3D 12500)
> > -                     hldt =3D 15;
> > -             else
> > -                     hldt =3D 7;
> > -     }
> > -
> > -     /* 400KHz: */
> > -     else if (bus_freq_hz <=3D I2C_MAX_FAST_MODE_FREQ) {
> > -             sclfrq =3D 0;
> > +     switch (bus_freq_hz) {
> > +     case I2C_MAX_STANDARD_MODE_FREQ:
> > +             smb_timing =3D smb_timing_100khz;
> > +             table_size =3D ARRAY_SIZE(smb_timing_100khz);
> > +             break;
> > +     case I2C_MAX_FAST_MODE_FREQ:
> > +             smb_timing =3D smb_timing_400khz;
> > +             table_size =3D ARRAY_SIZE(smb_timing_400khz);
> >               fast_mode =3D I2CCTL3_400K_MODE;
> > -
> > -             if (src_clk_khz < 7500)
> > -                     /* 400KHZ cannot be supported for core clock < 7.=
5MHz */
> > -                     return -EDOM;
> > -
> > -             else if (src_clk_khz >=3D 50000) {
> > -                     k1 =3D 80;
> > -                     k2 =3D 48;
> > -                     hldt =3D 12;
> > -                     dbnct =3D 7;
> > -             }
> > -
> > -             /* Master or Slave with frequency > 25MHz */
> > -             else if (src_clk_khz > 25000) {
> > -                     hldt =3D clk_coef(src_clk_khz, 300) + 7;
> > -                     k1 =3D clk_coef(src_clk_khz, 1600);
> > -                     k2 =3D clk_coef(src_clk_khz, 900);
> > -             }
> > -     }
> > -
> > -     /* 1MHz: */
> > -     else if (bus_freq_hz <=3D I2C_MAX_FAST_MODE_PLUS_FREQ) {
> > -             sclfrq =3D 0;
> > +             break;
> > +     case I2C_MAX_FAST_MODE_PLUS_FREQ:
> > +             smb_timing =3D smb_timing_1000khz;
> > +             table_size =3D ARRAY_SIZE(smb_timing_1000khz);
> >               fast_mode =3D I2CCTL3_400K_MODE;
> > -
> > -             /* 1MHZ cannot be supported for core clock < 24 MHz */
> > -             if (src_clk_khz < 24000)
> > -                     return -EDOM;
> > -
> > -             k1 =3D clk_coef(src_clk_khz, 620);
> > -             k2 =3D clk_coef(src_clk_khz, 380);
> > -
> > -             /* Core clk > 40 MHz */
> > -             if (src_clk_khz > 40000) {
> > -                     /*
> > -                      * Set HLDT:
> > -                      * SDA hold time:  (HLDT-7) * T(CLK) >=3D 120
> > -                      * HLDT =3D 120/T(CLK) + 7 =3D 120 * FREQ(CLK) + =
7
> > -                      */
> > -                     hldt =3D clk_coef(src_clk_khz, 120) + 7;
> > -             } else {
> > -                     hldt =3D 7;
> > -                     dbnct =3D 2;
> > -             }
> > +             break;
> > +     default:
> > +             return -EINVAL;
>
> There is here a slight change of behaiour which is not mentioned
> in the commit log. Before the user could set a bus_freq_hz which
> had to be <=3D I2C_MAX_..._MODE_FREQ, while now it has to be
> precisely that.
>
> Do we want to check what the user has set in the DTS?

The driver checks the bus frequency the user sets in the DTS.

Please refer to the links:
1. https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npc=
m7xx.c#L1995
2. https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npc=
m7xx.c#L2002

>
> (Or am I missing something?)
>
> Thanks,
> Andi

Thank you.

Regards,
Tyrone

