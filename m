Return-Path: <linux-i2c+bounces-8949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 581EBA0483A
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 18:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDD1F7A389C
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 17:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7161F6666;
	Tue,  7 Jan 2025 17:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IjkRd5mZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321D71F37BE
	for <linux-i2c@vger.kernel.org>; Tue,  7 Jan 2025 17:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736270879; cv=none; b=cZgAqWfEHfuN+ROvIdGEXq8A/ayUclThp2MN05Wo/8ABpG1eIHE8UzfR7bKyy3f6vWrP9bId3ijjLsMMtaJV7rlABQ/5msLXYB3AwM7tkCSqpsXa8piIqRxTRkkCUdJUNqLydXJOKDUu84T73Ix149523jK4CBmkuc6VwwTlDYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736270879; c=relaxed/simple;
	bh=c4T5lNNu2R8wdqYU619+cZBSgekeEsdh4POGVa9rVnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9YHK6nslG8kldza94G8EOsS6EeC6MfMkw7Qf4ze8Hzg2KBw2PtOIug4XnEk7TncItxEHNNmDg6oS8tG8vUmKlwtVCBW9aYs/ZuJbLs1zGkm4N7o8GKzvQIE+dy6QgeEt3VV/QtCSbvxwcNQ1BeQBN6sk5TQiNBbNnkJgez38ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IjkRd5mZ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53f22fd6887so14535298e87.2
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2025 09:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736270874; x=1736875674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e6oybH8waw0F1euskY/nJ2JCR+I1f/uoiRiLQitoeM=;
        b=IjkRd5mZ5KGQAHn7xCc6bkj3xcbDOv8qOpLf713jrMxwMc4PV8s0+0Wo7JxvAYUELM
         FIR2g3+OrYMQ1Bo2zfoHfrVfGNSF/Kj9K7pK2z57uTMLuYloH1L2sERZQI2f5jWo60No
         GSdt5RsSHXRDfnO+sWg901wiXH9xV+kNirpj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736270874; x=1736875674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e6oybH8waw0F1euskY/nJ2JCR+I1f/uoiRiLQitoeM=;
        b=f9bKXCX6H8U9uo34Q8vu4BqokzrD4hbkRP5bUR0EVxB3XV4boJDsJ03qiO3SUBwgxU
         oh54yWxVA0DSwuou5rthAI4ypUIGdQ/OLqqEWfSlZey6VnaO2y8DcGwaQNuR13IHe8Uz
         8sHwgOpLGEpUuGzrEHVlQbI7IPX5DHkkhLktDfz/OH97Mqc7OR73IimACGFWI/POfUQF
         /Vvr2ERn1Ryjj/Qrqfq9BdXNBJzXGLRylHOotQYCSTNCTQxCB46CYmjuNE/FfiZ+BPKV
         KnF1y1W+CsdKVgpWevaaiFSjj1YipA/r5YgMl+hcvBXcFiK7lftdnOj8KgEm8wRe+4i8
         EgPA==
X-Forwarded-Encrypted: i=1; AJvYcCUSSNl6QM1Fos9Eu1YhMOWpgeFIEUSFWqMyk8CRfRcAUAr0NMTulwZkICWrv70PVNBnN5u/RtR0+/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywks4uqKcgOb4k5yzyO5vRyrJZni5V8cAxPuVLdqurvjiOt3OMh
	z4/oaNzZb6iigDpkeMKshsc2JPXs+ms5vsjpduACXReoCiUbsUf7x1yv28bnR2+e+L8m17PNy+o
	HQM/1
X-Gm-Gg: ASbGncsc2jHwkuEWnkHW87IKF/oK6UVQuoN0rNcajiZIuNEFJk3RxNUuR64/etTvDVh
	1YnDzk4svzHGPH4T9E/d2/xpoH+Dwd01EB7BN2VO8/yCZcCG+q1oyyNLYjiWu4AHScrqr3EVuC0
	GMs3RZDU6SR25smnN2U+NOFKwnxKrjcjE2DZGjGMdXqf4qGzGZd629rxMobLOhdfOBPr5zD1gkr
	WUK0l1YcH8P2ZRAXuRMnh/a0hg5cgEmdLMAJlbzAMm44ZP2mIPr2UqFW2DjE43Xpet19OVYyBdG
	mPfvXNpK/9UBwNwaqJbalNcM
X-Google-Smtp-Source: AGHT+IGVl9RoAJUlgOPWY7DB51lml6g1cNg/shJjpAYoqBrlreqNUfASqNryPcSe0/n1A9c866ZkAQ==
X-Received: by 2002:a05:6512:1041:b0:540:1dac:c03d with SMTP id 2adb3069b0e04-54229586ef3mr19394814e87.57.1736270873849;
        Tue, 07 Jan 2025 09:27:53 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832ba9sm5313083e87.277.2025.01.07.09.27.53
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:27:53 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3003943288bso179784121fa.0
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2025 09:27:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYlqVGbn07faQxhSuAWuqqLe/Npldn/10ksyU7PnhbyJzc6Me6dCy5w2+XtuhYSyAUA8QAVpXV9Zs=@vger.kernel.org
X-Received: by 2002:a05:6512:2308:b0:540:357a:4aa3 with SMTP id
 2adb3069b0e04-542295404demr19430722e87.28.1736270507695; Tue, 07 Jan 2025
 09:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
 <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com> <CAMuHMdXhEcr-XDpD_RHHU4sxVNS7=iUWUNEwdEwS4pEGYzP39w@mail.gmail.com>
In-Reply-To: <CAMuHMdXhEcr-XDpD_RHHU4sxVNS7=iUWUNEwdEwS4pEGYzP39w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Jan 2025 09:21:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VONgQgohhtO07tQ4Paif_v1h+xrdAT8S8amkCc5rfgGw@mail.gmail.com>
X-Gm-Features: AbW1kvazHgvULSfHqt_0VX8ft9CTn7RJ3u6wjnfVyyyuGT7WJIlXCd5AaiKW4R8
Message-ID: <CAD=FV=VONgQgohhtO07tQ4Paif_v1h+xrdAT8S8amkCc5rfgGw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi

On Wed, Dec 11, 2024 at 12:27=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Doug,
>
> On Tue, Dec 10, 2024 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> > On Tue, Dec 10, 2024 at 6:19=E2=80=AFAM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Each bridge instance creates up to four auxiliary devices with differ=
ent
> > > names.  However, their IDs are always zero, causing duplicate filenam=
e
> > > errors when a system has multiple bridges:
> > >
> > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/t=
i_sn65dsi86.gpio.0'
> > >
> > > Fix this by using a unique instance ID per bridge instance.  The
> > > instance ID is derived from the I2C adapter number and the bridge's I=
2C
> > > address, to support multiple instances on the same bus.
> > >
> > > Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MI=
PI-to-eDP bridge into sub-drivers")

When I applied the patch, the DRM tools ran checkpatch in strict mode
which pointed out that you have too many digits in your "Fixes" hash.
I've adjusted them to make checkpatch happy.


> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > On the White Hawk development board:
> > >
> > >     /sys/bus/auxiliary/devices/
> > >     |-- ti_sn65dsi86.aux.1068
> > >     |-- ti_sn65dsi86.aux.4140
> > >     |-- ti_sn65dsi86.bridge.1068
> > >     |-- ti_sn65dsi86.bridge.4140
> > >     |-- ti_sn65dsi86.gpio.1068
> > >     |-- ti_sn65dsi86.gpio.4140
> > >     |-- ti_sn65dsi86.pwm.1068
> > >     `-- ti_sn65dsi86.pwm.4140
> > >
> > > Discussion after v1:
> > >   - https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.=
1729180470.git.geert+renesas@glider.be
> > >
> > > Notes:
> > >   - While the bridge supports only two possible I2C addresses, I2C
> > >     translators may be present, increasing the address space.  Hence =
the
> > >     instance ID calculation assumes 10-bit addressing.  Perhaps it ma=
kes
> > >     sense to introduce a global I2C helper function for this?
> > >
> > >   - I think this is the simplest solution.  If/when the auxiliary bus
> > >     receives support =C3=A0 la PLATFORM_DEVID_AUTO, the driver can be
> > >     updated.
> > >
> > > v2:
> > >   - Use I2C adapter/address instead of ida_alloc().
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > While I agree with Laurent that having a more automatic solution would
> > be nice, this is small and fixes a real problem. I'd be of the opinion
> > that we should land it.
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Thanks!
>
> > If I personally end up being the person to land it, I'll likely wait
> > until January since I'll be on vacation soon for the holidays and I
> > don't want to check something that's slightly controversial in and
> > then disappear. If someone else feels it's ready to land before then I
> > have no objections.
>
> There is no need to hurry. The only board I have that needs this has
> another issue in its second display pipeline, which will require a
> new driver no one is working on yet.

As promised, I've landed this. In this case I've landed in
drm-misc-next. Even though it's a fix since it didn't sound urgent
enough to land in drm-misc-fixes. Since it changes sysfs paths
slightly, it feels like it would be good to give it extra bake time
and not rush it as a fix.

[1/1] drm/bridge: ti-sn65dsi86: Fix multiple instances
      commit: 574f5ee2c85a00a579549d50e9fc9c6c072ee4c4

-Doug

