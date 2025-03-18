Return-Path: <linux-i2c+bounces-9888-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9337AA67F97
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 23:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DDE03B168E
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 22:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B321E832D;
	Tue, 18 Mar 2025 22:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSvj+ls3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6C3155753;
	Tue, 18 Mar 2025 22:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742336324; cv=none; b=bHbsyOhjhHNxnuRuPwztmfQ6Z1toOJYvo6kDqbGpAaEa9skUXZNq3JVp2m0pj5U8RPPlh1hWSncAnOB//ckkRy9FC3JZ2gk8OQdt+UklcfdQe4Z1sE847gh5RlvtalVd+4+mh2MjlAL7VWlNPrwjlYnTBp9ZeGhCFv/Jp8hS5A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742336324; c=relaxed/simple;
	bh=vkdQC79XQvfkbqHQz7oVGDIS3l5lNGm2h04WoA3ouVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+HkbTSuBY19kgFCI64d9rUohoUYn6DAa8dG+4VTeqp6zd/mCr71Jbax59+MRfJgardVnIiHyiMV9RewU58ggAApdoc9HZ8vnbvVutFYh+aNO038J1R0Fjf8Ef2rB8cCmlJAxrSPH5rbME0yw3KUChJZ4rrGL7Eb7xKrrtiV0c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSvj+ls3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12026C4CEF5;
	Tue, 18 Mar 2025 22:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742336323;
	bh=vkdQC79XQvfkbqHQz7oVGDIS3l5lNGm2h04WoA3ouVE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mSvj+ls3VFqoS8fnbHtRkCu/Xna17GQd2hLGcYM5v88U77FMVl+6ShDUaJvS/d0ki
	 Qr7brfAdNPkncBw+XqARc6t774GR33Dsuu48iGx29OpDyKVh/LqfncIpX/GrUInZts
	 rs7+27Bh1XxAHAhh6hZVSIR0G64IjMELxYkUURfUZzw11nuMZYWfMduuN1It4KaoRg
	 U+Mi96vZNnQfIGpWzoRAnXmZVoz/mQf7jvEa2+dKJ+qQWpvrdIzcFpgFc9wdMpTPom
	 SznNDhzwuMkbqovlDYXs7iIpofyn0rB6/00hMsd+9abZosl7VcBDWVNdbjRGwQOdJw
	 Nlicxhqbk3qIQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso8645262a12.2;
        Tue, 18 Mar 2025 15:18:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBdrO7l5ek4yHWXnoNy5c25NnqMToygXVClIFMAGGIdEHr2wSIyAgbZ5Vx39p1EmtwhP5hOC8XoWOZ@vger.kernel.org, AJvYcCUc4jBr+yYaLswbMUb9KrAqynWtfO+CRHtcEDnkaSqxjhhjspVtSCRPS1npHHfZqAd/MVq29q//bkSm0ou5@vger.kernel.org, AJvYcCVfsIi6A122XlTczJQ0nSJkpdm5Ax6Fkc3gZ/n7yIK+QOGIsl6+gwxc2TVEL2So1t4x3EbRsTx5bh9X@vger.kernel.org, AJvYcCXeYfxxhLJ1BEE0tYDHd3pi5MNVazkgHnHDoOoivQ+GS6tDe/rJ3vG3uJ21P8eb04z9ZYr1xQ+PZ0zhCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0lICXXB7RQp6r9Cmg6kdGPLZkudnGOeadAHlpB+36lUwoQaOY
	Qp6BbDb8ApeuVDlWO6NZJvYDNjGQBs8H8vOZzdtkSkSKNft9MIldrAS+Tb/FJbElpIA5OPcyG9a
	Smz162FRLFSpennaZrJgld6KF7A==
X-Google-Smtp-Source: AGHT+IFsMEAdgEoIYrNf71YtdNXeaCbte8P0UZiuSxcscCbHKKxY05YB9jxSreWxJ5mt5YFyuen73IUwyMiShOMj/eI=
X-Received: by 2002:a05:6402:2551:b0:5db:f5bc:f696 with SMTP id
 4fb4d7f45d1cf-5eb80cde5c1mr362082a12.5.1742336321427; Tue, 18 Mar 2025
 15:18:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318103622.29979-1-j-choudhary@ti.com> <20250318103622.29979-2-j-choudhary@ti.com>
 <59651605-45fa-49d7-bb15-dae83d8ad471@jm0.eu>
In-Reply-To: <59651605-45fa-49d7-bb15-dae83d8ad471@jm0.eu>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Mar 2025 17:18:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJnhXwbLb3Hos2YdgnzQGOQ0AFp=HT37JsEdfp8qjuVNA@mail.gmail.com>
X-Gm-Features: AQ5f1Jq_q-p36FuF5FSO3G448rRBEbH-k9cArJxfN4nOQpF8WgXeT562lCY_3qo
Message-ID: <CAL_JsqJnhXwbLb3Hos2YdgnzQGOQ0AFp=HT37JsEdfp8qjuVNA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: omap: Add mux-states property
To: "Ing. Josua Mayer" <josua.mayer@jm0.eu>
Cc: Jayesh Choudhary <j-choudhary@ti.com>, vigneshr@ti.com, andi.shyti@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, jmkrzyszt@gmail.com, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 2:55=E2=80=AFPM Ing. Josua Mayer <josua.mayer@jm0.e=
u> wrote:
>
> Hi Jayesh,
>
> Am 18.03.25 um 11:36 schrieb Jayesh Choudhary:
> > Add mux controller support for when the I2C lines are muxed after
> > signals come out of SoC and before they go to any client.
> >
> > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > ---
> >   Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml | 6 ++++++
> >   1 file changed, 6 insertions(+)
>
> Is there any chance for this to be generic across any i2c controller
> regardless of SoC in use?
> Is this perhaps also generic to any device in dts,
> similar to assigned-clocks?

$ git grep assigned-clocks arch/ | wc -l
2097

>
> E.g. in k3-am642-hummingboard-t-{pcie,usb3}.dts we have a mux on the
> carrier board switching a serdes lane between two different connectors.
> It would make sense for pcie and usb phy nodes to delay probe in a
> similar fashion.
> The same may hold true for other buses muxed at boot-time or based on
> assembly options or extension cards.

$ git grep mux-states arch/
arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts:
mux-states =3D <&mux0 1>;
arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts:
mux-states =3D <&mux0 1>;
arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts:
mux-states =3D <&mux1 1>;
arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi:
 mux-states =3D <&mux1 1>;

I'm not convinced it is common enough to allow everywhere.

Rob

