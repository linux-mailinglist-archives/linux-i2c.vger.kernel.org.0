Return-Path: <linux-i2c+bounces-8643-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EA19F7F1F
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 17:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 680597A4001
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 16:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9145227BB3;
	Thu, 19 Dec 2024 16:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRZ3a/Ct"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF635226870;
	Thu, 19 Dec 2024 16:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624825; cv=none; b=ShLviAI2MfbkxQtZLgIiAFJ7dBTuyNe5+rtpTkPrdT0ouTqLDP3rvjIr0rOAfo8QsdPRdkA42NMU21wVhJNHcUaA/zF9YtEGwUtSM9MNkXwOmGVCEyeemrrbSXtHQCUMKHKzxJJOWGZA53PtiOlvUAyX7sUscuzeSobceCa5fHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624825; c=relaxed/simple;
	bh=3ZslwSsDt0ZrevpyxJOwc9u5jivjryjPqkkjqbFu1x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwf+URgcfuBu+wg/hGJM9PyBN5E26jPvihz6LFtCprmrdfVA/9FvP8pI4OvZQFlucD8LbWSrxJ9reYK2xq3wfEuTwMqlzsXOgBxXuMnrhoiQgehfWZJu65EK6OQIMzuwH7phSQ8hwaPeIs3wzCZs1gwmgPu2F6ca9xAZaZ+vRxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRZ3a/Ct; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso149989066b.2;
        Thu, 19 Dec 2024 08:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734624822; x=1735229622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N+saF3O8ciaGMcz5UMikE+GnYspkuI5iWB6DK4vON0=;
        b=gRZ3a/CtvPoVGjNSQBWAhBEcx2sr9/V1QICBiuawU4D9yo45NxxEusgsmRit5+huEZ
         nRgmzjURNgEWHIEQ44l53X/r8NM5QClT6hZb57iUYvyW3k51Tcpt8gN+e07FhifJRA+v
         uPVzGdn2m/LRGcLSi+prlt83hOsBnfIAOaG9jrPcrM237B9m5/t363dnECTVkjVEQRPL
         4zvfjuuuDYxEjjvJsAXSpsgfWAFvisjgtiE136GgVc1HSVQmfAU2CtEzScUv45fG6w0s
         IYo2P0E5doDB4obpuH7HGWinKiL9G9pRPvU1I21DRYADG6s65VhqXzzslRU1W4zD5YZG
         tGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734624822; x=1735229622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3N+saF3O8ciaGMcz5UMikE+GnYspkuI5iWB6DK4vON0=;
        b=vRzu1SiKgtp9ztUW4WQgUpFj1+ONnYxfKfBpeF2w2cT+RO5QoqDzvJ7i8U2YzcZh5V
         TD/WoHA3OeLaZucBaTOFAMf9vJBohfp7uq8UeLxnqak7aYmAi2LXANEKHjGeeQ9RDVZc
         qBZY+6U0xZ4AuSATKt33yHYTD4n1R8+3GoVqSNNQGcix/ETPbVYAG1MaRSjOQkMM9Bqb
         D7x5BUkPsZsRPoiXJ8CyrvPOP2EvMSLc50P88GADLQzJcQizuxgYtojV0DvbYdxd/xQS
         YyEYDg08pu/rNs0gyZc8eq+IgzBwGzd4e7CxX/cb/eFV1HJT3yeV95SayfYDcGIgGJVN
         8Htw==
X-Forwarded-Encrypted: i=1; AJvYcCU7RimTUme1EdiGV0gMWLkJdu4+Yieesww/z79JlphW8fwvPlg3WcR+TAMu3uQq0uHNyR6ZiDZpAj7AsHZK@vger.kernel.org, AJvYcCUBuAbCqw2wy9KcPTh4ZKLVDfw7A8+ECEKrb99s58/OgCulrBM3K/HNKpDWUJDQXzR0D8QZ1igW7NQQaU0/7w==@vger.kernel.org, AJvYcCXbsmSXwXOrM7ENkWIe2RrSepWnhXav2MHvAifH9JbqqjknQ+Fy9DLKTogS5ypB/vNPbjg3pti9GVguNif61Xc=@vger.kernel.org, AJvYcCXgfwdXL2KJWtnnSEPi+Uz36PtpueL11aMzwBgG6g/usF2x6l874nvf+b/Nx/RPXv+mV3ilzlqgaGhE@vger.kernel.org, AJvYcCXj1rkJnljwNvKJyzEQGvGJP30GKIPQT9m+dfMrtYYxOk5TxXEL16JVGcO3ayy3Gno/Rvap4QlCjGrq@vger.kernel.org
X-Gm-Message-State: AOJu0YyeZCMG050TwBDMTfBAtUnmh1eOhp80lB3jQVMBag8n7jRdYOyf
	wnsWU4vw8iZkPCumtojom9F6JtrKiekcAQeZnvI2aAHb8+ZC7OtAqL12VHB2SrDz2/tudPeuwzc
	EZf8eqCHgSp8JYxruNkPbT4bazOE=
X-Gm-Gg: ASbGnct98byZstMyUQmk3xOAo+W25IL5gIlPGqV3RJ0k39QigcpqtpgbxOInE9MYGEV
	7ui+ce/p6h5nBh63mAg9tGRoTxqWNIAPjx8RvRFRNfo2CLr7VHtYz9Eikwp/0l/BOb5k0fQ==
X-Google-Smtp-Source: AGHT+IFMZheT4vIS61kxIEYkmlO7h7QA29FiOWtC6wSuYpKEtK5DwRwpulJDIUJetxuXjbdb9BCz6RurcxYEa1nfi5Q=
X-Received: by 2002:a17:907:d1d:b0:aa6:74a9:ce6e with SMTP id
 a640c23a62f3a-aac07901ef7mr418032566b.16.1734624821904; Thu, 19 Dec 2024
 08:13:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com> <20241218-ncv6336-v1-7-b8d973747f7a@gmail.com>
 <kb2ejk6c4uvazuumuezsd24qhjwh3k5bw76k2shywdugjqlf6e@lrghxcxxmnrm>
In-Reply-To: <kb2ejk6c4uvazuumuezsd24qhjwh3k5bw76k2shywdugjqlf6e@lrghxcxxmnrm>
From: Fabien Parent <parent.f@gmail.com>
Date: Thu, 19 Dec 2024 08:13:30 -0800
Message-ID: <CAL6vTrjD308v-Rzu1Sb7GCuLAb94Qt7BuZgrOgrnDCXm820P3Q@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: regulator: add binding for ncv6336 regulator
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	vinod.koul@linaro.org, Fabien Parent <fabien.parent@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 1:28=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Dec 18, 2024 at 03:36:37PM -0800, Fabien Parent wrote:
> > From: Fabien Parent <fabien.parent@linaro.org>
> >
> > Add binding documentation for the Onsemi NCV6336 regulator.
> >
> > Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
> > ---
> >  .../bindings/regulator/onnn,ncv6336.yaml           | 54 ++++++++++++++=
++++++++
> >  1 file changed, 54 insertions(+)
> >
>
> subject: regulator first, then dt-bindings.
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
>
>
> > diff --git a/Documentation/devicetree/bindings/regulator/onnn,ncv6336.y=
aml b/Documentation/devicetree/bindings/regulator/onnn,ncv6336.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c69d126cab33668febe18e7=
7bb34bd4bef52c993
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/onnn,ncv6336.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/regulator/onnn,ncv6336.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Onsemi NCV6336 Buck converter
> > +
> > +maintainers:
> > +  - Fabien Parent <fabien.parent@linaro.org>
> > +
> > +description: |
>
> Do not need '|' unless you need to preserve formatting.
>
> > +  The NCV6336 is an I2C programmable BUCK (step-down) converter.
> > +  It is designed for mobile power applications.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "regulator@[0-9a-f]{2}"
>
> Drop nodename, not really needed in device schema.
>
> > +
> > +  compatible:
> > +    const: onnn,ncv6336
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  buck:
> > +    description: buck regulator description
>
> Why do you need "buck" node? Just merge the properties into this device
> node.

I decided to move the properties into a "buck" node to make the
upstream process of the driver
a little bit simpler. The driver is written in Rust, and if I want to
move the properties to the device
node I will need to provide a Rust abstraction for "struct
device_node". I decided to avoid this
to keep the patch series simpler by having one less abstraction to review.
If you think that's a problem, let me know and I will implement it the
way you are suggesting for v2.

>
> > +    type: object
> > +    $ref: regulator.yaml#
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - buck
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        regulator@1c {
> > +            compatible =3D "onnn,ncv6336";
> > +            reg =3D <0x1c>;
> > +
> > +            buck {
> > +                regulator-name =3D "ncv6336,buck";
> > +            };
> > +       };
>
> Messed indentation.
>
> Best regards,
> Krzysztof
>

