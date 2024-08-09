Return-Path: <linux-i2c+bounces-5242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6E194CB11
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 09:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6B0FB23DDF
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 07:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CB316C878;
	Fri,  9 Aug 2024 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZZ7thxm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D005833D1;
	Fri,  9 Aug 2024 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723187842; cv=none; b=hwBcFiDDqfCQPfoc1gpl/Vs/hl2hNP0JhhD4l9Rr+US1P+dzC9ao3LjgrtWY4XAMy7wrRnsTZ5Hbc+Bd39HgveCyalJpefqxUI7y/ZyksBkm0c7NpgTKQsLpLuVG4y9ZP4nF4M6+tfwW0O8Tdyq8UHJor5IqwwcekGfACv9TSN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723187842; c=relaxed/simple;
	bh=pzrnD9OL5vORF2vjCCE4OsxXJs1WaOxOk6OwUjJgrJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtrQA19XMaPbNeZCxV4qAXplIyASQgjwZQIJTvngRW9nhigNHW9Ql82vaBV6NatggMaWIck6j9fMZlNXcjHlc0/ZQcvtWsvg7w+t3TyQvFQ+8kUv1vSFcGDr65zDGa/BHLb9DP745IKcVIZIh9Xk6a/bZ/M03NE2U5BWJJpLxWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZZ7thxm; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5b5b67d0024so1990114a12.0;
        Fri, 09 Aug 2024 00:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723187839; x=1723792639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpODigRY1HFvjnaXk96bH9eqAyHzDGOWTbmy+vqO+EI=;
        b=gZZ7thxmtYoGXlNf8619p8XS6B+fkTZA0NNwaCAVH9UAeR131W4fk2iECXj3JaxD3N
         vPAx0FOH8Do1fMJiSK2cLQshz0o4vXD8wwNi1KVxudqCOtKxbB4kFI0faM2eh+H1/i6A
         1VlUhMsHu2cUw7tfzNiySCKQaF9TyyhBENz3V8kZ8zBG9Qf/gHV7WY3cEFpg+S0L5lB1
         4bcl0A90BDukLW0HvDzf7sj+Z1dLhAc6nxU7qtY9a0y2iAp/Mx84xEMAf1pgqnQ2JBUa
         v2N2QANWlTw2NVophNaVJkX/bExSMSkOWaLd7cn2BKB+LjXxzgk8Bb9YtwK4+oIqiO5S
         /tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723187839; x=1723792639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpODigRY1HFvjnaXk96bH9eqAyHzDGOWTbmy+vqO+EI=;
        b=u1x3oAIotQArk5h5g490dDnVi/Y2zo9AkGPj1Ft04+VYIIy2PPOKBHDH753rwDxcgj
         t5nJBFSrXzZRXvACY4/aeA9d3Ju3Zzl9EriBNidtgSqUy2aRy1toSV/lgB4OB+f9o0+U
         sDPJ/X8HQ36K6qJniuWshkXNtgk9lUuNLsb+951TDDOiCfTKKTSI2eaLggJFgboB0Wow
         F93wBNmv21l80eHzaz3MB2ByPEeUbyFm/GN5y8UlGh/b2VDizz7MvSeWbnagE6L9N8qf
         DSQ1pZxKJiiZ6WG+cWoW7VFqyZNhAbty0RM9fOx4Z5sa6yXnFT7wzXS1sdXNYrViXkb6
         88jg==
X-Forwarded-Encrypted: i=1; AJvYcCXItmgEjOxurf096LPUe58VLK0xyqY76/kdvdRwqrOZRaFz6ifUr6z+LSTzgACkGz3xdOn8lnpqSANuk/LssIFHyJyZk32BYpyfkS6azwdam6bf6IpdZZWwIyU8flDuA5K9PIt001yh
X-Gm-Message-State: AOJu0YwruKPr4r3QQKQDeqcjyW6e4ywH5pkS8+b7aWKA4mCD96kFJBFt
	USgvap/Y8qgKiYkf2fRKaFVYlau54A316w2iTdniN/FWDWXWhOYL1e8UExAf1hdkt2YvnFHnHSY
	lbAX5Idajp4AUmakPRo2dYjgHWg==
X-Google-Smtp-Source: AGHT+IEzTI5d1jLwL4XO4ItIER/rGUNRj6ZhGxovMIQSRGAbuFN/TJjDR3qUkESHPc9yly+OhVRJdzcGDJzeQylhoN4=
X-Received: by 2002:a17:907:6d15:b0:a7a:9ba8:f890 with SMTP id
 a640c23a62f3a-a80aa54aba5mr44627466b.13.1723187838777; Fri, 09 Aug 2024
 00:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807100244.16872-1-kfting@nuvoton.com> <20240807100244.16872-8-kfting@nuvoton.com>
 <b54d11728eebb5307c1bf8ce290764bb001c725e.camel@codeconstruct.com.au>
In-Reply-To: <b54d11728eebb5307c1bf8ce290764bb001c725e.camel@codeconstruct.com.au>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 9 Aug 2024 15:17:07 +0800
Message-ID: <CACD3sJbnnH+j0tKYE4BfwTfY5dvMurg9jdZLY+x4W80t_oW9tw@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] i2c: npcm: fix checkpatch
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, rand.sec96@gmail.com, 
	kwliu@nuvoton.com, jjliu0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew:

Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2024=E5=B9=B48=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:50=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Hello,
>
> On Wed, 2024-08-07 at 18:02 +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Fix checkpatch warning.
> >
> > Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_=
slave")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 1af6a927b9c1..dbe652d628ee 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -1783,7 +1783,7 @@ static int npcm_i2c_int_master_handler(struct npc=
m_i2c *bus)
> >               /* reenable slave if it was enabled */
> >               if (bus->slave)
> >                       iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR=
_SAEN,
> > -                             bus->reg + NPCM_I2CADDR1);
> > +                              bus->reg + NPCM_I2CADDR1);
> >  #endif
> >               return 0;
> >       }
>
> Fixing checkpatch warnings means you need to modify the commit that
> checkpatch identified as having problems, not just add a fix-up patch
> on top.
>
> It looks like this change should be squashed into the patch before it.

Got it, thank you for your comments.

>
> Andrew
>

Regards,
Tyrone

