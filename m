Return-Path: <linux-i2c+bounces-13479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A57BD9297
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 13:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F41B4EC53A
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 11:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842803101CE;
	Tue, 14 Oct 2025 11:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c1oCzK/G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6943423AB8D
	for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 11:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443125; cv=none; b=S7iMV5eXgGVKToCZYn4ik7WuNfJG0tkDiQvsM8k1vTFDrzRClVuFVGSjGOyQNn/YnCA0Dj6KmVVgq0xPUuPbww5bboWeXO5vxavmiNHetpbmY6LXqH7TjS60OYiulVnzbWe3zrwVrT1LaY+BO5uO92zvlv5hYyUS6Xep4Y05Ma4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443125; c=relaxed/simple;
	bh=36MOViaES4h658Zm75bnIITCJIoFwL4VLgRZnUySa7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SauB7nGi0fb/8/CBzhygwA1symbdq2WP41VEtVf0L3DqXM8Hg+w2TrE1wo1x7sXbQdmeSdEJL6YTVM6xvHWJFo+JVHRB38Tj0D0/l8VWb9C/qqfIWcs3D+igaVoNpSGUgvZX4QmsmPe886yM5xKS196OkrtOU3gv3DR9Uk1h9Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c1oCzK/G; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=36MO
	ViaES4h658Zm75bnIITCJIoFwL4VLgRZnUySa7Y=; b=c1oCzK/GPzFDfQHYCR3h
	rzeqNWezCex6U5sxnRytOnmSp+vrq8ColnNfL/M1qqQUpSZGb2UG7w6kV6sLnudR
	7XN64AUlChJyCxnH90BWtVT8u2piuGjooerNRtCqmQOm1p3Xm0nOfXjj1hedxQX2
	2s40qmrzNudb8CixCCIujjFI1uyvFijw1irO9KLwOeLWONH7VbbC5YGC0eJgPv4i
	CIVxESD5kyn+Zytod8S7/oYYGgp84FiNzZTlYX338mb1aedsDV0D58Pl/1rymvm8
	cps1FIfe8qow3j8RE47/Kz2V8uUw8or1Z7z+534dHM4JtkucT7fGF7W4TjDrYUIk
	3A==
Received: (qmail 2953262 invoked from network); 14 Oct 2025 13:58:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Oct 2025 13:58:41 +0200
X-UD-Smtp-Session: l3s3148p1@m4riGh1BIq8gAwDPXwQHAL/S9V79e5yL
Date: Tue, 14 Oct 2025 13:58:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
Message-ID: <aO468ZlawXPNGXlj@shikoro>
References: <20251001212310.4813-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j90DF16K+GBPG4+Y"
Content-Disposition: inline
In-Reply-To: <20251001212310.4813-1-hansg@kernel.org>


--j90DF16K+GBPG4+Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 11:23:10PM +0200, Hans de Goede wrote:
> Add "INTC10D2" ACPI device-id for MTL-CVF devices, like the Dell Latitude
> 7450.
>=20
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2368506
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>

With dependencies upstream now, applied to for-current, thanks!


--j90DF16K+GBPG4+Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjuOu0ACgkQFA3kzBSg
KbaVSw/+PE/AvHopdzypWgqSXi9of52AMrwEcEi90fqTJABGS53j7FXS1N15B98r
hal5thSb1dr0moTU1xw4jmIp48govH/UzcjxVozt3yixUENgLJBPQkI8SPGIB5xv
Qc89D9H55m6I9ZHJYn81K7rPRAozDvvTUgU+8SS5c7mRVhgE0PQFrzf5geTrr1mU
XgeUDYOApjaV3H8XgmQK+k9ixMarBMcKu54MFYbd3uBt4mjXe7iUf5FMoOQ+Dgax
W5k3jZN8vJOz8hb3iqAHB0ZKIQGPjBOAdXu+kr7llJ0pZ+slcQrWFl9T1tSsXxKi
SuoqfDTeTuVV0YvQ1kCj8dhVWbGvMlFBeSowNuyuTOKhB8AczZfC7XiTGWkku6Dk
t1Rb4P560ntkAM7V6RTEcIsOMJBTJe1zYlZKE5APc7Wt/+5ouAr4INK+Z21f+nT3
HbJldm5m/Y6bC6kFJIsWMluuIDriINKKI+bp3+kwfqwapkFRDz/KHdZZBpIkEs5R
E/MlOJp79XFirKqkBAPZeNLTVGCO7vxKYnGGGQCmUo1xoqkck8cZB2MmeY92XJN7
Y80YLIBO4SlYaaaQPUI8oYePQFjFOmlD3Jo8Tw0O6PqF1miokynWK3cFopcJgbvm
Pmmiuao0XlQQ1J8KEANKZ+tCaGKjFOAphYUl6dKSo3gz3mOvBcw=
=EbqR
-----END PGP SIGNATURE-----

--j90DF16K+GBPG4+Y--

