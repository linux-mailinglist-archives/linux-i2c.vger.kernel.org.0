Return-Path: <linux-i2c+bounces-11262-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C81AD0308
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 15:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD5F9189DC3B
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 13:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB65288C1E;
	Fri,  6 Jun 2025 13:21:48 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE8320330;
	Fri,  6 Jun 2025 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749216108; cv=none; b=W/TAjhpOtPwxPDsweYPMU8HvblMH0MNaQG/dfSXYL3nhxJ/5RdJ+e4IsKdQGtWNXXRskAVL4oLKIS5Kq/yNDkjtNs27W8ijPox58zKOparEJmtKw49c5OqYTqUKiROtzLF04qlR1OyCqaLOcpvqzuP6Np186TNQGFTmgVLtlfCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749216108; c=relaxed/simple;
	bh=Zc3hOlE1rh4BeCCJuVCK2t0CTBXnExBS3agU5ssS/Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBSE7SbQZadGCzT2dRUi0R3gRPmW7mt6YieGRqHk2ee4NwQ4e+VUsRPr/N2nsOdjohZhrak8qcpLW/bU4qgN/zwHstkLgGldsBbWBfl38C2OBzhfogyJWguAuoVQlKf3mqze/sR3oMJmVjJ+53lhRl9NHvLVNDq1Bh/ESSYHGBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87ec4d69b12so68092241.1;
        Fri, 06 Jun 2025 06:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749216105; x=1749820905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5SHPgJGpGwWRpAKXV7TD2IvmmZsZIIUaR3p49SfxukY=;
        b=cRyjiXPoWB8TvAm/gyw+t1UR/xQdaBg0zdqjEHwOIB1uiX2UNl/sobCFyWIVJSFThR
         n65swkSlPUH7+6n5/rwq8zfyi7OtesvSPf4QaGknaZo3y7ug5zlMOcET3saqAKMzx1Q2
         iO46eC4x58s6exZ91LgCJ32yMGRDW9PQJgf5yPr+hvHwWqVQG73YjwwE2gfD6qVvOZSE
         R0IrQhVAR2sEGKf5cSO7YfyCf71pUk/BaT2j3zP67dzHc4D+ZH0uA60p8c2iN243CSf+
         q608IFRSz8NIxZJgPhGNXZZEonEN0h6yL0c9f9AGW6Z8YSLCw2bz69HUR/SEir3OG1nQ
         9k3A==
X-Forwarded-Encrypted: i=1; AJvYcCUa2RgczKWthvuwRzVojYyHXr9jhxT6Abow99AIpmaxUhBDgZGtxkJx95hZuhFXuI7TiRE5D8PhwwpO+9b7@vger.kernel.org, AJvYcCV3XIrnM/XpfEhhZP75ArzVGkS3A9Z6FFcFgoIy0VEgi1WSc8tUOrEvKspFr+P1Pdaw9tVVh2fEMUfn@vger.kernel.org, AJvYcCV5PID3I/IlZJ1ReMeU2cqNpYheWYQx9YMYu/gM/PiuYFGziwjO8CBkDj+nCfhlT9VulrZ25ae10ERh@vger.kernel.org, AJvYcCXygsh6zWNPHT0qpVo36TcU9Eq25cHWqXAl0aqwpSKraofDN7N33CfqDobw9BqQyCoks9dbRObzKFt6C/UbXq6mCXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHBWdqsjthYPsdQWmvhW3Frks3BocaSmtCDcyC5nKVe0G3QzEY
	2gbIPAA36J4GuKhe1GwZcRc1KSi01pEfgDKzgWQCYqIQFDeD0ttSD5SA5ZHR/Ato
X-Gm-Gg: ASbGnctU1ido/mJpYHdo1TB7lvHI9LzwrQXHpGIRrM4G7cn9lcrpvkT730eN4tg++rA
	760FYM9xRP+yPV8oTu9h4kGI/cDD5lBbswH24aVEk5B3n7DgdtpSKV66L6ObQmSECE6QH5C9MkB
	xBMVz/Zl/SEqQB1MucNSAvDWdmkirxJORel2Egn+d2X7MgHL3lSQCKhkLj0Ja/BnghRs2r/9tnb
	DtZnHPhlMi0pw7R0r0Et/lWzrgtQzU7gFpFt1hI/wNj5sDB9hW/a85JU4uyHq0Ea9g748ZapSGB
	hq9fw6RJbtbxoavet4wtCKOgLMHnkdGAYUsHONKJ6CaAoIYJQ81aUTdnRBUJSSTTXlfqxpGfT0b
	3YdwhN8fTpNnGvkI3x91Ex8rn
X-Google-Smtp-Source: AGHT+IGh9IE7imcdH3O8AsrnNV5dQ13WBR36cIaiMVuHG/0MuHPKcPAAI66x/OVcX8PpJHWDuO34HQ==
X-Received: by 2002:a05:6122:926:b0:530:533c:1f6d with SMTP id 71dfb90a1353d-530e48d2947mr3035897e0c.11.1749216104774;
        Fri, 06 Jun 2025 06:21:44 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e63e4170sm1082274e0c.27.2025.06.06.06.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 06:21:44 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e58a9bb8fcso636298137.2;
        Fri, 06 Jun 2025 06:21:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/j72tkcMoZHrbHRNajahiCydA02yBab4ZlljtZh9AcR3mv8w/KpUQLcJ0a8hhJJ9qYvznjK953UqN@vger.kernel.org, AJvYcCV3BB8neHyXyl/eK51uyR+m4dF3+l78rlA9HjfWHUrkC+LkrjEpnBblgIt8LTlI1Dv5frj8mLdy3mXh/nao92KvkGc=@vger.kernel.org, AJvYcCW4aPvN4UKjqHzsnP3Nt8WhfNJzS36nMYowawg/n1U2xc4HO4KfsrlCDrcgLuePCgOs+9o3D46FQBbvJkMd@vger.kernel.org, AJvYcCWK37T4By7gLgr27cTBDLr3trp9CATgoNHaRrCrtraITmd33afVPI55P64o2CSghh54QQoi/uWmDDkC@vger.kernel.org
X-Received: by 2002:a05:6102:1486:b0:4e4:8362:dce9 with SMTP id
 ada2fe7eead31-4e7729ad87cmr2873795137.9.1749216104213; Fri, 06 Jun 2025
 06:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250530143135.366417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530143135.366417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 15:21:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXO1fOODiDA4vQBT=+LKRjT5ZoeewdyPSDoTeeoqUVTSA@mail.gmail.com>
X-Gm-Features: AX0GCFtvhT3pJFghdGRenMhq10cIBWx14-LLPjr4W6t770WjmYutVYh9IEnSwY0
Message-ID: <CAMuHMdXO1fOODiDA4vQBT=+LKRjT5ZoeewdyPSDoTeeoqUVTSA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: i2c: renesas,riic: Document RZ/T2H support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 30 May 2025 at 16:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
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

Thanks for your patch!

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
> +          - description: Transmit End Interrupt
> +          - description: Receive Data Full Interrupt
> +          - description: Transmit Data Empty Interrupt
> +          - description: Transmit error or event Interrupt

Nit: the documentation calls it "Transfer error or event generation".

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
> +          - const: tei
> +          - const: ri
> +          - const: ti

Given you have a new set of names, perhaps "rxi" and "txi",
to match the documentation?

> +          - const: eei

Perhaps use the order from the documentation: eei, rxi, txi, tei?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

