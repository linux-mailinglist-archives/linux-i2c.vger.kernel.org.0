Return-Path: <linux-i2c+bounces-12790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DE8B4A058
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 05:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5003BEE32
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 03:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E01D27602B;
	Tue,  9 Sep 2025 03:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RIqv9BFT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507AF26F2BE
	for <linux-i2c@vger.kernel.org>; Tue,  9 Sep 2025 03:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757389831; cv=none; b=QIBeM3Z+Y1fyLnnkbaVe/l446i4U/gJYryZAzVNrVonqkyNj9ppHj4nP9AUKh9stCpwWRx7eTo4ZJ812xAZ22e02GA5mcDGt4F8AZSB7m2S621Vomy28A5x5AXJ7jklkQ2JWZoOMEq6hORfnVOT6CCuW5bkK/JmsxVKzpFxhGhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757389831; c=relaxed/simple;
	bh=1xFzen0cPNxM5zXyiLBipVzRarGcyUizNL8zdN6+qmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Olp1OFaJIegwOSoc99GSCQo3rsTBVis3aOtWXgDtQcTVVMIM38X8L2bAEZHliEH7QvawUJwy0F4n8aMGFlHopI5OaSTfNK1vOjETGHjm7ojO8xrfEQsNrYNMD6VFcEy/mhZdg5kqkFPg2TrLpZuMcm5ZvCRm6+Zem/VrFF/fOzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RIqv9BFT; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-336e16f4729so40218381fa.1
        for <linux-i2c@vger.kernel.org>; Mon, 08 Sep 2025 20:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757389827; x=1757994627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eua2YAPyWNoI872YUJ3VdyRPkVf1aMyuVYL342nj/u8=;
        b=RIqv9BFTB2A79EhdhA5Bj3DFOtVU8it4eVNNks3TAwDU0u3lyKNhjXxhfdbPq9H8xy
         ES7E9qS/9oOfJky0N+dBZR/3erD81LLKxqSQbCLUkJhGwvJHNpd0LGd906JmFgeUCUl3
         mGG8+VM4ogasakxtNDQleLyopDqBmw6+ldr9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757389827; x=1757994627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eua2YAPyWNoI872YUJ3VdyRPkVf1aMyuVYL342nj/u8=;
        b=vTSOetWIXXjheZdRWrfMfDE7idmOiCSUEkFv9izgYBfBEmX/A+I6kqP2N+LNZi666W
         zY3ueyheTlatJ/sr7y1FXQg7b0u5k4a9NsGhX5xIeDlzKckN0uhabBHUjzA/9+z7QWX+
         ar4BjqfZLaYsjx+rNh/ELMsqwJn6byYZcH0NxJGU5H+BdTuGf6cbSBTsY7ezxeo0dAJJ
         zONMHxHYRdQNj5XfMG1V+hOxUQK9g1PjzenuI4cDZYhI8C1hIi4IBG7cwe9enUURk80s
         U8xZZfYyoT5alPZq7t7Vbig7P/PNEyYY/QnaxlI9lDK1gCw+KJXJjDY4gdrtze293P/S
         LfTA==
X-Forwarded-Encrypted: i=1; AJvYcCWo56+58uL5Vde0NYdWZP/Jz/53JSkZAIlEHLUpldd2AUoR01JsdYmePgwqaeziXubz0GqF/frhZAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpckOpMxRVK1+6E7OwfNggrvC10mEL67YYtGnUMzek4DkWcAST
	AQhKvC0FycC/BvJMpN99A9AB8UO1Ep2e3TdtTsSMVdbSmgetkYBxOMAj1BNRNElrEQVESCmVDiy
	cxzHK+W30wq5xobqi8JPe0X+FZa/kMArIIKd49uEF
X-Gm-Gg: ASbGncusUsgUQYkOnqmxbjFpkPJqI+LXI+g9U7H9OfavgHAq/F0LXAmbsHLccjxgRZo
	P5ieK8jJBGyRbz55zsfNkfIM1msA0CCBm5ybtYTLwVDWR7kSKriZJq8BTdLm69qjEHh/W/fNlAj
	M/bNjGIPQDgDRhHCjP/4i6Hm3/9lTVnDntgvcRBB6nYjSnasfGb1oUv6+5jn3gHIXOEwD44jJB6
	nH0C115ComDij6sPQsDH6T/pkwmzNYFP9r9D6uAlQhToJs4
X-Google-Smtp-Source: AGHT+IGj8MbtzCVC3eleE1z+3A7HLn2+wwQE3Dbn34sAVj1F0T1xg3I1Y5OtFtL3Vq/iIqiBfRs27XObu4ME5Ad0K9g=
X-Received: by 2002:a05:651c:e10:b0:335:2d39:efe8 with SMTP id
 38308e7fff4ca-33b5840d79bmr17650591fa.44.1757389827313; Mon, 08 Sep 2025
 20:50:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906082652.16864-1-leilk.liu@mediatek.com> <zddsit53dwqo27buoxaolgpzvvvd6uvwcyzughv7qfvwg64ces@yrlrur5dkf45>
In-Reply-To: <zddsit53dwqo27buoxaolgpzvvvd6uvwcyzughv7qfvwg64ces@yrlrur5dkf45>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 9 Sep 2025 11:50:15 +0800
X-Gm-Features: Ac12FXwAUz9S8d-8r_TaFcUSUGZ-l28LM65axRib-fNazk4pPZoYccYUgggaCpc
Message-ID: <CAGXv+5HZcZ8uVZQbT83QnWd1M6p7fXvKU-0gOfc794BxqOmw1g@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qii Wang <qii.wang@mediatek.com>, 
	Wolfram Sang <wsa@kernel.org>, Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 6:17=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> Hi Leilk,
>
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-m=
t65xx.c
> > index ab456c3717db..dee40704825c 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -1243,6 +1243,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *a=
dap,
> >  {
> >       int ret;
> >       int left_num =3D num;
> > +     bool write_then_read_en =3D false;
> >       struct mtk_i2c *i2c =3D i2c_get_adapdata(adap);
> >
> >       ret =3D clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> > @@ -1256,6 +1257,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *a=
dap,
> >               if (!(msgs[0].flags & I2C_M_RD) && (msgs[1].flags & I2C_M=
_RD) &&
> >                   msgs[0].addr =3D=3D msgs[1].addr) {
> >                       i2c->auto_restart =3D 0;
> > +                     write_then_read_en =3D true;
> >               }
> >       }
> >
> > @@ -1280,12 +1282,10 @@ static int mtk_i2c_transfer(struct i2c_adapter =
*adap,
> >               else
> >                       i2c->op =3D I2C_MASTER_WR;
> >
> > -             if (!i2c->auto_restart) {
> > -                     if (num > 1) {
> > -                             /* combined two messages into one transac=
tion */
> > -                             i2c->op =3D I2C_MASTER_WRRD;
> > -                             left_num--;
> > -                     }
> > +             if (write_then_read_en) {
> > +                     /* combined two messages into one transaction */
> > +                     i2c->op =3D I2C_MASTER_WRRD;
>
> i2c doesn't change for the whole loop so that it can be set only
> once outside the loop instead of setting it everytime.
>
> Something like this:
>
>         if (i2c->op =3D=3D I2C_MASTER_WRRD)
>                 left_num--;
>         else if (msgs->flags & I2C_M_RD)
>                 ...
>         else
>
> looks cleaner to me and we save the extra flag. Am I missing
> anything?

It looks correct to me, though I think it requires a comment explaining
that "in the WRRD case there are only two messages that get processed
together, and the while loop doesn't actually iterate", and reference
the block where the WRRD op is set.

Otherwise someone is going to look at this snippet and think there's
some corner case where all messages (# of messages > 2) get handled
using the WRRD op.

So maybe it looks cleaner, but it requires more context to understand.
Whereas in the original patch, the extra variable sort of gives that
context. In this case I prefer the context being more visible, since
the original corner case this issue fixes is also from missing context
and assumptions.


ChenYu

> Andi
>
> > +                     left_num--;
> >               }
> >
> >               /* always use DMA mode. */
> > @@ -1293,7 +1293,10 @@ static int mtk_i2c_transfer(struct i2c_adapter *=
adap,
> >               if (ret < 0)
> >                       goto err_exit;
> >
> > -             msgs++;
> > +             if (i2c->op =3D=3D I2C_MASTER_WRRD)
> > +                     msgs +=3D 2;
> > +             else
> > +                     msgs++;
> >       }
> >       /* the return value is number of executed messages */
> >       ret =3D num;
> > --
> > 2.46.0
> >

