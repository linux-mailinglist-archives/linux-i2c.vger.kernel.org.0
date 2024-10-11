Return-Path: <linux-i2c+bounces-7334-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDD9999D98
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 09:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E13C51C2039C
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 07:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AF0209F5F;
	Fri, 11 Oct 2024 07:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YUDnsuGB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38515209F56
	for <linux-i2c@vger.kernel.org>; Fri, 11 Oct 2024 07:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630779; cv=none; b=ZwZ/YWnovKA0fNfSRC2Kj1J9fXMkPtFlEPhbisH4jJztp4EWQlUtuxgFni0QO+Zp3IVWzoC4UIpBDEysnhK/fyVcrhoC1gW5diTHT5IfacN8ce3w1HgYIS25Ibtk7WYqh/7Im5QHzbPXih1VXP/psnnKW1aEh7uxXtM0riZ9QPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630779; c=relaxed/simple;
	bh=1CDFQ+4yDEcEQM5+7/TmIfK4WyHlkWsOLf+wxAIOSNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHityQcuyFDY51M08+cJorHrr62uxM8s0WuXf/RtW+AkRlJ+Nw36+uOUxaczfrJrPVi6kNGiX6dPybEtR4SYo/HYqJMLbBsrR3COASrVbXjARCQ1QwReff5WyTe2+qxhfF3AT2hbetyZrWK2II+z9DWOQU/5iaDl7C9RYXjpJ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YUDnsuGB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1CDF
	Q+4yDEcEQM5+7/TmIfK4WyHlkWsOLf+wxAIOSNM=; b=YUDnsuGBdykYYK8tC07+
	v+pNcCTXhx2LOe2N+OASZpaSrmOwwUFcXEvnNdiy8RIKQfGfz4EjOd4GMmkZIMH1
	2/GG7eW++hqHVOd7SrkjbCshCX4agVWoPMQrtcwsDVafgPCmiFj1LSNEu9N6oPv8
	SCuLiUseESwTTtrBloQRKwJxw2wmzZIVHDOW8LRnWdr4h76Kbco4i6QlKCoGFaTd
	na1fyWqcJRmwbuovOaUMMisVtQgcSnEEQVXjdm7e/dfPJ4f2IrElqMF1QPUK2VZy
	ERuhpYPw6r3Dif0TOi8/P3PQefYbHy+50FE1RENxmL7RFsm6/JUz9AuPUf86LYI3
	fg==
Received: (qmail 1422641 invoked from network); 11 Oct 2024 09:12:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Oct 2024 09:12:46 +0200
X-UD-Smtp-Session: l3s3148p1@U5zANi4kPq0ujnvF
Date: Fri, 11 Oct 2024 09:12:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wentong Wu <wentong.wu@intel.com>, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: Add an entry for the LJCA drivers
Message-ID: <ZwjP7d-mnLqnGGzW@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wentong Wu <wentong.wu@intel.com>, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20241011070414.3124-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2EqYX9+itaK4CePP"
Content-Disposition: inline
In-Reply-To: <20241011070414.3124-1-sakari.ailus@linux.intel.com>


--2EqYX9+itaK4CePP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 10:04:14AM +0300, Sakari Ailus wrote:
> Add a MAINTAINERS entry for the Intel La Jolla Cove Adapter (LJCA) set of
> drivers.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Cool, thank you!

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--2EqYX9+itaK4CePP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcIz+oACgkQFA3kzBSg
KbZNXA/9FNyBvS6d+apUu6Cz84782t8SJtd3F7RE3fp3jvP1oDurjRh6+27IZm36
PqihjdeVgkexmpqPMN6UDI0ib2ihg8jF91qZ5ZeM7tRLv+vs5l6zW7iafSN2rqyZ
UGrca3dy68DPFrKiSmUxklSL0NKbQMZP1yxDVFMRjP4AjfUIJLrRL9dtfjN6csue
roZgRnp/OC97APENS5GPmU8whGG89JkZbXf2UZt1pyA4SMHYw1tR7umUzLigiebC
nAcfEE/I2UpOTlx8u9YzuirHL8HJKXQy624Ja1wFs9uISAU5uu5MJnQLJWMfLNEk
SpA6vij1dYc3kOQB4iKveIwrwLZiKFht4nYD9AcYtG+7W4AuMUPzy/pPeGFZ4EK3
nRsYSx0Q2CouKOspoCHhCJA547JlqrewrM3PF3asEaSx0Y++XfNk0mh2qb6IywRj
ss2B+HRo6CJmYflwDjDRkTCvuuh+0+MatsfPpmvp8h/2X1JrYOc1G90KRdTHLFAt
gYHPhfxuPj96G59feSaLBUz0p4fGABzTKqbNbT3qFi1bIqITSDT4e5hM9Q4lx0Vm
ikUAt8MQg2ev1huHN83wkccmcJJGDRFtxOKrcORw4D6V6VDNweUp9acjFC3EWMys
r0Yw1Z8cSSXXDjZpMbi//pndlX0RQhz6KrL7MPvuygQqeqic0lI=
=pgj3
-----END PGP SIGNATURE-----

--2EqYX9+itaK4CePP--

