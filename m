Return-Path: <linux-i2c+bounces-11176-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CDCAC92F3
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 18:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5CE1BC4B1D
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F80235345;
	Fri, 30 May 2025 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/DQF/1i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C2C201100;
	Fri, 30 May 2025 16:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621136; cv=none; b=WfXI1jVtf3BZBWF6PruEiZPMC2IZEd3/5HvQicAjJsLdjPlbAGDJ+9YlLSg0dbWHb9x/lNgb0TSpLHVZg+Wm21K3A21VOAuzA9Or8gaqP20ZckRbQa9nQIvx2Y2G1P8LgVlDXK3RvzOneqKJPdbJcwYDygr33FG6WT1tVrxnMrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621136; c=relaxed/simple;
	bh=azDNLRMzYiXadxMVYzk3Nsq/NoFTPc38tQQMCSqBKUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QH+kZDj8x7z6XAkvhBAqXjT0Ow4mgnbZTdd0zgsFI3C5+LAIxQQCJ+JFnq600M9SiWGRnzkzGDxD/TRyJ/KrpmhRydAn3LuxERh1BCni6J9LlZAATsNl3c8qmmigNeyBF3NYa8scgZ1UGrFebe496miyXSI9v9HV8KlnySWGVHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/DQF/1i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C278C4CEE9;
	Fri, 30 May 2025 16:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748621135;
	bh=azDNLRMzYiXadxMVYzk3Nsq/NoFTPc38tQQMCSqBKUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/DQF/1idQnJzXGs36D1QV53Vnf1X5Gcf2/Ot1STAMLtxoB5Uk407ZGTog5AFSc9l
	 Optu/+fCVUfSLPZ7IJsZCL0yKHT3uB8RUWhdrkXl8WW75l6ocIVLkQ4JEbC/io7HS6
	 DzYx6bIaITdf8u0K1X2TvfGLv1AW/EH0siySMAHroFG2vNA8OGs/s28WC90QNPaeNh
	 bNgWQ+QXqceGUcD1UqN9PRQ3h3ND5VqwaGUoCwKmiEKoDb44DEK09v8SW5PuiwvzdB
	 xjucMbA/wyQRvc/BYu6vAPyaKSnNdpofSK0qlllPpMJ9Qtb7WVAiKPoZFBH7mUrUME
	 i4R08n5wQmL2w==
Date: Fri, 30 May 2025 17:05:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/6] dt-bindings: i2c: renesas,riic: Document RZ/T2H
 support
Message-ID: <20250530-mandarin-giddily-171a7e285892@spud>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530143135.366417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CgvnarWUpvPFyOrZ"
Content-Disposition: inline
In-Reply-To: <20250530143135.366417-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


--CgvnarWUpvPFyOrZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 03:31:31PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the I2C Bus Interface (RIIC) found on the Renesas
> RZ/T2H (R9A09G077) SoC. The RIIC IP on this SoC is similar to that on
> the RZ/V2H(P) SoC but supports fewer interrupts, lacks FM+ support and
> does not require resets. Due to these differences, add a new compatible
> string `renesas,riic-r9a09g077` for the RZ/T2H SoC.
>=20
> Unlike earlier SoCs that use eight distinct interrupts, the RZ/T2H uses
> only four, including a combined error/event interrupt. Update the binding
> schema to reflect this interrupt layout and skip the `resets` property
> check, as it is not required on these SoCs.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--CgvnarWUpvPFyOrZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDnXSgAKCRB4tDGHoIJi
0gYXAQDRFkHw1WW4mPIAaHq4m38yEiIHo07o6Dgz1TV0tG8ffwEAhSGakc43j9KA
K5hCPGdWG6Dk/ZQSqfeViUFoR/VjagU=
=l597
-----END PGP SIGNATURE-----

--CgvnarWUpvPFyOrZ--

