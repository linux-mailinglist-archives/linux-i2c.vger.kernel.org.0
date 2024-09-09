Return-Path: <linux-i2c+bounces-6410-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4B2971B12
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 15:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AC76283B9E
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 13:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8957B1B9B28;
	Mon,  9 Sep 2024 13:31:11 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2970F175562;
	Mon,  9 Sep 2024 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725888671; cv=none; b=AFgvAUEPWn5e3RDCY/Utr7wGAOO9/1Xj16yCPvyvmElZKpMzOd8cuddC/cpvL5kX5392dMMzVpNQviUmnUgwf1fYdLHiW2iYHlo4uDE79AhKgEEHTLEFqxrJLM7rdOYAWlbBCkoopI7edw5SJgDWpRm54CegFHQipf8uChfWFKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725888671; c=relaxed/simple;
	bh=pOFig3eU0wBb1qCL+nsbHBh/qyBtiYCCd6tB5xK4AmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0Av1DyoGfidKyMIZ7bRYZebxXNdMRtnLwA3F8sYQciyoCvSoqdWIV3cELzUEirbLakHTYAtjOyE5Y2bXX8vlK9jc3GvKx/i/pAzpfMpKGgGAwp/jy/f9Us5IRX0wIxfmwMv6xm2PIXNq76+ZEuunmCoX0P+2MwEkwl1um36dlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e1a7e54b898so4060115276.2;
        Mon, 09 Sep 2024 06:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725888668; x=1726493468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ex72KcEBC32BEvrz/AzGLG+FsBKHihpIBTF/blpU0cc=;
        b=nk6CGRbVQVKeLPfa9LXiMXpKJ+pLCdz699Z9KPSOrPhSXvsBKxN8y2oAy950Z1PJkm
         SFsfDSHIeep261vqQaCBR1VfdTUZMMhQlKhGLLat41NgyE8KJ9DcizcOlvdgfGdsC5aC
         LliGQKxLZSkHu2jD9lo3VXD7Mw+aMq2SGwhLm4oYPWQPRRiljU1cwRWOA0tI/xFBG3RN
         OXakvmU4BN6ObrpDISoylCXaNLmfBTP+x0cK9RfM1dITdeL6VnnQ3rpoKxn8Kmc9W8P3
         zfNs97YrNvGZaVh94ZtT4GCP5fwtpnZiZRcrGSEdhlKy6kwt6NBvlElYzY97wZHJWciL
         /MxA==
X-Forwarded-Encrypted: i=1; AJvYcCUEbm4UA0lH/JJHvbSJO/ZjoWs1cK4beR4FYDsHXNzFYs81nAZnAqVisXQi8JBxguDhGrkY5F1Cp+VBMiv9fAI=@vger.kernel.org, AJvYcCVuDAzUP/0x/iWxBYCOxBw8SYfXkl+2B9NxDe2jn5FHqvBkmDDk71uZ8HQPeps18WngXl4XkNBDdknV@vger.kernel.org, AJvYcCXa8pO5yF+s8qlrvgRevl4ng240GcU2/aHhCN86nxKyP2jYCUh/Hq4+Rn3AOTLDJiwqPXNqJ5TDRpA+S3OWQ67EwSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbIWxfKe89OnuEUSWYqCZ0O6Y9DUXQHAD8NzitqXIESveNW7Uc
	nTbFEXc3OUx2cFo9VYzn7SKRtakh7YHz2IsAkqatRDOZ3nzkWjQ1wtl1uIH7
X-Google-Smtp-Source: AGHT+IEK/DPcX2EkuJp30m92OblQSWNKMeYLvxqYtCbIaUZ3hTHax0prwc1aMS4UCrfHuzceNDT5vQ==
X-Received: by 2002:a05:6902:230a:b0:e16:6aae:e65 with SMTP id 3f1490d57ef6-e1d3487f52emr9039359276.13.1725888667690;
        Mon, 09 Sep 2024 06:31:07 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d4b4ae070sm995049276.62.2024.09.09.06.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 06:31:07 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6d6a3ab427aso32535747b3.2;
        Mon, 09 Sep 2024 06:31:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1GwO0XT0IBaB8SkaAiHq7yXoMpdLcWxQGBnEo56lQdtmMUw18YBdsKxG4ROLiWNoAfOPghasUHWOR@vger.kernel.org, AJvYcCUrqGnsCjt094nUUSVyW0ugjYTm8/rGkaRfxR5UA3zvIh9m2izxeukWgUvMwN4D3JPsy551PUGCeR+asglWaRI=@vger.kernel.org, AJvYcCXzncPXhF6wxHiEfe2ifT1EU5JND5elwGtcZt+JbrIV8jnv95QFrdeBVG4u17rO9EJqprIJZMgcSXQbrHhcjjuQAW8=@vger.kernel.org
X-Received: by 2002:a05:690c:fc1:b0:6d6:94b2:f3cb with SMTP id
 00721157ae682-6db4515405dmr88200357b3.36.1725888666984; Mon, 09 Sep 2024
 06:31:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909105835.28531-1-wsa+renesas@sang-engineering.com> <CAL_JsqLui9=K_LdAoEAibxRo30_2ahdGXhCW50ow8rcqCp6jZA@mail.gmail.com>
In-Reply-To: <CAL_JsqLui9=K_LdAoEAibxRo30_2ahdGXhCW50ow8rcqCp6jZA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Sep 2024 15:30:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGtuAuQ3M3HonY8zfODTTz_izV6g9555iwuPLSY+P9_g@mail.gmail.com>
Message-ID: <CAMuHMdWGtuAuQ3M3HonY8zfODTTz_izV6g9555iwuPLSY+P9_g@mail.gmail.com>
Subject: Re: [PATCH dt-schema] schemas: i2c: add optional GPIO binding for
 SMBALERT# line
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree-spec@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Sep 9, 2024 at 3:07=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
> On Mon, Sep 9, 2024 at 5:58=E2=80=AFAM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > Most I2C controllers do not have a dedicated pin for SMBus Alerts. Allo=
w
> > them to define a GPIO as a side-channel.
>
> Most GPIOs are also interrupts, so shouldn't the existing binding be
> sufficient? The exception is if the GPIO needs to be polled.

If the GPIO pin supports multiple functions, it must be configured as
a GPIO  first. devm_gpiod_get() takes care of that.  Just calling
request_irq() does not.  In addition, the mapping from GPIO to IRQ
number may not be fixed, e.g. in case the GPIO controller supports
less interrupt inputs than GPIOs, and needs to map them when requested.

See also the different handling of interrupts and gpios by gpio-keys.

> > --- a/dtschema/schemas/i2c/i2c-controller.yaml
> > +++ b/dtschema/schemas/i2c/i2c-controller.yaml
> > @@ -135,6 +135,11 @@ properties:
> >        use this information to detect a stalled bus more reliably, for =
example.
> >        Can not be combined with 'multi-master'.
> >
> > +  smbalert-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Specifies the GPIO used for the SMBALERT# line. Optional.
> > +
> >    smbus:
> >      type: boolean
> >      description:

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

