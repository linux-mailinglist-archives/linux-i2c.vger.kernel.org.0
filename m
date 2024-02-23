Return-Path: <linux-i2c+bounces-1949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C25861883
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 17:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EE971F253C8
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 16:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D44129A8E;
	Fri, 23 Feb 2024 16:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cdn5DnOB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9100F84A2B;
	Fri, 23 Feb 2024 16:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708707355; cv=none; b=F6e7meaGJdVuQlzZuaHxkkFD4Bw/7085H31f9msrERAIydSFTDJfYG2DHk0KEYwlkyrRRo2XiAWObKJ0Qm/Zmd+6kQF0/qcdgeBkos8TBToknmyEu+GY5R5AFck60afwH355EYyy4mWnCxpFec4e6u7lJLoL/KpY4NIPz7G+1hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708707355; c=relaxed/simple;
	bh=o9q4NasFNGWz8zlB0rOMsX/O1t9hGjI/2ZeyGOezbiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=AjPMdUwOi4njmR1Y8fy2hJnWt/u/8EEedE4WenqCfgl4HCk2jIwF0KbLfEUdPPQQi+FHFSDFV7O3w91+/76zmoclsM7mz8Kq/L9cecA9E9XQ+37doXFyO4WFTmmdY1hYEnSa3jVJOuLlMH9+2ERHNg8CGMSz7FQXAx+plnupQBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cdn5DnOB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078E8C43330;
	Fri, 23 Feb 2024 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708707355;
	bh=o9q4NasFNGWz8zlB0rOMsX/O1t9hGjI/2ZeyGOezbiM=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=Cdn5DnOBlicJ0wUckGy4GLjk0678uwLkjSvz0YRREgyci3Ctsqte0wLRfij9CHFRT
	 S2L4JRLQ0QaiGizgjUOtlLun1f+2DGOcTRiUynJglubdSGcVZAat9Kx/2c5kqsS5m2
	 plj7Y3yoBocKYXmzHqlx8PiSMrwtD3YJKlAxA0Tu2l5mh+JKT71h0x4r7Ewlxq3RIK
	 yuR4NrFpy3wPgsq8zxxbSNpSIlFHmBN59ZlSxQYmCxNnqu8ro9xwu9/jvxcROocIWH
	 8jCN6i5Qt2629wNnfXHUZCOgchwzysgPuROgAPldAOSa5cvX46P0jffMUJ5fTKHoad
	 bu6YVtUsVo5rw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-512e75e013eso1020568e87.1;
        Fri, 23 Feb 2024 08:55:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUn6SN9ylNChomsxvkwv1ZDCm1dng5ty0XYOYb3P3aLEReU3S9HmhQGkJraixOnHIK7QGexRfexWhVpm8Vt86KxXBtUCOGOITlkvK5UC/9996hJLd4v8ikWOIPHQuHVcB8IZZqE3wf/+t9JT0fphuQTF1M1rsdG22glRIr0QaSumMo6bShjSWkwvj6qE286UPTuLSAFYbklVZdpDcc1OvIzJwJ4BWLJ3mPiVGyKyJgTLJp/EGAA1j+Qt6FEMG72KG+Noqmgs9NvLiFfQxDrn7pmif6Ak3NLDVfY
X-Gm-Message-State: AOJu0Yx+Rigxt/k9uJWiEtRRr0qB9y8CixhIpcpiEJz43OhZsEYICyTS
	Afbq7pVr9ZcbVyFk3Qm+lFeWD/AQ0//7r8DjGYMuRzbt1WmW98AwpRNxs3YLElTuQNcaQy70mLc
	d55ABu8W+/9xAcWpbmNggb0eBGg==
X-Google-Smtp-Source: AGHT+IH3eU4uHcOcgNkS4EpFf9+utY4dSGP0CnG9Q3vlqtkLCgKqay36eKFj4lBrOQtl0GgcUPQ/S/qHFYrfi4oR314=
X-Received: by 2002:a05:6512:e93:b0:512:d830:358c with SMTP id
 bi19-20020a0565120e9300b00512d830358cmr267753lfb.49.1708707353147; Fri, 23
 Feb 2024 08:55:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222174343.3482354-2-robh@kernel.org> <ZdemsdGQE0RtilCd@shikoro>
In-Reply-To: <ZdemsdGQE0RtilCd@shikoro>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Feb 2024 09:55:40 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKpn6jqktRLQUx7HMrJG0PZeiOZ=hQnHpZK6AHcM22CLQ@mail.gmail.com>
Message-ID: <CAL_JsqKpn6jqktRLQUx7HMrJG0PZeiOZ=hQnHpZK6AHcM22CLQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: Remove obsolete i2c.txt
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 12:55=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Thu, Feb 22, 2024 at 10:43:42AM -0700, Rob Herring wrote:
> > Everything in i2c.txt is covered by schemas/i2c/i2c-controller.yaml in
> > dtschema project, so remove i2c.txt and update links to it in the tree.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Differences to i2c.txt:

Thanks

> * In the schema, "clock-frequency" has a minimum of 1kHz and a maximum
>   of 3MHz. Why? The specs do not say anything about a minimum freq and
>   fastest speed mentioned in the docs is 5Mhz (Ultra fast mode).

IIRC, the high speed mode originally topped out at 3MHz. I guess
that's been revised.

We can drop the minimum.

> * new binding "i2c-scl-clk-low-timeout-us" has a description which I do
>   not understand. What is a waiting state?

Shrug. May have to look at the MPC h/w that uses the property.

>
> * new binding "no-detect" is broken. At the least, it should be named
>   something like "bus-fully-described" and then the OS can decide to
>   leave out auto-detection mechanisms. If you are interested in the
>   latter, you can simply disable class based instantiation on the host
>   controller. No need to describe this in DT.

I've reverted the property now.

Rob

