Return-Path: <linux-i2c+bounces-1948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6523F861804
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 17:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EFB328C68D
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 16:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07657128811;
	Fri, 23 Feb 2024 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brRGHeTv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6B58526B;
	Fri, 23 Feb 2024 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708706089; cv=none; b=n7r+iIQr5endIz5ksiRZziCRhhwipYPHdqM25CwrL9Z/rY/pMdX+Fn/+PCYFCpA/pwZ3hjiOcOJY0v1gZa+EAk7j0nGtFakLL2lNr7FYbGOYw5q/xUpROE8kVE9e1m1nwXmLpok7YL7r4fpvJFEKslCPwn1cZKsfG8ZfUiAj+gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708706089; c=relaxed/simple;
	bh=ML4ablhECz74yeyKTaRvj0YCaIvVpkryRuSuGokJQxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Qe4yrvR8bOM4zN6x/ua6S9T+sKCLiDLRnAKeWg2ebNqpaAl8F6uSntVSQbpLF/eVTHzIgvFOF3NfyHo892WFJUmh/P2a0koq5Y9q8j0uvL6hUaBRh2ckU4HP8SBdnFOhku65lM9sHYuDOwb70FgowniQLTPRn6UR096aPDOF/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brRGHeTv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E09C433A6;
	Fri, 23 Feb 2024 16:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708706089;
	bh=ML4ablhECz74yeyKTaRvj0YCaIvVpkryRuSuGokJQxI=;
	h=References:In-Reply-To:From:Date:Subject:To:From;
	b=brRGHeTvcOMxMeLxgsQB9su2KBP0rA/NjlNhGfQHxKx1/0HRxDekA7A4jaNnSAlWt
	 7WfMIZBQ8LWdXZNmGQwmrGteW9rh69RSXWRYCZy8wf6ZxADgzN8hnzbLXd50eWTNMN
	 j5x0ABhhn9i9mv+e39KfY+TsjOKuiBkBVfJpjjKW0VOOe2DUGIPHsm0Q/WK2BkQo88
	 VEx6qRg4vg2kiFf6N5eMQokJveNj7t5vJGK6yLGXemKX9IYnTBk+1PixinifI+eXsw
	 PWZ7aePCdWa7GyjwQB/VcKWw2llXbwpBrt2KCjQxV+YaYhg5VOu1cPcYZ8JsdQtz8R
	 g+4jgKRyhDVLg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512ea6ce06aso755459e87.2;
        Fri, 23 Feb 2024 08:34:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjjpj7QQerYrRG8i2K8goT4L+V+83OcKxjd3JlQq9blXqs1zERJlz1/HZyEB9mwRnX72cW8WF05BDcqMPAUjHvQRI1tsx+q42kuUlHtSq2x+HuJZpsrjTTQ9Y0DWePBbMpPgJZUkvn2rZk3oK2pZ7/aXiXCOWbfAwn+0W0MqbV7myHs9q9Mt6TUUeXn5j7ci5+8kL3AfXGap4lX9YKogI=
X-Gm-Message-State: AOJu0YyKJFz/jF4bzNUjJ+r64A0quFeNfIGYjXZ1ZxPs4fyCVzmMD8G9
	zqbwdED5OtPux/6nq+Y/46eqsv+oJZr5H+9VfpQ/vZ2lTZg3t2dkxyss5TdEF25qqKK4ehLKMJd
	Secyn60f1567ErkKfyvk904sVwA==
X-Google-Smtp-Source: AGHT+IE8kj3sCHnm6X+LNC4ToAKPr4y//DGpPKNeaFXMPaP7aTysr9A9jP71VheZenF8UTShPBeJkUDGcWcar8hx9Y4=
X-Received: by 2002:ac2:5fd0:0:b0:512:c985:4890 with SMTP id
 q16-20020ac25fd0000000b00512c9854890mr178807lfg.67.1708706087418; Fri, 23 Feb
 2024 08:34:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-1-19a336e91dca@bootlin.com> <20240216022704.GB850600-robh@kernel.org>
 <CZ6E24VPJKJG.35LACFD6ZV5KE@bootlin.com> <CACRpkdZZhhzg5SY7U5dv_OfLEVejRFom4V9nCfkQXunAw1ZXSw@mail.gmail.com>
 <CZ94LGRSF9KN.15ZO1VRMIQVR8@bootlin.com> <CZAX02IL1N1J.2GQR9D73GLRZB@bootlin.com>
 <ZdY2WzKbElloXC4-@shikoro> <20240222171404.GA3334332-robh@kernel.org> <ZdegTjJpDJGEgdvo@shikoro>
In-Reply-To: <ZdegTjJpDJGEgdvo@shikoro>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Feb 2024 09:34:34 -0700
X-Gmail-Original-Message-ID: <CAL_JsqLk3UbrXAymTvLQeeS-ACY7makTVYxa9CetO-G-v3TuqA@mail.gmail.com>
Message-ID: <CAL_JsqLk3UbrXAymTvLQeeS-ACY7makTVYxa9CetO-G-v3TuqA@mail.gmail.com>
Subject: Re: [PATCH 01/13] dt-bindings: i2c: nomadik: add timeout-usecs
 property bindings
To: Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 12:28=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrot=
e:
>
>
> > > @Rob: My memory fails a little bit about these two schemas: we have t=
he
> > > github one for generic bindings, not strictly related to Linux, right=
?
> >
> > Well, NONE of the bindings are strictly related to linux unless they sa=
y
> > 'linux,' prefix.
>
> Ok, right, of course. What I meant was probably: why do we have
> controller bindings in the kernel and schema bindings in a github tree?

Generally the split is common, stable bindings go in dtschema. This is
anything we'd consider should be in the DT spec. Though I have 0 plans
to add anything to the spec because I'd like to generate the spec from
schema. (Not really working on doing that either though). What's
stable? Well, no solid definition there other than not new. So new
things generally go into the kernel tree first.

For device specific bindings, they will never go into dtschema and
will live where the dts files are.

> For me, this is a tad more difficult to maintain. Like
> i2c-controller.yaml file has the "no-detect" binding which IMO is wrong
> in many ways. I rejected the supporting code for Linux.

It was probably added to i2c.txt and I probably said, looks fine, but
add it to dtschema. Then the Linux support got rejected. We can simply
remove it if it is not being used.

This is why I'm generally against moving all the DT stuff out of the
kernel. The reviewing would dry up. I'll try to make sure you see any
future i2c changes. I take either patches on devicetree-spec list or
GH PR. Shockingly, I mainly get GH PR.

Rob

