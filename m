Return-Path: <linux-i2c+bounces-4308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 574BA9152AB
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 17:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 892A01C211C7
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 15:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6540B19CD07;
	Mon, 24 Jun 2024 15:41:12 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96991DA21;
	Mon, 24 Jun 2024 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719243672; cv=none; b=bI3eFJ+xahV/KwadhM3EuPIdhPRZxnQWIyAwhT0Q6yT8xnSuxyHwj2pPkObEsFeXlu9oLiCDmk3HoWoKCDVpvFkQDVR0lUDNMBYBqcewqeJPNIfV+DiKvGXZ9vj653PGIt8RGEdjgjYx+aQbnd/9tg9QRzeGU6gQZEdki4XZGyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719243672; c=relaxed/simple;
	bh=N4Kf7Wuxy/4F/YKVzwXuyiruxJFedNgB2d/xx3ewM1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvzsmxgFnFeEbaYWfX5AQIyuw8ssMqCTlJY8GVltqwMntnbrUJe/wzkdExzFQSopV1LoB0/bBR/+7e6pTNkfDqBhjrcyBze/squ2tffnRrLEL0OPbTYI0LAMYgLggGkIts4diiWXJiCJT1eTPld7NCaZsYGbtUatRMzCOORdF5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-645808a3294so7296797b3.3;
        Mon, 24 Jun 2024 08:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243669; x=1719848469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyyZLKfbybyoHW1pomgo1ltrgcPpRsjdS5hXpqQgAyU=;
        b=q7svj8yzhICghkVRJhNZFsC4mfAnDLiaB60k3m4AAIBfD7hrKnsgol3PHoQvHMg20L
         lVs4zeIEpvBI7v5IVOiqQoTtq6vDmx+JnEuCsR44UOcdZZXAYmOyIcbIcOWMeUi2dpWn
         jzOC8cP9xF8AWF1Ni4iM5FD/MY6P87xgYDEzKwaAFZ45urYe+UbX7MU3MYemYLHTOijN
         Suy+msLx6/iv7Hp7U5D5Z0Hg28eKQbSxgG8h1PzlhQt45BEDR1I79G83pAP+a+yBVueA
         HTBHZjkBbFN82o5apgY2Gd+lm3Z0XvbkXAmiL3DZMwSIJff1HcrwDHpE8BT9bWk1tb/p
         lDiA==
X-Forwarded-Encrypted: i=1; AJvYcCUoevDyO3cnQVdJjk/40KR242wiv89dSL7iH6V2lDqP3goOaMmrwOZ2MrOz/JdNDUN8rBXO6Rg451qxDmuEZA0bejeunySFhICSKWJkssNRJhB85/ke3oL5jX0LiuMtKopVtwvaQWadIHXFzKxHD0JSKGEYSMhlROgfwsgroWbAOOV3IiaKrFpOCiqJ0TXWFc2YKuZkDn2FkR00kcWfkiw8lS9IivUG9SKPHYj5J7AII3D36Pvp0wv8QS2fiDC/nCVd
X-Gm-Message-State: AOJu0YxODiwArWQEpAauriTHgtFTioRvi1/oKmqwI5Cm2nxDS5um210L
	StyOo3Fyz43lVgoXc5Lz78Tl9Nnpqs1Fh65lFEjBrVXp0n9cCFMVIIMrpNra
X-Google-Smtp-Source: AGHT+IHOF6I9BBSjYho30m6qIXh6XBnnpsOwooEsiBDSNpOIZzhhPjm7NCumeBH8UBtWc7pntCLGdg==
X-Received: by 2002:a0d:c3c2:0:b0:631:3c7c:f766 with SMTP id 00721157ae682-64340ea9a89mr48626827b3.34.1719243668622;
        Mon, 24 Jun 2024 08:41:08 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f14c26102sm29111467b3.75.2024.06.24.08.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 08:41:08 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso4279281276.2;
        Mon, 24 Jun 2024 08:41:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULCC3ncAztxjHXNng8H6X/tsccXlHwsbkdc3kdWK49cofZO4Yg1ta3VTPw3wK9jdyw5pncPE/S+Ab3292bnwcncirwKAF/Yx6QidYAQPR8gcXZ/7sohZg0TKDj2Vn5dILLN+RcCmrUizSLfZ6OT8MXjVdQHvRxd2vs/aero3PmvRAtsh4+NluDA4wvcJe2xoI8Y44vhd0qkMK5HxIWuzfREXzJc0/I+lI6S6IZ4PuKTKFcT0HLrMzsSg9HWJYURGt9
X-Received: by 2002:a25:b11f:0:b0:dff:3028:4631 with SMTP id
 3f1490d57ef6-e0300f86570mr5309852276.33.1719243668079; Mon, 24 Jun 2024
 08:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com> <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jun 2024 17:40:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULaO2dH_wrcM5P6=rDYzRXcMSGfVsBz3okWPGjOsMN4A@mail.gmail.com>
Message-ID: <CAMuHMdULaO2dH_wrcM5P6=rDYzRXcMSGfVsBz3okWPGjOsMN4A@mail.gmail.com>
Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Fri, Jun 21, 2024 at 1:23=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
> the version available on Renesas RZ/V2H (R9A09G075). Most of the IP
> variants that the RIIC driver is working with supports fast mode plus.
> However, it happens that on the same SoC to have IP instatiations that
> support fast mode plus as well as IP instantiation that doesn't support
> it. For this, introduced the renesas,riic-no-fast-mode-plus property.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> @@ -25,6 +25,10 @@ properties:
>                - renesas,riic-r9a07g054  # RZ/V2L
>            - const: renesas,riic-rz      # RZ/A or RZ/G2L
>
> +      - items:
> +          - const: renesas,riic-r9a08g045   # RZ/G3S
> +          - const: renesas,riic-r9a09g057
> +

LGTM.

>        - const: renesas,riic-r9a09g057   # RZ/V2H(P)
>
>    reg:
> @@ -66,6 +70,10 @@ properties:
>    resets:
>      maxItems: 1
>
> +  renesas,riic-no-fast-mode-plus:
> +    description: specifies if fast mode plus is not supported
> +    type: boolean
> +

Do you really need this?
The bus' clock-frequency property should take into account the combined
capabilities of all of controller, target, and wiring.  It is up to the
DTS writer to validate that all timing conditions are met.

>  required:
>    - compatible
>    - reg

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

