Return-Path: <linux-i2c+bounces-10863-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41682AADD51
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 13:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D8047B9159
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 11:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9026A231C87;
	Wed,  7 May 2025 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9g7Uo3K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E52189B8C;
	Wed,  7 May 2025 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617287; cv=none; b=Kj7a+OQe8IHutWnqTN6NnxZxU37YhrmfKUNy4LB5qpBiCyyOvhbBYnZ43pIiZ0rbrNuv12J/7KYNubqGXSCeMQjzA761LfZ6DSyzbWiKbI6XMQIbDhbGFRRWsNFIw5i6NLrC7Muzxi5Yj4bovBxlE8umz1FplcZgg0xXHEbCGYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617287; c=relaxed/simple;
	bh=+myiwgE5IaBaXJzmpEL8CqSZA8uzkotePvS5m/azOWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AehfhQnq9nCydWCalbTeJqsmBRIe3XsRafo2MwCcUdLo+tvQLWt8rmgVIAhPhBE9EV+DrHYownjKwZ1how4HI21ytunbqZLfzilC4AI0Eo8VNcX8GKWGzjmn4kVJNibjvfRMcsw/dCoJliPK2ViAaW8+f3C5XjFKJpEnT8oqLjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9g7Uo3K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16050C4CEE7;
	Wed,  7 May 2025 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746617286;
	bh=+myiwgE5IaBaXJzmpEL8CqSZA8uzkotePvS5m/azOWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H9g7Uo3KF3gdhcH2ZEMV9V3wNqXA8tWVr4h+XSChpAk8ADpc3AiALZ4luZs+qiP11
	 Z/MMgQA+W8firplqY6wsfvaRlyKDnu2GwFBPbbSs260wPnfiIZNYS/X+7RgVASh77m
	 RpC/hLSnA/nsP75LVgIyB2iQqMj3uUQrguNMZM870ct6AHpi0KrvjkwwfISkMW7V3a
	 YOPAoo049AzlkO+K5zbADyxXnj6XpUO50IDuoOngkJTqfSy9VuxxdFuvsHaky5egwP
	 KzvfbiAMDQAUjIzdffkOIksa2UyWdR9eJyQ0Y56Uy3z2fvqMFG3OeJNxR8UwUZLFBh
	 Co6k62Ve2SILg==
Date: Wed, 7 May 2025 20:28:03 +0900
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 01/26] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <aBtDw-qXUCH9U-7l@finisterre.sirena.org.uk>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oe+RepqPNVL4+bmX"
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-2-herve.codina@bootlin.com>
X-Cookie: Well begun is half done.


--oe+RepqPNVL4+bmX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 09:12:43AM +0200, Herve Codina wrote:
> From: Saravana Kannan <saravanak@google.com>
>=20
> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.

> While the commit fixed fw_devlink overlay handling for one case, it
> broke it for another case. So revert it and redo the fix in a separate
> patch.

Acked-by: Mark Brown <broonie@kernel.org>

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--oe+RepqPNVL4+bmX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgbQ8MACgkQJNaLcl1U
h9A3/wf8D6c+36MLT2mhvh2zxesAYWfdL1e5vpcKQk0H/bkk+8KQLEBRl9w9syn2
MFtk87xXOIdfli0pvEnP2cUrCHKDrD2ehLcNFcur8Vq6IOjjX2Gs3Iboe5CfqnoS
tPRSxFS31DY3g7DhUGmQ7fUUlPYGwpYIK1QgXrfiR+uhEbooIq6yN1/hcKL2rFS4
Y21v0te/hUxHTpeTMlcOkXqqu/1UExRszOly4m0YB9mZoswASG024vcrx4paZFjF
sJ6hXYEyI/PDpMSVthVLe0jK7jyBsiVGSSVDRcimNQj6nAokmye1VeKejWhV3Flv
7epg7YG5YuZjEXoQ3CaQaDdESm7PnA==
=5SSZ
-----END PGP SIGNATURE-----

--oe+RepqPNVL4+bmX--

