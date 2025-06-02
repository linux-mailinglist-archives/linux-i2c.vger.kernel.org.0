Return-Path: <linux-i2c+bounces-11192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1799ACA9AE
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jun 2025 09:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C001F17894C
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jun 2025 07:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E151A238F;
	Mon,  2 Jun 2025 07:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IA166vdB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945AA6ADD;
	Mon,  2 Jun 2025 07:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748847915; cv=none; b=fWoPuJw/jXoZz/WJKAImeadkHYR9s1e9AyfgsL7Niwq2iIrQkL68FTwzBmE2itDsfg3PCIC3jukSjsXYU9VUW6ozpIgh5/lYWKC4E4DpktLxk8WSdGn/+Os6f820lRxMhxZuvyTkj7ho7C8ArWGaURgjEI9ke5tIe7sJdt2Z+B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748847915; c=relaxed/simple;
	bh=/agSbtTlBnvlNYz0HytGbIny9TXx7Zqqrgv0m4BerA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=QT3uhi/VjDNZ7q+KE3oOICKoVTzvClH9sjq5XrLwtVaPAgm3rjmyRCN/I2I5lEBAh4vti5iKk8z6GhHzbBoYYnZpeA4TNQ638s1Nubi4+Qb6fWJXYmAJq8GknQx+2iI/90ElFoz/Xh4yIrTuU6JaMZOYTgzBmdJD3P+eV6nZU+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IA166vdB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so1068944f8f.0;
        Mon, 02 Jun 2025 00:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748847912; x=1749452712; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/agSbtTlBnvlNYz0HytGbIny9TXx7Zqqrgv0m4BerA8=;
        b=IA166vdBcATiZChb02jz5uG493Wiuzs7hrRWXJqWecjb+sjeeOuOk32weWJIWEaPJ2
         kIYo9w9CrGo4c7qRbIwt9hwgeGuegmql/0dPrh5s+x/qtdkFS8yZncBXCGrHn4dwudz1
         kyCgyQASkDL9Y739GUve3Pxe5uRNoLgISJ7s35bKKShi3Tbd0AACvXHew5y+xBfFxuQh
         D0ac6sHP3KgLMBI33XRX+5Zi8J1iCBeXI9nlGkpqNCCU3Dfutoh9fA3rVRpsof++w08Y
         AILnp1SiSTbqn/T5UPJetRqFsN7Xy7WfIrKE0aQdggkOWlMRPxP79rU+Qu9LAni0//2o
         p92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748847912; x=1749452712;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/agSbtTlBnvlNYz0HytGbIny9TXx7Zqqrgv0m4BerA8=;
        b=wlay8v8BQrkhgA12C4E9fDlw5MBnwWru+0Q09QCpG7R3Oz0zeuu4JNRDSI0PsfEOPl
         Q0QbJa9jEBN2RHOR+RI6ikts2XkzyRLH1EA+AtFyUcWL/iGDuNrQzkce1NeEOiMYgIqW
         BMiwEm77NjrGKEodw3YISSS8cKBavqawExyjwnK7YnwKNWZdTUbVYyI96Ye2c0d92Fhx
         SE8YDxpWyAu9pWS5oEmH18vzqsvHQDDymvlJU8JiiRwmuOMHEEw1++hkvof0tbZ7Yt4c
         +q6AXjsaQVaz7YkXT5yo49gmwteskjBSNsDy3pI2TccwimkCUH2ic55s0SgUM1Q1dcUC
         6Fpw==
X-Forwarded-Encrypted: i=1; AJvYcCU9xqpZpYnOpl7yrjQW6bv0CVbMzu9r22su25gNrRwxNVQmKgHWSBcpyAiKDSZR2E3XWHRbvPLJjmK3IuNVMkQ3frE=@vger.kernel.org, AJvYcCV+Zz7l9bFJnK3EkuOVKn/lBFTxgzQzCkw0T6h9OKUyL85DwZwY9uJs9U9w4jFgK+QIiVwh2ajS7HqJ@vger.kernel.org, AJvYcCW6a/F2oIxAvcWYs1kbfZ7WxRewS16OsAEgZgOAa8IZxvlESn070pHz68C+O8bPa5KL8HdJTAYf5Jl8YVpc@vger.kernel.org, AJvYcCXYk0LbWZrbi+jTOCPcpaqhqaggK5K90UiSP6YQbar2/4DEHhdeKGvtendMH2vJFjD66OPmPqj0I3F5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsss22L+sCtev6fyoLPpuysbt5PsxxDC/pa+gRHyNoFBwLW3rP
	YwoPamW+DNvLU59X4gh/KMYjVk1sDZ32LrEmGe0RKg9oW4ziyP1gmJQ3LwM5EnLOYEomCD7uzub
	bHwgKHvW4wkgaMHmP/GvjZFgbzKJIgiU=
X-Gm-Gg: ASbGncvOuEDytMMDWhsbSmfrH0f3e7vRxEW7cQvMrfmQdFJV85b3ra2mJ4wE/IKzJoY
	RAnipNJIlcGVBNtyzuJ7E8GPKGBtj3AtylNctXVkVcbXNTsixWWqvmFcwYTmr+KyRKp+/lG4e23
	oWHrA5j70zzTzTqa5t7E20vLdi5IexOps09EYOTMyiDC33uR9a3FkzOLRCL3rMlc7S6Q==
X-Google-Smtp-Source: AGHT+IH0Zea22k6huD8NYftx0SSoT7UOXUD953lRkUFSmGHltG9SMaCG61Vk1DKMWxTYa8bvPJoUrEemc2Mzq/8jvzk=
X-Received: by 2002:a05:6000:2485:b0:3a4:e1f5:41f4 with SMTP id
 ffacd0b85a97d-3a4eeda2f6amr13421055f8f.17.1748847911575; Mon, 02 Jun 2025
 00:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530143135.366417-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <aDryEVl4VtZZqUdK@shikoro>
In-Reply-To: <aDryEVl4VtZZqUdK@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 2 Jun 2025 08:04:45 +0100
X-Gm-Features: AX0GCFtXDDE1G3o9rgqW63YXqoKraGeKxlXdelBd4cXjsFer9C21bDSrO6btEz8
Message-ID: <CA+V-a8uFJ4WvpMg+wFKgyXnRT0omXUnK3JNsjE=1bd_ZNprAPA@mail.gmail.com>
Subject: Re: [PATCH 4/6] i2c: riic: Pass IRQ desc array as part of OF data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Sat, May 31, 2025 at 1:12=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Fri, May 30, 2025 at 03:31:33PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In preparation for adding support for Renesas RZ/T2H and RZ/N2H SoCs,
> > which feature a combined error interrupt instead of individual error
> > interrupts per condition, update the driver to support configurable IRQ
> > layouts via OF data.
> >
> > Introduce a new `irqs` field and `num_irqs` count in `riic_of_data` to
> > allow future SoCs to provide a custom IRQ layout. This patch is a
> > non-functional change for existing SoCs and maintains compatibility wit=
h
> > the current `riic_irqs` array.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Did you test this on RZ/A1? I could do so next week?
>
Unfortunately, I haven=E2=80=99t been able to test this on the RZ/A1 as I
don=E2=80=99t have access to the hardware. If you=E2=80=99re able to run it=
 next week,
that would be really helpful.

Cheers,
Prabhakar

