Return-Path: <linux-i2c+bounces-6758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 485689799D2
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 03:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F18A282A69
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 01:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BCDDDD9;
	Mon, 16 Sep 2024 01:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI3Mgl9t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C282DDA0;
	Mon, 16 Sep 2024 01:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726450800; cv=none; b=t+y7OcMPFzbgoCly1WaNthORxmS7BRyAHmqdKrQtG8XMwckFh20gRzDrjkEYx03DP0stVZ8BtH+Zp7aYFjHZW9baQQyjMsl5ztKNPIp9EO7kYEWW6xRgEQnkjGN9MIcWGsL6z1JBqpvreDV0WmdFtgEsgqP60/6oFcNwB07sS3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726450800; c=relaxed/simple;
	bh=R+sOr6rTs+SUgajdCN8Fys+s/TbgJExaG4eZ/WDlPuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTfdP1nT4I/3CA78ubibgtgEwMYZ2rnCCnfTfgP6gccLey8621p9rIGYj++vE+Fs+F77AeCKKD8FfPglob+EkGILMR8pNiz835ck3sJZ3krXs74N25zRmgi0dH4bAgQ4yrf7WY6mvapJA/pey5Zzk2XnhidxTNJDunhWVNyIlJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI3Mgl9t; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d100e9ce0so483164866b.2;
        Sun, 15 Sep 2024 18:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726450797; x=1727055597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLNskjMwpu/ATcCtySS+dITa6mUnk8ZJT8hndfBc9/A=;
        b=OI3Mgl9tbyJ2SykWh/OKXUfPq1uqoRv1DEt3ihcg5IGADbG0XWsjD4JClANor3p+0g
         1X4u7xCN0CIs/Xo/a7lZgWUPW+F2DzMd4vIk5ohFoL5FKAnX4meVwJdR5J+95sjGNgFO
         4l7RjhGcGiPJ9oZsO53XpVmsg2SrSiCF1fGag+HKHt7snoXOGr1hOF2316+SR5U/XRlp
         S0zIvh6UdlPiOlifFZvpVVIJQ1o9XYO0l+uAjdskYNIZOsYUUjNpFwZeP7cXbqyZSmOi
         xkcAcbRmd20uU7qa9HWd57pj/aqAunXs5dcZcbhtRXZ6iStJhN+NCazKYwtLBdSgUPlG
         V0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726450797; x=1727055597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLNskjMwpu/ATcCtySS+dITa6mUnk8ZJT8hndfBc9/A=;
        b=uyxLTVQZSjDgF+s6J4qEKpsPwXdLpEKwleKLyGcdIrWXKpKxBBEQatDgxNh0N5nOD7
         5964E51oNCVsHqRjskNVgj3KlL7ljuGQQ8rJ09Jxh5d0ivVFgysS7H2oY/IM/lmPHT36
         lCUSlpQFhRBlJktgLFomKGNDcQ22FduS3HHeYipvGUv2pKOQ8EeZ0jikAHByfjU5Bs0w
         6ctrGSuFe9fYLzR0rqKZ5U/tTa7BmaFRTDckoSKCtz+DBBz0S+VNdHoL2jjefxg0qLpe
         OF13V5ohzmbIdcVszmFEgWdKIjbS0n9mdJGeLVZbOYQZWwWfroyARCP8t0OZEbVrfMZ4
         +BDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5+gFQZln7zFTYuio4COlpkzTch8e1vp/Omnsjghim3NabghroeB4TiNNVont86M/we7Wmiac+sU4=@vger.kernel.org, AJvYcCXMd4oSaeNn0uBUx5bvcdLTJupFPtaMT/G23Jyu8n/V1yTkM5FRe2MB4Pzrq+0/LQrZMyWlIOU4wqn//UCF@vger.kernel.org
X-Gm-Message-State: AOJu0YyBrdsX/4iWuHynkna0StH3QQf9KJTv44HuzAH6je4FwrP1Hh0C
	bQ20YeFLcRT+xYAkfLBTWIetmo9QFdcZpikqksMHrSYnCqocPM55xj2wP1v3mv2RoB3cO0h+XW5
	Asu9vmvguFV5NZ8HAW9Q0AgJEZA==
X-Google-Smtp-Source: AGHT+IGP396YoxKMeuFdHaGR6hHKLwvsNnGLHkZuU+t/t9No92oGlJWDOM3jIUM0utCqdVA7eHiM9iRsmvytrTQmVYE=
X-Received: by 2002:a17:907:c7c4:b0:a7a:adac:57d5 with SMTP id
 a640c23a62f3a-a9029476004mr1376694166b.18.1726450796510; Sun, 15 Sep 2024
 18:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913101445.16513-1-kfting@nuvoton.com> <20240913101445.16513-6-kfting@nuvoton.com>
 <ZuQWYabomv_xyYyj@smile.fi.intel.com>
In-Reply-To: <ZuQWYabomv_xyYyj@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 16 Sep 2024 09:39:45 +0800
Message-ID: <CACD3sJbzMGQYchr_cW+caMcLqsmTB19ya3E_Wf=s2D6Y8QRqGg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] i2c: npcm: use i2c frequency table
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Your comments will be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:39=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Fri, Sep 13, 2024 at 06:14:45PM +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Modify i2c frequency from table parameters
> > for NPCM i2c modules.
> >
> > Supported frequencies are:
> >
> > 1. 100KHz
> > 2. 400KHz
> > 3. 1MHz
> >
> > The original equations were tested on a variety of chips and base clock=
s.
> > Since we added devices that use higher frequencies of the module we
> > saw that there is a mismatch between the equation and the actual
> > results on the bus itself, measured on scope.
> >
> > Meanwhile, the equations were not accurate to begin with.
> > They are an approximation of the ideal value. The ideal value is
> > calculated per frequency of the core module.
> >
> > So instead of using the equations we did an optimization per module
> > frequency, verified on a device.
> >
> > Most of the work was focused on the rise time of the SCL and SDA,
> > which depends on external load of the bus and PU.
> >
> > Different PCB designs, or specifically to this case: the number
> > and type of targets on the bus, impact the required values for
> > the timing registers.
> >
> > Users can recalculate the numbers for each bus and get an even better
> > optimization, but our users chose not to.
> >
> > We manually picked values per frequency that match the entire valid
> > range of targets (from 1 to max number). Then we check against the
> > AMR described in SMB spec and make sure that none of the values
> > is exceeding.
> >
> > This process was led by the chip architect and included a lot of testin=
g.
>
> ...
>
> > +     {.core_clk =3D 100000000, .hldt =3D 0x2A, .dbcnt =3D 0x4, .sclfrq=
 =3D 0xFB, .scllt =3D 0x0,
> > +     .sclht  =3D 0x0, .fast_mode =3D false },
>
> It seems you have no leading space, while having trailing one. Also the s=
plit
> seems a bit illogical to me, I would rather do like
>
>         {
>                 .core_clk =3D 100000000, .hldt =3D 0x2A, .dbcnt =3D 0x4,
>                 .sclfrq =3D 0xFB, .scllt =3D 0x0, .sclht  =3D 0x0,
>                 .fast_mode =3D false,
>         },
>
> Yes, this takes more lines, but also more flexible to the updates in the
> future. Also mind the trailing comma at the last member assignment.
>
> ...
>
> > +     for (scl_table_cnt =3D 0 ; scl_table_cnt < table_size ; scl_table=
_cnt++)
>
> Extra spaces...
>
> > +             if (bus->apb_clk >=3D smb_timing[scl_table_cnt].core_clk)
> > +                     break;
>
> ...
>
> >       /* bits [8:7] are in I2CCTL3 reg */
> > -     iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (sclfrq >> 7) =
& 0x3),
> > +     iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[sc=
l_table_cnt].sclfrq >> 7)
> > +              & 0x3),
> >                bus->reg + NPCM_I2CCTL3);
>
> This has broken (illogical) indentation. Consider
>
>         iowrite8(FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt]=
.sclfrq >> 7) & 0x3) |
>                  fast_mode,
>                  bus->reg + NPCM_I2CCTL3);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone

