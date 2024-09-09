Return-Path: <linux-i2c+bounces-6413-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4EA971C81
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 16:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC4B1F2362B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 14:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AD01BA292;
	Mon,  9 Sep 2024 14:28:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EE0146D75;
	Mon,  9 Sep 2024 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725892086; cv=none; b=BZAP6umjc1l+DusS29OF+8vs4v8CIe+VeKXETunVy4UAqNfPMFRoah6r5KVL4LcOEnVPWIYh/NnhF9eM1PvhC66iwmwMD8RAa8EOnxCyDJEPEOWRjeIBCSgcUgImu7l3u9mVNGD29uouxbPaEQvBbc2eI0dw3LHavWBaJzbob9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725892086; c=relaxed/simple;
	bh=Upr2kVJPeIeM/kmdb+9pvBJ2V0ID4O32UEDnljK+yw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUIFtR+luAH12BGxmudlQSdkrKqOU8zIHR/Xu7kodracybnpcMUCCAjYpVZz2FbEzy+fhhTA47i6sPcXY0GVKzhYi6eU/oPaeyRZxCb8UpV/z+Wbt+/wl4ZEB5qA0tZelVc2yaul9KhZEnmTBDHYDHXppMYMjLKPt72LtR55+ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e1d4368ad91so1535044276.0;
        Mon, 09 Sep 2024 07:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725892082; x=1726496882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXkyE1Z714MyovHiivV/drnn/cmkdD/V8e57YXHJufo=;
        b=qfBWPtJhVFe9lyzAuYEhvWG7rCf6KntSxeDYmn1p+08xQ/0EFuc9cP8bcTnlnLGWSa
         DBefelUEuybslokbWttJouWrCZW/Jeh9jT0WYwpujPREVutAcPzsczXlZZKsV9vTEeDo
         dULkKf3V851mXRWBH9qjIp34e/R2OF6sHlMDDa+cF1AJfsdJX1lU+EPHUIwELy013pXM
         Gidn8cVCzi2N2LVUCbCzd+pKBqQ4Wv8SnJ6w546CJjq/hQwq46e5WTECeij2Y9RPiMkK
         J1ZoiOPvOTrJqqorxW/Ej5rWFokf1E/rqXd5bhsESzECcPAZ8Vr/UQKGRdZIZ2ZcDqN1
         FWHg==
X-Forwarded-Encrypted: i=1; AJvYcCV3x9LvT8JtX4ZnfH9++MF4tw4cscQR8RdaZ6lrVOO4klWZSiGFQhHAWdfF+y3/bH3WSYMs0j48VTUSO04QPZc=@vger.kernel.org, AJvYcCWUzhLw1iX7XPxqNvTysaxqZF56zrVgSL+AuXm0KIGVkzmZyZMMAfFxD2TkYQgrqpF/GHZK6WvUBmBpwgkfPvPvTfI=@vger.kernel.org, AJvYcCXvrV8Nn5a05BwCdjzpxzDydAGFpDIy/3dStOjOVFrBXcqzuLwVJSOjmF+7Rj5BvMuYRGqNY9MhPCsU@vger.kernel.org
X-Gm-Message-State: AOJu0YzR0EcY3HWNFDF2pnPVe68fR/SZHkkK28MyHo47pIyEfwggqgKo
	xtP1loQO0oKry8AwQWxdNVyb67sNtAC/dpANEK18SpTj0NrcV1ukicutsQwr
X-Google-Smtp-Source: AGHT+IGsX230Z/gtLB7z9dEoMXgkkyAidsDqGhBpyGP/dFb3orlaEFV/DfJ96wV+HOqtIv85VUqf8w==
X-Received: by 2002:a05:690c:c93:b0:6af:8f7a:28ce with SMTP id 00721157ae682-6db445f32famr95138147b3.20.1725892082353;
        Mon, 09 Sep 2024 07:28:02 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db5c7007c8sm9168737b3.145.2024.09.09.07.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 07:28:02 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6d7073a39dcso48157267b3.1;
        Mon, 09 Sep 2024 07:28:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVr07afTSHnZ3VrAYQu1XE0qqL+Na3xZsZuG3iN8NPHyr3PHLOUkDpKSk577mCsZiDGWS1jQSBa8aJWbNTiQAU=@vger.kernel.org, AJvYcCWGt/ue6PW8w4KlW8KM2nV41rjYNpDQR7xooU1RFbOELeJBjmPycBAh3mNEXcowjo6GHXORgVvVRZD1@vger.kernel.org, AJvYcCXQZUb9HHiX269QdB6P0BFW0jErvjOJb12ITPHtuflezMmcomXj6WrrHYyl06EDras635UILCNs96ZrdrOFd+srwYY=@vger.kernel.org
X-Received: by 2002:a05:690c:3687:b0:6d9:807f:5115 with SMTP id
 00721157ae682-6db2603b6c0mr150438347b3.19.1725892081850; Mon, 09 Sep 2024
 07:28:01 -0700 (PDT)
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
Date: Mon, 9 Sep 2024 16:27:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiY4kxTaiYk3FOmW_JsK5Beyia1w73DA3grL9mu55X_Q@mail.gmail.com>
Message-ID: <CAMuHMdXiY4kxTaiYk3FOmW_JsK5Beyia1w73DA3grL9mu55X_Q@mail.gmail.com>
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

;-)

> > See also the different handling of interrupts and gpios by gpio-keys.
>
> I believe "gpios" is what was originally supported, but now it is
> preferred if GPIOs are used as interrupts then we use interrupts in
> DT.

You really do not want to use gpio-keys with interrupts, unless you
have no choice.  Some shortcomings are outlined in "[PATCH RFC 3/3]
Input: gpio-keys - Fix ghost events with both-edge irqs" [1].
They do not matter for SMBALERT, though.

[1] https://lore.kernel.org/r/356b31ade897af77a06d6567601f038f56b3b2a2.1638=
538079.git.geert+renesas@glider.be

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

