Return-Path: <linux-i2c+bounces-970-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968F181CE30
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 18:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5170328AD06
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 17:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDD328E0A;
	Fri, 22 Dec 2023 17:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXuMzfBa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFCA28E1B
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 17:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78113481f91so132184185a.3
        for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 09:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703267797; x=1703872597; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/HhLTRm08Y43dtSXWxfZ5KzfsdQRFgDHvFFek/ks+PY=;
        b=jXuMzfBaTId7RAsCp4Ev56iOS2JNp5+JKj6ZQaE638gKfYpCCcaFxg5qFk4LlRWafe
         bHvZTulOcsjjYWAJhIdYY+2VQTGx0lMDVka08BndKYZUxlSuVW/wR+MW2+SvFid6rnph
         igMWh+bHsGJTOYUwTgVq2YcmYFB4PnkRzg5wN+OLn9IVRYKnF7RtX8RYffyo2o6my7O9
         Nc9Lsil7JtrNdIMl6HAINnFw/F+ZKxDrJu4yvkUOSduVUikPkFrXo0XM1Wlh02Kbeuy7
         KXNePdQriKjoAsXk4qSvENUvAvO4bumZnByfzl7J6GtPgPgw4G/4Jjorsfai79aZjIQ/
         0+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703267797; x=1703872597;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HhLTRm08Y43dtSXWxfZ5KzfsdQRFgDHvFFek/ks+PY=;
        b=L5hSWPp3Aa8x4fhRZp9I3IZNpZ2FMt2RMgB++vd7eDen0MqLaBIP0bddJkGGUPNpic
         X0i+2EL5J4lmDZdVlfV3e2cZxr3xwPDsQEUbxwDb7ggCFv8vNyzc8TQQGNhh7TSEl2uC
         IzpkBXN3Yi08CBKCImBdh9yOsRrOq06BEVSxISXuw3+F0qzneIDfEXwCLslJgyLCzWts
         Teq17kh33x8b74JGGxRuoliGebt3VSqgeHVKiUt8TTU5fXehbdC71h5AbzuDVIFp0FAg
         RoUu9J7bUvL+yydt6ULe0G7FLHExL8vyig4W8WUzxvg8gKv6TGBxfBDM+ndlhqiGUxbl
         IMXw==
X-Gm-Message-State: AOJu0Yzy8u2+kM+SEKEjusTYIqeViwPyNuUud+4p7iGQ2rV1cLrSqcVn
	SQHWsIeKefVppHy+b4n7+vi/O8s4HMg1opx2xhTbWSeOLw896g==
X-Google-Smtp-Source: AGHT+IG9Aiis1ajE6B2jjYD+C15ieRSm6oqpOi9lEtvJS7UBbdBf4Zjd9BXZZQoWAgS4DtHb8E2xzJl/+Kil1Evx0XA=
X-Received: by 2002:a05:6214:1301:b0:67f:f64:8dce with SMTP id
 pn1-20020a056214130100b0067f0f648dcemr1955342qvb.108.1703267797556; Fri, 22
 Dec 2023 09:56:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-3-tudor.ambarus@linaro.org> <20231220150726.GA223267-robh@kernel.org>
 <173b06ab-2518-49ee-a67f-85256bc5b6a7@linaro.org>
In-Reply-To: <173b06ab-2518-49ee-a67f-85256bc5b6a7@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 22 Dec 2023 17:56:26 +0000
Message-ID: <CADrjBPpGWxidBYvEcQjv1k6QRcoJSdnJ7SK1koJpeb60V3FhKA@mail.gmail.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: google,gs101-clock: add PERIC0
 clock management unit
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
	andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	arnd@arndb.de, semen.protsenko@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Thu, 21 Dec 2023 at 07:20, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 12/20/23 15:07, Rob Herring wrote:
> > On Thu, Dec 14, 2023 at 10:52:32AM +0000, Tudor Ambarus wrote:
> >> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
> >> clock management unit.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >> ---
> >>  .../bindings/clock/google,gs101-clock.yaml    | 25 +++++-
> >>  include/dt-bindings/clock/google,gs101.h      | 86 +++++++++++++++++++
> >>  2 files changed, 109 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> >> index 3eebc03a309b..ba54c13c55bc 100644
> >> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> >> @@ -30,14 +30,15 @@ properties:
> >>        - google,gs101-cmu-top
> >>        - google,gs101-cmu-apm
> >>        - google,gs101-cmu-misc
> >> +      - google,gs101-cmu-peric0
> >>
> >>    clocks:
> >>      minItems: 1
> >> -    maxItems: 2
> >> +    maxItems: 3
> >>
> >>    clock-names:
> >>      minItems: 1
> >> -    maxItems: 2
> >> +    maxItems: 3
> >>
> >>    "#clock-cells":
> >>      const: 1
> >> @@ -88,6 +89,26 @@ allOf:
> >>              - const: dout_cmu_misc_bus
> >>              - const: dout_cmu_misc_sss
> >>
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: google,gs101-cmu-peric0
> >> +
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: External reference clock (24.576 MHz)
> >> +            - description: Connectivity Peripheral 0 bus clock (from CMU_TOP)
> >> +            - description: Connectivity Peripheral 0 IP clock (from CMU_TOP)
> >> +
> >> +        clock-names:
> >> +          items:
> >> +            - const: oscclk
> >> +            - const: dout_cmu_peric0_bus
> >> +            - const: dout_cmu_peric0_ip
> >
> > 'bus' and 'ip' are sufficient because naming is local to the module. The
> > same is true on 'dout_cmu_misc_bus'. As that has not made a release,
> > please fix all of them.
> >
>
> Ok, will fix them shortly. Thanks, Rob!

With Robs review comments addressed feel free to add my:

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

