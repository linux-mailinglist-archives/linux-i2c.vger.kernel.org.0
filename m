Return-Path: <linux-i2c+bounces-3672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1801E8CE1ED
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2024 10:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBD15282F15
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2024 08:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBD7128814;
	Fri, 24 May 2024 08:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjwPQTzk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B06C17578;
	Fri, 24 May 2024 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716537708; cv=none; b=lEug3JvuIRaxbHiam6rT8wc8DXjOS1inmTHYGkHbGbrTBri45CC74TPW8Xu561lFnjXoJJ0iIcwAfgRg1i1vfa39SexiXUP+UXIV23fpz+jS7DHlkknKt2hg3d5RSJtCP2wNMJh79XCCRBM0ktL/Ol9uTEEIcgB96btlA4Npx9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716537708; c=relaxed/simple;
	bh=SKY3VRl+bMcbZGIWvSO5VX4gbnQYaFgj0+jNolM/xz4=;
	h=Content-Type:Mime-Version:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=lAmFresUPdK1CzO02ehHgsB3jzhJzrP4VAMFOGinG1KzurqyRz0Eenu5w2IrqF3LagzPv4Idwepwp8oBH97I1fa2qQ2JsGMnrpu801j0yspe6GJyPOMvxjKetr0nB98fbKzVVT18rKv/MIC8sj/09lUlt1vQi/E93ON0j9FRq7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjwPQTzk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4202ca70318so59662715e9.1;
        Fri, 24 May 2024 01:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716537705; x=1717142505; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xUZEtBZTSSESf71yCpejIBGUuWcjhkuyzTnO6DQP9Lc=;
        b=ZjwPQTzkWpnq0PA+seElYZ2wNPS9WAqpF4G7Rw1kIBHy1IL7xjn1HYScZ6xeo38y09
         j8UCsjHEaqIWDn0FNJ4l1Ac2q8D7Xvyw5uhWKzrawB9OyDQxJcidOQ7Xo+EF9UtODnWr
         KUV/bAlmFSrxEsWN4hvbXM+nAExrTgZ3ibIV0Rw14lhzvJlcxVJ7/CY3JcGcR6eqymZr
         TNU00LPrLRdvtHL/AVKExwL3vWVv6NmxFCsJ5/wCrdHBNU6D/56VLV2MyXji8VzrPOLX
         nvmZp8orUhYuivmRmzXXf7PDujzA4jTHEYKY6M9f0HphYRlVsl6xpYuzaQRJTYw/wCmD
         +JJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716537705; x=1717142505;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUZEtBZTSSESf71yCpejIBGUuWcjhkuyzTnO6DQP9Lc=;
        b=HXXGG/6WZ5MINKCosZQkOyA+dKgsTYv5n/HuDvWtPa2RRoZUwpFLIvRKhOVs780wtl
         HbxCoqgLY+5Wzinw1nknaInZw89MjtXjMeIh5V+fy10Qd/RPuOSoV3qtLl3dcXz/wYK2
         +KfPqjdRFCZIosrSXEzMnoI30cG0AFI7AusVOEqcCKX4KoNdEpva1+Lk4HF3YD7gBqYo
         G2Eu0Yi4DBt5lAWXYBwSxt9olTT/Mf9StCYR2YNRHh1ZYciHSelot92y3/4niOkFAJML
         QiSOmke20QbDh5DYPsx/CoaCfDDLUgw4/jSdt4q7UcC6IxBGkZqWqtMa1MwBZTd65ih1
         19Dg==
X-Forwarded-Encrypted: i=1; AJvYcCV4O6YtWs6DHLugok5R7MhCIy2FbIMWs2yeL6HJ22/Sd+Lmuv9LnxCcGiNCjZoxyhs1SUGGnnwYUFYFmftJtEino9/m5biH4m63f2SMKH5o57WLvPbjPWyjmjqsn3F6pk5uhj3j0ASUkmcglGGJzm9QUbdQrbqIpm9jSd4NwBxYFf9et9vvLexz0NUBdPwiqkUiIvKc/MeP1461uzKNZzzKd6kBbeDp+7gZrhNf/Fspaw2oBgfStQMEHttukKkUbRSEemgJIfzxoWpYxNBZpOPUIABOrP3X
X-Gm-Message-State: AOJu0Yx3ck75w3reM/KmshBx2pmQoGBG8TFCt1stf+6u5u5U3R/QKCwp
	++/eC6SnKrkSCn0eCALPHHBVrWOLV8pTmT5K51hIwgtT8RAK4fTd
X-Google-Smtp-Source: AGHT+IEez6MoiosPjUNo30HprrvAuJWApsgOJu0yXmAphaccvJr1e0LN+Dvwto5+6abdUbvgubrc5g==
X-Received: by 2002:a7b:cd94:0:b0:41a:f76f:3362 with SMTP id 5b1f17b1804b1-421089d3927mr10443355e9.21.1716537704679;
        Fri, 24 May 2024 01:01:44 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100fadcabsm45671125e9.35.2024.05.24.01.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 01:01:43 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=fb8b70f1c41e009f374399bb3450b2fa3c696c750a469b66dabbee56955e;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 24 May 2024 10:01:42 +0200
Message-Id: <D1HPTY9MKVCF.WZDYWSJUWFYM@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Krishna Yarlagadda"
 <kyarlagadda@nvidia.com>, <linux-tegra@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Cc: <jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <corbet@lwn.net>, <andi.shyti@kernel.org>,
 <wsa+renesas@sang-engineering.com>, <ulf.hansson@linaro.org>,
 <adrian.hunter@intel.com>, <digetx@gmail.com>, <ldewangan@nvidia.com>,
 <mkumard@nvidia.com>
Subject: Re: [RFC PATCH 03/11] soc: tegra: config settings binding document
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240506225139.57647-1-kyarlagadda@nvidia.com>
 <20240506225139.57647-4-kyarlagadda@nvidia.com>
 <29e26d22-04b3-47ee-ba70-9f4eb77326f7@kernel.org>
In-Reply-To: <29e26d22-04b3-47ee-ba70-9f4eb77326f7@kernel.org>

--fb8b70f1c41e009f374399bb3450b2fa3c696c750a469b66dabbee56955e
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue May 7, 2024 at 8:32 AM CEST, Krzysztof Kozlowski wrote:
> On 07/05/2024 00:51, Krishna Yarlagadda wrote:
> > Config framework parses device tree and provides a list of register
> > settings with mask per mode to be applied by the controller.
> >=20
> > Add binding document for config settings framework. Config settings
> > are defined as a property per field and have different modes per device=
.
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
>
> >=20
> > Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> > ---
> >  .../misc/nvidia,tegra-config-settings.yaml    | 50 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra=
-config-settings.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra-config=
-settings.yaml b/Documentation/devicetree/bindings/misc/nvidia,tegra-config=
-settings.yaml
> > new file mode 100644
> > index 000000000000..e379cbd5b597
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settin=
gs.yaml
> > @@ -0,0 +1,50 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/misc/nvidia,tegra-config-settings.y=
aml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Config properties for a device.
>
> No full stop, that's a title.
>
> > +
> > +description:
> > +  Config setting is the configuration based on chip/board/system
> > +  characterization on interface/controller settings. This is needed fo=
r
> > +  - making the controller internal configuration to better perform
> > +  - making the interface to work proper by setting drive strength, sle=
w
> > +    rates etc
> > +  - making the low power leakage.
> > +  There are two types of recommended configuration settings
> > +  - Controller register specific for internal operation of controller.
> > +  - Pad control/Pinmux/pincontrol registers for interfacing.
> > +  These configurations can further be categorized as static and dynami=
c.
> > +  - Static config does not change until a controller is reset.
> > +  - Dynamic config changes based on mode or condition, controller is
> > +    operating in.
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +
> > +patternProperties:
> > +  "^[a-z0-9_]*$":
> > +    description:
> > +      Config name to be applied on controller.
> > +    type: object
>
> Nope, this means nothing. Sorry, describe hardware, do not create some
> fake nodes.

We're trying to solve a real problem here, though. In order for the
hardware to operate properly we need certain parameters to be programmed
into the hardware.

If this is not acceptable, do you have a suggestion on where else to put
this information?

Thierry

--fb8b70f1c41e009f374399bb3450b2fa3c696c750a469b66dabbee56955e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZQSWcACgkQ3SOs138+
s6FkbQ//TcU3nWtL50zZ6CO7YiGnMZvV0R3SIBQaxEZaD/C4mMNwfyJoHH5vQ87E
CnYewOH/nzdwzIUQsG3iY0mCQamHuJgC/N5JDvlDg/Y9TmFYq59F8DC584Ueh4DN
l2k/0HcAB89IU2+C1rZ/RwcTMgLNpMcGXYf2ZbgI0UtkHAPsW5X5HlKWivupg21B
9tU73AKBHd9kbS5u3WxtzwbPDgFlSY26et+HgNuDpTQpbLsEKMMFcAz2S4+/36L8
IB4eJk8DLtTFnQ5dzYiNbOWk/T8L7GNkPAyiuD2yYVJC7ISbzVsFlXrwR1OGbGTz
rVwQOB4W727+pfj+oneHHF2y5H+wcSZs15yqPARC6TAb3PuwwUGzEcNqim7Upzpf
DwC7OWP78ieFgfRX/6CfOVtNtXUEPFwVVBvnaWGwveecpXrW+4V28WQItY7iPgZ2
kff+q54lIbEoNIJagO7qaomRbjL2jQ2WH8wkTzs/8ItFYxIh8LADLrzgnrByV9ik
b23yGaLv+qWDIwzIr2rFggiBqeMl/PITM9aN2FQvrcsNoNtsRMttljYEFKu9FP4D
YMa5rJh3sHCYCwsroLMZTo3jLLVmZKgp5+vPZgfdiUYglWphC7LrQKN4WjUeOwsH
6RQDaOFra+X0ri/GnNRb+xfrHJC5QCpYlmoLySobHrv6MuiP7Vc=
=2nUy
-----END PGP SIGNATURE-----

--fb8b70f1c41e009f374399bb3450b2fa3c696c750a469b66dabbee56955e--

