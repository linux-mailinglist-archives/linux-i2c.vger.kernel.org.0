Return-Path: <linux-i2c+bounces-11307-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40601AD23C7
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 18:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C6247A1541
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 16:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6ECA21ABDD;
	Mon,  9 Jun 2025 16:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9jKQzZH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA02921A455;
	Mon,  9 Jun 2025 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486322; cv=none; b=ROp7IOTM/G8knjl3Ke6tkMOxCxXznTAJZdNOszinciN9wAafsztySqxnwl3+1MlwAvB6O4CU6H6mCR5qqBPJaAacmt7H/s9OUIjdXP7eiw8/vYtrfiVxrhV8J629wVxYk1w5Xgsw3qfGJ039OAZRF/4XlI4PbEe57PB9FiMnI6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486322; c=relaxed/simple;
	bh=ewBoIicoU2rPiyvMAvO0aqL5uC6Y/7DiQIIPhethG48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsGWgnQn7QF8GGCoURghCWd4wobNGG1gEeLrZPCls4D96ZZDyQp0WRZ7WcxCM4WZEVn/Zj/tnd15emYH5ldZZksbbCZkFC5Sd2mpsqqlidN3OjT4hfIuVd7d3nrUea+0q8heaIgDLAx8RDpsSFgXKisCojGW/cUQPuuqWFgT5vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9jKQzZH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d7b50815so38875965e9.2;
        Mon, 09 Jun 2025 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749486319; x=1750091119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLHMSY+1NpQuNIW8ZbZ+DH4o1fIGIXqUmCd7r5Cy4Y8=;
        b=C9jKQzZHESxzRlSk2ZYMrok7ynsLZiWWRcinMRaL/aGPQvMtv2rG9igGt3EX3dC9ey
         /IiKKdDAIEHrK+wB0GJHbrlpfKEAjo8Bime+81M5KLaRHjU6FnppS/OoNtSgQqVj1z0N
         R6be8BEwa/cHT9AvbvunYVgDy5jg3zgqJIL8xUgEST6b0Fj2fahKMzqufvCs3B+jAKFj
         eZ1cnQd5qePGV9oyo0AmprytIklh2V54l8tRmRPRW1pkoPN6ZMHGoAx+rBwF04dBrtbO
         4eOCY+DhBhUgAoi0U+bq+KptYWFUfGFE07YkCGHZ0DCH3ywM9b8Q0letnxDnMLdxzwkR
         UwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749486319; x=1750091119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLHMSY+1NpQuNIW8ZbZ+DH4o1fIGIXqUmCd7r5Cy4Y8=;
        b=AMGBnn8pHVZXvHM6D4VV8kluJWRdzw/FTQmHweRGzcIeE69UuGNWPi1zaZNY/BQaJG
         R2PZa1qYacBh+Z1P2EI6SFxIkQnAp1Y0or8necjSyP3MwFLnulQaJY4OW9kFJdkQA0sR
         T0iGC1Q0f5bHyJg0aAPyeBATAcXag1uGg24M7y7MuYP3Ks/VjqMvJGNUCMb2PdFu1A3a
         UswrVlVoSL++v1bCHWLBt2Zh6/1rIvk/L4Ft8ThUTptSofRlb2t27oXMEzf6ixp0CLSf
         fqGZH8aK5aHCHWz3NH7ltGyE3ei0SPd0NtPrx3j3mk8sgwOMyJ/nQxNfZoPDWEliK/Sx
         AfAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMvhzZJ7OGZzgAZQc5Pt7GZHoLVAajwbHi7GolkOkxoEI1ql0piUluQl5Mf8ndkUFaND8jV2JvjDvSTdQ75u/Ty6I=@vger.kernel.org, AJvYcCUXavCC911hhqUBS9XfdrJucWlO8ojGwUR02SZdWxEMHfQFeNZCvitk7/t3+M2B2HlD9UiQi0IJDNg0@vger.kernel.org, AJvYcCUqS/GhmYc93io2AVRTKaBplir3f7HIqi82kiQw8qXdn/dV+03UAXVjlqFabp8yBllvYc+fUwjC9UKN3lAD@vger.kernel.org, AJvYcCVVzHtpx2ejJj5pzMFtbdXRvH6RLpol9PRhx+fmfJs2jdmPOa0eDCEt+mGNtqRqdQiJA2iHOBpaoGAW@vger.kernel.org
X-Gm-Message-State: AOJu0YwmgXjH7yfzktNiP5QZVEHBGDw8bGt8AxIccDjxRm/i1lZWs0N3
	j23GRa/dmIZaHxl4Iostvy1NpUkbDdAhKtPXRoTg4Tp+6MfUcIbSjjfOzihexg5I/5p3hTIsuOv
	p0arpgekiKsSUuZi7UR0uAVolknPTWsV9wusvczU=
X-Gm-Gg: ASbGncsm4Pp0Nogjo5R5UToNZDyYbIOvEfjYT0Q884dvYYo5DCyx0TVAo0K2pGVT3ll
	3aJq28TM6k5RCKtNFgPYjfz4OtEH8ZvFxzuC7jpptbQxHlpn6ydGio1FBhIArXPiT5LtbZRpAVQ
	+4Rl+PT5ojuKPZVItgc1I9/4kpdMezscivXbJYS9kayec8q8hEStFwkvWW5uAgkYMO
X-Google-Smtp-Source: AGHT+IEEbZ3PXC2oHrXVHH4I0F4HXHOqQzdudJSfeMWMLuxG2evM3fVi6W4ih8RZKbZ8KuKXQw6lqSF9zPNUDZGNFI8=
X-Received: by 2002:a05:600c:4686:b0:444:c28f:e81a with SMTP id
 5b1f17b1804b1-45201423593mr115761115e9.27.1749486318890; Mon, 09 Jun 2025
 09:25:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530143135.366417-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXO1fOODiDA4vQBT=+LKRjT5ZoeewdyPSDoTeeoqUVTSA@mail.gmail.com>
In-Reply-To: <CAMuHMdXO1fOODiDA4vQBT=+LKRjT5ZoeewdyPSDoTeeoqUVTSA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Jun 2025 17:24:53 +0100
X-Gm-Features: AX0GCFvjk7pK_HYwdTAM_eJeLHbzN785oYdsDzmaDOiVC_DAci0e231PKJv9lJA
Message-ID: <CA+V-a8t3rjKya9BwLfUiLvJtfPLavV9+MxstYTrFpxyNtkvzZA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: i2c: renesas,riic: Document RZ/T2H support
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Jun 6, 2025 at 2:21=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 30 May 2025 at 16:31, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document support for the I2C Bus Interface (RIIC) found on the Renesas
> > RZ/T2H (R9A09G077) SoC. The RIIC IP on this SoC is similar to that on
> > the RZ/V2H(P) SoC but supports fewer interrupts, lacks FM+ support and
> > does not require resets. Due to these differences, add a new compatible
> > string `renesas,riic-r9a09g077` for the RZ/T2H SoC.
> >
> > Unlike earlier SoCs that use eight distinct interrupts, the RZ/T2H uses
> > only four, including a combined error/event interrupt. Update the bindi=
ng
> > schema to reflect this interrupt layout and skip the `resets` property
> > check, as it is not required on these SoCs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> > @@ -29,32 +29,46 @@ properties:
> >                - renesas,riic-r9a09g056   # RZ/V2N
> >            - const: renesas,riic-r9a09g057   # RZ/V2H(P)
> >
> > -      - const: renesas,riic-r9a09g057   # RZ/V2H(P)
> > +      - enum:
> > +          - renesas,riic-r9a09g057   # RZ/V2H(P)
> > +          - renesas,riic-r9a09g077   # RZ/T2H
> >
> >    reg:
> >      maxItems: 1
> >
> >    interrupts:
> > -    items:
> > -      - description: Transmit End Interrupt
> > -      - description: Receive Data Full Interrupt
> > -      - description: Transmit Data Empty Interrupt
> > -      - description: Stop Condition Detection Interrupt
> > -      - description: Start Condition Detection Interrupt
> > -      - description: NACK Reception Interrupt
> > -      - description: Arbitration-Lost Interrupt
> > -      - description: Timeout Interrupt
> > +    oneOf:
> > +      - items:
> > +          - description: Transmit End Interrupt
> > +          - description: Receive Data Full Interrupt
> > +          - description: Transmit Data Empty Interrupt
> > +          - description: Stop Condition Detection Interrupt
> > +          - description: Start Condition Detection Interrupt
> > +          - description: NACK Reception Interrupt
> > +          - description: Arbitration-Lost Interrupt
> > +          - description: Timeout Interrupt
> > +      - items:
> > +          - description: Transmit End Interrupt
> > +          - description: Receive Data Full Interrupt
> > +          - description: Transmit Data Empty Interrupt
> > +          - description: Transmit error or event Interrupt
>
> Nit: the documentation calls it "Transfer error or event generation".
>
Agreed I will update it to `Transmit Error Or Event Generation`.

> >
> >    interrupt-names:
> > -    items:
> > -      - const: tei
> > -      - const: ri
> > -      - const: ti
> > -      - const: spi
> > -      - const: sti
> > -      - const: naki
> > -      - const: ali
> > -      - const: tmoi
> > +    oneOf:
> > +      - items:
> > +          - const: tei
> > +          - const: ri
> > +          - const: ti
> > +          - const: spi
> > +          - const: sti
> > +          - const: naki
> > +          - const: ali
> > +          - const: tmoi
> > +      - items:
> > +          - const: tei
> > +          - const: ri
> > +          - const: ti
>
> Given you have a new set of names, perhaps "rxi" and "txi",
> to match the documentation?
>
Ok.

> > +          - const: eei
>
> Perhaps use the order from the documentation: eei, rxi, txi, tei?
>
Agreed, I will update it as mentioned above,

- items:
- const: eei
- const: rxi
- const: txi
- const: tei

Cheers,
Prabhakar

