Return-Path: <linux-i2c+bounces-13544-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEBEBDF696
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 17:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EAA504F16B4
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 15:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8C72FF174;
	Wed, 15 Oct 2025 15:36:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5B8305966
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542572; cv=none; b=sHikcQyEXzbCgqnC+z/NyQHe3PKXXLQSU76NUi9YBzzFHVTpToBkWFpteiKybNbBBmP5t3HYMBtG1Ry2FC1YEMY89NWcHouiCaviqS9PKZ6jwne9dl/TramzlT6IrvR+yMHQQngrWRG1GVDm9mYVz6NsTcqd09IEsHCWXrA1N3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542572; c=relaxed/simple;
	bh=I6P15+XhidIm4wEGq3EBOacS03cItxiFUaa6LkWs8hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWJjQDeFdBJeWiBoofhVuCnLQgvQRqsjJZDw5VoKrFgAZRvLRD/a0F76brVNlrvgG9uwb14BLFDVbQR8bG2iAezK01tSA0qxa9TBEpP3i5Prt2qaTWMQfgmhfc7118LdupQeUFo2hzvj4mSexzu1x7UKZjh+pnYaT+v2rR08wP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5523142df73so4409048e0c.1
        for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 08:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760542570; x=1761147370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNmUCrYMJqR/KXnbLWdaSqa9Gxw7R7jjIcZiaJXQXIA=;
        b=iZ98iCtNq2tk7r9/D1d7Guwzo9Zlaok6ElSoLsZAcET0nIKk6Ux9AnzKhkQZoGCwi6
         cUbqhQMiTIIzQvRMUWr5Qq5e2B6VstgjXWOq0oTWfzcKtsTk2bhEcof20KUo1V98yj+T
         bMGGRzjKjoHSaQ0hVQsP6ZaMux+yye2aZGKN81pUf4h7whwd2KRl2QdM2GUwqPnwOspl
         HrCb5+I3fJQjW4B6gQCCO9hlY2NIZIb0sVxeVb3gs6qvOOXPNTkIRdte3B5pDEaBUuVd
         +aiKUG5bV8VMn3yJoQLTl+hj2TRVYULhN2JohO6tYbB/ORBUfprb2yGlB20/AbPHvA9H
         hWOg==
X-Forwarded-Encrypted: i=1; AJvYcCVGgb11X0kYYQfodqPYE0bqb3VUdS9U0OzHpchdAU9oCbRHNw6u+4hbUYoIIN7YX5LnRNdCWVSpuc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9zsIQwQcZcSkjjifDi4PHizRPHzjCFpCKtYt7Mby3ZsCdZifl
	2jIQJ3PKCBYTjNQcl6w04el61oOFgAL5GPfkgOs1EcUx9hkPoldE3puvkHcHQi5v
X-Gm-Gg: ASbGncscEDexL9na/TeUjbPxGjISPAydP6m47w63XeX1dOIdU0/LQ4y/nOA3wjXtLIL
	SwQ/c5mWxVcFiU6V8cJeZyJEAyLCgNr/AW2tFQdYBXWLmrLjAqM1jMxGMmgHrdnqb7mgELG4Wex
	4jL50osn3a6l6Tcuknx/JKAPXZ0DOiwLPhcMqxh3pXRj39FovR0opO4Ndpkx4zjcvMQX1BhlxFq
	aNyjtCqvXAbLL8GWlBN1ss5+MNYb2F7/C4WxqxLXcE+aOmbt5D3Eg114JtA0MiXoICDG38MJY7j
	60fX4+PoG8PYiJjoV+1ifqCJcX3gtH3hiTTC86xS084ZcNezNjSdEdIAOa1x/Qr6nYxlsiOoWY7
	Y1hUAHkxDtHxe0wuP3lWzMnHh3TQpB9xK9gmHw2AU92Ky5mARTg4+isMmDa9ySp9HHxpE3i78iA
	udRp8ekYoQHuDmqA==
X-Google-Smtp-Source: AGHT+IEniZ66LZ3Q9kLxevS5Vzv0G8VG0RPyIQBzoJ47CqSnhzP190oPn3sk8WGIaSXFfBnGGQOi+Q==
X-Received: by 2002:a05:6102:1497:b0:5d4:1e69:fda2 with SMTP id ada2fe7eead31-5d5e2346ba8mr12146902137.17.1760542569730;
        Wed, 15 Oct 2025 08:36:09 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf6ce034sm4608934241.7.2025.10.15.08.36.08
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 08:36:08 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5d42137abc2so6076199137.2
        for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 08:36:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRKgPAYQ0vg2XCyXe+MfG5R9Om4xR4BcPKPrKUW7t9qSnRrK4ommZrpeEpR5iIGieL4x4qJCvOdCE=@vger.kernel.org
X-Received: by 2002:a05:6102:3f8d:b0:5d6:254f:4e24 with SMTP id
 ada2fe7eead31-5d6254f4e58mr4448769137.32.1760542568340; Wed, 15 Oct 2025
 08:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014153314.177300-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251014153314.177300-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 17:35:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBthNYYOg4WHjt+gJRL=g00wmiqCsx+La_3NCUrCJ9gg@mail.gmail.com>
X-Gm-Features: AS18NWC2xZ5k0_H_MwKSUXMl7-yjZeX_uMDf4r_eO11t9puIMof4gvI7VNM2V8g
Message-ID: <CAMuHMdUBthNYYOg4WHjt+gJRL=g00wmiqCsx+La_3NCUrCJ9gg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Add VCC supply for EEPROM
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linux I2C <linux-i2c@vger.kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

CC at24, regulator

On Tue, 14 Oct 2025 at 17:33, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> The R1EX24016 EEPROM on the RZ/T2H-N2H Evaluation Kit is powered from
> the 3.3V rail. Add the regulator phandle for the VCC supply to reflect
> this in the device tree and avoid the fallback to the dummy regulator:
>
>     at24 0-0050: supply vcc not found, using dummy regulator
>
> Fixes: 0176c9e82e10 ("arm64: dts: renesas: rzt2h-n2h-evk-common: Enable EEPROM on I2C0")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -160,6 +160,7 @@ eeprom: eeprom@50 {
>                 compatible = "renesas,r1ex24016", "atmel,24c16";
>                 reg = <0x50>;
>                 pagesize = <16>;
> +               vcc-supply = <&reg_3p3v>;
>         };
>  };

"vcc-supply" is not a required property, according to the DT bindings,
and I believe the 3.3V supply can be considered always-on (but see
below to encounter dragons).
I was always under the impression that these "supply not found, using
dummy regulator"-messages are just informational, and can be ignored,
but they are at the KERN_WARNING level.
So should we add real dummy supplies to DTS, or not?

Thanks!

P.S. Actually the 3.3V supply is controlled by an SLG7RN46899, which is
     an "RZ/T2H Power Sequencer with IIC".  From a quick glance at the
     documentation, it is not clear to me what is the purpose of the
     I2C interface, and whether it can be used to control the outputs
     or not.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

