Return-Path: <linux-i2c+bounces-3107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B215B8B0B57
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 15:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52DE61F26791
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 13:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F92215E800;
	Wed, 24 Apr 2024 13:40:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ACC15AABA;
	Wed, 24 Apr 2024 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713966045; cv=none; b=P+kauMyBiF5enpF/tSSAY/WNM+TejZnZfRa7ItqiW39UqXU+BEKC/+2+y342/RVlufp0VqXEKMeI4LSoaQBHFO3dfZUuOq6zyxC3eLZnk0F8RWGgLCzj2/am0MSpUIrfXtgxhnMIMb20ecRV2/pS9Zg7MQVc9SSI8aZuYkbyLLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713966045; c=relaxed/simple;
	bh=9DK4QJ/TCi2B/QX3H6PXVhRwQNGSFim3Fn/8J5m5l5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHJrBij8k4EuKhZmNY88fvWlDWbFUYQuVYXs7Wv0grlNVwPRUPHXjTQeB5hyLrtJQymChKj0ci7pduG44TAEggGn2J7l8/5CAtPKMIvdyMvKsnCShy7jU/X74/HlK1gWLumz5qGwv4o/Ppf+Ukzkn2QaO8oADiaxjkzi+camc0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51bae805c56so2162391e87.0;
        Wed, 24 Apr 2024 06:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713966040; x=1714570840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZ9CwMK3wqk6+/Yp2Zsm6M08mayo4fMD+34z+UfTXVA=;
        b=jkLGLrh436xNDxsmCX2JckyWBinR2TyqTNY0oRJHceDjdi6B34SJoBk72ZvST4l170
         A8EHyhl0qcpcB9BGkVm6laKTqiZCCWJ6BxVxkZ69S7owNt4XSQHdhxT4a5maK/SiaU/2
         yDag7s5/CFenbuYa6vJce3F81h08eGFBHoMSfm5olbCcD8IMFMWL6unkPyIulr4oNUQc
         z/kc+nBnYXXEIA8wiqe1383nt+bqlE0mKAtlOxSFtjUFTifzaGShahUZ2T62xJWWWvRR
         TxNbGrFDm2Ep1zcMVAaEWfGEMnlXWChwQLWrINOhOziQtbALWfNnavZBlN42/ICivKjL
         jgtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdCCaLCoqmbJK8m3WiQHMuV4/NHCxNDoRfv/ds/ccfJ7YdlCWw64A8kOtmX5UncZKFgEh81xqBfaejmG+znSSwPe73w+fHlWdDShf6cDOTMZPBw6KiNXFlIqXwwaNrLUuh0WcyBW9ddMlHpJRrJMs7tzg+52pCcT2UwsKGqNDMxyz6yDQ4Q+irxjC6T6h23pxOHPTj4auU31dzz2d/ODQLkJ+UJDEha6cVaK6ym2Q00Ox35B2R1weah3M=
X-Gm-Message-State: AOJu0Yx1MCGIhLptptQIs/A8WSC3BMjGMYUCIT9PRtKWi9a/k+CZIYuL
	gKL3sH7kmM0Vh9yvztjWJu4AMF9anuXrd2R7ion0VCuHQcrw3GXxqf3pYn9bvHc=
X-Google-Smtp-Source: AGHT+IHYWH4+Gq2S646E7ld6OHN9XiwFpf56LVUY9UItsluc4weuVEZwZSnSoPv8gOpE9IcXGaMKPA==
X-Received: by 2002:ac2:58cc:0:b0:51b:9254:91e2 with SMTP id u12-20020ac258cc000000b0051b925491e2mr1561096lfo.55.1713966039887;
        Wed, 24 Apr 2024 06:40:39 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id c7-20020a197607000000b00516c51b3e29sm2423139lff.143.2024.04.24.06.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 06:40:39 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so8518967e87.2;
        Wed, 24 Apr 2024 06:40:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2fDZ0yQSj/nK3P+z/h79/2EOSA1gs417apj8Uh5FTPidqkbZWS8ybHmGkomhsDiBSVeHERhrqCZthH/VhCT9iydqSjikgVvDinHW90DeB6cS4SGRO+v17iQ1cvOwz1a3qHIYgib4E//vbS7VNnKuoBnI45qVwG/ibLNQqUJgVMu8h3PGibcHRPOWPBJGnkxQtzUzGHuzePbzVvoWVjGc4zmhBEICqGbs04fJImto3ZBmoJRasgDHqbUQ=
X-Received: by 2002:a05:6512:3253:b0:516:dd4f:d9ea with SMTP id
 c19-20020a056512325300b00516dd4fd9eamr1661058lfr.5.1713966039011; Wed, 24 Apr
 2024 06:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411235623.1260061-1-saravanak@google.com>
In-Reply-To: <20240411235623.1260061-1-saravanak@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Apr 2024 15:40:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUS-YX7tTEF0216wk+DdCbWCJ0z1huSj8cjRXp8GxJ5gg@mail.gmail.com>
Message-ID: <CAMuHMdUS-YX7tTEF0216wk+DdCbWCJ0z1huSj8cjRXp8GxJ5gg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] fw_devlink overlay fix
To: Saravana Kannan <saravanak@google.com>
Cc: Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	kernel-team@android.com, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Saravana,

On Fri, Apr 12, 2024 at 1:56=E2=80=AFAM Saravana Kannan <saravanak@google.c=
om> wrote:
> Overlays don't work correctly with fw_devlink. This patch series fixes
> it. This series is now ready for review and merging once Geert and Herve
> give they Tested-by.
>
> Geert and Herve,
>
> This patch series should hopefully fix both of your use cases [1][2][3].
> Can you please check to make sure the device links created to/from the
> overlay devices are to/from the right ones?

Unfortunately it doesn't, and the result is worse than v2.

After applying the first patch (the revert), the issue reported in
[1] is back, as expected.

After applying both patches, that issue is not fixed, i.e. I still
need an add/rm/add cycle to instantiate the devices from the overlay.

/sys/class/devlink shows one extra link after the first add:
platform:e6060000.pinctrl--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:e6e90000.=
spi

> [1] - https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=
=3D9F9rZ+-KzjOg@mail.gmail.com/

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

