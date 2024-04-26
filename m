Return-Path: <linux-i2c+bounces-3237-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A248B3D79
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 19:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AF051C2460E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 17:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177DD15A48A;
	Fri, 26 Apr 2024 17:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OybWpkgy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57A6149E0B;
	Fri, 26 Apr 2024 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150883; cv=none; b=GGbn6dt0TwI9q+E4KJAjs8qiaiizg8aTOqCRoInccpJU+yPS05RJTAIgt95T2/p6ZfMDy3m+fep+v2KSCsDKbtMSsc8H2gpkVl98LS0OJEQwH8wxtFQiprrDzNhZVmYLfZX9MY+Y/A/swGLmTxFX6EANaujI2ta+LCVPmfPFHik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150883; c=relaxed/simple;
	bh=npWhV9eOwBR+K951s9eWxDqGQBWlSRqHsdyuk+LW69g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V181QyD55yYcdY1Tktg6ok+jYSyQRGGa3kxC56A+yPLJb9A1m8UZ8ioo85YUBKbMef3xaP5ieSuqvxmfKHUSnwmeNImEvWuxHjUlOoTI4AkhORyAoLiFgLLab5kjNQGB83EaRgXQD15IcSSzDmSvsBuZNNXGsvhzK7hb4CeuZd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OybWpkgy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91A3C113CD;
	Fri, 26 Apr 2024 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714150883;
	bh=npWhV9eOwBR+K951s9eWxDqGQBWlSRqHsdyuk+LW69g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OybWpkgy6DTNUaPgyQHvvfw7nDWrcb4cNlABncNZm4uXsKbQtNJrNx+b1DZz11bZ7
	 KX5ApdxKh54jlV7b0L5DOHMZYUzMI0QxRLOhb8wFn5rRsvGuFECWyOUux/zk3ewQHO
	 0vRZKPwDWYjgF79QcZbvji/2WIOhd1RFTlqqxj6IdtYmv6FEvDBP0BI6A/ypfe12ER
	 4rne2OgiyiHwmayvgoiOSDWZP+nMKUVRelkRZeXgHyuBVwG3vNH+KoGGKxPpUYoEmE
	 mOjPLeYPlPLVkd3pfs5rnxDKG8OJEs0FX+cfgirNBOdA2Hq/D2lYVqYgdSDJK03rHw
	 2s/mlz4bx7rfw==
Date: Fri, 26 Apr 2024 18:01:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v3 2/2] hwmon: pmbus: adm1275: add adm1281 support
Message-ID: <20240426-emoticon-exemplary-a79b0dfad5ce@spud>
References: <20240425070948.25788-1-jose.sanbuenaventura@analog.com>
 <20240425070948.25788-3-jose.sanbuenaventura@analog.com>
 <1a2e6020-77d8-4299-87b0-e2b16dfb3f86@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9/RvDkW+gaTrqeL4"
Content-Disposition: inline
In-Reply-To: <1a2e6020-77d8-4299-87b0-e2b16dfb3f86@roeck-us.net>


--9/RvDkW+gaTrqeL4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 10:52:03AM -0700, Guenter Roeck wrote:
> On 4/25/24 00:09, Jose Ramon San Buenaventura wrote:
> > Adding support for adm1281 which is similar to adm1275
> >=20
> > Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog=
=2Ecom>
>=20
> Patch is fine, but we'll need to wait for Conor's feedback
> regarding the compatible fallback before I can apply it.

Oh, I didn't realise you were waiting for me. I had deleted the thread
=66rom my queue given I had already acked the patch.

I'm not really a fan of the warn when IDs don't match thing though,
seems a bit unhelpful, unless you've running into scenarios where the
firmware tells you there's a device present but actually there's some
other incompatible one.

--9/RvDkW+gaTrqeL4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZivd3gAKCRB4tDGHoIJi
0uOHAQDF/BG9lN3nyIl9W0/P2KzprBUXsidylhLqT8n+BzFF8AEA8vJTMALLy6Z/
86Tq3mLatq8NbadfKD2NiXTyTe0pDwU=
=1cJT
-----END PGP SIGNATURE-----

--9/RvDkW+gaTrqeL4--

