Return-Path: <linux-i2c+bounces-2999-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E51B88A8738
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 17:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22DD61C209BF
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 15:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CB2146D40;
	Wed, 17 Apr 2024 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QL7zJy6O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ABF77F2C;
	Wed, 17 Apr 2024 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713366935; cv=none; b=LQp1dFnF/3a2ILrKiI3ujjX0qRa1ggWaPFIUYQnvhno9hmVZ3Wah5Qzh7cACxTf12bg9Ik8u1fUcZHVkPPz4WQ5zNFHYggJ1XLaVj39mRqENmU3UDcusJeRr/eneznVe95JQpGTmbXx9GxOzMVCys0g1whqZslKc/R9O1tLRSbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713366935; c=relaxed/simple;
	bh=kOOLX0GNiMAkD1VX/95set0np7ukVjF1pfBU3LwFRW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJX+MRJjScmVZA1XJl+lqMnjOFMTby5ZTWTEWURgGf58figyyR064yscCm480URMmmIDZvfvxMp3IzGd7xfc1lqP8GLpJfTNf0e747g1Y5anRj5zhVcW4SYHC/j+jJOQaqmBBMIbv/1Xkcoc896DYBFgLL4Jw/3STGeozWiQDN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QL7zJy6O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82531C072AA;
	Wed, 17 Apr 2024 15:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713366935;
	bh=kOOLX0GNiMAkD1VX/95set0np7ukVjF1pfBU3LwFRW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QL7zJy6OLSIs1652n7aexUDQ63cHmByQdZlKh1yLGxBuvWohHBx1/W44cUUtQPAKS
	 44Yzv9uPuxjL0byOWhYvXMCY/w2/9N1r6+Q+VGO+MkL52eiodAPoTF3AJFL5X+RCcS
	 AKTKKsX5qOL3tj7fcAS8HU7c9L9kdtmJZTO4SeQoUPepNar9GFBDODAGKUAaCq95Lx
	 sawi7ORpD/qG7VqJQ1J0ghq4dl3u+VB/Zqi+qR4mYYXbRVGxs69PpCAQDr9eu9Kq/6
	 N7hJpyYfLylOGmtYUGB+8XXgKAibTeVfo3P5vAvMLwGEkUKzQR3Cm7w1Ts0q73+3oz
	 B7QgX3LaA9UGQ==
Date: Wed, 17 Apr 2024 16:15:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: adm1275: add adm1281
Message-ID: <20240417-trailside-hardhead-ad59b591c243@spud>
References: <20240417000722.919-1-jose.sanbuenaventura@analog.com>
 <20240417000722.919-2-jose.sanbuenaventura@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Dgh85Drl3KFrr/nH"
Content-Disposition: inline
In-Reply-To: <20240417000722.919-2-jose.sanbuenaventura@analog.com>


--Dgh85Drl3KFrr/nH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 08:07:21AM +0800, Jose Ramon San Buenaventura wrote:
> Add support for the adm1281 Hot-Swap Controller and Digital Power
> and Energy Monitor
>=20
> Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.c=
om>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Dgh85Drl3KFrr/nH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh/nkgAKCRB4tDGHoIJi
0tHaAPwO3MjuuAqScqO7DvoyJX491xjsNeINbG0fUGpBnYXMMAD/WObAXpy2t01d
d/nf/1XG6mSaiwuhUeK21kYIMThfFgw=
=ndHo
-----END PGP SIGNATURE-----

--Dgh85Drl3KFrr/nH--

