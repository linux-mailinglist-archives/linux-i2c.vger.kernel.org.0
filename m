Return-Path: <linux-i2c+bounces-2941-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBA38A5689
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 17:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F266B20E74
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 15:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5B779DD5;
	Mon, 15 Apr 2024 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBgSgn1o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF8378C82;
	Mon, 15 Apr 2024 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713195271; cv=none; b=q0FRQ1gKYT9oQ/uFckSC6cF4s84fxU85iJ/amUTRwSXQS4ECTes1YvrZO2e5mViD8g4OjaSRCKrGaqGf6hR/Seijkc3VuVpMn4wGUD46WRdSBPOZvGiIgnJ+WbSVrXI159P4rMDfwPbuXTyexvMKjyk4/qf7PfeVGrtn2xX2pNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713195271; c=relaxed/simple;
	bh=lt3EqHtUbz9qchyHitXc3Sc+ljn9HGqN4eVLmg6FtSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8xjutUl2T+Ae1nhY05JlE2aTOzeh538uID6jgMaSMtdGHSv+1z9JTAKBHo4jghyxPwgq6OUSbKouaLXHv7oE6UOnSR+XGh7Tj8hjlLBlb66I86OJODfcldsn6u5k9zMz9r0TUOUKPrvwCsqwAwLzhoIqM3IH5TZ/KYbjo3KjWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBgSgn1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FC4C113CC;
	Mon, 15 Apr 2024 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713195270;
	bh=lt3EqHtUbz9qchyHitXc3Sc+ljn9HGqN4eVLmg6FtSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HBgSgn1o2HGiJb4m1axjl/pD+9VyP89viUPwunxWu4TaDdwU532LXIRqlpQJTrWfz
	 e/H4DQgm6oFOD3HVXK2NdcS+VFtHbByfgRjGGjGbR87SsOhghNbJCoewKmYywfDPAi
	 cIAdfr7n0OZ0Xe5ZirzXALUzlR/i+F+bYzmXaKtaW4WYSQuMTWnY4epADe1Uook69O
	 GViZe6mNG5IfWlRXNJdVHtAYCU86ZCdrzMd6GRtTUuzI2PcdaYd0Jf9+hbqexeXfL6
	 kMqPDc89mAuZdfV/vnUSaWA26huFgCqoNkDz7VNBxk2TeU+ng/G7lJrSfb8WVHZpCM
	 t/DSG86pbsSRg==
Date: Mon, 15 Apr 2024 16:34:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Fix ST M24C64-D compatible
 schema
Message-ID: <20240415-mandate-sanded-41cd7d180e22@spud>
References: <20240415131104.2807041-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FniYWCs6OrcrsZmX"
Content-Disposition: inline
In-Reply-To: <20240415131104.2807041-1-robh@kernel.org>


--FniYWCs6OrcrsZmX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 08:11:03AM -0500, Rob Herring wrote:
> The schema for the ST M24C64-D compatible string doesn't work.
> Validation fails as the 'd-wl' suffix is not added to the preceeding
> schema which defines the entries and vendors. The actual users are
> incorrect as well because the vendor is listed as Atmel whereas the
> part is made by ST.
>=20
> As this part doesn't appear to have multiple vendors, move it to its own
> entry.
>=20
> Fixes: 0997ff1fc143 ("dt-bindings: at24: add ST M24C64-D Additional Write=
 lockable page")
> Fixes: c761068f484c ("dt-bindings: at24: add ST M24C32-D Additional Write=
 lockable page")
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--FniYWCs6OrcrsZmX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh1JAgAKCRB4tDGHoIJi
0gclAQCWccrJ4dPLhkH99N4CTLpBd/8QjhYnM+wgs98ToyWIcwD9G6ZxF1VGSJ3Z
YOlT+SchgWFpUFBJltE4A3gYHb3XAgY=
=7dSY
-----END PGP SIGNATURE-----

--FniYWCs6OrcrsZmX--

