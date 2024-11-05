Return-Path: <linux-i2c+bounces-7771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA09BC2CA
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 02:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3FB42822F5
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 01:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227D425765;
	Tue,  5 Nov 2024 01:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpZqUsAd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EEF11CA9;
	Tue,  5 Nov 2024 01:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730771619; cv=none; b=eMy+KebVXUaowympR2KHn88fyXEbUUAUbyZMnKL8G3QhK1BJjVcQrRAYUNyDF7T8A+wtZMNIrDNl2aYqfvCBRGbzoOOmbJ9rAX9vxlvXITa0B9sNU4PrwPpWVJDCz0TFjTan+eNPKwhtDLR6kV2mpYmQ/fyvhwrdKIP+kLcSq78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730771619; c=relaxed/simple;
	bh=JAa88vdCg/GICjVUJVccuSosxdKMxTy6/z6bOx13SyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKSoR3Dk0MeBTrJEN91INdo7x4dHkMeovwDMOGaEUipIkpbH4X49vmpIag5VNC3qcPIOXpVLfsaCLfCLp/WSLM6n7W9AzJJNA1+NtSOzRUkwnoMas2Vopa2gREAP7koo8446vp3y1gnr/BXK3Qh9FI6K2cHlB7H1EeCSE/XJ0Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpZqUsAd; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so4421368f8f.3;
        Mon, 04 Nov 2024 17:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730771616; x=1731376416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AQtxq6f75GUqEq+zy/3pKDKuLzqPnWncabb+BsPt9A=;
        b=mpZqUsAdM1I8w6ECfQEDTFccJ1YXeasM7sKyxN3zpAqnurZGtz1fDz8AvDURMPW9AV
         HcHThuJLRcs1UOaXdRFkxiNHEIvPs/ElX9nLfftZP8m/0l75qPxs+xYwgxW6TC1C6w9E
         6Ozoynm0h9WUPKw409uXGI3I416Z7CPu2pYr8BV4aUzj7hXiAYTgjfmvfu39JEoKGfua
         xh4YycdQ9Tlr+QuFzzbi9TQ5W7rPmnAvwBZHGtFbJHNmLN3mDXYHL27OBiHuzavssu5v
         k5lpzUuR251TLMzQZxNmovhPmJoROEKE4Rm+FiDla9CvVkaLNilJxvIlhk7olumTPNXY
         4lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730771616; x=1731376416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AQtxq6f75GUqEq+zy/3pKDKuLzqPnWncabb+BsPt9A=;
        b=LvADvLTW0aBbvSWxGbeXiD6cHebo/JqxjXA4NUF57tUpfVA/WoGQFlyjnhc+kjaqdq
         4kzGg7wdv+SYOd13+vCGAM/sVnAi0EBLdOc3BA8uvUBYbaMUgLWXAMo4I4sg06o8K9tI
         c6izaVefbMgc7HpQQzXsjQyitrh3ry675WxnsoOAJvdeeCYUyUSQ1cHVGkvvsJyV6Hbi
         CI/GxSpweWdWo3HAkFEgddHx+tEr+3IXB4fGFQy24Q62haT30McTqPbbzHgnOE81nUZ5
         k8RZnmKvif7F+894E0A004wTfPg1cxYrBpfAASr/ZSft40ek0l+QzABXGvYSHWNKKiRs
         aSbA==
X-Forwarded-Encrypted: i=1; AJvYcCWX0hjI55c1RW11AM7H63b+zAnSxLgPkbfJXJKlPoE0BdPX3HeTCHIj7HhpFReEWGfzIWl2qbbdReyDZJe6@vger.kernel.org, AJvYcCXtClmBUWKTgmr7ViVWPftEbPiV5WuALFLRF+/eUYUysjN3MKFwRXgC2AygyuG6GbRvmNjYkXQkMTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBJLNLyw+HbZ/NraCVdixp3azrIDphhmUSSC8UGbG/gAY+lWYd
	bj1SSJx1/ETvjwVPmKgLfebpfbUQdb9W/0ShfyLW9GR3BcrjB/9Sucnuq6ib3ww39XQVH0dSPbl
	A6mfx0lIgVaZlKF+IhOjcS6+Stw==
X-Google-Smtp-Source: AGHT+IGer+CZ/zgHN7qPF9OVKsUT5REaHpHEPg8J5zVAO0P8xH9Ol2oHigHMK2EfJa51wILlxPK4hzqEgrtyilbiw4Y=
X-Received: by 2002:a05:6000:1fad:b0:37d:5130:b380 with SMTP id
 ffacd0b85a97d-381c7a5e114mr16646830f8f.23.1730771616192; Mon, 04 Nov 2024
 17:53:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-4-kfting@nuvoton.com>
 <fh43vyo4oviet35jmihew5yew5ez3nyaqgsyntqtd7x7s5mdrv@ezpal3a4banw> <CACD3sJbzgnq1bKJXS59TA8MJE3o0N_bz_a9PTJdy5C0FdD8wRw@mail.gmail.com>
In-Reply-To: <CACD3sJbzgnq1bKJXS59TA8MJE3o0N_bz_a9PTJdy5C0FdD8wRw@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 5 Nov 2024 09:53:24 +0800
Message-ID: <CACD3sJYU2gDbeGyhtqnu2Rjbfny9zE3Cfbhii34uKB=iG=EwuQ@mail.gmail.com>
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

May I have your comments about my feedback on these patches?

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=8825=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andi:
>
> Thank you for your comments.
>
> Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:20=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > Hi Tyrone,
> >
> > ...
> >
> > > -     /* 100KHz and below: */
> > > -     if (bus_freq_hz <=3D I2C_MAX_STANDARD_MODE_FREQ) {
> > > -             sclfrq =3D src_clk_khz / (bus_freq_khz * 4);
> > > -
> > > -             if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
> > > -                     return -EDOM;
> > > -
> > > -             if (src_clk_khz >=3D 40000)
> > > -                     hldt =3D 17;
> > > -             else if (src_clk_khz >=3D 12500)
> > > -                     hldt =3D 15;
> > > -             else
> > > -                     hldt =3D 7;
> > > -     }
> > > -
> > > -     /* 400KHz: */
> > > -     else if (bus_freq_hz <=3D I2C_MAX_FAST_MODE_FREQ) {
> > > -             sclfrq =3D 0;
> > > +     switch (bus_freq_hz) {
> > > +     case I2C_MAX_STANDARD_MODE_FREQ:
> > > +             smb_timing =3D smb_timing_100khz;
> > > +             table_size =3D ARRAY_SIZE(smb_timing_100khz);
> > > +             break;
> > > +     case I2C_MAX_FAST_MODE_FREQ:
> > > +             smb_timing =3D smb_timing_400khz;
> > > +             table_size =3D ARRAY_SIZE(smb_timing_400khz);
> > >               fast_mode =3D I2CCTL3_400K_MODE;
> > > -
> > > -             if (src_clk_khz < 7500)
> > > -                     /* 400KHZ cannot be supported for core clock < =
7.5MHz */
> > > -                     return -EDOM;
> > > -
> > > -             else if (src_clk_khz >=3D 50000) {
> > > -                     k1 =3D 80;
> > > -                     k2 =3D 48;
> > > -                     hldt =3D 12;
> > > -                     dbnct =3D 7;
> > > -             }
> > > -
> > > -             /* Master or Slave with frequency > 25MHz */
> > > -             else if (src_clk_khz > 25000) {
> > > -                     hldt =3D clk_coef(src_clk_khz, 300) + 7;
> > > -                     k1 =3D clk_coef(src_clk_khz, 1600);
> > > -                     k2 =3D clk_coef(src_clk_khz, 900);
> > > -             }
> > > -     }
> > > -
> > > -     /* 1MHz: */
> > > -     else if (bus_freq_hz <=3D I2C_MAX_FAST_MODE_PLUS_FREQ) {
> > > -             sclfrq =3D 0;
> > > +             break;
> > > +     case I2C_MAX_FAST_MODE_PLUS_FREQ:
> > > +             smb_timing =3D smb_timing_1000khz;
> > > +             table_size =3D ARRAY_SIZE(smb_timing_1000khz);
> > >               fast_mode =3D I2CCTL3_400K_MODE;
> > > -
> > > -             /* 1MHZ cannot be supported for core clock < 24 MHz */
> > > -             if (src_clk_khz < 24000)
> > > -                     return -EDOM;
> > > -
> > > -             k1 =3D clk_coef(src_clk_khz, 620);
> > > -             k2 =3D clk_coef(src_clk_khz, 380);
> > > -
> > > -             /* Core clk > 40 MHz */
> > > -             if (src_clk_khz > 40000) {
> > > -                     /*
> > > -                      * Set HLDT:
> > > -                      * SDA hold time:  (HLDT-7) * T(CLK) >=3D 120
> > > -                      * HLDT =3D 120/T(CLK) + 7 =3D 120 * FREQ(CLK) =
+ 7
> > > -                      */
> > > -                     hldt =3D clk_coef(src_clk_khz, 120) + 7;
> > > -             } else {
> > > -                     hldt =3D 7;
> > > -                     dbnct =3D 2;
> > > -             }
> > > +             break;
> > > +     default:
> > > +             return -EINVAL;
> >
> > There is here a slight change of behaiour which is not mentioned
> > in the commit log. Before the user could set a bus_freq_hz which
> > had to be <=3D I2C_MAX_..._MODE_FREQ, while now it has to be
> > precisely that.
> >
> > Do we want to check what the user has set in the DTS?
>
> The driver checks the bus frequency the user sets in the DTS.
>
> Please refer to the links:
> 1. https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-n=
pcm7xx.c#L1995
> 2. https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-n=
pcm7xx.c#L2002
>
> >
> > (Or am I missing something?)
> >
> > Thanks,
> > Andi
>
> Thank you.
>
> Regards,
> Tyrone

Thank you.

Regards,
Tyrone

