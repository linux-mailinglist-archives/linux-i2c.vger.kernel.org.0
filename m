Return-Path: <linux-i2c+bounces-2371-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F07587CE43
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 14:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D47951F22849
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 13:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6BE364CB;
	Fri, 15 Mar 2024 13:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRJoNyPA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563B12C1B1;
	Fri, 15 Mar 2024 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710510583; cv=none; b=X3quPi6kVcJN0e79REJ5S4YWr6+4aTXT3/vnXg15I+Rz61n+38dupoz/mIjh7j0Xy91mMCHlAdXcrQ9CQE0N39azt+Qa177hmu+Xv+YcOPmHe4+goMDVbrL1N6y7hTrQkrV4FYv19E63vAynIa25igweZE5QSfvtCb8PVzFZjPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710510583; c=relaxed/simple;
	bh=h/4Lk/SMGsdQgDM8jcVCYB2+YgZckD6icPn+NiY1FHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puXiLzALAOzp8XgPE5YdnAGgzdA8edO6hcdJKvKKE9rednbCZIaphzpnPWrDbW8N3GYw+bWyv1kIfgMvoV6w1+FslKDUal/7TGfhSNFe35Y/9AIx+Cv3DUiqVli9akuYhaIsC/DwfexrpjrYZF2U46Ei/IeRz33Aw683iS3SimI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRJoNyPA; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-429de32dad9so13223221cf.2;
        Fri, 15 Mar 2024 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710510580; x=1711115380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Wk5gVJOPGfeho8JPzSGCN6ya15q71s7clvvSXBk97w=;
        b=mRJoNyPAZtvHsbAvBmw/S/sgsuS5SYVg7T6nGfaoklQ8LVGc8Y3AV9472gnfkqAl4r
         DUp1QVIkcpVgWBiU0o2nAb800HgKNDLt7ofjypiAMHpjch4Qd+T7qxOTWSUYeRSWpIzv
         yEck0wwKjsos+cTPonhYN+dNd3DSY1JyjNLf4xprOGIgVlior3MmX8n76Ypf4DLlLPmw
         TmxloVlDeP1tOA/A9cLjTz9JIOqCbnCS1BHGxZMIMfpdMWR2jWCiahpogSjwI+SnXlr3
         fX961Mo2GdKEDfyfakYOam1Ygp3E2Nbjp2Ip2ycnAcJhBVleBHsSrh8vQjU4VhI8qBF2
         4Fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710510580; x=1711115380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Wk5gVJOPGfeho8JPzSGCN6ya15q71s7clvvSXBk97w=;
        b=qwz1MTEuS94H77DvnrvOFNapAllUmWJX2ywC6eTQD1LCcezrr94rl77hCbJPvWDeU5
         UnzB7g6rESqEV+bp//tX+OCwPyvtS/0vzcQlg1VY2HEHI5S7HMiztFYa32oJiwDjiJSC
         M5sE6ELYMdtylSsDW2vlJrZUZYIrGvF6cfmhv6WLfiXHE51tBrkMxMwh2pB9ueGsm0Dj
         WnJMnmnMiBrJ14APV61kOomP/jfa+UosSZcgRhEA8Czh2i+ASwA5JvYnFcub6oPDrVDS
         QvVPQDr+zQt1B5Zt2mgAvpG+jMU4kqhJ0dCbk0PcbC+gt75pNiHXYd9h2BebseYc8/ug
         EmsA==
X-Forwarded-Encrypted: i=1; AJvYcCWpAkoLvI11ODnZKaVOF0yyRSv8gVES8AQaMm1Wdys/rNBDrE2sXSEn2DPaqHQMLeTE88c/fmkSSovnZzv9fHTUIXejKpnsZZi2VzjwzcTGth7brHItJ0JaM+2b0EKsfIbziNRgxsUMnpu77DOYYNiE6V0dHFXehQVczPXgxwlG5uw2qFr7WCrZmt2+CdYM2jv1ZIlzR4DYabEOFbAdRZ6sNVdniAPX
X-Gm-Message-State: AOJu0Yyh9uMmCwOyMIjD6lYETcjnn9zQhDq8vNwpB6tayyNZiBDjJQdY
	FiNy5aN0mh2HP8VtWqrOjDkDA1EyPKZ0sKc8z5PnAhVkCb2oae6SpZMp8gl6YCOWM03kBbQ5O+e
	gWWdxhD6NIDoPXPCqyNEVYdvYLxM=
X-Google-Smtp-Source: AGHT+IFgbluFhi9bT4nQa92X1wjIoWmS3ECfzn7cYD7XLw63BZtbQsJ5VYXfx6k5w9DPAygksDQ9/hzBifoHk66galw=
X-Received: by 2002:ac8:7f8e:0:b0:430:9754:aece with SMTP id
 z14-20020ac87f8e000000b004309754aecemr5898888qtj.42.1710510580223; Fri, 15
 Mar 2024 06:49:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240315103033.141226-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW8qKy4p4vefhrdK861dEi93Awr6NcQBHbLTwO0NWq6kA@mail.gmail.com>
In-Reply-To: <CAMuHMdW8qKy4p4vefhrdK861dEi93Awr6NcQBHbLTwO0NWq6kA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 15 Mar 2024 13:48:22 +0000
Message-ID: <CA+V-a8u5SguphwZ2H4xpn=ZX2OaC442bLMBVJtPC+1Rj1GF=9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] i2c: riic: Introduce helper functions for I2C
 read/write operations
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Mar 15, 2024 at 12:59=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Mar 15, 2024 at 11:31=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce helper functions for performing I2C read and write operations
> > in the RIIC driver.
> >
> > These helper functions lay the groundwork for adding support for the
> > RZ/V2H SoC. This is essential because the register offsets for the RZ/V=
2H
> > SoC differ from those of the RZ/A SoC. By abstracting the read and writ=
e
> > operations, we can seamlessly adapt the driver to support different SoC
> > variants without extensive modifications.
> >
> > This patch is part of the preparation process for integrating support f=
or
> > the RZ/V2H SoC into the RIIC driver.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Renamed i2c read/write to riic_readb/riic_writeb
> > - Made riic as first parameter for riic_writeb
>
> Thanks for the update!
>
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -105,9 +105,19 @@ struct riic_irq_desc {
> >         char *name;
> >  };
> >
> > +static inline void riic_writeb(struct riic_dev *riic, u8 offset, u8 va=
l)
>
> Please use the same parameter order as writeb(), i.e. "val" before
> "offset"), to increase uniformity.  This also would make it easier
> to review your changes using "git {diff,show} --color-words".
>
Agreed, I will update it in the next version.

Cheers,
Prabhakar

