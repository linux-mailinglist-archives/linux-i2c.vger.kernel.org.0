Return-Path: <linux-i2c+bounces-2937-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 952DC8A466D
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 03:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B8741F21435
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 01:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264376FCA;
	Mon, 15 Apr 2024 01:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AP+/Pkre"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B748333CA;
	Mon, 15 Apr 2024 01:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713143213; cv=none; b=IjRHcnB4lcszKPGHqGMm9Qzoszh/GcnPosgI5C5ViMcwecDHFdxhbSEsQYX2b2wtLejCTV8I3ljs4DY0iM1ZqbtQXc+9gOlUF4mctS8Bvx4qRFClR1H79xwGP73tD8q3yOmXiCTcZqO9ov01fiNw7EoJToK9t2whE0hsLeKiZN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713143213; c=relaxed/simple;
	bh=rykQa5lyIfiHN9qYO+UH/csm4L0wBhXCNiha9aVGAS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btzYzsN1oSPIdPJ3LDhO1xxgR/Zb9xl+zFis1rUGjcFweatPCaUnREoPlNy05OIiEoKnsCX8RRMNhRM4ShQtwWRt+0F7VrYX0RshKE+Iem76TfTj5RvZefm3BIKoJM52YNsmzMySgP4MgwPE3tHgz2JLhnWi+daXEr2u6/HTxAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AP+/Pkre; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B899DC072AA;
	Mon, 15 Apr 2024 01:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713143213;
	bh=rykQa5lyIfiHN9qYO+UH/csm4L0wBhXCNiha9aVGAS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AP+/PkrexOxpAHNN0YFHU1E800DYe/dV1yegf+/alc3ol+qoXvemnIML/FpOsCEZJ
	 rN/5GIqtxaQSRVAq5ZT2i+etORasmmeAMxK4UFOQedSkwyWkHYYsuJinCLJf0aWace
	 sMCofiDHLXbDkaWe/45J0y+eRyR/05CDVM7Lcnya5kD/cXchEcE8NbGWLlI75ZKqc2
	 UX9qhYJWPF3SlGyOMVYB8hHTe9UVPppXnuMuScL5XY62p1hF+N991P+9wuAp7ROMxm
	 7dSENQwh1P1Q9eVBgHrMtEGodKg/dkuS9HjZgiUbLQPfwOIsHjtyPkpggYlaVY1D0H
	 iMqHoGZ5KcI3Q==
Date: Mon, 15 Apr 2024 10:06:50 +0900
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	kernel-team@android.com, Wolfram Sang <wsa@kernel.org>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 2/2] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
Message-ID: <Zhx9qqiymJdXwYQs@finisterre.sirena.org.uk>
References: <20240411235623.1260061-1-saravanak@google.com>
 <20240411235623.1260061-3-saravanak@google.com>
 <CAL_JsqKRVVNzgQk6PETfJ9RrDuzT1CTjHWW02Twc_T4C82t__Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w8x69Pci+HaC+o9L"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKRVVNzgQk6PETfJ9RrDuzT1CTjHWW02Twc_T4C82t__Q@mail.gmail.com>
X-Cookie: You might have mail.


--w8x69Pci+HaC+o9L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 07:54:32AM -0500, Rob Herring wrote:
> On Thu, Apr 11, 2024 at 6:56=E2=80=AFPM Saravana Kannan <saravanak@google=
=2Ecom> wrote:

> > +#define get_dev_from_fwnode(fwnode)    get_device((fwnode)->dev)

> I think it is better to not have this wrapper. We want it to be clear
> when we're acquiring a ref. I know get_device() does that, but I have
> to look up what get_dev_from_fwnode() does exactly.

Or perhaps calling it get_device_from_fwnode() would make it more
obvious that it is a get_device() variant?

--w8x69Pci+HaC+o9L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYcfaAACgkQJNaLcl1U
h9CojAgAgt2fCimmNYhJQqDqfhM2bmWL/w9vqvYjQe8HGvckNhSuz23yy6xPb/bE
q9dDK6V1xzGLIMriwY4TgiSXPLVdmp4gORRq3/zEsaSIMDbBzgVuMnxFghARPVwT
8sjCvifFv9N5yOCMHbYhMteie92AzIWo9yrxq10KgKzX/4HURrT1G8n1zu3jOglG
2OjGQTHa5LeyE+5RdfaUMwE1JhchXojQe7tWE+tK1lqb5Tk4x1sKmCJG9BkZqE6k
0x5U+V1i77GpyUhFNbkFBFV1ROZ+oeBnIkd311q9Y8vOF3ecYFA0pe4hr3/6ceyo
cxfTAKuaqYZknFMwFcvvgiKIHuRFDA==
=+cQa
-----END PGP SIGNATURE-----

--w8x69Pci+HaC+o9L--

