Return-Path: <linux-i2c+bounces-11408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 711F9AD88EB
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 12:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6834C188C50B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 10:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A657B2D1F44;
	Fri, 13 Jun 2025 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQeWMcQ1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E932C376B;
	Fri, 13 Jun 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809458; cv=none; b=fYyDZE7vOoLhf4rYUiCtRBzZaTnCVYEBn8uFxIRpQXPQghLVvkPFN/IDb0xRp92m22wTnkEDBN0PAmWDwBTVEmahweRDO/ANdWg06/dT3R0W+SCH88ovK7qdYld0D+49D7Gazw8Nj7VJu3aYzboAm256B/bcwPx0i3AsngvHVOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809458; c=relaxed/simple;
	bh=ghZ1LG1KHdiUBK1zj+udIgi2zei5jleAEyjVIVwbSK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ru0cU9jbVNlkS6Iu93aXp9qsvaI4qJDt0Zb5GfF6n6HV5rsEOaqk9AhcvLwgjqfHre7MwkvX6xUZ0Fyat7wG9alakVKk22myp0zMa3llm4Hg+y/B9j1Tsex/ufZ/K8oOGLnZSRAPFqahlHqO08xHzn7FMZjrEaUPG699gKqDyRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQeWMcQ1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so13048125e9.2;
        Fri, 13 Jun 2025 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749809454; x=1750414254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REfwVy48LjvgCSinXle+QxaU3FrH2CN4u42d5xmEyy8=;
        b=cQeWMcQ1qpHx2TrrfSDMvA/TrPe1qsJUm6zTDmygnt0X3wNO+EA+6lufmG/Kw313Jz
         RLQgohYw7A33/fDSJ8QHTS5oPddNmivE31ZXKkKbL0ZLxMj3ULT4ose6ACKLRUFwZnzE
         oNi15cVyy3vDYGQzbvgNhR3AqYjZOR0uMgDst0jRUnBJXb9TwuoCW6+OYG5UQ6adSaku
         Vfdx6eGMCg7z0+2zMAxb5zmJ0Z1YBoBTlRZkkFfNfpGlkTq950LcolH81s2DoI91/T/5
         ljbgLPTf1JiJLzsLIHoWl3OGnyDkdlSIedSuar56saSC9CUi67vilWVRPZ7tvKfyGUHx
         qtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749809454; x=1750414254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REfwVy48LjvgCSinXle+QxaU3FrH2CN4u42d5xmEyy8=;
        b=c+9wOvHRoQ0izBK0TRN611MvUAQO0RkorLArMPsUoiueXoS1r4GcUUw7CWP2J5xQto
         qG7o8V7PDy4+i2oyb+O34t3f3YJhEbpTkTVSzG3mS5TgNjuYZE37plVuUFuHtmqpaXbD
         iFNrLK2pkMkb+KH7lR8jgI3g9iuYw8NpgBm9ALHrC/QhjefsKrf7FAugP86D9i93R7Hf
         gnIACmdBtR8L0PT+2scSgplMOJl03ra+vjPKOIGRIJjkxUtUryP92qpk4QgkxjcdNIDU
         CfXvFUNsvbQ/k0SH73jm5tqB3udKu/61XLPmfAhcZVPBR/FAttkDLQocsz0ky+n9rF1b
         gS7w==
X-Forwarded-Encrypted: i=1; AJvYcCU3oXaLGXNijYtKr3m1G0rCz3DMwQ5gxTCrpV491oa6MMYabsZZODtNI3/P/wGvDq3xqekcSW+yMNbR@vger.kernel.org, AJvYcCVtP51CXSFTN6bdfLDLiaSeHqR1MQYKhJCSti3SWOikjj7lsohNX4JcZ7TFxczdd2kVs14lvTGd3SgN3M8sssxhI+M=@vger.kernel.org, AJvYcCWyudvbZyd37xH3H3l+uwBag1ONSj2n4g1bhhFVF9vxejQJafCl9bKJBWy7nsHwdvUZx7gnY18sW5MgFK7t@vger.kernel.org, AJvYcCXM2som8jblq3O4aymFOo5ck1F+AiIFaKZsGkjzHpn/pV96ad5jXOJZlBrUvmAFhe7z6ROWtkiuHMkH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw78l8EY391/zPwYtK6CC85l82liweClSv0AFu3o0qKgOfQnz2Y
	ANgnU7NrfadHznZIGe6VETZ2gqwp2f7OpBO68foLrDih16e5KaiYxYi/Iv35fft+ABqokUvMyrx
	+Lg1DqQrOop4075burJsCn185TIt6G+4=
X-Gm-Gg: ASbGncuB+n1Iffd44ndCeSwUu76GxtME7ZSwSW4g2BWT70j7WcJl4pA+ixX0vxNhiN4
	YBHQml2TI2pH3RxbVIfAkMwfBK2NWUegj7f0cefo4WNc/f/YdxRTvYFEi6bydjekRdc7YdlGWqq
	6vfDymJuFvCUj1whw5VSK1akNzuZplFHADCXFtBCmOsdHoOA==
X-Google-Smtp-Source: AGHT+IEWDvuz4zH4iWOydIQMgbrpQR3J1s4lhCZk8JE7vwP5jdDaVx6ppbnNqm2UA4NOKPnuTe1bjM/QFqa3jPbgQ4I=
X-Received: by 2002:a05:6000:1acf:b0:3a4:d0ed:257b with SMTP id
 ffacd0b85a97d-3a56870469emr2315734f8f.22.1749809454252; Fri, 13 Jun 2025
 03:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609184114.282732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250609184114.282732-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUCYjPP326g9MsnH8p6gM-vy33L4OsFFMGzsZbLbucTUA@mail.gmail.com>
In-Reply-To: <CAMuHMdUCYjPP326g9MsnH8p6gM-vy33L4OsFFMGzsZbLbucTUA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 Jun 2025 11:10:28 +0100
X-Gm-Features: AX0GCFsNZ6GYODXXSo_A5GWSFs0V8tUCqmJPQVQONI8m8dqOA67nkeFpQLYGvN8
Message-ID: <CA+V-a8sWMFEA5Ub8nGh6jygcQKKVm568nD2zo5HSE2jN1qp4pg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: i2c: renesas,riic: Document RZ/T2H support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Jun 12, 2025 at 1:17=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 9 Jun 2025 at 20:41, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
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
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> > v1-> v2:
> > - Listed the interrupts in the order as mentioned in the
> >   HW manual.
> > - Renamed the interrupt names to match the HW manual.
> > - Added Acked-by and Reviewed-by tags.
>
> Thanks for the update!
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
> > +          - description: Transmit Error Or Event Generation
>
> s/Transmit/Transfer/
>
Agreed.

> > +          - description: Receive Data Full Interrupt
> > +          - description: Transmit End Interrupt
> > +          - description: Transmit Data Empty Interrupt
>
> The last two don't match the order in the documentation, and the
> order in interrupt-names below.
>
Ouch, I'll fix that and send a new version.

Cheers,
Prabhakar

