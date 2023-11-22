Return-Path: <linux-i2c+bounces-388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7897F4E5E
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 18:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FB891C209FE
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 17:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD8824B5A;
	Wed, 22 Nov 2023 17:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GaraeVTi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1B6191
	for <linux-i2c@vger.kernel.org>; Wed, 22 Nov 2023 09:26:39 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-45dadc5bf51so2588479137.2
        for <linux-i2c@vger.kernel.org>; Wed, 22 Nov 2023 09:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700673998; x=1701278798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2shFgJTlJ9h7e3t15BYDPAUoPIZ4uMg+GRBduHwrWE=;
        b=GaraeVTip7HJ4qr8nej5WgeJtW5xWs3FtNGgGPJUvQRMUl2q4/zwnLgEUXKsIF0h9P
         V/aPoXYLzdt1iSb/5ojs0UOyMjpP4ftk+6aoY2qLPVqvHp2xaYLFGo3FUgcfZzvzM3xY
         aHEAxzFMV/CsyqVjS3kYMpJe4NWsebojEr7qRyGFIASwNWhyAX7dCRNNpQtztOLiiQ3j
         Zm34g6RPIMqGBgLntgfgbos+7uMKUoyrnMNiboN4E67x0wz0q9TvXcl9o/E8HjQtwV14
         vd2d2WnRxYlKKs7vm280npjbAcCqTqu0WC45Np4gISUj64Y3bGUs+yJFHIuZSZdaEDXP
         FhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700673998; x=1701278798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2shFgJTlJ9h7e3t15BYDPAUoPIZ4uMg+GRBduHwrWE=;
        b=OgTtm75hEhi1dqSyRZ9JHNYgtATCRzQj+lmwUeg1nAlf4TvRkD1PHKcTyDYVE0knTA
         k8+nKUfsjA4eOQmopiuOgHWvJClrTgPjLJQ3ZUtf8vpaAw5cVw7DNdMyL5IGEwipVfgG
         QL8tDgJJ9/TsqE4Jrc34i3KvCr8lWhNUt4wBb8zQlOyDXkKks0xGmtw+bmZZqi+HKcGS
         Q4gDwPXhQR2Ed16qEUPnu6aWAfsxGCa+KhuzJ86DHHTciVHNj5nBxnJxMGoopgiDmOHo
         yNvBw9weC7w8IBOO+2huoiKiZHxZbSnITalh7WG8Hk2LPDetzEllUqfFLMBxMBTO/9hU
         Xcmw==
X-Gm-Message-State: AOJu0Yz9o4kCkN1qO40AjduPxdsJG2VGlOW0ydhRW9zuBe2GNYvvJcya
	137O/oCS5nb2+gvrIptOkQpZBuXNoNIizQ66K6LHSQ==
X-Google-Smtp-Source: AGHT+IFzi7SMG/LyyZzNBXnCal5MiEtxDZ8q1iycJnu3xy9PsdGdlxKP8z69RACANGv6/CKjF+AbqWMoKIiXGT6/D9k=
X-Received: by 2002:a67:fe5a:0:b0:462:8cc4:745 with SMTP id
 m26-20020a67fe5a000000b004628cc40745mr3170192vsr.22.1700673998778; Wed, 22
 Nov 2023 09:26:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122155916.38037-1-brgl@bgdev.pl> <480fef02-09ed-9a32-d5bb-e7114381220c@axentia.se>
 <CAMRc=Mc_KAX0QWSoL9UEwwjFCD=fHv6ydceSYwaY91C=RkURxA@mail.gmail.com> <978e008b-0787-4204-3d5f-16518f35a3c9@axentia.se>
In-Reply-To: <978e008b-0787-4204-3d5f-16518f35a3c9@axentia.se>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Nov 2023 18:26:27 +0100
Message-ID: <CAMRc=Mfo_N75ByOGe0TRxr__ajZ0fdGmzaVu9ig4uSsyMPSOhA@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: use of_match_ptr()
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 6:14=E2=80=AFPM Peter Rosin <peda@axentia.se> wrote=
:
>
>
> 2023-11-22 at 17:57, Bartosz Golaszewski wrote:
> > On Wed, 22 Nov 2023 at 17:41, Peter Rosin <peda@axentia.se> wrote:
> >>
> >> Hi!
> >>
> >> 2023-11-22 at 16:59, Bartosz Golaszewski wrote:
> >>> -             .of_match_table =3D at24_of_match,
> >>> +             .of_match_table =3D of_match_ptr(at24_of_match),
> >>
> >> If you do that, you will need to also add #ifdef CONFIG_OF around the
> >> at24_of_match definition, of you'll trigger a warning about an unused
> >> const variable (for some configs). I think.
> >>
> >> Cheers,
> >> Peter
> >
> > Nope, no warnings even with W=3D2. This is true for unused functions bu=
t
> > unused data structures are just silently removed.
>
> Then I wonder what the difference is from the following?
>
> https://lore.kernel.org/all/202311161306.opyfcoCY-lkp@intel.com/T/#m3a33d=
c4c3221ae167563bcff70757af776cf07b1
>
> It sure looks like the exact same pattern to me.
> I.e. a static const struct of_device_id paired with of_match_ptr().
>
> CHeers,
> Peter

Ah, we need __maybe_unused here.

Bart

