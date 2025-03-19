Return-Path: <linux-i2c+bounces-9914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC090A68BCD
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 12:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C3CE1888BD2
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 11:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A69F253351;
	Wed, 19 Mar 2025 11:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="QjpuVdmL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9EEA29;
	Wed, 19 Mar 2025 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742383987; cv=none; b=du7LrO8QmkvUAtWNyzXB/yVCSmuXLaGK1cYkZpw5u1g2wZicR1ZN+MeXsREZWeA2O/z/QeJOJPaZt0sHahDvPhAaK/wY0eTT22FxLmLUN10mUFWlrvPZE6UD5EIN5FfkS/y4LgR8jACzY04FC4mTomTeLrw5iCYtLVUO7s+rmPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742383987; c=relaxed/simple;
	bh=cXiXr/JsZvK+TvPi0jxSLIxmXwsNc8aIsF8cyvtS+Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VXkKvn9OR3yp5yCOtFnktmP65H5CqmbQ22Y4EDgm1sxSG0uM2zMX4MH+yTdzMlXe/g4DtpHrCtUyVw7p+LZ4nRDSnnjGTtoU46zOUK+abrj3HcKfwyNTHvv3xcrbM1n3JTfbqeEfpp4AyHfi5Wshr9usCqCNSjoVdByo6uuSAe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=QjpuVdmL; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ALHuqvypAVXPwmYHPUNM9vrTavBCqYIlVAQfauZIino=; b=QjpuVdmLmwGDqb3PsuBJiXXCsf
	Gdr0vXyKAhh3ZOVGKzxpuDEL0zoiqxEW5nCW9ylByoSMnJzl1VQgRtWV5rWhQ3DwcuB4Pxk6Zk48w
	TW38A2F48+4eTn21KUYNCZDtPtA2gIHnoV67v6IYakxri29nOZXVJVzsnwEIKoZOmd+8Ilx56wlxw
	vtJHafKUzNc9FFmL2W7OwQ5S4q2tqg5l7T4ORZwBYLCZf86y1rmEPEqTSDh+UH4MwzcO30TQaNV80
	Hu5UM5hgu01lLf7u5ZmsKBtDeP7BxMYr/1sHmTd54OAgfx66f/h0epElMmE4eqp5uiJKg4ASJ7ZYE
	JM89WWDQ==;
Date: Wed, 19 Mar 2025 12:32:56 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Rob Herring <robh@kernel.org>
Cc: "Ing. Josua Mayer" <josua.mayer@jm0.eu>, Jayesh Choudhary
 <j-choudhary@ti.com>, vigneshr@ti.com, andi.shyti@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org,
 tony@atomide.com, jmkrzyszt@gmail.com, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: omap: Add mux-states property
Message-ID: <20250319123256.3482063f@akair>
In-Reply-To: <CAL_JsqJnhXwbLb3Hos2YdgnzQGOQ0AFp=HT37JsEdfp8qjuVNA@mail.gmail.com>
References: <20250318103622.29979-1-j-choudhary@ti.com>
	<20250318103622.29979-2-j-choudhary@ti.com>
	<59651605-45fa-49d7-bb15-dae83d8ad471@jm0.eu>
	<CAL_JsqJnhXwbLb3Hos2YdgnzQGOQ0AFp=HT37JsEdfp8qjuVNA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Tue, 18 Mar 2025 17:18:29 -0500
schrieb Rob Herring <robh@kernel.org>:

> On Tue, Mar 18, 2025 at 2:55=E2=80=AFPM Ing. Josua Mayer <josua.mayer@jm0=
.eu> wrote:
> >
> > Hi Jayesh,
> >
> > Am 18.03.25 um 11:36 schrieb Jayesh Choudhary: =20
> > > Add mux controller support for when the I2C lines are muxed after
> > > signals come out of SoC and before they go to any client.
> > >
> > > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > > ---
> > >   Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml | 6 ++++++
> > >   1 file changed, 6 insertions(+) =20
> >
> > Is there any chance for this to be generic across any i2c controller
> > regardless of SoC in use?
> > Is this perhaps also generic to any device in dts,
> > similar to assigned-clocks? =20
>=20
> $ git grep assigned-clocks arch/ | wc -l
> 2097
>=20
> >
> > E.g. in k3-am642-hummingboard-t-{pcie,usb3}.dts we have a mux on the
> > carrier board switching a serdes lane between two different connectors.
> > It would make sense for pcie and usb phy nodes to delay probe in a
> > similar fashion.
> > The same may hold true for other buses muxed at boot-time or based on
> > assembly options or extension cards. =20
>=20
> $ git grep mux-states arch/
> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts:
> mux-states =3D <&mux0 1>;
> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts:
> mux-states =3D <&mux0 1>;
> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts:
> mux-states =3D <&mux1 1>;
> arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi:
>  mux-states =3D <&mux1 1>;
>=20
> I'm not convinced it is common enough to allow everywhere.
>=20
strange logic. It is not in there, because it is not allowed/supported
and some quirk maybe is added elsewhere, e.g. in bootloader or private
kernel branch.
So you cannot say whether such a case is common engough by looking what
is *now* in the dtb.

Regards,
Andreas

