Return-Path: <linux-i2c+bounces-11372-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C8AD6FFE
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 14:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDA9D18956E3
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 12:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EACF72605;
	Thu, 12 Jun 2025 12:17:28 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC062F4315;
	Thu, 12 Jun 2025 12:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730647; cv=none; b=qbyvFOwRv24nEfEyM2Eqazky05f2vVhRF1Up59PNWck+cHidzwOjT6zHHTrwwOX8fPHETLpFHw6MDLLlV7gHvBhrA5GpS2MUzMiguNPDssJOLLFu4voFe2tapUrLFF8La4KxoNLe8eMGTee4Y2x+H/nq0XCkOeorNdszzTdnqlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730647; c=relaxed/simple;
	bh=BAJPS5CTIsKgTtnWWCS8RNglnAj/Nh9iWChoip6rm+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXfBmn+UUMqj8UKo0vZN7DreF6/GVpXR2UD82VOVujBDaus0ntqFBhFrwicKxdQJijOjSvdHyWi09EtoYKu0kbzt23x9OwPybO0laZ4ZNuH9bBUMqKIpcE88yT1EcJS1ZoVR/Ybe9SVqG4SqsTjHnPj8Vj7r044YMzX0+EzBJxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23508d30142so11005825ad.0;
        Thu, 12 Jun 2025 05:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749730645; x=1750335445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoJJcCh5MIZf7vzkudV0p31BxyvL75PyGTQMdM/s56k=;
        b=foOWqDza142eflaLjrts0s1LMUTaonOED3q6utgj+umm7zz/t6fDuUU4M54bHhhHfc
         t+MQOchNuxCuqtGrAE/kYUhweVZ8dlbSneban3EqKjukSixrURgxMavWqkKaIAoGWsBu
         Nuz0qhpPRdfHIvD/ULeVsmPIePvgB4ZlETTepidi5eZg8ACFoux3jRtj7Fuf73ZYaazT
         QwQhb+0huTUy0wBF2pNL7qnMk4YaZIgTsphDqY6w7YXxGCmq0c3HgkpHLt4/3Qf6+VSa
         kJgKFvYSDBUu+gLApW4jWyE6i5ovxwGFDgW3dnu+wxMcwHnHitrslPg7heMajyRaMq3t
         Elaw==
X-Forwarded-Encrypted: i=1; AJvYcCUDNE1kmUuiuuqxXWvZpIh3lpKWuaqBh9G8iPcXnG5n7q7pZo1NQYwUGj64ZgjqPdMtFixoGQXlWR1zEaIff2oTMyQ=@vger.kernel.org, AJvYcCUV26RfxlA1Xvl9eRHAWBwblt18fnbmcbasrGX4Nl0FMBJ1QYkbuUP74HfoklioS28K48tDk41Ay55M@vger.kernel.org, AJvYcCV+vVFytB3p6PRTmApRex8onfDN378GktRY2+925E6ELZgDcY+80mazq0wNDCG2VspHWM2OHyflVs4D@vger.kernel.org, AJvYcCWOvgy6sj+F0M4tGelTp+mWiSfiJqhYFILg1VbRHfPEsKkv6HV7HNJ6MPib9dzp6zAN8/edjpA02bk+n3FZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxbTzElj2ilka6ZqjSJjRZfI9Iu5t9OnjZHVvGV4NmdVJvgsMpT
	nVMVukGNKxdOop3Y2RTHKr7oQfzsC56Z22qT664CeMaxaCmMggw3Idt2ZLdbV04x
X-Gm-Gg: ASbGncsddPF3jcVYiNVAuDa3Ryvd9RRynhuPFUE74+wWxw2oDxuzyUkn0pRYz+0GVp0
	lo2lA5Ru1zRbG27X36kcTc3Un3unpT41Trh4h0klwf81GhfhBziISbEIgxUXEnjJlAOBccZ6wm8
	Jam17mYODw4JVqMy+jfu9WHHJYBOF9jxKzEPS5F+qfBE7fvj9MP9DRpWhsl054bCIoV92gQemcl
	HWN1uS2SiDlLXLHBXwOxQzv0nAjtsYNwj6GmAbcyJQNU7OVk5B1tupVwB4TZQ9HTAROQpch5f2I
	Cv/5a3QPINf3VvvYZbQXXOeGegZ7OQxFpbSAUHfK02AJtXpcGbUwXqwY8nFXw+SyBOdXNN1OhOg
	1cEmLaOHmGlNkDVoJs+VCoWz6CTJ4
X-Google-Smtp-Source: AGHT+IEgFvXq46wHwmacDtJ1o7cDFPAhk1arkDEirrosX113yDofcaYTqcsmzJSga23+U/z6EBclRw==
X-Received: by 2002:a05:6214:2242:b0:6fa:c617:23f0 with SMTP id 6a1803df08f44-6fb3464b734mr60985826d6.27.1749730633452;
        Thu, 12 Jun 2025 05:17:13 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c87430sm9297716d6.117.2025.06.12.05.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 05:17:13 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a58ba6c945so17473001cf.2;
        Thu, 12 Jun 2025 05:17:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2IA5UD/7N1ZCuJn4LOV89By69nPvhV3aXfXJ6LG5UZvolTlCorhJIebdYdAjKWfIKmDMPVLtefe0r3K3w@vger.kernel.org, AJvYcCX2Rk441ZA9skIyLF3ElRSqi8mNCAwFK4S2sYr6aeJZ23O6G5nmOHyMqZNIK8OXZe9gZIoulkkXzxX+@vger.kernel.org, AJvYcCXTod7Luv3fHYUyh5+6sHDzsmfHU3hOewMb3a/AOcwf1xvYQYAqNN8dNPKHO9XT/rnFx58BpnwJ0lqEzxobv1Kb8V4=@vger.kernel.org, AJvYcCXm4H3WSGHe4btzk6lnwufatp8Erj8YqsmxQsB+IgkLX0E2Sbr+6UFDyadMeZSqTGaVvImQxE5F9Qa0@vger.kernel.org
X-Received: by 2002:a05:622a:248b:b0:476:b7cf:4d42 with SMTP id
 d75a77b69052e-4a72298b45amr56780671cf.27.1749730621392; Thu, 12 Jun 2025
 05:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609184114.282732-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250609184114.282732-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609184114.282732-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 14:16:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCYjPP326g9MsnH8p6gM-vy33L4OsFFMGzsZbLbucTUA@mail.gmail.com>
X-Gm-Features: AX0GCFutJDPpULdILFjEorVuhRUPwxUBTaslsCHyRwchuwR_DqFdheZmmW6F7w0
Message-ID: <CAMuHMdUCYjPP326g9MsnH8p6gM-vy33L4OsFFMGzsZbLbucTUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: i2c: renesas,riic: Document RZ/T2H support
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

Hi Prabhakar,

On Mon, 9 Jun 2025 at 20:41, Prabhakar <prabhakar.csengg@gmail.com> wrote:
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
> v1-> v2:
> - Listed the interrupts in the order as mentioned in the
>   HW manual.
> - Renamed the interrupt names to match the HW manual.
> - Added Acked-by and Reviewed-by tags.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> @@ -29,32 +29,46 @@ properties:
>                - renesas,riic-r9a09g056   # RZ/V2N
>            - const: renesas,riic-r9a09g057   # RZ/V2H(P)
>
> -      - const: renesas,riic-r9a09g057   # RZ/V2H(P)
> +      - enum:
> +          - renesas,riic-r9a09g057   # RZ/V2H(P)
> +          - renesas,riic-r9a09g077   # RZ/T2H
>
>    reg:
>      maxItems: 1
>
>    interrupts:
> -    items:
> -      - description: Transmit End Interrupt
> -      - description: Receive Data Full Interrupt
> -      - description: Transmit Data Empty Interrupt
> -      - description: Stop Condition Detection Interrupt
> -      - description: Start Condition Detection Interrupt
> -      - description: NACK Reception Interrupt
> -      - description: Arbitration-Lost Interrupt
> -      - description: Timeout Interrupt
> +    oneOf:
> +      - items:
> +          - description: Transmit End Interrupt
> +          - description: Receive Data Full Interrupt
> +          - description: Transmit Data Empty Interrupt
> +          - description: Stop Condition Detection Interrupt
> +          - description: Start Condition Detection Interrupt
> +          - description: NACK Reception Interrupt
> +          - description: Arbitration-Lost Interrupt
> +          - description: Timeout Interrupt
> +      - items:
> +          - description: Transmit Error Or Event Generation

s/Transmit/Transfer/

> +          - description: Receive Data Full Interrupt
> +          - description: Transmit End Interrupt
> +          - description: Transmit Data Empty Interrupt

The last two don't match the order in the documentation, and the
order in interrupt-names below.

>
>    interrupt-names:
> -    items:
> -      - const: tei
> -      - const: ri
> -      - const: ti
> -      - const: spi
> -      - const: sti
> -      - const: naki
> -      - const: ali
> -      - const: tmoi
> +    oneOf:
> +      - items:
> +          - const: tei
> +          - const: ri
> +          - const: ti
> +          - const: spi
> +          - const: sti
> +          - const: naki
> +          - const: ali
> +          - const: tmoi
> +      - items:
> +          - const: eei
> +          - const: rxi
> +          - const: txi
> +          - const: tei
>
>    clock-frequency:
>      description:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

