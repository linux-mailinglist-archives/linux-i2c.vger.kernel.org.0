Return-Path: <linux-i2c+bounces-8115-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 054BE9D4A82
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 11:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA476282D0C
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 10:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BF11C3026;
	Thu, 21 Nov 2024 10:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/IcJIzm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759A25FEED;
	Thu, 21 Nov 2024 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732183882; cv=none; b=bvnNmN0lBqsai7hqwos1VfRrN3WHFHyF9Zszf87T2Ooj0QR9yN4uQ+i2koTAEhKsiHweknN5W6h2QiwqVa99iIpJYV+dBappUASyujcdRw9j+2+C+8wVdRl5x5hAH5RqNr12Djj0IybNYY85O6pq4cfjmv/LqDu2hKRwT7ywOaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732183882; c=relaxed/simple;
	bh=S8XCUZdZIsQmCweh/Xof+QyHgkUG5L7UiamSVUGRZYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdsUwo+uwZ6qPDM9vyTtTpSqNmc+ikJ7oy5XJ0tTtkOTCAKQ0U4U10uGG8qr80dKLIj6lstqK8ZRRU6pYf6AU8DSxy2oBfwIDXW/GXKiJnw2Z4Ml4UYT9EpS9XN85K6H3KamK5KiHuc/zblTvH2vq8wJi6TnkialOCqQxqfSVds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/IcJIzm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cfcb7183deso3264108a12.0;
        Thu, 21 Nov 2024 02:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732183879; x=1732788679; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=orZm2h7WMcvgWW0S6Q6soEEfio1OXIAtBvmEIOIWSRs=;
        b=k/IcJIzm6Iuu99vjJdHLGdPxL1qSmIuhtjU/fI3WMNPpXZCMk1YF61hC625Flmc2B7
         6BV2vO6iEF/7NmPT6OGYm38h6wSR2CtyvlQirFH+sW28tWO68pHjNs17Va6cbQloSvN7
         lAjSxCYy5973MgtpXkHtyV4tgjbIqxsHcI6gcUym4GdXhsTbYr8iQseZRsSsI3RQC6rj
         BB3+WLxSVmlTqTuk69q38xwmTI4a4JZAzroYt8mmilUscLxOekf8vDKNjDpGKD4L6hVv
         MWXvIPFXJZ2PWDjRNsXhqapy9pRPW/NALvr9iKWc/ThUFo9FUOPgKUvD3opWtMqXYI2j
         ijfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732183879; x=1732788679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orZm2h7WMcvgWW0S6Q6soEEfio1OXIAtBvmEIOIWSRs=;
        b=BenIkVadqrZXrHg+e7xb+bhu6aMdkwyRuz326O41AK0AOnpq8n1mwgiTCeneFc6jMF
         IUOTkRa0ejyXOlvYktqPottrP0UM1Rove5nTMZFF3W7RPJv0/L5cQk4GQK5VPqObC395
         UF+EYbySxglYObSKm59/kR4Qd8xGZnwoZBuUTg64QJtiucyHJgKdPZfQp55ABha/b/O3
         f5wD06eSastgctlrkosOh4OwoJ+dOILRlxpYF0wO9DomIrgubMtC75CsViGahL4gAnqV
         oFGyzuHlwZCQyiF0f7hAklIjkZNp8t6PLRdlvgC/wS29phhvqk+Q57XGN5Gf3QOyWAjL
         HXZA==
X-Forwarded-Encrypted: i=1; AJvYcCU09PMQ096X0L+3gNhnYQUJi8VgwM+34vdPZuGQ1JZq71xExK/Uct5NubwMHbEKN71CzFRYGwZSFww=@vger.kernel.org, AJvYcCVn018ExE7nAUWQ7pAPOp9aNoI3btrW6pMaKPYeyK/s3FXzcYFZfbHPYogz+U6L0kElwPnRnWYGqbzt5/y4@vger.kernel.org
X-Gm-Message-State: AOJu0YzzMaSSJmruXujG8JxpoYEq5+Ejc4+2RRyKFnoKCz/lVch2PwRi
	xiuCSzEkZWjYcVTTQZwRDXz0D0nlzCgHKXmUbg2EhxGlWFKpi2k7TjE6NLUagijsuuQrv2j76yT
	LJXOB1fWALvK/EVNMnUxFzR9jrOU=
X-Google-Smtp-Source: AGHT+IFo9Si2frH4eDj3XQI3Tzc2md+3KkMtVOhZp4DS+rJqFhD9bAjtxNSdW+oDIlSQJEvSuo3Mel4KJuzeuyxVF5U=
X-Received: by 2002:a17:907:7208:b0:a9e:b5d0:4714 with SMTP id
 a640c23a62f3a-aa4efd9b8a6mr243895866b.21.1732183878598; Thu, 21 Nov 2024
 02:11:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-4-kfting@nuvoton.com>
 <fh43vyo4oviet35jmihew5yew5ez3nyaqgsyntqtd7x7s5mdrv@ezpal3a4banw>
 <CACD3sJbzgnq1bKJXS59TA8MJE3o0N_bz_a9PTJdy5C0FdD8wRw@mail.gmail.com> <bad4bd66cuiva4foudw4iv3aqr4475coo3fll357bh4k5xxqpv@n4iqvh5odsjc>
In-Reply-To: <bad4bd66cuiva4foudw4iv3aqr4475coo3fll357bh4k5xxqpv@n4iqvh5odsjc>
From: Tali Perry <tali.perry1@gmail.com>
Date: Thu, 21 Nov 2024 12:11:06 +0200
Message-ID: <CAHb3i=uT+Zx8m4hAF1M2yjCn=a5sDBn2wJajWdCm79syuy97Ag@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] i2c: npcm: use i2c frequency table
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com, tmaimon77@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andi,

>
> > > > -     /* 100KHz and below: */
> > > > -     if (bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
> > > > -             sclfrq = src_clk_khz / (bus_freq_khz * 4);
> > > > -
> > > > -             if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
> > > > -                     return -EDOM;
> > > > -
> > > > -             if (src_clk_khz >= 40000)
> > > > -                     hldt = 17;
> > > > -             else if (src_clk_khz >= 12500)
> > > > -                     hldt = 15;
> > > > -             else
> > > > -                     hldt = 7;
> > > > -     }
> > > > -
> > > > -     /* 400KHz: */
> > > > -     else if (bus_freq_hz <= I2C_MAX_FAST_MODE_FREQ) {
> > > > -             sclfrq = 0;
> > > > +     switch (bus_freq_hz) {
> > > > +     case I2C_MAX_STANDARD_MODE_FREQ:
> > > > +             smb_timing = smb_timing_100khz;
> > > > +             table_size = ARRAY_SIZE(smb_timing_100khz);
> > > > +             break;
> > > > +     case I2C_MAX_FAST_MODE_FREQ:
> > > > +             smb_timing = smb_timing_400khz;
> > > > +             table_size = ARRAY_SIZE(smb_timing_400khz);
> > > >               fast_mode = I2CCTL3_400K_MODE;
> > > > -
> > > > -             if (src_clk_khz < 7500)
> > > > -                     /* 400KHZ cannot be supported for core clock < 7.5MHz */
> > > > -                     return -EDOM;
> > > > -
> > > > -             else if (src_clk_khz >= 50000) {
> > > > -                     k1 = 80;
> > > > -                     k2 = 48;
> > > > -                     hldt = 12;
> > > > -                     dbnct = 7;
> > > > -             }
> > > > -
> > > > -             /* Master or Slave with frequency > 25MHz */
> > > > -             else if (src_clk_khz > 25000) {
> > > > -                     hldt = clk_coef(src_clk_khz, 300) + 7;
> > > > -                     k1 = clk_coef(src_clk_khz, 1600);
> > > > -                     k2 = clk_coef(src_clk_khz, 900);
> > > > -             }
> > > > -     }
> > > > -
> > > > -     /* 1MHz: */
> > > > -     else if (bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
> > > > -             sclfrq = 0;
> > > > +             break;
> > > > +     case I2C_MAX_FAST_MODE_PLUS_FREQ:
> > > > +             smb_timing = smb_timing_1000khz;
> > > > +             table_size = ARRAY_SIZE(smb_timing_1000khz);
> > > >               fast_mode = I2CCTL3_400K_MODE;
> > > > -
> > > > -             /* 1MHZ cannot be supported for core clock < 24 MHz */
> > > > -             if (src_clk_khz < 24000)
> > > > -                     return -EDOM;
> > > > -
> > > > -             k1 = clk_coef(src_clk_khz, 620);
> > > > -             k2 = clk_coef(src_clk_khz, 380);
> > > > -
> > > > -             /* Core clk > 40 MHz */
> > > > -             if (src_clk_khz > 40000) {
> > > > -                     /*
> > > > -                      * Set HLDT:
> > > > -                      * SDA hold time:  (HLDT-7) * T(CLK) >= 120
> > > > -                      * HLDT = 120/T(CLK) + 7 = 120 * FREQ(CLK) + 7
> > > > -                      */
> > > > -                     hldt = clk_coef(src_clk_khz, 120) + 7;
> > > > -             } else {
> > > > -                     hldt = 7;
> > > > -                     dbnct = 2;
> > > > -             }
> > > > +             break;
> > > > +     default:
> > > > +             return -EINVAL;
> > >
> > > There is here a slight change of behaiour which is not mentioned
> > > in the commit log. Before the user could set a bus_freq_hz which
> > > had to be <= I2C_MAX_..._MODE_FREQ, while now it has to be
> > > precisely that.
> > >
> > > Do we want to check what the user has set in the DTS?
> >
> > The driver checks the bus frequency the user sets in the DTS.
>
> yes, but before it was checking the value within a range, while
> now it's checking the exact value.
>
> The difference is that now if you don't set the exact value you
> get EINVAL, not before.
>
> Andi

Previously the driver was rounding numbers down.
The driver has settings for 100, 400, 1000 KHz.
but what happens if the user asks for 200KHz?
Some of the coefficients were calculated according to the equations,
and some were hard-coded values per setting.
We don't want to support this mix.
We prefer the users to ask for numbers that are one of the three
supported values and block unknown input values.

Thanks ,
Tali

