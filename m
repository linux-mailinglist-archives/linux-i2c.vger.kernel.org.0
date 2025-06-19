Return-Path: <linux-i2c+bounces-11525-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D324AE07C6
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 15:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13CE516C588
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 13:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9D125D1E6;
	Thu, 19 Jun 2025 13:50:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117FE522A;
	Thu, 19 Jun 2025 13:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341027; cv=none; b=VULcQJFwkvf0dXoPWUx3vKBxCV33b4wMk6Fuu5bp9kwW9ksgvAT1WBaD3H2WxNMGh5EjOtcU2074O4G3u8CK6RCKtv0LvCiDyLW6fZmdH9vkBcEWAiHWIwTbGz2CFaNd1Y00KA6rpn22V/Ph5BNVWUccAphLibOd0yJz01h7o5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341027; c=relaxed/simple;
	bh=17rqwIF9S9LIvpH8YoFd92XwGkAXj+mh597VvniVRQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYF6Nrz/48Z+IuuIPHPl96CRZIk4FveRmZYrx6PLgfZQexbp4bynMK81okn4M3pxYbDSWZpBRV5CUb2vnqtmVo0SbHcdWQ7fxu55uIMi6AWZC18JVzRjBy7SxIDC3vl/YeYUXT1igdal2Ts4ap32/DALvP9QZQ2/yZ54O2wU61k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87f161d449dso582432241.3;
        Thu, 19 Jun 2025 06:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341023; x=1750945823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PA/2Orye8C3qBctW0WFI5cU4GUc9aL2SqWpOnNsdnA=;
        b=GEgL6yCbo+zOs4laLOh0SmIc4fdy6xkWAeSpv0fTJNp77SR6j/FPIAGBX8ECeZP52/
         /dGngZIxCMnnAbYl/1lxCM7jHDYTmyynqY4en0WtaPQCVzTM7MUzK0m6KIezIpTmnLjZ
         5jNqHMF5hTafzyA0HdM2zwuiWJBkr7BC223rCBiik4mpdEPfGbRTot8SGrIbYvxc6iF3
         haN2Lk/s50lFa217uWZVtqUPG82KCSuy5/b0tfIY2aq7YbxZrpR6R3KXy5O/TFxBpJn4
         OaN8LoFxRB+v9Kfu/ipiJ6k4wfsem65/4pY8lxeuSROO/5+pIThbkNdpDygjq3tJYi7Z
         v+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUQvr23+fed4AkzdPUp0SpjYyRdbxyY2I2VI7e2DT47prhYPW1Td6yD+TLqPSKxOriKuv8ysfaa23sfVlkQwcxBTc0=@vger.kernel.org, AJvYcCWXPy2I3XMtrQmBKw7Mttkwvf/pLHq6puHt2PUYlsg98nh65Yx0PZNtn1SEMjtXvJmX/CEBd5ugZ/xT@vger.kernel.org, AJvYcCX/vcabnIp9kc9L2UZtmLLPgYjZw46SpZxShw4A7bwmlm2X2QZpWFaWR+xmAw4vHNr+96dnfeJoNwc719L6@vger.kernel.org, AJvYcCX28EDRwksLaPGnjYOquaqgeKXGQmCgUQXGwzomvuPN9qb/mTBk6iSGmaKmV+GMk4d9SihPzT45FExR@vger.kernel.org
X-Gm-Message-State: AOJu0YxFiWiVqFe5VwL36o/Ol3I4daz/p9LWR7pfvOwSSPJ7aX9uT7OY
	vzm2kJ80bANCT+M92uN60NqqFlxXIFsywnqDYsPnqhmJuAmhnSt2IjN7lCJ9gbXI
X-Gm-Gg: ASbGncsCsAPKMT1GX1fah7RQGhDh14vt55CYi71D2dpM4yPG/m1SBCp0GzFcSyCRFCb
	h9qUuOxF5+aP1x/ZCl47KqGlkbWVk1AYruoxjzQNPFUVR7n+TrfmmB9bWaSAi694PjB5aThUe3C
	SeOBSWEdYb5y+hXF8WMz6YL2hFSM9ccOhdRkOCy63phc3WSUFKu/fNs7sNGgQ6pH8z7RCavxfzs
	jniLaUBG/JGkT5cpBNb8aTCi1znh7ilb2baakAm2vbJaw2Xs0xSpySIjZLuaVrYAZaFt12TuCVS
	rZWE40wgXYLJ6BuKw+zZ8bb9TAOlsUpO7mlbCifPyxkYjkszMgFPr4BlKMoxqmVnOfewfEKcwW+
	+sfTo3JEuvQBHZyC9IF/eD2g6
X-Google-Smtp-Source: AGHT+IHRy1diZ85ChBfviMGFWd3DBbpClp67HtvaIidkA2DkikGzuFX7uVxfkTBj3mTP84t9kabzyQ==
X-Received: by 2002:a05:6102:291e:b0:4e5:ade7:eb7c with SMTP id ada2fe7eead31-4e7f620796bmr15585848137.12.1750341022631;
        Thu, 19 Jun 2025 06:50:22 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7e70c5e17sm2311693137.21.2025.06.19.06.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:50:22 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e7feaae0e1so609828137.2;
        Thu, 19 Jun 2025 06:50:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX7dr0dEGpoHw+EfwLpaeZhhyt3QTSDNZKxkMoZJu17uNe/gbAQjxzXqaCBO+CIkpNAmfgQXAFrDBQh@vger.kernel.org, AJvYcCXk2mrK7EskFraVUDKtKpXG/PjYeP9s2RwSkFB2VKA69fS2xHAiuRFqrniMJGDHtqWUo3HfGYlQqR3ZoCg+mALbeEs=@vger.kernel.org, AJvYcCXtClxbj9/o215csMD2uBJsp439mFsp9e0XDOnrB9luojwOe8i4YHwYKAN9HyWctau2kgtJLOjzj1ud@vger.kernel.org, AJvYcCXtd32Kiw1jDRoD1+2aPI/sSjelQON7iD4CqzwOzEi+3b8LjOyLpuOHufbYzKPoOakgHK5Y1zPDYlQMhYbH@vger.kernel.org
X-Received: by 2002:a05:6102:160d:b0:4e6:df73:f147 with SMTP id
 ada2fe7eead31-4e7f6188a81mr17457976137.11.1750341021249; Thu, 19 Jun 2025
 06:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613113839.102994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250613113839.102994-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250613113839.102994-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 15:50:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRFUb0ht8K4ONhSn8rh7X23=vaxnZuKJ0sLFDRLwOLBA@mail.gmail.com>
X-Gm-Features: Ac12FXy0vX9Oyxu7zFspTipfUwmgTHICoQvKiOwbL8RfYJosuAdocBaODmHex84
Message-ID: <CAMuHMdVRFUb0ht8K4ONhSn8rh7X23=vaxnZuKJ0sLFDRLwOLBA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: i2c: renesas,riic: Document RZ/T2H support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 13:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the I2C Bus Interface (RIIC) found on the Renesas
> RZ/T2H (R9A09G077) SoC. The RIIC IP on this SoC is similar to that on
> the RZ/V2H(P) SoC but supports fewer interrupts, lacks FM+ support and
> does not require resets. Due to these differences, add a new compatible
> string `renesas,riic-r9a09g077` for the RZ/T2H SoC.
>
> Unlike earlier SoCs that use eight distinct interrupts, the RZ/T2H uses
> only four, including a combined error/event interrupt. Update the binding
> schema to reflect this interrupt layout and skip the `resets` property
> check, as it is not required on these SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v2->v3:
> - Replaced Transmit Error -> `Transfer Error`
> - Fixed the order of interrupts in the DT binding
>   documentation to match the HW manual.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

