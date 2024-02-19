Return-Path: <linux-i2c+bounces-1862-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EBC85A583
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 15:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 574081F226FE
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 14:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2078374C6;
	Mon, 19 Feb 2024 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofwXhxnc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AB037160
	for <linux-i2c@vger.kernel.org>; Mon, 19 Feb 2024 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708351888; cv=none; b=HFj9/+l1t7obEyLpp9EIQ1vf5/M2+BriDQmNEXBiRM1nJMO7ZBNH2FdBlN4oxrAWVTDc3toVxOZhRvSmK+McyCZpzxK3qnTcq61dYND6+80KLmm726kUQAUrvSSMPEJMGTngG2ZuWLafolYGp67yOleLQxtMw14OyV67xdrSeKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708351888; c=relaxed/simple;
	bh=AL5wPKCohpQ2yiWdCvAfraFWUPzLoyX4xAACLyQi/3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPJKSGKrfFUQEQDRji2/54tUziFbeP+v/pzVkYHV3LdSAqb2q+T6fj92HRNDMy4rCyWG6lAr5YvBPQ7Q2ObPcudYRI0/oEKf3TyHpSQI7tMBruU9+Kz1SOoM+23to0RldE7Q6eHnqTc2X1UqH6rqeYY3dVVFOfNtMB7YGJMVtxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofwXhxnc; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso4012055276.1
        for <linux-i2c@vger.kernel.org>; Mon, 19 Feb 2024 06:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708351886; x=1708956686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLWue9ycIOQi61G3VhAa/UT0phNqo7WitTTg69VFfzg=;
        b=ofwXhxncZ+RLtd3LUTHnaNto2ucA2DnyFFN7l/uC6YZ91b8slLEVkrogxnycQAQqZY
         QpfmhKD1ffifQAH6n+Qwnb9VZ/XQjn63tgGGfY6NEv2WDKxTTpiB9p0moMN/WIFZXQRd
         CpEiZ1b3NaHuW57ekigQC7zuE1IhKkciUD0hDlOIHYRs5CG9uMSjskIRV3pIz6+k5TSA
         fDeDHAR1kPQmuB3neP1C1vCKHbOX/KhoioADwRryeBp9KNDXZlsauNdZjlAQj9LAOJoZ
         63r8wGvIyIYh7Bj8I+7SRmOs7c/6G/DVfytUhFVqIP1WhzCeYkLYJkOochOxIsHgWwxm
         GX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708351886; x=1708956686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLWue9ycIOQi61G3VhAa/UT0phNqo7WitTTg69VFfzg=;
        b=KA3h8/bWWi3IvSoi/bCf3JrPP+DwOSp6NhnSPtBpi0zCQpPMGctfxGnSwZAr7IVreA
         7rVCCF/sFPmhB/ewbEWjJw5MnTUtH5k3ghvG4N6cqWvRneY2cg/2wFR1bz3XRH2qBaAV
         dcq2MHmR09aROiVFHk4fWx4tDMJdKpxbdRbeZ55sYfz53U3o5BRytyWLJ8ZZJgd3ub5i
         bC41tIsZsv38cFQS7816bznUgLzOJJNOZzIJrBchr8XepmRa/1sGENWLzlL6LzPYpj3R
         fslb4jn74RWrx+AxlIPDP3G+L0aT+5bUieLs+AHhR2SCfdyKHUNbJYSsXgBxRZFLpznv
         yJPA==
X-Forwarded-Encrypted: i=1; AJvYcCXC4o8oqJ3Y1xrjRvscTgDHqg5O7VIEVjmpZN0Ro9e+84Fh/dRP2Rv6vrvKxPqml02hZKSSPBH/k6ZWL0r1EVVZNNWUaJhEdf8O
X-Gm-Message-State: AOJu0Yz8Ewa640UPRoMf3CQHJteBjVd+xDHe9gy3XFgvnaLFVllhAkMM
	/9CeNeJDv7BVePYvSdTtR4udu+F8YRr57UOMxXx7zT0OKI98fopsZ98F3H6qernb7I/eI8dgZVg
	E6EL+jicaq9d2ZgZnWdeCrb56QJk53sb7cbclOSvJ2GAypc6k
X-Google-Smtp-Source: AGHT+IEyZLci8obwFdop3kZF7Pd3UOHq57xrv0s6peR9LNlh8VjmZu/Hfi8U9om9ebeFZisu/0Ryyvpi+AcjByuGjXU=
X-Received: by 2002:a25:4156:0:b0:dcd:49d0:eece with SMTP id
 o83-20020a254156000000b00dcd49d0eecemr10314098yba.60.1708351885246; Mon, 19
 Feb 2024 06:11:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:11:14 +0100
Message-ID: <CACRpkdbmQLAL-W_2y_T4sBJtZN-DRXMsYhODP=sXSJ4ysUKpxQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] Add Mobileye EyeQ5 support to the Nomadik I2C
 controller & use hrtimers for timeouts
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 5:52=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

>  - Add a new compatible to support Mobileye EyeQ5 which uses the same IP
>    block as Nomadik.

Sweet! I'm amazed ST Micro licensed this "ARM PrimeCell" to Mobileye, but
it's a well tested IP and used in eg ST automotive SoC:s so it's a solid
product.

It feels worth it for all the time I have put into maintaining it, finally =
some
real users again! :)

Yours,
Linus Walleij

