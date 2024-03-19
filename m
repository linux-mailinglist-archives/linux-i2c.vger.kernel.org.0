Return-Path: <linux-i2c+bounces-2411-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE64788040D
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 18:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 842061F24607
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 17:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943B928DD0;
	Tue, 19 Mar 2024 17:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yy7sXhQu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA9723772;
	Tue, 19 Mar 2024 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710871045; cv=none; b=VRtR789NJ/zzLK5CrjPZ9A3a9PbRIhvOO2RTX5e8vpsOwhL8Kp3C4DelmGq0JzKDSiYMFSlikQYuLFZg93ORlsRyA9+B1q3hzDYkoqVRSuwgWqXJu1L+nV6XHTVZ88yI2GvobXGCkMLGtJV38K+Whuqnj0RrQLSxqJeTwqia26A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710871045; c=relaxed/simple;
	bh=rSMBRQhO86ZaiahiWoHWOAwZH8gnfghHIse2UHp08jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXcs/Q+j3Thtwdb0cZmzFLzXdXbE5OdHbJ2zwe+UAG0J4hXnWliAOegVyNkVXfB0J9rpGzygOhmsz2evddUk2xsZ2SNe4lmHEmzml3EoWCumW2Z+cmtN6MDvOHvPBvktdE8fpVHP5RNnfsmY652S5gBoQ4QNIZK9+js9X1RzQHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yy7sXhQu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22A3C43390;
	Tue, 19 Mar 2024 17:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710871044;
	bh=rSMBRQhO86ZaiahiWoHWOAwZH8gnfghHIse2UHp08jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yy7sXhQuG3ansdkEVsG2rjbdMxh+eZDneKfQWZQ/l1vdO3Pfl6XqBD6JH3nso6oTv
	 rv5w8y5bPaoo6W7bcl0jE7vrVIWHhRdcGEvs/6QGEwubc5FRTVZqIP+xPC7qhIAdGG
	 OwDl5xORkQqKP3ii9S77hG/Y/vMvObGYGeG5oQKf/mlwTcCT+TcC8nan8hHq5nGN07
	 LkRtgwdF7+wsAK3H28iwAydH5oN4ROM7NEgEZFArYQIho0KCA+l11bGBNPo6OCvGqW
	 G4Ogj5Gyz4UPKy48jEQ/MdEd5mUtJ0MHpGC6fnmyHdvZCcjfcXvlO9CH2UjXhEmOpX
	 7ZRtZy3KX8Sqw==
Date: Tue, 19 Mar 2024 17:57:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: nxp,pnx-i2c: Convert to dtschema
Message-ID: <20240319-oversight-viable-4550ffbc31d9@spud>
References: <20240318153959.30755-1-animeshagarwal28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="03jX1Fej0ep+ArIc"
Content-Disposition: inline
In-Reply-To: <20240318153959.30755-1-animeshagarwal28@gmail.com>


--03jX1Fej0ep+ArIc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 18, 2024 at 09:09:53PM +0530, Animesh Agarwal wrote:
> diff --git a/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
> new file mode 100644
> index 000000000000..3125b2f5891e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/nxp,pnx-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP PNX I2C Controller
> +
> +maintainers:
> +  - Animesh Agarwal<animeshagarwal28@gmail.com>

You're missing a space before the <, but otherwise this looks fine.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--03jX1Fej0ep+ArIc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfnSAAAKCRB4tDGHoIJi
0j+6AQD6xcT1/6zqEUexPuQRIoJHOkyYu1vcSk+IidBMesL1WgEAtG32NnzqA5qe
TrrUfX0twBIhxb0Hn4r4lsiYh5NKuwo=
=J0yU
-----END PGP SIGNATURE-----

--03jX1Fej0ep+ArIc--

