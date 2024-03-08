Return-Path: <linux-i2c+bounces-2298-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B2876A6D
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 19:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D97B284D77
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 18:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1104C5102A;
	Fri,  8 Mar 2024 18:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UP5kSPym"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB3B4085D;
	Fri,  8 Mar 2024 18:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709921088; cv=none; b=VqtgjT2Taf5+7v5PEqoP0Ptd++EtGg4K9WLURhPew3w6GQlXwQSHdXMB70JHUruo1xjQF+swOvVBfHQzxZB5+mHh5VgOoeXPwQ3ibuBK1ta2mHUR1fHJn1t26pJdKO1LevQlfmBw0o8+mMoTKkx1eiuv4id13GSMbLQUQ61e9q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709921088; c=relaxed/simple;
	bh=DgRla8Vemcg3N2Xu8hP2gOK08LWRmoXvUIZoE1kt93k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mN0IxMPV/WdTx2d1X6KiyWsc+bpHlaZS9kg1/sHuNaOD/+xlsQynJODwqfGcDl1m/toM5wppSDKElf6vnGnHBoAVT/dJYkdjxoX2T8CDwvd5RxHNqL7YagQkF2Te0PX9qOnIMcCxMoIAJANRdIYep3J9OePrxM5kN8ctQsM/A8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UP5kSPym; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e4eaa4b394so1077536a34.1;
        Fri, 08 Mar 2024 10:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709921086; x=1710525886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Is7K4+wisW8bZSxpqo0nKy4Z8xog4B5RxdNeDQtbIQY=;
        b=UP5kSPymdqA6qYlr6C7/84VZNPFvAGAPXJ+AaqEYfUWnWgh6JuM9WaE0ykhcxEzo38
         DF2rwBukUSYWNMAYit99pdgrXLN36t83x7yqVDUJ9Q6h9ndZ+gnuYggG/92vALRHABZx
         L86PUQWn5C6yzuVMOe/0MgYpVt13EFQ7Wq2ouumaZ2hUnCxugtypnRaWX2MjDNppMK0k
         hKHfGMSy6dEngOyQzul/D4NrK74HUBZK5xzRY2LXK0wN4WBsoW2I+M4ZU5BC30KxdM+8
         /nu9cGL2FYPO7IJCjqOE6fvZVN7PDnVcP31SaW/ZaA2YPKiP9CDQscbePFLaLnEV+GPo
         f4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709921086; x=1710525886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Is7K4+wisW8bZSxpqo0nKy4Z8xog4B5RxdNeDQtbIQY=;
        b=dunow1ZOMZOj5erGGdFtl4XbEPb/6F+1PDivg3o83eWv3FvIxRWvqQqsimHOB96gXV
         mpDQFjEVdjrLYrbf6tRJvGxRC7YtCeo5LdULNujzWud75Iftn3pTfmhRbIPfmYu8f987
         pYs0cbsQBVgWgjMI1e+40p9wp0Lt/Pwm+N0BQ4qyjCp6XvYCZQFrdZCEtw/uMFoOIo6g
         /ieqFWd1GKv5QNNL/x63XDzKRiRZ3YbieDc+WWGRvaKkNgPcawDaeO38F+uSCDVe7nGq
         O1Sdc3xVziVqdCgJU90Bb6eY7hU14/590JlqAzxrV7exbqLjOK/6Hrmn3xhuITf3YE+i
         iydQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8eRXHkPENP7640RTQlkmiyjZZi2JRH5GY9Qv8dkaCp6dMMQYr+S9xezEvuS+ot1PQPDHINoiRWsIA4MHN2y3Ru/Z+0vTjCUnD0y6WodJUM+ybzckcW7Zum+jmPLg9NIL09T4wEudVLXR+Ll+T/nzvkJpIS6f1LWmkU0JnP2rMLc0Vl8fr6NNIQGI4XZEHzCvlSOldYutHMoiAVc2jCxsEk+cna0xk
X-Gm-Message-State: AOJu0YzeVxq87nGGNOjdP8uGAcBUZFBtjPKmbuC0dZ2HVxLUguWBdidL
	1xj6WF/h0qKyCErfIsY/OwyFHCndDsmdzodi36Mjb0zd12vPDtjM7+bquWH3yWrjOnHb800wZrf
	c3OQ5iTNZRo7tBs0izh+oTBP89JtPLcne12Q=
X-Google-Smtp-Source: AGHT+IGqW7tdNTBPDYxaWB1aenTyJ6JRK/ye4Up6Ni3gBtz31pRs1tUqJe0ojNNBj7nQSkgkXh4tJlPaMz3Utnb2lqo=
X-Received: by 2002:a9d:7ad6:0:b0:6e4:d6d8:fbaa with SMTP id
 m22-20020a9d7ad6000000b006e4d6d8fbaamr12247845otn.37.1709921086307; Fri, 08
 Mar 2024 10:04:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <OSAPR01MB1587CFE774834B31820E7D5486272@OSAPR01MB1587.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB1587CFE774834B31820E7D5486272@OSAPR01MB1587.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 8 Mar 2024 18:03:39 +0000
Message-ID: <CA+V-a8uJO_qz6CaD2zUXC1Kf7tuM+Nzq6W+WHjy09NN2FAn+fA@mail.gmail.com>
Subject: Re: [PATCH 4/5] i2c: riic: Pass register offsets and chip details as
 OF data
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <Chris.Brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Mar 8, 2024 at 5:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Friday, March 8, 2024 5:27 PM
> > Subject: [PATCH 4/5] i2c: riic: Pass register offsets and chip details =
as OF data
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > With an increasing number of SoCs reusing this driver, each with slight=
 variations in the RIIC IP, it
> > becomes necessary to support passing these details as OF data. This app=
roach simplifies the extension
> > of the driver for other SoCs.
> >
> > This patch lays the groundwork for adding support for the Renesas RZ/V2=
H SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > ---
> >  drivers/i2c/busses/i2c-riic.c | 59 ++++++++++++++++++++++++++---------
> >  1 file changed, 44 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-rii=
c.c index
> > 49a12f1ecdf9..3398d639b754 100644
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -46,18 +46,6 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/reset.h>
> >
> > -#define RIIC_ICCR1   0x00
> > -#define RIIC_ICCR2   0x04
> > -#define RIIC_ICMR1   0x08
> > -#define RIIC_ICMR3   0x10
> > -#define RIIC_ICSER   0x18
> > -#define RIIC_ICIER   0x1c
> > -#define RIIC_ICSR2   0x24
> > -#define RIIC_ICBRL   0x34
> > -#define RIIC_ICBRH   0x38
> > -#define RIIC_ICDRT   0x3c
> > -#define RIIC_ICDRR   0x40
> > -
> >  #define ICCR1_ICE    0x80
> >  #define ICCR1_IICRST 0x40
> >  #define ICCR1_SOWP   0x10
> > @@ -87,6 +75,13 @@
> >
> >  #define RIIC_INIT_MSG        -1
> >
> > +#define RIIC_RZ_A_TYPE       0
>
> > +
> > +struct riic_of_data {
> > +     u8 family;
>
> Do you need family as compatible have this information?
>
Yes this is added to future proof it, as the RZ/V2H SoC has some bit
differences in the slave address register as compared to RZ/A and
RZ/G2L. Comparing the family outside probe is not always preferred
hence this is added as part of OF data.

Cheers,
Prabhakar

> > +     u8 regs[];
> > +};
> > +
> >  struct riic_dev {
> >       void __iomem *base;
> >       u8 *buf;
> > @@ -94,6 +89,7 @@ struct riic_dev {
> >       int bytes_left;
> >       int err;
> >       int is_last;
> > +     const struct riic_of_data *info;
> >       struct completion msg_done;
> >       struct i2c_adapter adapter;
> >       struct clk *clk;
> > @@ -105,14 +101,28 @@ struct riic_irq_desc {
> >       char *name;
> >  };
> >
> > +enum riic_reg_list {
> > +     RIIC_ICCR1 =3D 0,
> > +     RIIC_ICCR2,
> > +     RIIC_ICMR1,
> > +     RIIC_ICMR3,
> > +     RIIC_ICSER,
> > +     RIIC_ICIER,
> > +     RIIC_ICSR2,
> > +     RIIC_ICBRL,
> > +     RIIC_ICBRH,
> > +     RIIC_ICDRT,
> > +     RIIC_ICDRR,
> > +};
> > +
> >  static inline void riic_writeb_reg(u8 val, struct riic_dev *riic, u8 o=
ffset)  {
> > -     writeb(val, riic->base + offset);
> > +     writeb(val, riic->base + riic->info->regs[offset]);
> >  }
> >
> >  static inline u8 riic_readb_reg(struct riic_dev *riic, u8 offset)  {
> > -     return readb(riic->base + offset);
> > +     return readb(riic->base + riic->info->regs[offset]);
> >  }
> >
> >  static inline void riic_clear_set_bit(struct riic_dev *riic, u8 clear,=
 u8 set, u8 reg) @@ -453,6
> > +463,8 @@ static int riic_i2c_probe(struct platform_device *pdev)
> >               }
> >       }
> >
> > +     riic->info =3D of_device_get_match_data(&pdev->dev);
> > +
> >       adap =3D &riic->adapter;
> >       i2c_set_adapdata(adap, riic);
> >       strscpy(adap->name, "Renesas RIIC adapter", sizeof(adap->name)); =
@@ -497,8 +509,25 @@ static void
> > riic_i2c_remove(struct platform_device *pdev)
> >       pm_runtime_disable(&pdev->dev);
> >  }
> >
> > +static const struct riic_of_data riic_rz_a_info =3D {
> > +     .family =3D RIIC_RZ_A_TYPE,
> > +     .regs =3D {
> > +             [RIIC_ICCR1] =3D 0x00,
> > +             [RIIC_ICCR2] =3D 0x04,
> > +             [RIIC_ICMR1] =3D 0x08,
> > +             [RIIC_ICMR3] =3D 0x10,
> > +             [RIIC_ICSER] =3D 0x18,
> > +             [RIIC_ICIER] =3D 0x1c,
> > +             [RIIC_ICSR2] =3D 0x24,
> > +             [RIIC_ICBRL] =3D 0x34,
> > +             [RIIC_ICBRH] =3D 0x38,
> > +             [RIIC_ICDRT] =3D 0x3c,
> > +             [RIIC_ICDRR] =3D 0x40,
> > +     },
> > +};
> > +
> >  static const struct of_device_id riic_i2c_dt_ids[] =3D {
> > -     { .compatible =3D "renesas,riic-rz", },
> > +     { .compatible =3D "renesas,riic-rz", .data =3D &riic_rz_a_info },
> >       { /* Sentinel */ },
> >  };
> >
> > --
> > 2.34.1
> >
>

