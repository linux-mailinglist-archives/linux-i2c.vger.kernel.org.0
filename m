Return-Path: <linux-i2c+bounces-8444-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5539EC727
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 09:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB0EF287439
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 08:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8112B1D89E5;
	Wed, 11 Dec 2024 08:27:39 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0D41D88D0;
	Wed, 11 Dec 2024 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905659; cv=none; b=G04PGnCWEWtXBhVb/IHo41auMZlu62o6gZnmTuvnflSXyWowtjJcMIk+N175tRH260rHsIWB/bhFlLY3Fj0vrObj+uHubDW49Z5mftIoShf4e18zQuF7Zk9xtXFMIHZjRkshTmFmrH5T6OJHPmzNCAY/D6bfTSBkBSxsvf+2Zbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905659; c=relaxed/simple;
	bh=F0aFH9YNz6TgHOndINh8XwAqnw2zsB734R+wc1YHRt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqmxsgZftME2W4Y4rwJW/O+bNuxTcbYikpVlZe12PUxYeXH50H1mreDoOUEOfCiDN8GWPkxqvecwHo02WYzrD+80aXaz2JClIYX1UdEmhnxC4EC+ymX2xyuZ5wLRLyHHjfiu8Xk9ojMECAPDT+FV5WNrpV2MV9ykQjxbgotEB40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5187f6f7bcaso879348e0c.3;
        Wed, 11 Dec 2024 00:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905655; x=1734510455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/Dej2kYyG3z1bxICL2ZGhKcyvgd9hc7ze7odnxVC8k=;
        b=kEPxsPF8rIOQPdoHC0wuIjy1XOWwseVy4yc8hXTPXWzGk3S0rvrHop1pakJrbxxxs6
         jc6Oh+VK+E3jU9WeCmlnznJBUNqD/pUBSQVTieuwPtPtZ6WHJoOJPqwJiF8nC9hSYuNt
         Uxmqbwf737MYakwqQluKY2SjJgYBfqEWA4drWArSjundi0TopB70/BzS0W7Hf6qZlc4s
         MLN6RuXL+7y2IXkYMN0wkx9WXx959uaQgdeMGouHq4AV5m7y9tTaO8a6Pw6uim/R3SgZ
         k0C2t/H2J62pKByqMBgDYtOYXrRs8mAQB7Pkad5K7bkpKI5WfvnIrKoozDd55IQgb2gh
         4c6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4c79j2pEMFb/D1u1jarPW8U3wJZ/iIgIKMMpeN1lbkMtEvN9sLUA1JII+h/ohH+LNCu/522g9X/dwLY3@vger.kernel.org, AJvYcCVaUHwQYe8X+QSM4Quughi0yu1CjPIm5asRHCIjGuqxxbjYzEn0z1QT/ND03WUUv1drc+uGLQuzS2I=@vger.kernel.org, AJvYcCVqYhf7jTLXjzhnLBiXl/L92r8VUxNmKuGnFel4bSi/xwgQplYCW9AElbVF78BC9Hg/aHzfoZ54q61qZg1y2Cwbcc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaNQKHRFZjeCi/g9TkSKrIh/8b04SGFip2mx7e8HyNmTr5W44z
	ILeVKaa1wLfkWXNeHcsrAe84PTX9+eIpDRPQ1T2wu98xWDol2u207gpa97FT
X-Gm-Gg: ASbGnct9cXLhfMzOXurQiC4mE4qWPRtd9B/XSVnRvDKEHmUrkG8Y1BOPQAgG8H11+T0
	3GNQzxGBJ/NwLkdPIHNRUijfRA3o21JCB7yaiuAPmplNxkKcPN/ZvU1okQapV2ASFk/AZChvdM/
	eD6ba/DQHZPQ4fkbKm8ViKEuGiFPBHzJDXG4ouYu+tk6hDIopxOO7+jubdbI9f20EtluWAsROTY
	p/axAkJluZlJ75498kS+HKggngvFw065Pj1FulmYNb2bTPMLkZVidwZlRJfACir55/ULrYyAZWq
	yYiXZzg0YdynM1QZ
X-Google-Smtp-Source: AGHT+IGbojCh5Sge/N6aRpNKpQGvm66IWMrrUWr1RITO6zjFeYqrNRsGiXOuPjdgEnrDIc2YhdwccA==
X-Received: by 2002:a05:6122:3a04:b0:518:8bfe:d5f0 with SMTP id 71dfb90a1353d-518a37a48c2mr2048756e0c.0.1733905655209;
        Wed, 11 Dec 2024 00:27:35 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5187a500e9bsm501798e0c.16.2024.12.11.00.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 00:27:34 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85c5316f15cso982580241.1;
        Wed, 11 Dec 2024 00:27:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZVBWWsjxXD9JmXcr7g4SFAsEacBWJ4+po8lMAtf2bvegnBKaPkTOr2bHEOcwWqH7rXiUMHsKX/EIdm34GrKX9z98=@vger.kernel.org, AJvYcCUnLJdRVdGdu03fo6ZmariL9n8XLPq1lbvUzbZ8cnOy7dUI98jzesq6dY1m/nZfydgH7BriVjwybvk=@vger.kernel.org, AJvYcCXnPaPQv9LliGjKEeWhoKI+4dDc4fjr8hrCurGxjiy8eABq5CnPY2AP+9UQDfEvXiZZFyNJnhTWOnMdX0hH@vger.kernel.org
X-Received: by 2002:a05:6102:41a7:b0:4b1:16f8:efc4 with SMTP id
 ada2fe7eead31-4b128fd7418mr1958963137.12.1733905653978; Wed, 11 Dec 2024
 00:27:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
 <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
In-Reply-To: <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 09:27:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXhEcr-XDpD_RHHU4sxVNS7=iUWUNEwdEwS4pEGYzP39w@mail.gmail.com>
Message-ID: <CAMuHMdXhEcr-XDpD_RHHU4sxVNS7=iUWUNEwdEwS4pEGYzP39w@mail.gmail.com>
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

On Tue, Dec 10, 2024 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
> On Tue, Dec 10, 2024 at 6:19=E2=80=AFAM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Each bridge instance creates up to four auxiliary devices with differen=
t
> > names.  However, their IDs are always zero, causing duplicate filename
> > errors when a system has multiple bridges:
> >
> >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_=
sn65dsi86.gpio.0'
> >
> > Fix this by using a unique instance ID per bridge instance.  The
> > instance ID is derived from the I2C adapter number and the bridge's I2C
> > address, to support multiple instances on the same bus.
> >
> > Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI=
-to-eDP bridge into sub-drivers")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > On the White Hawk development board:
> >
> >     /sys/bus/auxiliary/devices/
> >     |-- ti_sn65dsi86.aux.1068
> >     |-- ti_sn65dsi86.aux.4140
> >     |-- ti_sn65dsi86.bridge.1068
> >     |-- ti_sn65dsi86.bridge.4140
> >     |-- ti_sn65dsi86.gpio.1068
> >     |-- ti_sn65dsi86.gpio.4140
> >     |-- ti_sn65dsi86.pwm.1068
> >     `-- ti_sn65dsi86.pwm.4140
> >
> > Discussion after v1:
> >   - https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.17=
29180470.git.geert+renesas@glider.be
> >
> > Notes:
> >   - While the bridge supports only two possible I2C addresses, I2C
> >     translators may be present, increasing the address space.  Hence th=
e
> >     instance ID calculation assumes 10-bit addressing.  Perhaps it make=
s
> >     sense to introduce a global I2C helper function for this?
> >
> >   - I think this is the simplest solution.  If/when the auxiliary bus
> >     receives support =C3=A0 la PLATFORM_DEVID_AUTO, the driver can be
> >     updated.
> >
> > v2:
> >   - Use I2C adapter/address instead of ida_alloc().
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> While I agree with Laurent that having a more automatic solution would
> be nice, this is small and fixes a real problem. I'd be of the opinion
> that we should land it.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!

> If I personally end up being the person to land it, I'll likely wait
> until January since I'll be on vacation soon for the holidays and I
> don't want to check something that's slightly controversial in and
> then disappear. If someone else feels it's ready to land before then I
> have no objections.

There is no need to hurry. The only board I have that needs this has
another issue in its second display pipeline, which will require a
new driver no one is working on yet.

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

