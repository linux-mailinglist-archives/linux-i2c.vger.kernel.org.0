Return-Path: <linux-i2c+bounces-3988-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C91BE905381
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 15:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CCA8282FF0
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 13:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023E4176ACD;
	Wed, 12 Jun 2024 13:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OApSNVQ9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8DD16EC12;
	Wed, 12 Jun 2024 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718198285; cv=none; b=JJkwfVs2vSH5uI4qv/DBz3LKYT0MLLBpS011CNda4H0bZ8D0Ue0ZlvMISvTQerX8BeAJnfIF2z59Px8HJNU1FUtyCYuFDaFoK3hLmhPKfyUNwPRgc5+oqsjHtWc3l0H4HmjGlb5lHn6j3CAj89b8m/J8EwcbfptJJ0pw8eH2/kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718198285; c=relaxed/simple;
	bh=EAhhAkJSPT8m5ngR46DhDWBeRyQ+o42ANBwH3ptZVhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fqg9X6enFyGfuaHx+TKNQCVe3De0MmandlpuSCB+hP6Hw9fzmEdwWxrtwXspygWJPeDOsG2t3KwYqit9MaxTTiTPRsKDgUUQNkKu/d5gI5r6xH26rER6pvlo25cHsLQJDX+HZYSPNJzgTGVWgeiPf7VMUxi5uflsOYE+coCewuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OApSNVQ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40486C4AF50;
	Wed, 12 Jun 2024 13:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718198285;
	bh=EAhhAkJSPT8m5ngR46DhDWBeRyQ+o42ANBwH3ptZVhg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OApSNVQ9rxCDt78BplPKCVq47aEVD9f7bvXL595EXGUxakoQ5fNWgPRq+nw8FUdDB
	 48+kmtTH+mDChhpxU9+TXo90WaGNshAaVz8EAdHmGQ8prHcI5l8gAAYoicWRbcugKs
	 Fm4nbnlyjSaqcBUoghULX27RFQE5Qy5Op8b44vj8atRLQBvD63HHk5fUNWc9CQEfWo
	 vgLuWdQUbCwrdVKv7d/DtFUwtutQCY+Tdx7lmUHRvad9/jbd95ikcEmisJp8jz5lVL
	 xDrbvgdK7PNtYZ8L9fOwZ0LUVeyloZ8sttX/xFMnM4ZbPG4GsVj4crSSySPlW69pYQ
	 zkrMyQBbPJ9MA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so2893841e87.1;
        Wed, 12 Jun 2024 06:18:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQGvJLOfIqKNLIAigHcdCE3BVNAdTciPjQitn+R//7Mhj0e9fu/dPLImMPAL0M9EkpqmhcSs9u8cUO5MpJlnjl82kavuTfVyVRYKRbHferwrJJm1y9oEwvusTDNFuG8x+xfPBFxmHnh8x4HMWA4NHa4EUhdk/QK5cV6xFEW5KX1awXIw==
X-Gm-Message-State: AOJu0Yz+NlZYAiDBDfykWr7nYVTOYWfT9zcdGUAMS3S2m0ObTcofvAM1
	qyXnTul2KGVN64f87hpTTUVUf9T081YCUO4icM3JeQ80eHPjU7lmdukDeLjYozSNs9lt8ffD21t
	3pMU+2VQrEth81vweXiesIeS98w==
X-Google-Smtp-Source: AGHT+IGRdGHPsMkRPpbZiPDo0vVmCHDqtl0Psn5HUImt9EEAE0lx3tPjGwXY5tKVUkqpNnOVIiW4L3JmK8xPdWvgy8M=
X-Received: by 2002:a05:6512:3d1f:b0:52b:d48e:32e8 with SMTP id
 2adb3069b0e04-52c9a3fd878mr1250484e87.45.1718198283584; Wed, 12 Jun 2024
 06:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
 <20240611-dev-mule-i2c-mux-v3-2-08d26a28e001@cherry.de> <171811272875.1782775.2673232019553624734.robh@kernel.org>
In-Reply-To: <171811272875.1782775.2673232019553624734.robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Jun 2024 07:17:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ83sz5-MZN+Cv6=AbLXWxAaYayw=k0_X=F2AAxU1j2Gg@mail.gmail.com>
Message-ID: <CAL_JsqJ83sz5-MZN+Cv6=AbLXWxAaYayw=k0_X=F2AAxU1j2Gg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: i2c: mux: mule: add dt-bindings for
 mule i2c multiplexer
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 7:32=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Tue, 11 Jun 2024 13:43:53 +0200, Farouk Bouabid wrote:
> > Mule is an MCU that emulates a set of I2C devices which are reachable
> > through an I2C-mux.
> >
> > The emulated devices share a single I2C address with the mux itself
> > where the requested register is what determines which logic is executed
> > (mux logic or device logic).
> >
> > Add support for the Mule I2C multiplexer bindings.
> >
> > Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> > ---
> >  .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  | 80 ++++++++++++++=
++++++++
> >  1 file changed, 80 insertions(+)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i=
2c/tsd,mule-i2c-mux.example.dtb: fan@18: '#cooling-cells' does not match an=
y of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/trivial-devices.ya=
ml#

You cannot add warnings. Please fix this or this patch will never be
accepted. Either drop the property from the example or add it to the
binding (by moving out of trivial-devices.yaml).

Rob

