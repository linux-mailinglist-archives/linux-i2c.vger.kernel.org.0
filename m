Return-Path: <linux-i2c+bounces-10313-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B70EEA874ED
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 02:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6893216FC51
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA6A64D;
	Mon, 14 Apr 2025 00:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2CstJKy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C6D195;
	Mon, 14 Apr 2025 00:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744589288; cv=none; b=Vb7YDJQW+Do7haeug34z3BGPnx4Qdwh+mA7XpxFaW4k2tNa3GBjAgnP3Ts76DzeO0S+D9/Pbj6V0l7QEWVi2C91Wvqq7gu48dtKsOqgrdZ6dGm9i/Qq4FkEj1XzhuLbpCjJfmVkxBFB8Ph3yXoExewMH318VLZ9RL6WFR5cs5Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744589288; c=relaxed/simple;
	bh=Hvl6NPX31K6tngDFinmxJTlTJ63kbtU5Lh6QdjnqjcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kg8u9MCe+oWXAadYycNutZNPXni8IFwWWLhpwe3TdUmh6TplSr7Ikf06rRTUPxu+ShcJeVtwN+kO11EBgte0MZdH7Xa3AGuSFsQdolnWCtiRwLAq+17qvN8UQbxR7t8TqDMWFvWjc29EZhUeex4iykeyyIK96T0pdDaYtDKpT8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2CstJKy; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so46684176d6.0;
        Sun, 13 Apr 2025 17:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744589286; x=1745194086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rreFZDTz2uBZn6ChgxZqj3cVrha2t3QZe1eg5gMrOew=;
        b=A2CstJKyPZlGrs5migMbLMaAJSq+yjUX2RzuGQbm3XOL5owgKp2FUFyGQFA4v93t58
         YinfTyBo2Odx8/r1vG728UyIsSClnXXSuhdavdUh220w/csTCZXPF2Vldn6JeMWwxGHK
         Ju+9O2TB6TNcLzdQ1UvHIAYdCJCYiRpJTswNjW3xvWNdPiZPWRBYRgvAKgeqgmWEYkRy
         09n1OUzWEY1gZ6JoIAyBHKPysqQ2AwI2S5vihWzyjrAZUTkQuxwyCQFi+kvQ/KvHrZdi
         +oCAfV9EteJsjQoUgLEGvEViXQ3bO52U70Qzd+QePKW+4rf5puKNkRq/LMHUB0oxGYd2
         EEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744589286; x=1745194086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rreFZDTz2uBZn6ChgxZqj3cVrha2t3QZe1eg5gMrOew=;
        b=jGQP52DMJn/YYn0fRC2XCxStXF2RWBPLeOLUAvupoO/XpfYHmwhY1yD9zdW42jkziu
         ncB6lbU/vyYNZSqdt/gjE/UUDYpqll/rv8rMRf7efRO+KvdisKfiybfwozKAi05amVb8
         62C6bg1xFyEfDxiicmSXrqm/WO1wAD/kPrvWlnjVFZ0MwTdYZiwuUAckhQQlv9+NQ9v0
         q++1gLbZjXz8ovcR4sy300uIGVRC/3hgg41WC41n0aQPKYLz0l/9v1sJ5U+hSlcYbPWQ
         SXynMYjAesFyEcMZsYSmjUewUkUp1m0m2vhfR71S9QGnlC44iwwXdSpfYWt5s58UKAHo
         wqWA==
X-Forwarded-Encrypted: i=1; AJvYcCWBVaMswFeYsc6QXB6gxb5YIyg6JOqHIiMl1cl6ZiMOmgwb2ipItikGTFQX5V0Iw/lfPjF5BCL03hU=@vger.kernel.org, AJvYcCWdDz4ob72fMCr+zTECFIMqxxjGfYEv8gFkQVn7oacwgbOgPXD7uQuoNJSPcD5BAY+35AMAizqC4e31Kr6y@vger.kernel.org
X-Gm-Message-State: AOJu0YzPY2cemR1WZlDhif3rnHzHGcaN3nHyDtI3iXgITPsHFR/8OaN2
	3RZJNhXvkzlGUY7On7h49D1teYm016OqZMiT3uXsrLrjtjDY4TNkIlvO5i+w51UL5eqN+sJukxh
	YdjuHQFOxyCK9pplqW/Cqb9hJ8do=
X-Gm-Gg: ASbGncuH2IG1ur1gi2AQhgMKE5xCtVH/aJiCpoaeh7aCWwOai1znv63SvtJnem3J+Mg
	Y03er5cnl8IR6MjLHVjbcvX1EHYFfS4cvikRuDoR7wHGPE6osTGS60WThAfN4934K5to3z/k4ad
	VI/C39LI27bSa2XJpPEvE3j3OhVCttbn8=
X-Google-Smtp-Source: AGHT+IFqMErkq/Yib4S882Q+l8wRVUIb3fb4K3HsLkmozQNX59ADuTQ1zrW0m4HCV4FsO/QnMwo9UG4tVKr7BoftpyA=
X-Received: by 2002:ad4:5f46:0:b0:6e6:5b8e:7604 with SMTP id
 6a1803df08f44-6f214188d12mr175624006d6.12.1744589286021; Sun, 13 Apr 2025
 17:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
 <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com> <4wbq7yepeqg6lhu34giqlz7fwamtuv4o5r5slm6ggj5ut7omvd@archqknzat3u>
In-Reply-To: <4wbq7yepeqg6lhu34giqlz7fwamtuv4o5r5slm6ggj5ut7omvd@archqknzat3u>
From: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
Date: Sun, 13 Apr 2025 17:07:55 -0700
X-Gm-Features: ATxdqUHCKdMZs_LEePD-OxZDub-K8K9UCKSTdv8KH_BZ7jlSxZSZ8fITrJH2Lwg
Message-ID: <CAHdq5QHUeMk4WLf8uGz78KagN3WSvS_skhvKFMqUD5YkwJOOkg@mail.gmail.com>
Subject: Re: [PATCH v4] i2c: npcm: Add clock toggle recovery
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Tali Perry <tali.perry1@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Sun, Apr 13, 2025 at 4:06=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Mohammed,
>
> On Fri, Mar 28, 2025 at 07:32:50PM +0000, mohammed.0.elbadry@gmail.com wr=
ote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > During init of the bus, the module checks that the bus is idle.
> > If one of the lines are stuck try to recover them first before failing.
> > Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).
> >
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
> > ---
>
> we are missing the changelog here. You are at v4 and I need to
> see the changes between the versions. For now it's OK, please,
> next time don't forget to add the changelog.
I understand, I will do that, thank you.

>
> One more thing, no need to send patches as --in-reply-to your
> previous patch.
>
> >  drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 2fe68615942e..caf9aa1e6319 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -1967,10 +1967,14 @@ static int npcm_i2c_init_module(struct npcm_i2c=
 *bus, enum i2c_mode mode,
> >
> >       /* Check HW is OK: SDA and SCL should be high at this point. */
> >       if ((npcm_i2c_get_SDA(&bus->adap) =3D=3D 0) || (npcm_i2c_get_SCL(=
&bus->adap) =3D=3D 0)) {
> > -             dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus=
->num);
> > -             dev_err(bus->dev, "SDA=3D%d SCL=3D%d\n", npcm_i2c_get_SDA=
(&bus->adap),
> > -                     npcm_i2c_get_SCL(&bus->adap));
> > -             return -ENXIO;
> > +             dev_warn(bus->dev, " I2C%d SDA=3D%d SCL=3D%d, attempting =
to recover\n", bus->num,
>
> the space at the beginning of the line should be removed. I will
> take care of it if you won't be asked to send a new version.
>
Got it, thank you.
> > +                              npcm_i2c_get_SDA(&bus->adap), npcm_i2c_g=
et_SCL(&bus->adap));
> > +             if (npcm_i2c_recovery_tgclk(&bus->adap)) {
> > +                     dev_err(bus->dev, "I2C%d init fail: SDA=3D%d SCL=
=3D%d\n",
> > +                             bus->num, npcm_i2c_get_SDA(&bus->adap),
> > +                             npcm_i2c_get_SCL(&bus->adap));
> > +                     return -ENXIO;
>
> why don't we return the error coming from
> npcm_i2c_recovery_tgclk() instead of forcing it to ENXIO?

The error that comes from the current driver is only -ENOTRECOVERABLE.
I do not see why we cannot return that error instead. I understand the
difference between both states; however, from the driver's
perspective, on initialization, ENXIO and ENOTRECOVERABLE behavior is
identical in that state.

ENXIO was what the driver returned by default without trying to
recover. Do you recommend changing it? Let me know. I am happy to send
the v5 patch with the change and address the above comments, too.

Thank you,
Mo
>
> Thanks,
> Andi
>
> > +             }
> >       }
> >
> >       npcm_i2c_int_enable(bus, true);
> > --
> > 2.49.0.472.ge94155a9ec-goog
> >

