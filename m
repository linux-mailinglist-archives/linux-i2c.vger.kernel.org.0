Return-Path: <linux-i2c+bounces-2130-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E5386FCC1
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3B8B1C222BF
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 09:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3173920B33;
	Mon,  4 Mar 2024 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FqGzq0d3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B39D19BA6
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709543317; cv=none; b=JjuP9T5njM8jgtA+fWy5wliHwMrRBpDxFoZaVGdF2Vovi6b5hX/iXJfVzeQvAtBhtTF/Dvtimzg6tEeUANmqa7ocf11+yXs16ta4jwsxTuVvM+IBeaZjA+scQfr5lTBywOSbuOtEwVp+VPMQRcBfNKlCtfdZrt1y4sucdyHrTTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709543317; c=relaxed/simple;
	bh=ny95I8bIbXgvYRR/9/ImWnR7LSQXs/XryoYHCkehg3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ag3uQu5nOnZ5rqvStMOLX00gN0ovg2BySIEufZXSpwkkEin86CS/Qo4d6BvuB16LwdA2rXH7tFkoz1BE6AENsjdHvGTQwOZTckijPQtP7AHXz0NzXo8Z8wYilZZ1WyF8TPd5xF496ItSqRXcR1Y+hCGIXmmTmlDbeY68HB1eScA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FqGzq0d3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ny95
	I8bIbXgvYRR/9/ImWnR7LSQXs/XryoYHCkehg3o=; b=FqGzq0d3F5k0S+8rAhQf
	YMkGAu50r/uN9xFoXBSLryaLmM+EJbXOqhN+Lf5EG0EIcbfMOCsf4hGKkJmLq7e5
	LAAcp6Dsn323IAvhP8C5HFyYdSWfe57ovUdnYChFhEy4NEci7f/4PWfcR5O2Smag
	5ywHS47WBBcvfhMq3yhjadgFc8wlngjn0YCKIAGi8pWlDStjWaxQAfVgfmzFeZqp
	3MELY7K83LUArR2AwLqiaX+Bd8jx+GFlGYe7eH2H0AZA9d+ksVSmsYiCS2lVQC4f
	F3QspEOeeTiybMQu2EO1x8yRc//uMCerkUWMV1y1XFALU74YU74qSeU+xZxGytsm
	+Q==
Received: (qmail 3436890 invoked from network); 4 Mar 2024 10:08:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Mar 2024 10:08:24 +0100
X-UD-Smtp-Session: l3s3148p1@xshaEdISNMwujnuA
Date: Mon, 4 Mar 2024 10:08:23 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Cc: mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] i2c: acpi: Unbind mux adapters before delete
Message-ID: <ZeWPh3asA0rSTJ92@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
	mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	stable@vger.kernel.org
References: <20240304000355.2614421-1-hamish.martin@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kpj1D2yhT/675NeA"
Content-Disposition: inline
In-Reply-To: <20240304000355.2614421-1-hamish.martin@alliedtelesis.co.nz>


--kpj1D2yhT/675NeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 01:03:55PM +1300, Hamish Martin wrote:
> There is an issue with ACPI overlay table removal specifically related
> to I2C multiplexers.
>=20
> Consider an ACPI SSDT Overlay that defines a PCA9548 I2C mux on an
> existing I2C bus. When this table is loaded we see the creation of a
> device for the overall PCA9548 chip and 8 further devices - one
> i2c_adapter each for the mux channels. These are all bound to their
> ACPI equivalents via an eventual invocation of acpi_bind_one().
>=20
> When we unload the SSDT overlay we run into the problem. The ACPI
> devices are deleted as normal via acpi_device_del_work_fn() and the
> acpi_device_del_list.
>=20
> However, the following warning and stack trace is output as the
> deletion does not go smoothly:

Applied to for-current, thanks!


--kpj1D2yhT/675NeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXlj4QACgkQFA3kzBSg
KbYg3w//Yb45Gdsst/nxFw5XwlOlZ+V4Et//WraJxkBGagzxk4j9fuVzP+aoyZzu
1/74FUO+yfmAJl7aqFEuAPG7zwIKRhnMbgl9z5XX+S2KtIBgDMrIKz76ilkzhklt
7TtxVz96sa0oLOBL5UUYCqdSWrktvoauWRv0sdS+5zOgXqvhtAGGrxLsUbJ/FDOs
uxL9fmj6wE5NUrzB1WvTr0Rk3w/jWobFzezxyxO5F9fgTjPfbJ1PqKwhPOH7mBQx
M9QafJ6GUB+gzkaJnSMIDDC6j7GOCPNy1+p60t/4TSVgukVNKHf8xcKlJwMWNy1I
85SDBLjDT0+LFQlYZ44AbJkzE0LNKxYMYHSkBMXqcjosnvaqAKSoGd3rpGo28zkY
E1zjO4dY2Wm4wk62AH3Md5/zJLsrHgpIWPaH+PnO9gb8vpHZyP32ekxXRFFIVR9o
F2SrdDR7KoEXIppfN+c3BuwN1rGBtPKv45EEObn5L70HCpT/faPwCYoBDadeIZqQ
Jf0lhSXiJXh3ys7G1NDZ6691L44+jZ0wWyah9LWoKbyk1NmxTSTqtFgXDZUp0G0Q
bDK/yu+V5s6wdMq8I8bRvbtQ1O6rDDbBUiDlWsfuQClLHpG+J/t5JsHezuzlov/V
3Bk1Yy1TdMlkut9QmGbPTxar6MAxzoZSW3Uhc4P+jApm2Z1Jcd4=
=1npF
-----END PGP SIGNATURE-----

--kpj1D2yhT/675NeA--

