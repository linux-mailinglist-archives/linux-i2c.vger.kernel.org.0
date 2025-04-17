Return-Path: <linux-i2c+bounces-10447-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DB6A913FE
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 08:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E989C3BB4D7
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 06:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A4D1FAC59;
	Thu, 17 Apr 2025 06:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iv/zivPU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DD91E1DE8;
	Thu, 17 Apr 2025 06:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744871160; cv=none; b=tgQhYLf05U/fgN5QxrrLDjsZGn5YQzUwM+HWznY+AOk2Dwi7P4uokJiEeR48DMMUBxriHAXI4rhq7OLCZkFtyHBnbv9w9px90WhxLb+ZxZgyrHJpAhO9RPEn+sk0vmQr66QZELYsa9HY/D8zrzIO5fGTo2ePirkm+XOxaKEa/oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744871160; c=relaxed/simple;
	bh=dw1Ek1919FgPg/uC5+Y9RdiuRk0gjvI3OK49Td9EDoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNfKUuKf83ZWYL9yI57nWqSG3DGjOzq9CG3ctC+WOe9Ka9+c3hRcr9iLzTRwh64ddeINloVV5AiJ493Y6UJqxBldTasnF0nk8FsJ/Kbc2hf4ty9C+QxxCTa5GtjOomBC0u7K5VSmyChnZpBOJgr2byOUXepu3xleIlngEAV+vJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iv/zivPU; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c922734cc2so3725085a.1;
        Wed, 16 Apr 2025 23:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744871157; x=1745475957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZST5O+ENabbKZFG4u9ZlHE3mu44ycA1WpCteAX/mCTI=;
        b=iv/zivPUQU23CeXaBhFrkU0ndDTPAqrXsNPoOFdl/WFq/gttYkBAYyyRL7on1vxxhh
         s1t0Hs45PsWqxz03wuNGVzZM/OhIGtUVYs67Y0Emr3By/uIhv9HQ1zQ4l/to1+kaF9ll
         9NoE+1P6KfT2WOQ0FvzjJYaXXDU+Ak6YNJa3sJ3KJzyk+3ZlpSZFXchcPZdNwZR7nv2D
         vW6ydi/YoMr6Ea6FQUd5gxLvO6oGrKD9hK4csUp9wHAdwFMKg0xKRFhk/1CS+BOWyjPi
         IoKa+iqKKSJQ6P5dh/sTyajSkBh5q7G2CS8w1DkL/Z5Zin8sSGNKAt4NFQtKe/YeuM41
         09Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744871157; x=1745475957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZST5O+ENabbKZFG4u9ZlHE3mu44ycA1WpCteAX/mCTI=;
        b=fSPcpXLCnM/jPoZGEKbJxYLypABTs1AE8r5VJ/z50bSw5zRCDafZID13qLBD4pJs3U
         5OZ60FaP27z5sPoVDEYGJZ8vDTtWpmKPZhQtFjR/NwX2k/RbABNnBRzPy7PN8EMWK4yi
         fWVpzwOpIVfMSsp2FkZnwBFjA4foGFI6KhMM9GGZLE7g/URtlL/1lJnVXCr3+5LD5OMA
         7XvxspjU8iGw5Lk7OAf4P/94XapfD2fnmtw0joz3NrUpUoSDvgPY1wHaP1LzG1CDMfE5
         LYx3hC7VK8rEQTJ1Gp1SOS99/7k9UCPM09ppwijnDdSRBVAGBlIbjqEPSjLmdz0NRNzk
         gUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnQsPxoYr2M4++RupreBf1aKA+CM4FBTtx+1tCTKRFkO5NlvmcP9K9RW9L6uZo6tGgRS6TV1q+KhU9@vger.kernel.org, AJvYcCVKkxS0+10RXkKt1VlEQB89AXLmMFEkR12GAPiZwydC8z5eWxraDDQwOxp4p/7TQrFmw/M/M//a96qO@vger.kernel.org, AJvYcCWMEZLeh5TYgvboEwhF4rlIjX0HRp5z9j9Q2y7KopENrcKq572qtpDZOsfLIGEywQVU8gqm1A5V@vger.kernel.org, AJvYcCWU/pvIJ2ItEF4tGfT6dFXwGeUL984WlZXuKZFWpfxatMYdyYmoZzDHmDc09NNHbg+DXn6ovPJHKUCnnIq4@vger.kernel.org, AJvYcCWzbrT8jKXC8saIOWvi4W0BhOW80LVgSH3uJCrFedxvFM86r4RMhIR59UyT1NkOrW3ocQ9whC7kLCaF@vger.kernel.org, AJvYcCX2GKjZgdLRc8Ig/bWnltboyBP7ptD7b4c9KIvkzfzplQdP6eP8ZNoz7padHS1TdbscBqwW3NKtW1DN@vger.kernel.org
X-Gm-Message-State: AOJu0YyXmYuNIapr/CJVwZab9yO2W5at1zOHM5W/VrSDQ3I3447YTdHw
	KUALWMVJCLp5E8pfEbx5W5goGAxHo7Nl8y1mBK+1XhNb6rfMIUqyEOuSb3i6XGADDeewDxENuTi
	2Mzqrnh4dw4DmjcfKcg/mnTUzHZA=
X-Gm-Gg: ASbGnct1U1r+gM2M5MQvdNUXWDn85sRQvNSLHa3lh1iZZDQn7LGUtTrP4241ToOulXB
	Jh3EYm7b0xj7E4g7O5Yt6bOlCMF4xrZNIhc4AcCedfAR0iLPlUoOldL6bnfjUxPainal1iSqht6
	IZgdqcm7+1LeMCW3uqSwJWgX4njLbqZBPG29GF7O58i0mxa/spq50p7Go=
X-Google-Smtp-Source: AGHT+IEUG2qKwwAEec639Bxod8wzMz7dx75qAc7U0rBWKEyq4yVPfHNSFLQqm7Sf3Cgg0Jwvm52KKhOAOvEG7cdfGyE=
X-Received: by 2002:a05:620a:172b:b0:7c5:3b8d:9f2f with SMTP id
 af79cd13be357-7c91e2440bbmr275101085a.17.1744871157183; Wed, 16 Apr 2025
 23:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com> <20250416201407.GC3811555-robh@kernel.org>
In-Reply-To: <20250416201407.GC3811555-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Apr 2025 10:25:51 +0400
X-Gm-Features: ATxdqUFKu43OJ9xK0QSQwijmtHN6PzWQ7tNDf-5s79MH0fFlMz0UJN-MS1W5jhg
Message-ID: <CABjd4YyTKquLcYC+DVg_koi3p7AhqwBNiazCiC713DQKjCaBSA@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 12:14=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Apr 16, 2025 at 12:21:28PM +0400, Alexey Charkov wrote:
> > Rewrite the textual description for the WonderMedia SDMMC controller
> > as YAML schema, and switch the filename to follow the compatible
> > string.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
> >  .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  1 +
> >  3 files changed, 62 insertions(+), 23 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt b/D=
ocumentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
> > deleted file mode 100644
> > index d7fb6abb3eb8c87e698ca4f30270c949878f3cbf..00000000000000000000000=
00000000000000000
> > --- a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -* Wondermedia WM8505/WM8650 SD/MMC Host Controller
> > -
> > -This file documents differences between the core properties described
> > -by mmc.txt and the properties used by the wmt-sdmmc driver.
> > -
> > -Required properties:
> > -- compatible: Should be "wm,wm8505-sdhc".
> > -- interrupts: Two interrupts are required - regular irq and dma irq.
> > -
> > -Optional properties:
> > -- sdon-inverted: SD_ON bit is inverted on the controller
> > -
> > -Examples:
> > -
> > -sdhc@d800a000 {
> > -     compatible =3D "wm,wm8505-sdhc";
> > -     reg =3D <0xd800a000 0x1000>;
> > -     interrupts =3D <20 21>;
> > -     clocks =3D <&sdhc>;
> > -     bus-width =3D <4>;
> > -     sdon-inverted;
> > -};
> > -
> > diff --git a/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml =
b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a7d962bc13c7ff70b504482=
01b0416efc7f787af
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mmc/wm,wm8505-sdhc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: WonderMedia SOC SoC SDHCI Controller
> > +
> > +maintainers:
> > +  - Alexey Charkov <alchark@gmail.com>
> > +
> > +allOf:
> > +  - $ref: mmc-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: wm,wm8505-sdhc
> > +      - items:
> > +          - const: wm,wm8650-sdhc
> > +          - const: wm,wm8505-sdhc
> > +      - items:
> > +          - const: wm,wm8750-sdhc
> > +          - const: wm,wm8505-sdhc
> > +      - items:
> > +          - const: wm,wm8850-sdhc
> > +          - const: wm,wm8505-sdhc
>
> Combine the last 3 entries into 1 using 'enum' for the 1st compatible.

Fair enough, will do.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: SDMMC controller interrupt
> > +      - description: SDMMC controller DMA interrupt
> > +
> > +  sdon-inverted:
> > +    type: boolean
> > +    description: SD_ON bit is inverted on the controller
>
> This implies I know what the non-inverted state is. If you know, please
> state that here.

This is a tricky one. The only answer I have is "it's inverted in
later versions vs. the first version I saw in the wild, and I'm not
sure if it's board related or IP version related - nor if the original
was active low or high". No docs, no schematics, no vendor left around
to chase for answers.

Will dig around some more and update the description if I succeed in
uncovering any further clues :)

Best regards,
Alexey

