Return-Path: <linux-i2c+bounces-3299-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FA08B5AA4
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 15:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 196341F22B19
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 13:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7091574BE2;
	Mon, 29 Apr 2024 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GG2LIngI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8086A8DC;
	Mon, 29 Apr 2024 13:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399022; cv=none; b=hWqGXIo7rpnlD0qNGRmpBWpLRvmf2SNkTgVMtCAxRcfXW+fE8Vk2hAPr34SCe17mpbWbHYfFEXYy+ur0ipnB8rZyc5DUdNT+H2TrEmJfr5y3zOZ47y3dUZ8LJ2jz8AcjLSY8hAQ4VrGC+cziDTAfiv1+qECh+ZjPQd75fb0Hubw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399022; c=relaxed/simple;
	bh=hrLWHVfoaJSAGcsmzkGrXHUYp5l5rsvCk0u32hKO+Bw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaWYg6zaRqiXivQnHXLd9w3gl2Mzr9tsnYhkqxRzlUG32TNActUURE4Uw+hjfGUZloSz3bmrXb3DGw5pvrT8SFNxMOjSwY5wHLbR3YZkghpGdDiE/Lmz4MzLHnbOfhOrr5kQtRStTWE1e+Si714B8XY84ii+dcORYL584oBH3ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GG2LIngI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9040BC4AF19;
	Mon, 29 Apr 2024 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714399021;
	bh=hrLWHVfoaJSAGcsmzkGrXHUYp5l5rsvCk0u32hKO+Bw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GG2LIngIGzse3bsQ9kthxsjMAUAZI18Z566oUWErkMx6pPPK49xkUk+Xz0B0X/Bn6
	 R+b/P+Htbg22jhWoXDB3Oyz9gUNFa0MN/amxRG6aIki1f6CGNXKXGfBiIsMQQFOXjW
	 YTmvzuopp2z2VIIg7xi23SW8B8QERxA2gbE/cTlQhkeuuVyPDzHkpS30qyffRa3Npp
	 BbYI0Cd1nNXvpvP7zDBBD+K2ENXv03afNPJUZ6U//q0KF8rtLwUz60ylXyFnIi+FGl
	 jLBwmtlZ2+0I0um1rWTWHVQBh3wiZxSCmFzINCFYm/gHYuYfK/rY6qG37jIEW6kM5c
	 y+/eAsjXLl9jA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2db17e8767cso52413921fa.3;
        Mon, 29 Apr 2024 06:57:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPP1nzWT+T7r1oMk7NuIllaju4C5zN/URBmbFt3eKErJi9Uw6mvjnvPEwcR/nWxpCw38GEHZzriTipIdQJjaP1RSPNsQu9MwuRRwOt+WxvLfCYOyu8IL5tR3a+D4lbxQ2jw75CNfrzXUdtyiTAkW0h6/W1O/ql49MQDn2iWcMzAjqsRQ==
X-Gm-Message-State: AOJu0Yw28WdaAOn91anqcBMB0/frRnRykzPUILG1k4lk1RbfNZ1ONn6A
	cKLI6av0guR+CWhHCIycnQu8zlhNEJIL1yew3Jvq912oP16BjpUeyfhBnGSSgO/BxEgwB7kE38V
	08xY81fEkRXVDByKZpkvbu1EE1g==
X-Google-Smtp-Source: AGHT+IEEwIcqYTHNTyeaORQu//zY9IvZBv3W8ieDDuTopIM8O5FwyOdckugAJo/9oCC9YM+OZe74ACDK193felORT8U=
X-Received: by 2002:a05:651c:212a:b0:2da:7af:e6a1 with SMTP id
 a42-20020a05651c212a00b002da07afe6a1mr7547332ljq.3.1714399019810; Mon, 29 Apr
 2024 06:56:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
 <20240426-dev-mule-i2c-mux-v1-2-045a482f6ffb@theobroma-systems.com>
In-Reply-To: <20240426-dev-mule-i2c-mux-v1-2-045a482f6ffb@theobroma-systems.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 29 Apr 2024 08:56:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJH-wD1BbSK=DmBtftpWT7YDbabmvgy1+PPii-8ziHTiQ@mail.gmail.com>
Message-ID: <CAL_JsqJH-wD1BbSK=DmBtftpWT7YDbabmvgy1+PPii-8ziHTiQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: i2c: mux: mule: add dt-bindings for mule
 i2c multiplexer
To: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 11:50=E2=80=AFAM Farouk Bouabid
<farouk.bouabid@theobroma-systems.com> wrote:
>
> This patch adds support for the Mule I2C multiplexer.
>
> Mule is an mcu that emulates a set of i2c devices which are reacheable

MCU

reachable

> through an i2c-mux.
>
> The emulated devices share a single i2c address with the mux itself where
> the requested register is what determines which logic is executed (mux or
> device).

Just to be sure, we need a complete binding for the MCU. Is this the
only thing the MCU does?

Rob

