Return-Path: <linux-i2c+bounces-10479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54609A9374A
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 14:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 574381B619B7
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 12:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64339275844;
	Fri, 18 Apr 2025 12:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSgW0ree"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA532750F3;
	Fri, 18 Apr 2025 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744979927; cv=none; b=eFEMCJF2z4u4AQqWRgPeM3mtaCcGnwqAlYpKyGPlTLcXqlrovsH1t1g6iKqvSoceW0f0PXFWSmW8EwnKbWHerfYcm092Hd3hvS6TLG2Fl5JLttrweYSznghYU8W/g1ElZY8SKoscZlXFb1QySb09ibHZTVYWXLrBD0HZCBMcbzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744979927; c=relaxed/simple;
	bh=Sz2OvhT1YtRxCswr5Ix9aIntavDUyOJ8JgBM2MSHo+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DT0aIjFftkumctMky2Iv3lNhuGEFwXq1rpgZPWuEMnProgzG2m2gMHmMqJzwnr0cM1GAeTMY2sQH1mx/r9az+fAYKflcntnYnzVK3v+YFbMkkKgflmBAVEqtzY7SKcyTe0eccyAAAklaluPNijuQ+BzH2UnQgkXTDeyKUwyh1a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSgW0ree; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4769bbc21b0so17288491cf.2;
        Fri, 18 Apr 2025 05:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744979924; x=1745584724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ex4CZQWgxkClQmKHcyHVLX17Io0C6G4ejKLtSY01Ru4=;
        b=SSgW0reeY78B1eoSwWx+CkIligLnZ2pFiR1IscalmP2AUFDIpNAgtXrOL9sxzIlV/g
         K7ld9Sn02yEJ17DEC3wx0w8wFZSlOxgVSOz90fQUNe7Sq/ZmsjaNZUvRee4pRJghlr0a
         CX2sn4HCQ1i2BmuaJKaKMhehTQgKQxNms7j5ALHgpYE8hlrMKnIyPBYtltEe5SirfWWt
         F8aIeIl+BzI9UcBgxMmturYw0IaTtvdFhS4hsylyh2iTxxCGFVizQwBlYdEHywd+W5+r
         kO4DZPPcCUiZgJuvc9vN7xUTCnjZJlkIKKz4OJXIFfmt2op+UPi+ConJNe6GU4OebZ8F
         AXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744979924; x=1745584724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ex4CZQWgxkClQmKHcyHVLX17Io0C6G4ejKLtSY01Ru4=;
        b=U40Dik3n8ZLesvDT3Hbmxe6TicqFA2Bd+PTpkrdruX0W7cI9EqeIQUuhfL25Iqnuce
         wntF/wArkD1ocWbE7rbkP2F3qlF/4FzBADShpWk1UQWRbAYbSKrXMN5+bKHRP+1Ml8lQ
         orCo7QyYixtr0pAh/b6MhC/Ihukzj7qjkpBE7ZHBkQgCvaOqYdPE2FU21te2u2P0HS0Z
         SNzaZ/XMtOziuqN40dTu9jsbXJlHiFoT+5r8IOg3mD6OxVp3OAFJL+unSeP5nqP+jFGS
         IIRO5FvlQN2mhEA/OrC/aJsqobEMJZGjCShvXDzQ8vuRU9YeD8PCqsNEBO7a+SOMNsm0
         NQbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAgmzvyuuPg+WsCzFfQZYNJWKcEbQmU8y5zVADdbhvtweYw7xdAhY85ZvMFotx0qLjgTHuo7xNc3nw@vger.kernel.org, AJvYcCUDU6faJciWOAcPzgIxWnUSPlYoRD7iCuwHLLBV2l5/S9BTjDR6FH4JMP6H6/ccAy0u2oN5nB5xzdjvG6Ha@vger.kernel.org, AJvYcCUweMNquWoF9KR2Z8CMboeoWwq/v8DtmVliBfGShLgbzcTb14M+tbWfBsEO+n1nOkvwt7wTu4bBUV8l@vger.kernel.org, AJvYcCV5sVeqbZ8YwWwVF9B0W55cXS8kpgISV399lw38YK8T7Diza/IcougdG+flYWg4YqdW4z6DIQFTdx0g@vger.kernel.org, AJvYcCWd6M+D4M0JXmjXEGfJe4JR7Og5CsyqrjLBA4w3FYWF7KyAnqg++vWC47NIlIG6IVDGdEtODaKcoWqg@vger.kernel.org, AJvYcCXlis+JTjApgiMTliaUXrPPFq2iO8rLrPHfXYKPdFw7u4fl0l6a1n2xiVca4unrjdygGynylxYz@vger.kernel.org
X-Gm-Message-State: AOJu0YyEwIbWFeN/+J52IVcWjeQ1jt9p9uCvS9SzQ80mwOtCtYuoPpS6
	T6Fw7HodvkHQMpKTzs8qtGZVKwdhEyVtO2fnJsHwCRxXsiTlTR1FE56asJz6/oGZu173kqOrQGR
	4uFTgF9RGbbH2nhQ/+WEIkKTA7tA=
X-Gm-Gg: ASbGncuQwctuvQCU/G9SEZe+VVKuIPsOB3uSs/RYBzyGW5piyQcGIYlWz/W7Yg73nmQ
	xGyAH13GLuB6MVs6bejro6HFrOx5+gL1X0d6nxeHJuIDCPEBSLokPs2jS1Ppvv03QvvBUUXDzAI
	NMqueRCsGN8UIbeDV0XVB8vz/iYeEX0VYfjNMUxKQz6rme0AsxMChBvw==
X-Google-Smtp-Source: AGHT+IGB0+9rYEJMYSumpu6Vzq9goNJmJbJ95NPX/w0TApxD1IhEm9WvTNPQJ7w305XUYtnHZHJIiC78RgW25GjDsKk=
X-Received: by 2002:a05:622a:1828:b0:476:8225:dac9 with SMTP id
 d75a77b69052e-47aec4c57a5mr39379541cf.45.1744979924108; Fri, 18 Apr 2025
 05:38:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com> <20250416201407.GC3811555-robh@kernel.org>
 <CABjd4YyTKquLcYC+DVg_koi3p7AhqwBNiazCiC713DQKjCaBSA@mail.gmail.com>
In-Reply-To: <CABjd4YyTKquLcYC+DVg_koi3p7AhqwBNiazCiC713DQKjCaBSA@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 18 Apr 2025 16:38:40 +0400
X-Gm-Features: ATxdqUHZEjWs_YUTRnLI_mqfQ2sstLgHtYWGD2PkyOOwUEJjeYm4m7FuAwUHjuc
Message-ID: <CABjd4Yxi4SLqsAk_fb9C=1BW6XjnZ8LQ_JKYu6KZ3TtMS0fnhg@mail.gmail.com>
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

On Thu, Apr 17, 2025 at 10:25=E2=80=AFAM Alexey Charkov <alchark@gmail.com>=
 wrote:
>
> On Thu, Apr 17, 2025 at 12:14=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Wed, Apr 16, 2025 at 12:21:28PM +0400, Alexey Charkov wrote:
> > > Rewrite the textual description for the WonderMedia SDMMC controller
> > > as YAML schema, and switch the filename to follow the compatible
> > > string.
> > >
> > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > ---
> > >  .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
> > >  .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++=
++++++++++
> > >  MAINTAINERS                                        |  1 +
> > >  3 files changed, 62 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt b=
/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
> > > deleted file mode 100644
> > > index d7fb6abb3eb8c87e698ca4f30270c949878f3cbf..000000000000000000000=
0000000000000000000
> > > --- a/Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
> > > +++ /dev/null
> > > @@ -1,23 +0,0 @@
> > > -* Wondermedia WM8505/WM8650 SD/MMC Host Controller
> > > -
> > > -This file documents differences between the core properties describe=
d
> > > -by mmc.txt and the properties used by the wmt-sdmmc driver.
> > > -
> > > -Required properties:
> > > -- compatible: Should be "wm,wm8505-sdhc".
> > > -- interrupts: Two interrupts are required - regular irq and dma irq.
> > > -
> > > -Optional properties:
> > > -- sdon-inverted: SD_ON bit is inverted on the controller
> > > -
> > > -Examples:
> > > -
> > > -sdhc@d800a000 {
> > > -     compatible =3D "wm,wm8505-sdhc";
> > > -     reg =3D <0xd800a000 0x1000>;
> > > -     interrupts =3D <20 21>;
> > > -     clocks =3D <&sdhc>;
> > > -     bus-width =3D <4>;
> > > -     sdon-inverted;
> > > -};
> > > -
> > > diff --git a/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yam=
l b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..a7d962bc13c7ff70b5044=
8201b0416efc7f787af
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
> > > @@ -0,0 +1,61 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mmc/wm,wm8505-sdhc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: WonderMedia SOC SoC SDHCI Controller
> > > +
> > > +maintainers:
> > > +  - Alexey Charkov <alchark@gmail.com>
> > > +
> > > +allOf:
> > > +  - $ref: mmc-controller.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - const: wm,wm8505-sdhc
> > > +      - items:
> > > +          - const: wm,wm8650-sdhc
> > > +          - const: wm,wm8505-sdhc
> > > +      - items:
> > > +          - const: wm,wm8750-sdhc
> > > +          - const: wm,wm8505-sdhc
> > > +      - items:
> > > +          - const: wm,wm8850-sdhc
> > > +          - const: wm,wm8505-sdhc
> >
> > Combine the last 3 entries into 1 using 'enum' for the 1st compatible.
>
> Fair enough, will do.
>
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    items:
> > > +      - description: SDMMC controller interrupt
> > > +      - description: SDMMC controller DMA interrupt
> > > +
> > > +  sdon-inverted:
> > > +    type: boolean
> > > +    description: SD_ON bit is inverted on the controller
> >
> > This implies I know what the non-inverted state is. If you know, please
> > state that here.
>
> This is a tricky one. The only answer I have is "it's inverted in
> later versions vs. the first version I saw in the wild, and I'm not
> sure if it's board related or IP version related - nor if the original
> was active low or high". No docs, no schematics, no vendor left around
> to chase for answers.
>
> Will dig around some more and update the description if I succeed in
> uncovering any further clues :)

I've found some extra clues and would like to consult on the best way forwa=
rd.

It turns out (if my understanding of the decompiled binary-only WM8505
vendor driver is correct) that all chips before (not including) WM8505
rev. A2 treated their "clock stop" bit (register offset 0x08 a.k.a.
SDMMC_BUSMODE, bit 0x10 a.k.a. BM_CST in vendor sources, BM_SD_OFF in
mainline) as "set 1 to disable SD clock", while all the later versions
treated it as "set 0 to disable SD clock". Which means that there are
WM8505 based systems that rely on either of those behaviours, while
any later chips need "set 0 to disable". This is not a board related
quirk but an on-chip SDMMC controller revision related quirk.

I'd love to switch to a compatible-based logic and drop the
"sdon-inverted" flag altogether from the binding I'm writing, but here
are my doubts where I'd love to consult.

* Looks like WM8505 rev. A2 needs a separate compatible string vs.
prior WM8505. Can we have something like "wm,wm8505a2-sdhc" and
"wm,wm8505-sdhc" respectively? WM8505a2 not being an actual chip name,
but something discoverable by reading its hardware ID from a system
configuration register at runtime
* If I introduce new compatible strings for "wm,wm8650-sdhc",
"wm,wm8750-sdhc", "wm,wm8850-sdhc" and "wm,wm8880-sdhc" in bindings,
DTS and driver code, then the new driver and new DTB should work fine,
and the DTS should pass schema checks. New driver code won't work with
older DTB unless I keep the logic to parse "sdon-inverted" which
wouldn't be part of the binding. Old driver code would not work with
newer DTB except for pre-A2 versions of WM8505. Is that acceptable?
* Existing DTS doesn't differentiate between pre-A2 vs. post-A2
revisions of WM8505 and is bound to fail on the latter

I realize that breaking backward/forward compatibility is undesirable,
but frankly these systems seem to have few mainline users, and those
people who do run mainline on them ought to be compiling the kernel
and its DTB at the same time, because the firmware doesn't know
anything about DT and any modern kernel can only be booted in
"appended DTB" mode. I also don't know of any non-Linux code that
might be using these device trees.

Any guidance would be much appreciated.

Best regards,
Alexey

