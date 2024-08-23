Return-Path: <linux-i2c+bounces-5733-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD4195CBDF
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 13:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F53C1F22E5F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 11:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC455188580;
	Fri, 23 Aug 2024 11:59:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357B1153800;
	Fri, 23 Aug 2024 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724414356; cv=none; b=HCwOZbvIK5r0wx3pR2BImRDEdpX8AUGkmocTJ+zqhItM3kCxgsxez5PX+mvjxLc9xZpXZmDyo+4IJY1MbkG3zHXjseYIX/3sv9emiEGIJygiFzuV0v43wmR7bQQQprg+im+GgxRgY9tbPm34jS3kMzkz3BWlmDvDM5Cim0UpRCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724414356; c=relaxed/simple;
	bh=8B23v5X+cS3cd2kmxb5OqNt7C2K6ZA5vibIL2GdmWsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6gnYE/9KaJJT9s6pWNZVyqqva4xMZlMAxa0bbNnhjSBczguIwoHRdvSGCamzX5cG1z2fV2cxUPnOgm1SM+b/L8z7bX6N5OrDNv2VrMjs1ZNIiJH6XQ1iod8KLByT8TGJbMl9VEH71F8D+CSAS+7kSUbASu1cMdC8sRpGg2xcOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso1941734276.2;
        Fri, 23 Aug 2024 04:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724414353; x=1725019153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/hFk9Gce8EiP6CDoZ9pcsvjfhydJPd8nR5lhPBP2rg=;
        b=dWPMliLJXXmirciHx7tCEUUwkmGjcaVrFEi23vdl7feUZdPAoSsWKEkx1wwWSFzuuU
         C8xzCXMtIwByA8edF3DGJCbM+5PVt+KE8Oi+NAkwGK9rwFTZOwHDLNoQOn9+b63gz7QL
         3SATyfbi1kFl2HOG2Yp1VG5S6sEc76bGQiQJ+R4SzpcrrRmFHcq/mUNJ5RXDHDvtlAle
         ghd05eCoMj0JKHG3Ck4GSfKtggK1yk1P6bjKTe2bRxiK/Z/tu1Qu6zO4MLh2RWXExYxc
         MHtmw9/7iNLDxdUcp586V8jkmRk1kdbLmRXXbEV2JXxrbJwr8Afc8KtMCRRCPKVcQQEN
         pb/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOWi4H15CFtY/47iuvv4SnLx3VqEocgyCjI0zmp8Oy7kHCvqKg37OIzPRIFdQviWWOz65fQeMYQZjCyfMZCDjGUWg=@vger.kernel.org, AJvYcCVg1+xXsUxSt7YEPkvbinZErbudAcXaRcNqGiYD2uTIC4uOgRo2HCfe6wbq3+l3tgWQc5z5p6XvNHdP@vger.kernel.org, AJvYcCVubitoodfveb7cIeAKfxul6suqB7sCNRO+IKd1InXeEnaOdXuP+aamt6MEnHJV/xNNGeu1OMy/MzFsiUyW@vger.kernel.org, AJvYcCW5p6on18RVs2fR1NJ/8bYxXv2XdbozegDLt9YUbu7B3p2CzPj5Iz4/Lh8PLqwscT3MRXVako0gVq8C@vger.kernel.org
X-Gm-Message-State: AOJu0YyI1TQL39j1x4yP77D23l7UIG4k9V8debjLwxD0ggFJu8b10DSw
	wvJC6PgWgtHsqxeGsPuXm27p9c6xe3upegbQJt82Rcl36uJkdiJJ0zsY3vGT
X-Google-Smtp-Source: AGHT+IHN/+dPr2jAblZWQIaEvLRSpx707djk+CJWw27rTLChhyWJZPURJ1mCTBimOCnkWiuTb6PcJA==
X-Received: by 2002:a05:6902:1ac2:b0:e11:7e70:a9b2 with SMTP id 3f1490d57ef6-e17a864da59mr1948400276.42.1724414352971;
        Fri, 23 Aug 2024 04:59:12 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e463e9csm624180276.25.2024.08.23.04.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 04:59:12 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6b44dd520ceso19316167b3.0;
        Fri, 23 Aug 2024 04:59:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUq3gkpELWpXwhyBwVII6EKpyOsW/EdGOw42x/3BAy0GhyJyuwz/aYruJT2PvKQhO240fS7MQwoqM86@vger.kernel.org, AJvYcCW1OP/PyX3Q25L7jEwDATHawTZnDQbu8+krQ3BJtcTyKZqnVfbQoGrs0Dgr7qmENZFKkNR7hYaKHkKLblPyl3pbCt4=@vger.kernel.org, AJvYcCWKVAzhIOkl53OyUL+Fm+ah0Dp4aR57i4CowjKp/xV4fQJmwOT6kYyYIJ3JPX9+2y7T8Mya0kQ/e3LlTtkQ@vger.kernel.org, AJvYcCXL9JSlX4C8MadWvpFHrxAF3KqhgdfOKqGcr7VjxuqZnJjs3JyDG5xunVFam2psdqJQDybLmMes0hWQ@vger.kernel.org
X-Received: by 2002:a05:690c:2e0c:b0:643:9333:9836 with SMTP id
 00721157ae682-6c62906578bmr18037637b3.38.1724414352454; Fri, 23 Aug 2024
 04:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com> <20240820101918.2384635-11-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240820101918.2384635-11-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 13:59:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzLksUj5HaxHrv8KRvmwOt1uGLd4QQM3Xk0vx8fD==dQ@mail.gmail.com>
Message-ID: <CAMuHMdWzLksUj5HaxHrv8KRvmwOt1uGLd4QQM3Xk0vx8fD==dQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 12:19=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable i2c0 node.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

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

