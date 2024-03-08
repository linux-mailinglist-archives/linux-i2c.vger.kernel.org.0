Return-Path: <linux-i2c+bounces-2302-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D007876C35
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 22:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2670A2837C5
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 21:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318145F472;
	Fri,  8 Mar 2024 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDi+XCkQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D4D5E073;
	Fri,  8 Mar 2024 21:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709931717; cv=none; b=o9P7wadKAh5MQYt4hDFFZFKASvFt6UUeEnF4J254Fq3YDMAnLuxsoBfiMQVE1tptNqaYV5jB5AcxKjCnX3nQsSFV6iKfNnQbGkQUyRLDkuOnFCJoIqMb6DtzeD3T7mbWMaS5Sc1DB4XALJNEozNiJuukp77mZFy4Jr9OeGHWPI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709931717; c=relaxed/simple;
	bh=XiN9Fa9QuOna06HjksVQ2Nm0qV0d3fdQcZqGcIcMRc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4lRIQdftEf5N08rYMmW/pejbDyq7sCnSLCg8X0/H9VKtvnUy/32uD0AA0jalqmKoYJEJq/5m+ruKEneTF5CVsnhC6KWXdymUUI1fOXVWZNseTK/xhFgFXqzr93cPjOwFUcuHDnGOO6zjAdMsFXfqnuwY7qKIJWPyn29wR0bS2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDi+XCkQ; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4d34abf66deso282670e0c.1;
        Fri, 08 Mar 2024 13:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709931714; x=1710536514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCymEiGpipubs/MqTyZ4nrqmBe9tQmx2x+DjRvTmJuA=;
        b=UDi+XCkQSCONS4zDom5uZXV3UG1FB48dhCuQthMCEbIM6jTlEehsg3AHMMLzKBl3Lq
         1zsvjqFEaH+MA+f1406kzOhJXrw3Xk/5gbP8iTvfBaECxnjZou8Rnuo2rT8TqMwbmJQw
         8qb4TwCHGqCIYBRMLbNv58oWsKS7LvXNVNp8YZQfy/F4uffe4TNjf7XWNiw6dzgwmhMr
         8dZ7E0TxYFsdREsxkCACDsfuLyPIDy0UWHpui3PJDiXvpr7Lyi3f4njkyjIPxrBUQg3l
         kl+6+fjmqcuZq9J2kNItj5XS/E68n8Zomb3521MvP48dXeFFBhGBw6gHfispK4lSDXzx
         u7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709931714; x=1710536514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCymEiGpipubs/MqTyZ4nrqmBe9tQmx2x+DjRvTmJuA=;
        b=amFuqJXaYv0vF7azrqutkLRn28aVs4yRUxj+q8IjsxYqjaJNvbUyw+k9mdXPc6DE3g
         KsZZ50gQa5NUzOIzXkF3CUe7tEr0eJ+HOAJCe4qFHq0wvLOW2/fS2OpGhRVLSfQVGKyJ
         TWdmyOYmxCVdG9GrvpnwK0UpKGSc85Y80l8ThvNZGE9Z4ZlOlHeKFJWSeRpJylGLDS/w
         T8d5OynK8LS8Cr8Py6KXHSJE0VQc12CXZ4XqEVlBPwbP6XRqTgeKXknbzMsl4qNeVq/+
         FQKnMraYqyKb0nwCSLOVHvizXZ+XoNsRkMtUXvRA73S/pCFzAQ1onY9OD2KiwCgBhia0
         +tvw==
X-Forwarded-Encrypted: i=1; AJvYcCWfqN9VVr3nwov6sitTCO8jiov7CkkmNZM7OouUpdENZY79XQxbuxjbC/Taq+aUQnwc5QLyCA3yEThgUL+pHYUmax7npaT0PpkLgSJKfwN0HaRNaRrfKDznSG5t0Uezq2iwMceb8otbwnRs/WRYgvB2R/wSQYKKUg8IzlP4rvpVg693B+baMDU8lK9IXpA1jWSq9pepNaESzrYQHK20b34y4AnQy2hd
X-Gm-Message-State: AOJu0Yz6g9zabs1A7+uRG67zJBJgYfrODzZ0fJcX0Gpgp2OhB6+xaJ3H
	uVshgY2DIYgdAGzzceYNP4Fv3Q14e0AtP9bS1G6bFW1O+QjawA8mQzcvW94d1RtBR2ztgb7A8Zt
	5atWx70Mth3XDnFpmmDR0cwwFeig=
X-Google-Smtp-Source: AGHT+IGnq51iE4+BqWlMAemT74cR1wABtqmatGGKO31Zy2uvzaKVgj19n72J8jv/Bl7YJRlXBZzTdV/xtxW3w4cCeDs=
X-Received: by 2002:a05:6122:1c0e:b0:4d3:4aad:22d4 with SMTP id
 et14-20020a0561221c0e00b004d34aad22d4mr555569vkb.0.1709931714135; Fri, 08 Mar
 2024 13:01:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW56ihcdZE_=y5MgURbmFjuPXkVjnHtA8HZ+BWznrvTXA@mail.gmail.com>
In-Reply-To: <CAMuHMdW56ihcdZE_=y5MgURbmFjuPXkVjnHtA8HZ+BWznrvTXA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 8 Mar 2024 21:00:47 +0000
Message-ID: <CA+V-a8uHHM3MY+CpGOmTdc_jn++bgngUqkZgVQgyBfF2jOXHXQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: riic: Introduce helper functions for I2C
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

On Fri, Mar 8, 2024 at 7:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Mar 8, 2024 at 6:28=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
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
> > Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -105,9 +105,19 @@ struct riic_irq_desc {
> >         char *name;
> >  };
> >
> > +static inline void riic_writeb_reg(u8 val, struct riic_dev *riic, u8 o=
ffset)
>
> Having "riic" in the middle is definitely the wrong order of parameters ;=
-)
> Please make "riic" the first parameter.
>
Agreed, will do.

> > +{
> > +       writeb(val, riic->base + offset);
> > +}
> > +
> > +static inline u8 riic_readb_reg(struct riic_dev *riic, u8 offset)
> > +{
> > +       return readb(riic->base + offset);
> > +}
>
>
> > -       writeb(0, riic->base + RIIC_ICSR2);
> > +       riic_writeb_reg(0, riic, RIIC_ICSR2);
>
> This clearly shows that the new accessors involve more typing work.
> Why not just call them riic_writeb() and riic_readb()?
>
Ok, I'll rename them to riic_writeb() and riic_readb().

Cheers,
Prabhakar

