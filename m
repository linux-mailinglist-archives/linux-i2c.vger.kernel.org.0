Return-Path: <linux-i2c+bounces-12934-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D5BB5593D
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Sep 2025 00:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D933B1E84
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 22:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C252376FC;
	Fri, 12 Sep 2025 22:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XapbjQvM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342320C037
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 22:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757716412; cv=none; b=gdTuT05z0rgG1yJx0GpAqqtvXh+SZRAEjorstK+IdvYz6goqaR1yN6Wt871c/o5CY1+h7eWFx5rZu2hZ/G0z4HklUAOXzTgwAGNSk9yIKsx9M0pBUNiu8mgdoNSuVbHsRikHVMTMybFQcNhxIQOY4Y+x7I9LTR4PLpyx3r1IHoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757716412; c=relaxed/simple;
	bh=MI9hMQ752mJMu7gs9Oryud/LU3YHRG7X/1OmDN7XfrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKPRRiPQ0xewCiwDYqopzYs5D61jVsoBp8b20wq4FdQP00e6oM3NOiP2mceENM0qBjLQEUZC9P7YKDxrS03kaJbXmp61XshfUTsnD2A1XyG0UQpcQA1y3Jy/XOJMUM0njI51E7ZoZnLHMRrMnMHcmubk0N7RTEj1/9+AmAuL0rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XapbjQvM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=MI9h
	MQ752mJMu7gs9Oryud/LU3YHRG7X/1OmDN7XfrE=; b=XapbjQvMYPuDDXbyIaro
	/fJvJSEX85Crp9R2M9orvhBtGwj5fZSRcsZdsB6K/0eONNwHKBlCEJoRtkAENYyO
	6187CjeMs8icBkiBGgXqBE5GpOvJqfncyGFQp1R5feLCOGyXalqaqKWaV1KM/cmN
	2zFoAxAx9KOm4eGQSUILRD6Dta8MBSzqJy9FjTQ/pkuPBDLkrCRlBIfG4X/uWHx1
	InWdE/fr4TyPLLpTC7bFyOY6INEFamrO5h1cQAlozfLaefkCXTstIhpelc8P+o/Y
	1+g958v+79wQPb+nRHW8otcPXOXYjOLiEK9yIFXuIQAcuAPcPPlvYxkHXYQ4+FUN
	Sg==
Received: (qmail 1505220 invoked from network); 13 Sep 2025 00:33:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2025 00:33:28 +0200
X-UD-Smtp-Session: l3s3148p1@O/4fPqI+BIQgAQnoAHJ8AC93OVDMgFWg
Date: Sat, 13 Sep 2025 00:33:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	digetx@gmail.com, jonathanh@nvidia.com, krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, ldewangan@nvidia.com, robh@kernel.org,
	thierry.reding@gmail.com, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RESEND 1/2] dt-bindings: i2c: nvidia,tegra20-i2c: Add
 Tegra256 I2C compatible
Message-ID: <aMSft58OybS1IEpA@shikoro>
References: <20250818043345.65899-1-akhilrajeev@nvidia.com>
 <20250818043345.65899-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ivnUMvcJNX3IfZiw"
Content-Disposition: inline
In-Reply-To: <20250818043345.65899-2-akhilrajeev@nvidia.com>


--ivnUMvcJNX3IfZiw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 10:03:44AM +0530, Akhil R wrote:
> Add compatible for Tegra256 I2C controllers. Tegra256 consists of
> 8 generic Tegra I2C controllers similar to previous generations.
> The parent clock frequency is different in these controllers and
> hence the timing parameter values are different from the previous
> ones.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Thierry Reding <treding@nvidia.com>
>=20

Applied to for-next, thanks!


--ivnUMvcJNX3IfZiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjEn7cACgkQFA3kzBSg
KbZusA/+OBUNAhHfzoQQYBe3CujtYLvtKXh3wx2I3fxwX/CC739vx0tq5gNnr2CT
fxJZ4Pv+taoNx2ey0WYOOqX5nSVBmT9FkROsUmssui4EeBJ3FxtYUflJ6ewGY109
NWXBIACL+ICiR+PmAYLxkR8vi+48QPJpImiYAgxswxYjA1XF4m8Fm5RfXvgvSyYB
AkKYNoYktembLHxKE9VolA6CxMl6PAbkC8EDrlD+te6AL26BzqaUNUudaukI7eWl
gXCBAjjy3Xw7AWhZLuW07PJtgDu5xU0eFKQtrkHFJ/sMYQ2ud/4VIo5FnyeGgOSI
ImOWrMy1P2Vh1dfps4B9nWgZDh0idd1eHG8L7p0X1zcRaDyLeeq/I8Nh3oxdtZvb
Y1dKBGlRzbGkMvZ1PwoIbed/VteNOFTNn1eW03JSaXK4uErkg8W9f7f1wNwGyYYV
4JdlEOYpLwhO/RjUchMF85J3yU4qViNvN48g6jTggBz3+MknGgosJqw+kCVTW9VX
C6ZrYeYHDvoWuYYj8Opc6wunNSWPojDWNQSJe9QToYV+FzI60SkQWjDvg6pZT7nT
U7mRM0UvR0xZODFtVBpX9wA8V4rAR6bZtyY6v3mxqf1V8Xwh0FHOftdeo4Di8cgC
QHU/j7hz9cFM8EAm5uw6DMKxSslZzR9CXFCVTMAihyWp3a3S5Tg=
=7U4B
-----END PGP SIGNATURE-----

--ivnUMvcJNX3IfZiw--

