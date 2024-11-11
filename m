Return-Path: <linux-i2c+bounces-7930-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8E39C46F7
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 21:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 469E51F22043
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 20:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242AC1B6541;
	Mon, 11 Nov 2024 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9YXFbsg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8C31B4F04;
	Mon, 11 Nov 2024 20:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731357376; cv=none; b=pWaiDqM3Ru4roQXl0h1hc8J+s8tTC/HFhVMRhremxxd1tmN8OnSmo7lWvyIeZCK83HIx/i6TzB3oX2hTrr9KpRRsXsZo3FvxeGI5Hl5JP3jGUvQsDAxZESFVUB8uNmzccjqgtpKrSXD6hPmkI7qGycOoxFFu2fqGphZSMi60kF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731357376; c=relaxed/simple;
	bh=sowLwZu699PwyfGqXSwrO59uwPduv6eDK5d+b6fSKH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZeLgjLc/Q+yBy+e5y7unVdxiL/h3sYp3YzPac8NRaool55484O2mn0XPiwkGQHfhvYWIXBtbsINVWEFyIqbVNEU88rGl8H7au/qvzLwtQJ1r12xXnHaeutQntI9TNzzesawyjIkeObMpjiK0smIcRKP3IgAhrq/ExoKQoF7q/ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9YXFbsg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E484C4CED7;
	Mon, 11 Nov 2024 20:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357376;
	bh=sowLwZu699PwyfGqXSwrO59uwPduv6eDK5d+b6fSKH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9YXFbsgp6NcANX/elk3FSTRwcO8Fvpileari4s9tVapV7npfw54WspALkK/FOB1j
	 AVN1dRXjV9OXonqa/iHVklbsIDNm5WopfEAHA84dyK9UD5+06b0Ny6uNsourJoGSuK
	 fFgzyzHnd89To/F3FyF1D0F/LL4qGj6ksErK4h51fqaKPsXpQhZtSCQrNIGmqRecay
	 5psoMITvoWeAd2oYdxX5fZd4sYtTjSs0z9FlwRAeEHGiS1NAGttRCVxp/Nrx987tdm
	 Wy0OvgebxLuibe3TlE5UonBit+MxkiQtiIKq3NBCpMf4vMKP+kjZn+wpdlgNiMgbhb
	 CRha8wNyWaxdA==
Date: Mon, 11 Nov 2024 20:36:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/14] dt-bindings: i2c: mv64xxx: Add Allwinner A523
 compatible string
Message-ID: <20241111-yogurt-slacks-ae8993881216@spud>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pTTvxdvgtpuRqDjB"
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-6-andre.przywara@arm.com>


--pTTvxdvgtpuRqDjB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 01:30:24AM +0000, Andre Przywara wrote:
> The I2C controller IP used in the Allwinner A523/T527 SoCs is
> compatible with the ones used in the other recent Allwinner SoCs.
>=20
> Add the A523 specific compatible string to the list of existing names
> falling back to the allwinner,sun8i-v536-i2c string.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--pTTvxdvgtpuRqDjB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJquwAKCRB4tDGHoIJi
0sVCAP9FkjAH3fFo2Hcf+ZlfmmpDqgcCj8g44kJp6QWk/3cgIwD9Es+QU04KS2Yf
VkVqm2TK30nhRTNCt9eLkYyTwtRGGwI=
=NaZD
-----END PGP SIGNATURE-----

--pTTvxdvgtpuRqDjB--

