Return-Path: <linux-i2c+bounces-11380-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F8AD747C
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 16:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 218861891575
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 14:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285F8253950;
	Thu, 12 Jun 2025 14:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc8ZAVex"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CA223FC54;
	Thu, 12 Jun 2025 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739268; cv=none; b=B9mzufX18sWz4aZ4Y+fRCZE8aY4yWt/Emo7AXvi8ThW3TWAdRtb3NHfcdjs0k5LtLbg2HUTsZqEy6R5kOYsAhtp42YjVGzLT1n+tbQNqyeIJtRhIqikAwOV1dOnx5o7g3KhFaVQ/mKnXmIS0qaZebG88fhlh9zig4vVUQUmwy04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739268; c=relaxed/simple;
	bh=HrIXxbRS7o44pmuf/yuZGjngQDdq7t0cP+O1OJL88j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VqC7SHG8NJPVn2TEtZh94I8J8jYlqt7UhbnuvR0RPDql8+eNXUI0cxy/7SMT3LrOP5Vq12xKv5aIxqNozoM6OaV+sYHpaIIiTf00OT5RC6bRwUzNG+yajui7PcPrMD0MnqJ++qFT7+gIJoRPfXUvgU6iyRiHzsJeJ3gQzZ+opjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc8ZAVex; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e740a09eae0so967246276.1;
        Thu, 12 Jun 2025 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749739266; x=1750344066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEpDdSY+2jWUkNnS9iYms3NFnNi5IdWvmT0Vr9mFNCU=;
        b=Xc8ZAVex4jR4+ai3zlbLPFYV60D26DWi7+7ZnYsj4ZxhVefyc0FjLeNIuMBnY93huO
         lHdbcvbJgzkqWLWiVkp401jVRfAu5gxWwXKYpwlh5H/mMF3kaEKJ2rf6QNJrlxA8f0LR
         jO115yiMD218EBY9yytBuSck3EvcI5ocrEcWaUK6CW9DwXpYQL2h9Bxu6lcNg4tKuxV0
         G5CxDXD4zrMURDoj5pCdg0lxOBG4n9v3u/cLRj57nUuwlZYK/EZ5iPHaY15tILfHXFXA
         q/e6TCMzPZIIjfxFTwYKHTSmkLp9ddMb53Ql835GHKJcbBFY2RRrv4dyWAw05p/V0fNN
         Lg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739266; x=1750344066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEpDdSY+2jWUkNnS9iYms3NFnNi5IdWvmT0Vr9mFNCU=;
        b=Sx/jy3hThgUz3oVGrBpnRtzIDhKIzvjqqLIYkbHCZZmW0aIrjREaGsXZbU6s3i6RXi
         qP1JXpkddZjHxPj+KUJWN53kOh1S88PVD8h2zFkHdHygUFjy748TrFu08+6w6OkNidQO
         Mx0E88r4EBMl5cwHd1QupRmTUzDP0LJ5gkao0FAa5n7Ny4+sNqM+oH7q23/co/8INy92
         B1ebSih2y5LkRdeeOpWscjIQawuaxXixNQTopbYLN3+jnxXriPgfUjfjIgzngZ2Y1WxE
         cLpSoW2I18ccu/KSleNBZrEOcXcYLrMIM7NvGAaLWObeih5Nv/f+qlr+OFAhLmWiIPLR
         FuWA==
X-Forwarded-Encrypted: i=1; AJvYcCUthQn2QrvX9y5H4+YKd29zMwPx7jMDytbjGsSa303CnDy4WVs2MXd548ElFyBGGKBbLDMIiespzN5l@vger.kernel.org, AJvYcCV8n8UVBRNoqze9fz4TQhgpZaw2hMqDLzDGNvWDqI/7B+LdU5CSjUH0Q7c0RoTR/foketLDwTASJtbdEAI=@vger.kernel.org, AJvYcCVFF48N5ri5FV9T1nI7am9QDnMchPmjPrfymosu9BGKKKw/inQSQDqpWf6BFOdOPeYmyelihd3w@vger.kernel.org, AJvYcCVQKIZ16YmXf6oD7ZfLx7EfmrMhm85UlM6PRaRS5cCE4v7ujlQm2OGvFLhR298KJr5Px4Zkr/t8P7Tq@vger.kernel.org, AJvYcCWH/vJpy/YVVCei1GnpzBM5e1lD3PNmvo78Wp2oBDNlrgYbO2BCre+5i8kMQl5Y2frdizSlLCJzufw=@vger.kernel.org, AJvYcCX0S0q9icaPAaptlUwbDGJU+pDrp0O4/HucISh3VQOvjfYXGd+Nm7XeIPD4ZE0a6C27+ogJtQpei6/1CVAWaCQ=@vger.kernel.org, AJvYcCX43prmBg7BDoHZsqoOIo3PrnTu5y963NUiO53BPRhJiLgK080R/Z+ScNQSlYv4+8jRahArMjL8jJA2zfr6@vger.kernel.org, AJvYcCXmGOjfWSZcl8DPYxjB8vL/8vTFtkMH711nmvMnY2+KdBIBVCI9jnhD+FVSZnckRZCvubtNF4t1O78HAQ==@vger.kernel.org, AJvYcCXpBDxYasujhOwWAiRw0Ct6ZqpZk9J333QfpU0xh9L9KXvO1cJPI1rLBsKgyHAhJVCReE/VLMiDPGTr@vger.kernel.org
X-Gm-Message-State: AOJu0YyAE6iMggz2Yq4jc7yNJg5YVuRVMktooNo2NN+/reLPRODMM6xo
	3UFZeLBhDENG4T653n/hOaRhXKGJz6m+9+Uel3Dy66v5QkrYCmjro6V/ZJj+u+TDX3S4RxpNjec
	1IPUUiDKuV3LyZU6wOIeB9EG/tqn80ic=
X-Gm-Gg: ASbGncvxV+cUzVKGAXIZpbUxbaSqfF3hPxsIr2G1PLTP/6xNEYC/PhJ+iNb3WDmtM3l
	bGrvoAoEMbUbS724Rany9rSWaiBoEFUv5gzkVIoUYbxZT4pJbdA/PVSWjQIr6G8Z+gVjZo+W0hU
	UvzqYDUnA9lnspfh5E2S61X1tUXieyVLuR0BuZUHS+TPM=
X-Google-Smtp-Source: AGHT+IHbXkDYNuadtMxqrLv3eWpepQOun6qiF0ETWy2zrWyc5v6lbDG/lF+Rb/oCRSfW2as0T8+Q8KacySN6ARKlV7s=
X-Received: by 2002:a05:6902:160c:b0:e81:a0b8:e351 with SMTP id
 3f1490d57ef6-e81fda04835mr10460738276.5.1749739265971; Thu, 12 Jun 2025
 07:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604041418.1188792-1-tmyu0@nuvoton.com> <20250604041418.1188792-2-tmyu0@nuvoton.com>
 <20250612140041.GF381401@google.com>
In-Reply-To: <20250612140041.GF381401@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 12 Jun 2025 22:40:55 +0800
X-Gm-Features: AX0GCFsHJ9k1Lm2CrO34dBCfeL0tuuLt-YrRc-whSYIUck_BRu3E49ZxjLYE8dA
Message-ID: <CAOoeyxVvZiD18qbGd5oUnqLNETKw50fJBjJO3vR50kon_a5_kA@mail.gmail.com>
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Lee Jones <lee@kernel.org>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Lee,

Thank you for reviewing,

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8812=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:00=E5=AF=AB=E9=81=93=EF=BC=9A
>
...
> > +static const struct mfd_cell nct6694_devs[] =3D {
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> > +
> > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
>
> Why have we gone back to this silly numbering scheme?
>
> What happened to using IDA in the child driver?
>

In a previous version, I tried to maintain a static IDA in each
sub-driver. However, I didn=E2=80=99t consider the case where multiple NCT6=
694
devices are bound to the same driver =E2=80=94 in that case, the IDs are no=
t
fixed and become unusable for my purpose.

I=E2=80=99ve since realized that using pdev->id avoids the need for cell->i=
d,
so I reverted to the earlier approach.

That said, do you think it would be a better solution to manage all
the IDAs centrally within the driver? For example:
in nct6694.c
struct nct6694 {
    struct device *dev;

    struct ida gpio_ida;
    struct ida i2c_ida;
    struct ida can_ida;
    struct ida wdt_ida;
};

static int nct6694_probe(struct platform_device *pdev)
{
    ida_init(&nct6694->gpio_ida);
    ...
}

in gpio-nct6694.c
static int nct6694_gpio_probe(struct platform_device *pdev)
{
    id =3D ida_alloc(&nct6694->gpio_ida, GFP_KERNEL);
}


Best regards,
Ming

