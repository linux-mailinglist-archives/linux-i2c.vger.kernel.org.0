Return-Path: <linux-i2c+bounces-10446-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83301A913D3
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 08:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F526444EE4
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 06:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E84B1E98EF;
	Thu, 17 Apr 2025 06:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1mpszgG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7F91A2554;
	Thu, 17 Apr 2025 06:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870566; cv=none; b=DdjNwWiqWbkND+aiN4cAOSV/hAFKOOim3MZrvzkINgnDAXH4a5HCDt+bk1QVczgblQPbeuNlGw+RtAe0O5KdU1vvkhUbCMXNR6f/AB6R5ny+dMslbuAE92J/dOm3Dyb5ecgKbXohU6X30IUci36/xZNZM/p9GenYHGTcVXuf+Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870566; c=relaxed/simple;
	bh=mRMaq+/rAaWrqvEjYLnNBHEYBJm0nTahID7wtaPBLbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VcE8tormQm1GWhMZOKRBnQPZtEUyAonlguxJCehPglUAU0fV3n/JCwmFxurAKpMphpgN8rXsy5R0Bneqn67Ht0J2ea9S43SEcITYrScD+8nb6IchU7eXshzL8KTSEpJaK9dAm654dZYMURMd54f424U3UYA8iDZy5NkSzwkf+mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1mpszgG; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4766631a6a4so4083051cf.2;
        Wed, 16 Apr 2025 23:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744870564; x=1745475364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmcYADO6Ts8LiEjQjRl2AEglFUJkqPE38Uht7fpIgwo=;
        b=L1mpszgG28gIw9uQV1fYbFu4+gCYNLhwPPzvXf9l412bRvAKEuvdS2sK+sxngwgpXa
         MDkmCY1X5X6vi7+f80oQxtuyfA9zR/hJUzG7VipDFjLSzsdFulPvXpMH8dVSNAClgq7h
         m3Yl9eEfUE2zfaKQ2MfFPo0BU7PP0z2qqGk7aTqG0oemOfrSqlFloHTlJLU2qXI4RHAF
         fcHZ0FlomkJL0/sNdzk+Sj+K2oV4wMR4VSChM19Pmvee/E3aG8f3MZ1i2NdgwwyTJodq
         wbgTJ/DgwfNe6d2s/q1XH8o250IXgpwef64uotfNM9M2Mrf+8Aoo2glMOSFGvYwrLJEG
         zztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870564; x=1745475364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmcYADO6Ts8LiEjQjRl2AEglFUJkqPE38Uht7fpIgwo=;
        b=cBcw2eJQykU9GPHJ6VjK3Fm9lgxYAFeBjG5O3ZH+ZepMhp39ALdzcbEqnfvGdYJ5ml
         PAdbJ/mj5Jkdves2FQ27lKeiGDNnEUl8Qt7p6dHw/DeRJS3fzQQ24kjSD1d0woDmyXP2
         3iEmvtgF9h7PlbgitP10vejm7/U55jtSyW4bdeSPxVGd5OOA70EYm135ccs8aExfpPiK
         sG8BRfPfledQandGNuVX0nwGpL1vpoYefJfQf7ML6HznyNxzktrcQ4Q7W6aCeJCBwSeR
         Tv23C29cKuW9zJ/nwAIuQyQYoWt7LVcwJt8Purjd0VWUaE69ZJA4ND58VQAFnmlv2LJN
         Qv2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIYq3OwkIpIDNb8nTsjxfa+1C18tewqHQAF1xUWESkUexqo3hRMXmYqS153xKnyEI7Sds+oQqv3A7o@vger.kernel.org, AJvYcCVb697+Y9qPsJxsi6Vlj7x0hiYscxQjOyHgDyG94XHGfzQ5geQC04jd4yrfQKMBAppEah8OPNv9TZW7@vger.kernel.org, AJvYcCWNfD7OHLrFCsQ2P74Waj+Pe/lDXr5STp5P+Pop1VYXUzvPqkNcoQhzgb8+yFkYEBcKdP4AHIq9x/yv2cGP@vger.kernel.org, AJvYcCXBQOWVJaTOfDfG/YZjsemGBiYgVs66rZ4CnH5OsYdooaJml7O/eZQdGIqq0xy3e5HhPAi0ZhwCb094@vger.kernel.org, AJvYcCXjen3aGzL8IU7EmBS0zF8FR32fMgKQ1txFHlrFrPFJUncwvTXA9CfcdzY/9BxC8S3P2XU+ElK0/Ek0@vger.kernel.org, AJvYcCXzi6IRMcQtppQKFXaiLZO7YkMLDG6BEKtLW6jBHL2XVE5xQ6Bv9Cy+WrCXIaPCOuNPOOuu72su@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq+4eXptcdKVwOuwZi47zGNrt6fVp4y8jS4raEuNBD4u8i2mwY
	9kZnl4V70D+37S0WK2b8nA98ANnAvzgsn3bV32m9g+AhCUAzjgi0iQ4c+vW7RnWcdx0LrELOTyn
	gqxrkT6nizfpwAodqHnBawM/eYuk=
X-Gm-Gg: ASbGncsfiHnA4yOHqGYzyi4SBPA2IDXwOmBcDPM4ZoasMGRUye98QLaIQ0wlN3ZpK1V
	wmCPEQ0VZk+sCPnHBqVl/rtE/EXlysw3nNQZsjjFGmxbuptE9J6g0fRkezY8crxHCrjnZQTUK52
	5f8ieERuP6qztDKPrgDKiEZkgAPwezvQ3AzCXrkCy33aeoUELqb2GeFZg=
X-Google-Smtp-Source: AGHT+IFKuzFZMBDi/GpEynCqLVtlNq8r4VkyTy96KVOsHsHaj4cpcrwJwQ/3ExydfNXFnduwqBQ1lh8ibHmlutTFGnI=
X-Received: by 2002:a05:622a:149:b0:477:4224:9607 with SMTP id
 d75a77b69052e-47ad80b4308mr56619511cf.12.1744870563720; Wed, 16 Apr 2025
 23:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-2-f9af689cdfc2@gmail.com> <20250416201057.GB3811555-robh@kernel.org>
In-Reply-To: <20250416201057.GB3811555-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Apr 2025 10:15:59 +0400
X-Gm-Features: ATxdqUH_PzZ6LbO2fyRH_TSqVCYYVFFi8jocQlkWEwLVvGPaJEDpipkomz_BGGY
Message-ID: <CABjd4YyQVGZROse9kJtV1pEk0uk+=2h86cAyB1aCujg7+9SZEg@mail.gmail.com>
Subject: Re: [PATCH 02/13] dt-bindings: interrupt-controller: via,vt8500-intc:
 Convert to YAML
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

On Thu, Apr 17, 2025 at 12:10=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Apr 16, 2025 at 12:21:27PM +0400, Alexey Charkov wrote:
> > Rewrite the textual description for the VIA/WonderMedia interrupt
> > controller as YAML schema.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../interrupt-controller/via,vt8500-intc.txt       | 16 --------
> >  .../interrupt-controller/via,vt8500-intc.yaml      | 47 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  1 +
> >  3 files changed, 48 insertions(+), 16 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/via=
,vt8500-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/v=
ia,vt8500-intc.txt
> > deleted file mode 100644
> > index 0a4ce1051b0252bbbdeef3288b90e9913d3f16f0..00000000000000000000000=
00000000000000000
> > --- a/Documentation/devicetree/bindings/interrupt-controller/via,vt8500=
-intc.txt
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -VIA/Wondermedia VT8500 Interrupt Controller
> > ------------------------------------------------------
> > -
> > -Required properties:
> > -- compatible : "via,vt8500-intc"
> > -- reg : Should contain 1 register ranges(address and length)
> > -- #interrupt-cells : should be <1>
> > -
> > -Example:
> > -
> > -     intc: interrupt-controller@d8140000 {
> > -             compatible =3D "via,vt8500-intc";
> > -             interrupt-controller;
> > -             reg =3D <0xd8140000 0x10000>;
> > -             #interrupt-cells =3D <1>;
> > -     };
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/via=
,vt8500-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
via,vt8500-intc.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a3fbe985db276e6a3b65cc6=
6c7de097ed0719c0c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/via,vt8500=
-intc.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/via,vt8500-int=
c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: VIA and WonderMedia SoCs Interrupt Controller
> > +
> > +maintainers:
> > +  - Alexey Charkov <alchark@gmail.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +
> > +properties:
> > +  compatible:
> > +    const: via,vt8500-intc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 8
>
> This wasn't in the original binding. Find to add, but note that in
> the commit msg. Here, what each of the 8 entries are must be defined.

Will do, thank you.

The primary interrupt controller only has a single line routed to the
CPU (out of the 8 outputs it technically has), while the (identical)
chained interrupt controller has all its 8 output lines routed to the
primary controller. There's not much difference between those outputs
other than the names IC1_IRQ0~7.

The original textual description only listed one interrupt, because it
worked ok with one interrupt (the chained controller can be configured
wrt. which output to trigger for each of the inputs, and those can all
be IC1_IRQ0), even though it is not a complete description of the
actual hardware.

Will reflect that in the commit message and descriptions.

Best regards,
Alexey

