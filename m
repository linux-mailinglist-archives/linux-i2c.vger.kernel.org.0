Return-Path: <linux-i2c+bounces-4655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3592829C
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 09:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F3ED1F24AD9
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 07:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BD4144D34;
	Fri,  5 Jul 2024 07:20:04 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2977139D1B;
	Fri,  5 Jul 2024 07:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720164004; cv=none; b=LGowiwmzHuF8lQopT/Wrzlt/2WvILdSaGY5f/xr63Xzm/c/US1i35avnJcBws1DRFe57uQlR4myXNnfTZUy2x2Wv7s5roKojX0zsjUPEiUiF3+RzGDM3MKr8p5cILgizJVOQkfEIYt8pHPUpLsb9gOO75VWpGJpP0Kp3OwjKET0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720164004; c=relaxed/simple;
	bh=hrYys/hSWnTYJsfYNVQHw8oZRpFWHaSeNxp6S+CTrwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfSI+6x0gT06K8gavYGtdjZVUVOOSGiKk2EsAlypZUNas/0GRzYKBXCDGwSpmZS45hteL4/WBIsJaLKrH5ORLx+V9D+dXtfEKyJxzw/Lp6ahd5ezU+hWv0Akfh5HPE1YFy/94CBnQb+xfcTAvTJxbvsmwkkWWMt7u7kvxqLmgqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfef5980a69so1355209276.3;
        Fri, 05 Jul 2024 00:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720164000; x=1720768800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQlRvdEIl3wW/T9tWerBdCapYf+E5WFW4Sl9gBRQc3I=;
        b=KZvg8wCaXk4yDecd3ULRgiTgPhrQeuCM+JYP0BKEN8AuBM2SAg4lXFI7vZI+FGOnMa
         1mfUG9GpjmTLtXmmgTxDn/Wzv0P6qRLTtg0U9/JtCmlgxmFxrAx1q9VXiDHdgnqsZbD5
         rI2SCHX1CMdx+6/T8i1GzGBhswMkf1jlwa9r/8gUD57Lz98y4HgC2TyGSzdwMR0whI0N
         4oAEDJHyJgESpPcXRw6oi461ZlXl1TwH7JcnNtsmP71bQxN54ycjTP+Bygp8TS4AIpSe
         e9pR54I8k3Tjf9IeVDF7hZtU7FUTaFX6raJForsII9ETIcIHk7YyiDspb/HrAUifAw58
         TYOw==
X-Forwarded-Encrypted: i=1; AJvYcCVa6uKtLPUtsYzNfGWSR5ezmMcwXlcsUveMARmRetvJbMdPzNNOKAC6AbvFQGpy1is8vYLFZYz6S39uSQG56VD65tTMg20c7uKXVPqtbkWZuQUF808UqOgTvXh+vb9LxO+iLyRvTZfSDGSE7AvopMRz5GV+CkxLCBIc3uYOLW5cKyIS57874zGFZudaX+gDqUr5SnC5YaiIalf8GlYohJQYkFvmGAdGvKtHBFgkNdwXQ+Z3FdgjhlKBx6UzN7FAXOKl
X-Gm-Message-State: AOJu0Yz+y8qgO2XwLfNTIis0aF9mdjIdZNwyJ4+WEFEabnuWmnu3GTTp
	wLDk+vMFJNiPXaXi5ohCVRlgNTUOnJGwj0Te/l+DTELuHLhdSXgtlEFRkNBC
X-Google-Smtp-Source: AGHT+IEdn+yZNpYbqFWcod6LpgXMbCvrh3sPAXeeQuLwG6G/P623/Qckq+WZefCWwErV7FFkjqu8Ew==
X-Received: by 2002:a05:690c:6ac1:b0:64b:313f:d7cb with SMTP id 00721157ae682-652d5ef9153mr45515107b3.22.1720163999739;
        Fri, 05 Jul 2024 00:19:59 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9bf32efdsm27722627b3.123.2024.07.05.00.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 00:19:59 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6515b824117so11494207b3.3;
        Fri, 05 Jul 2024 00:19:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJjjFaLtdaAoJjiJEU+Ze07kQ5fEjatGeqDRl+zsBYroSrexw/cLT/JUy8ZgbjfDDHxlkjbmt+cB81CjQ1TT348a6fysTZh85sKRKA9+T/S4HT3eLecz4STYPJdZwzRyq9wPEXAa3+nsDygiCVgh0qEFibUpj84nrwYh52Shro6czGIVnhOHfLLdE7gRbEsfvITko0efYh4rfYHZqv4EfjlK819rbw2NEOsxgF01ZGQkrcqSumWeXGGNUC2vKD0elt
X-Received: by 2002:a0d:e8cd:0:b0:643:ed61:11bb with SMTP id
 00721157ae682-652d5338f0dmr40312717b3.7.1720163999140; Fri, 05 Jul 2024
 00:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com> <2wm6vd4dib7tqpdq2eusjhyvfl3sofyvy65w6axvdjbkmgm5cn@bjltpbwwilc2>
In-Reply-To: <2wm6vd4dib7tqpdq2eusjhyvfl3sofyvy65w6axvdjbkmgm5cn@bjltpbwwilc2>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jul 2024 09:19:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=Uhqar6k_z_wo5jzge_7oY4tBK5zNiBbpsWa39Wvabw@mail.gmail.com>
Message-ID: <CAMuHMdV=Uhqar6k_z_wo5jzge_7oY4tBK5zNiBbpsWa39Wvabw@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Fri, Jul 5, 2024 at 12:42=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
> > diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-rii=
c.c
> > index 83e4d5e14ab6..002b11b020fa 100644
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -113,6 +113,8 @@ struct riic_irq_desc {
> >       char *name;
> >  };
> >
> > +static const char * const riic_rpm_err_msg =3D "Failed to runtime resu=
me";
>
> Please, don't do this. Much clearer to write the message
> explicitly.

And the compiler will merge all identical strings, emitting
just a single string.

>
> > +
> >  static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offse=
t)
> >  {
> >       writeb(val, riic->base + riic->info->regs[offset]);
> > @@ -133,10 +135,14 @@ static int riic_xfer(struct i2c_adapter *adap, st=
ruct i2c_msg msgs[], int num)
> >       struct riic_dev *riic =3D i2c_get_adapdata(adap);
> >       struct device *dev =3D adap->dev.parent;
> >       unsigned long time_left;
> > -     int i;
> > +     int i, ret;
> >       u8 start_bit;
> >
> > -     pm_runtime_get_sync(dev);
> > +     ret =3D pm_runtime_resume_and_get(dev);
>
> In principle I like the error message to be always checked and I

s/message/condition/?

> will always approve it. Whenever there is a return value, even
> when we are sure it's always '0', it needs to be checked.
>
> I had lots of discussions in the past about this topic but I
> haven't always found support. I'd love to have the ack from a
> renesas maintainer here.

I don't mind checking for the error here.

>
> > +     if (ret) {
> > +             dev_err(dev, riic_rpm_err_msg);

Do you need to print these error messages?
AFAIU, this cannot happen anyway.
Ultimately, I expect the device driver that requested the transfer to
handle failures, and print a message when needed.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

