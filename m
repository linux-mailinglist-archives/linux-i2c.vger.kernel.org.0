Return-Path: <linux-i2c+bounces-11644-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB60AEB4A0
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1C733B0F5A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8322DBF6C;
	Fri, 27 Jun 2025 10:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RktgclJL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025C529ACDD
	for <linux-i2c@vger.kernel.org>; Fri, 27 Jun 2025 10:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019746; cv=none; b=NiFWf2YgUuGshkf16+jD5YKYSbVAq2WJrr+BuHiOmAJ8+9nVcGjAsMJgIG/JoVLI34Y3ceb+Xt2CGnHy6xm6N2JwsEFbTVTJW0nxDetEJaT8FvZKpeG7D2kXpaCh2Bvmhm+5gnDUkK+ziCxEO2vddXUc/m9q2ovnflNhA6o5z1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019746; c=relaxed/simple;
	bh=1pqLbaouR2VFInPq4KWQCoFeBItmWNB5BJNKIcl3qoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCLHQVIArpuZCBfKa+py7Q0XJW0CHekkTzPU8QaFvvDasKnDmFYac55NnT2JTd7Hz9mqUoyd4PObTwHXri819vIpoogLi91BY7aG4WkepFec+Qpldd1PYsH2k/LU7KeXVUPGYelRkP2tlQycR89dGvFGa+CBlEbD+WMvhd2C3/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RktgclJL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1pqL
	baouR2VFInPq4KWQCoFeBItmWNB5BJNKIcl3qoE=; b=RktgclJLDDahrKZkgxrA
	oSA7b7bMsyx+L4/rCKZBD/FR+KUaa0MfqPzhIUTq0LaqYfSxW03fG0lU/RuwrB0E
	2Ax5/jr5ji9FFtg7GFHkw/oFv/yftz7JX2isgVp8slaBUeYz6pq13bJv42biConK
	iPaSPthMvBUMt45UZrY4tKnJtqxa0rl1Ol+5LhSyJ8Zw0oQR7X0q6PPDuirmYO7n
	5f6AaVSzU1t1Sue7tefoxCmKOQ1h+XRO8E9m77PySi9gKgzN8utIw31RIrDnm24F
	1jl41m3DKag+B2CUdZQyt1DiqZhFA7+6HMqwRspMPQ7jMidVZK0GpSPgDRFCsIvV
	Gw==
Received: (qmail 1423167 invoked from network); 27 Jun 2025 12:22:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2025 12:22:23 +0200
X-UD-Smtp-Session: l3s3148p1@WRrEDYs4WN8gAwDPXzuUAOCQSK0rM+sw
Date: Fri, 27 Jun 2025 12:22:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Randolph Ha <rha051117@gmail.com>, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH v1 1/1] i2c: acpi: Replace custom code with
 device_match_acpi_handle()
Message-ID: <aF5w3vHNfN14dgBc@shikoro>
References: <20250623134521.158447-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jihlUMXufe6nnsDN"
Content-Disposition: inline
In-Reply-To: <20250623134521.158447-1-andriy.shevchenko@linux.intel.com>


--jihlUMXufe6nnsDN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 04:45:21PM +0300, Andy Shevchenko wrote:
> Since driver core provides a generic device_match_acpi_handle()
> we may replace the custom code with it.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--jihlUMXufe6nnsDN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhecN4ACgkQFA3kzBSg
KbaIMw/9EiRCwxXaijKVtTdRjiW7GOqJB3pguSByO2o2d/u0sEEuTyLN3l+wIgCB
9/n+p1ugt0rq+gtRH6l/+ECQM3ImfSR9JKrAYNengJmzmQpL2Qh303SEnMgAaa/s
qmDm4vrvAZfkVwRbh8hHA3CmvnxpxA/t2UJ51U9lkQQGkGvl4Ybk/jS0lcOYdBmZ
A1E1ohURsDku7H/7mNqpjUK2VjBuCj/h7jZmuSJGog4X8aiiQVNNwoMCiPybYn5L
1JISAnJzOQzgoBBUiKGfPHOlrmqdttWIDNr1rKR9dAicMAysYKNjuWme5Fmif0Y4
SWfIvawn6MdtfUhRRYdjfk6c7dmqKAs4Th/J9+qDAViTJHHUiFP/UxwLpSfDGtQz
C8YCFNIdHx74FjPZOqllfPgT+w3GjjqcCmTXJHOAJtVAhfcFjvJfHpNpYh/pvP0x
2WX4FrkgYpJMGENEU/v4b5ls59iSSjqvfS5sFRpjAyO1wlGfDEzbk+vQuwuCOFsG
74YhGgHDXSoQZYGhnYcPvXPZbYe+In2pNc1TMgUbCLSrHikp1InC1K2RMlm/JvvC
kMH4JNMSVKvsSyVAoIDrrrMFuPXOxqfyLkJwKHc143+6HU15ch2woaL09wSsG4sE
i/YK8pOSDM9oqI6U1PVGguLuPLOjTEDbp463eIqlvTooX3cZFYY=
=aQ+Z
-----END PGP SIGNATURE-----

--jihlUMXufe6nnsDN--

