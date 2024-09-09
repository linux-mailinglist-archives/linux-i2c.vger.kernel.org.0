Return-Path: <linux-i2c+bounces-6433-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E319721CB
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 20:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 652CA1C22C3C
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 18:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA93C187856;
	Mon,  9 Sep 2024 18:24:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F50C16D9AF;
	Mon,  9 Sep 2024 18:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725906277; cv=none; b=JRfFzcupPPps9uiwebQKbAWRnNcKKW4hMkX6LtMH2j8582iiBZM9wD1JFsVPizQmBKTky+u0umRG/xZ0j/kV3GStx2ydv0iGnnJbmRpnyTfgvraXtmk5mcUnF0EE2a0EIKkxKnlwtwisBbKkhQyhm6jJnFdTU2cF2m40o/BR3Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725906277; c=relaxed/simple;
	bh=H1HrYV3nGu7dk6DeTttTdNdhYwRQg0LmmbTolyu8hX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SoAB6JVx/Z8TjCwdrVkQ3gMeef0DgK/rnPHhDjnSgpLIJl5mLw45F8Q5ZsP1Ji9HGfq3jBVlxldOPJH6JHrxYEXXhtm560WrK6DyLDFIivT7E0GIeMr6LNkTP0tJhnjFWvlw3Mic3m87IjPfA+NSNARm1NGu6kc7EWDTCKcMwmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e1651f48c31so5155753276.0;
        Mon, 09 Sep 2024 11:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725906274; x=1726511074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GT+93N3cYqkEubN3oqEdQZHocdjlebcPKNrk4DFLYiw=;
        b=DSsQ+S3hTncgUcfX5zdNjHevvKSnNg1Ip2+tRJPT+qN+KO9K0czt1/tW69NmtVCe9G
         0U737jPkcBditMXs/NCkhAQ13LPmdFnvs3UcCSi07eVDaGR9JN1ouKFxD1lFgtjxYkcN
         7u8ub8PQ7/XRcMsCBZrS76u/82vDdqGtI9CYMcApKnE3x7jMeiBtyaYxSoqa9Q6rzPm/
         WJzVyrKYynPqx+2ZTX0ssG7HYkETsoFRuMR8PaltZSTxTUpHOY1X2asH/PQ+AfM1H4hC
         xdlS6qUZrSVzx1lICQxeB85J0LB4k1tIjahGj2IgF0pKEgjM1WX0Oi0skXCbw3S6n82P
         gk4g==
X-Forwarded-Encrypted: i=1; AJvYcCW8gElmb2ghlxHizsNH+DjXTSadM2E2TByV0nPAd0l/TfmM4QM0RyItfQ+fQ35T4nQwybShTNq3J6VtiNTjEisA4sw=@vger.kernel.org, AJvYcCXSyGZxt034GcGbN858PuUeUoJi9Ueeo7fFGPup+Di9zok2Ur+dXTcWzfGg49r1rJEak4lZtra39Nc+@vger.kernel.org, AJvYcCXq90JhUnBY2YBYGnaNjWfYqgsYMX1B3gVsyBreLTUs3zV/BnNIuAcXodRuUuvGG0KCfCYqOm7RkWGnjbpDx8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5SEZbA6q/TjYKFsrNUuX8LngI3J14jsUS8xGEOdUo8j/ETnK1
	/yEACoIJqESWK7qVRU9P7ZzDn/WaHQX+948SiaIa/Ir4zepQgRU/6rJDluUm
X-Google-Smtp-Source: AGHT+IHs3ybvb/kwPIC9K7Q0KGaUz7WgzJcr7z8v9fn3rtxmq4Jy/a+kvZkE3RcoamYKX0+eWEQFLw==
X-Received: by 2002:a05:6902:2012:b0:e1d:449:31b7 with SMTP id 3f1490d57ef6-e1d348650bemr11519121276.8.1725906274126;
        Mon, 09 Sep 2024 11:24:34 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d7b9db608sm16027276.6.2024.09.09.11.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 11:24:33 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e1a7c25e350so4480485276.3;
        Mon, 09 Sep 2024 11:24:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU935LWDDb3JIhM9gjl3QcvDBRSZH2jTFU2Ar2lOot2wYnWvTwQ1IoAjDoJS0EcuPFE8l0DraMUR9n7Z1GD3+o=@vger.kernel.org, AJvYcCUB2dfWmUXf0VfGt5dTwq7BFpoOTI/NaEyrbelNCHPzVLIkmQeNZF7xJDo5GAReD5I8f4l10qoUx35NKqARdfnvC84=@vger.kernel.org, AJvYcCViy4UcEJf0iCTmC57SXFzgpprFHcoPR6T28zl9bngUoQttOTotVoyVMaAXhanv4abBSc+UsMpd5Fuw@vger.kernel.org
X-Received: by 2002:a05:690c:2d09:b0:6db:5567:6907 with SMTP id
 00721157ae682-6db55676eb2mr89491407b3.14.1725906273718; Mon, 09 Sep 2024
 11:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909105835.28531-1-wsa+renesas@sang-engineering.com>
 <CAL_JsqLui9=K_LdAoEAibxRo30_2ahdGXhCW50ow8rcqCp6jZA@mail.gmail.com>
 <CAMuHMdWGtuAuQ3M3HonY8zfODTTz_izV6g9555iwuPLSY+P9_g@mail.gmail.com> <CAL_Jsq+cFb56e5WvipL1nR-0TDz+v6vnFDvz9F9JbXinxkEt1Q@mail.gmail.com>
In-Reply-To: <CAL_Jsq+cFb56e5WvipL1nR-0TDz+v6vnFDvz9F9JbXinxkEt1Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Sep 2024 20:24:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4xf37BLwORE=bh1s-SGXH4vnhEqFkvxu+h4RJKB1F6w@mail.gmail.com>
Message-ID: <CAMuHMdV4xf37BLwORE=bh1s-SGXH4vnhEqFkvxu+h4RJKB1F6w@mail.gmail.com>
Subject: Re: [PATCH dt-schema] schemas: i2c: add optional GPIO binding for
 SMBALERT# line
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree-spec@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Sep 9, 2024 at 3:40=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
> On Mon, Sep 9, 2024 at 8:31=E2=80=AFAM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Mon, Sep 9, 2024 at 3:07=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> > > On Mon, Sep 9, 2024 at 5:58=E2=80=AFAM Wolfram Sang
> > > <wsa+renesas@sang-engineering.com> wrote:
> > > >
> > > > Most I2C controllers do not have a dedicated pin for SMBus Alerts. =
Allow
> > > > them to define a GPIO as a side-channel.
> > >
> > > Most GPIOs are also interrupts, so shouldn't the existing binding be
> > > sufficient? The exception is if the GPIO needs to be polled.
> >
> > If the GPIO pin supports multiple functions, it must be configured as
> > a GPIO  first. devm_gpiod_get() takes care of that.  Just calling
> > request_irq() does not.  In addition, the mapping from GPIO to IRQ
> > number may not be fixed, e.g. in case the GPIO controller supports
> > less interrupt inputs than GPIOs, and needs to map them when requested.
>
> All sounds like Linux problems...

Let me rephrase in the familiar way: in the case of the latter, the
interrupt number is not a property of the hardware, but depends on
software configuration.

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

