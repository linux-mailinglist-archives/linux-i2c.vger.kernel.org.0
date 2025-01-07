Return-Path: <linux-i2c+bounces-8950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7EDA04872
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 18:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AAD97A0655
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 17:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C6018D643;
	Tue,  7 Jan 2025 17:39:34 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65C718C34B;
	Tue,  7 Jan 2025 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271574; cv=none; b=nsTgUvRvD2JhAUAdIXnvldBIR0gOOrnxpVTlS1N7b+3xAHs4cB7cFTBiTgf63VGGDstQhGS3ZERVpromjAztbtkWLTJUICl2RLtw7BL52bUZRRU6gT0cOwJWl/JFm1kPxP6LAjNOOITQOU0d6DasO9sgeX0JYLCAWnArigS0TSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271574; c=relaxed/simple;
	bh=OfIp+Aquec1jrPa9LdMz2MMwu76VNzTtviz4Ln6pnIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TuvPZifRmkeLAfWcRao8byVKRRAQWbGk00/FSwwhv37ZUDMNRahUA807rX7DwGHfWtPQm1Jmbo2RpPP7GkCyCFkyiTxG2155vTqAeWtfTLDFvlJWj6NZ8YpUwsvUH855tcil8u/XojUdvwkL1DSFJ5hxfhDOX4YxGaTuwxCku5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85c4c9349b3so3454528241.3;
        Tue, 07 Jan 2025 09:39:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271567; x=1736876367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaPQPHSvWyyLv8xX7fZJc9IEXHLgtsQ9XIp8Xqiuv3Y=;
        b=szlQXzTnpm8JGLaHWRkq7dgcZBjEM5Vo4FPwN2cwtW5Xm8Uu2U69YgqHwT6hoDIbht
         q6XxpRQULY6lk/aiUAZe9wGrprnRePfDwA913LSC1vf9wuh8oa8wIiej5tCRs54clzw7
         a1R7q3PlbO1TT1QzrYvSjiMcjOOVXuLV0wCXFN3TUmi3nw7WqkGamGqSNjfXZLkvwo41
         xjWbze9k84LyjZpMou59JE2Las8xGA29dMRmkBay/Q3ioElUMJ49aUOohZATLSu+6wTA
         jCsZwOBiaRQ8qGJbUqmvPxom2StLhnay3Vr72XbwK3zyhN51QJr8Opu7YkflDlW1F+vD
         VyWw==
X-Forwarded-Encrypted: i=1; AJvYcCU79rVhOcCtcNM2SsAu3L0GeNR/FrbyZRlr9Y5XrjMEkWVpbWl3o4/W3Wr7y1ONzqi6kqdyuLK+33mEDkT9@vger.kernel.org, AJvYcCWxqVI0WHmy69xHv3R/HL/tFFvON3GGJlMKaTr5nATsqTAkD6DipySee5BQXhfp5XZAs3lfsvwMyvhwot+koFYn7MQ=@vger.kernel.org, AJvYcCXBntDZSTXbMfQ6l9k8KsEGoe7TX9xxNZLYGNd1XlZrEe4UZnf0Uyl8NEdD6gFCkgVLDCLtULnw9Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz21CJC0fVvUqf7epCX1jDUdEB1zHMnoi4HYtfApLApdEfWJ1zt
	zsGQmR+jJx9WZV1pwLWbXpGG1nhd/DnQrNIFj2gSGbkxkbxvSPNJf9W3x+1a
X-Gm-Gg: ASbGncusipMnIGvrJQpQ2EQjgsfv9ldlMRW93Y86ilahK0MS8DDCBOs7GDNmsEwOTmY
	hZ4e4doblKlPoQXYB5Qq5YRVJRzEYW1JeF+qLQeDpcSMVm1Qd6gt18NTkfMg7hBqWyNthv8wSz3
	DrcBTAO1lgYO44jhXWOQ9t2Mqk5bF0IlJkTgXU9tN7F4ITOnarNjZknP2cVbHLawiQZa/Lkj2xE
	uKQcP+mZZTWDtGg8+cnvXRlz26uMxZ1Hn3/wyy2Hsg9TgTizm7Ee50omN60bKaiv+LxpITk5EK7
	8cDBe/r+hXIhUXrGp3M=
X-Google-Smtp-Source: AGHT+IHzl39bfNH18goEhAIFV7+d+rV896TwABv49E+VmHa8zUzClrtsPGydUyz//ndwVG2rrbxaVw==
X-Received: by 2002:a05:6122:180d:b0:50d:5e21:ef39 with SMTP id 71dfb90a1353d-51c6c3570a4mr48477e0c.1.1736271567242;
        Tue, 07 Jan 2025 09:39:27 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68cd9a0asm4673456e0c.36.2025.01.07.09.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:39:26 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4b1279ca1d2so4143325137.3;
        Tue, 07 Jan 2025 09:39:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCFrDhcKrH5VPbMTUWZBUx2A0zRS67q/mAaCyvv+hdg5nrR8mVraSXVq6P0atcrrWUPXuDSblm56g=@vger.kernel.org, AJvYcCWCADbBOByRDy+k5vcitVsDmOFTDi5eWWpKHbJvejqaQgrQexpmA2KWzq1cGjsbxvQ6yNFC2J8xoiD70pnBYqOZous=@vger.kernel.org, AJvYcCXxXKX54H1g5nasuSKBDirYrVm9u9Gjt9Cm8o3iWslj5f1dqY6m8gLfn7hYxhPxDgJkUF1PLQe9gTVYT+Dy@vger.kernel.org
X-Received: by 2002:a05:6102:6d0:b0:4af:f630:7216 with SMTP id
 ada2fe7eead31-4b3d0f2999amr37101137.16.1736271565946; Tue, 07 Jan 2025
 09:39:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
 <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
 <CAMuHMdXhEcr-XDpD_RHHU4sxVNS7=iUWUNEwdEwS4pEGYzP39w@mail.gmail.com> <CAD=FV=VONgQgohhtO07tQ4Paif_v1h+xrdAT8S8amkCc5rfgGw@mail.gmail.com>
In-Reply-To: <CAD=FV=VONgQgohhtO07tQ4Paif_v1h+xrdAT8S8amkCc5rfgGw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jan 2025 18:39:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4w=zpLY0g6hdUN9-NTmmcpaqH5XxCCNSeu6oQsre8fw@mail.gmail.com>
X-Gm-Features: AbW1kvYJhzaw4K-QQnqpEvWHnGuJCeeRQqkPsoHSm_R-F6Oc8WJMTLEzNVdJ0LY
Message-ID: <CAMuHMdW4w=zpLY0g6hdUN9-NTmmcpaqH5XxCCNSeu6oQsre8fw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Doug Anderson <dianders@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Greg KH <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Tue, Jan 7, 2025 at 6:27=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
> On Wed, Dec 11, 2024 at 12:27=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Tue, Dec 10, 2024 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > > On Tue, Dec 10, 2024 at 6:19=E2=80=AFAM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > Each bridge instance creates up to four auxiliary devices with diff=
erent
> > > > names.  However, their IDs are always zero, causing duplicate filen=
ame
> > > > errors when a system has multiple bridges:
> > > >
> > > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices=
/ti_sn65dsi86.gpio.0'
> > > >
> > > > Fix this by using a unique instance ID per bridge instance.  The
> > > > instance ID is derived from the I2C adapter number and the bridge's=
 I2C
> > > > address, to support multiple instances on the same bus.
> > > >
> > > > Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and =
MIPI-to-eDP bridge into sub-drivers")
>
> When I applied the patch, the DRM tools ran checkpatch in strict mode
> which pointed out that you have too many digits in your "Fixes" hash.
> I've adjusted them to make checkpatch happy.

So the DRM tools don't use the latest version from linux-next yet...
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
scripts/checkpatch.pl?id=3D6356f18f09dc0781650c4f128ea48745fa48c415

> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > On the White Hawk development board:
> > > >
> > > >     /sys/bus/auxiliary/devices/
> > > >     |-- ti_sn65dsi86.aux.1068
> > > >     |-- ti_sn65dsi86.aux.4140
> > > >     |-- ti_sn65dsi86.bridge.1068
> > > >     |-- ti_sn65dsi86.bridge.4140
> > > >     |-- ti_sn65dsi86.gpio.1068
> > > >     |-- ti_sn65dsi86.gpio.4140
> > > >     |-- ti_sn65dsi86.pwm.1068
> > > >     `-- ti_sn65dsi86.pwm.4140
> > > >
> > > > Discussion after v1:
> > > >   - https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d=
1.1729180470.git.geert+renesas@glider.be
> > > >
> > > > Notes:
> > > >   - While the bridge supports only two possible I2C addresses, I2C
> > > >     translators may be present, increasing the address space.  Henc=
e the
> > > >     instance ID calculation assumes 10-bit addressing.  Perhaps it =
makes
> > > >     sense to introduce a global I2C helper function for this?
> > > >
> > > >   - I think this is the simplest solution.  If/when the auxiliary b=
us
> > > >     receives support =C3=A0 la PLATFORM_DEVID_AUTO, the driver can =
be
> > > >     updated.
> > > >
> > > > v2:
> > > >   - Use I2C adapter/address instead of ida_alloc().
> > > > ---
> > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > >
> > > While I agree with Laurent that having a more automatic solution woul=
d
> > > be nice, this is small and fixes a real problem. I'd be of the opinio=
n
> > > that we should land it.
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > Thanks!
> >
> > > If I personally end up being the person to land it, I'll likely wait
> > > until January since I'll be on vacation soon for the holidays and I
> > > don't want to check something that's slightly controversial in and
> > > then disappear. If someone else feels it's ready to land before then =
I
> > > have no objections.
> >
> > There is no need to hurry. The only board I have that needs this has
> > another issue in its second display pipeline, which will require a
> > new driver no one is working on yet.
>
> As promised, I've landed this. In this case I've landed in
> drm-misc-next. Even though it's a fix since it didn't sound urgent
> enough to land in drm-misc-fixes. Since it changes sysfs paths
> slightly, it feels like it would be good to give it extra bake time
> and not rush it as a fix.
>
> [1/1] drm/bridge: ti-sn65dsi86: Fix multiple instances
>       commit: 574f5ee2c85a00a579549d50e9fc9c6c072ee4c4

Thanks!

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

