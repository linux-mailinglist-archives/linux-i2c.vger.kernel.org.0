Return-Path: <linux-i2c+bounces-11175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66388AC92EB
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 18:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97D5C16956D
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AD5235073;
	Fri, 30 May 2025 16:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fT1bFwM+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49496258A;
	Fri, 30 May 2025 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621099; cv=none; b=ORLiZhSSzns1w0M5gC4DSZf9zM3s5kzl8fKWDgLoVR8tJKiNjEfj7UaLkXcsaV6U+Dth0t9r7VhXDCCCdVTdbsCgazkGuxv4TWIwNojdA88eAjE9uE6zQ9r3SPkoQ6z2xPGjGJClOnhk17r629rXXnh5W4f5ds9VHTXu+p+SwFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621099; c=relaxed/simple;
	bh=oxQR8fyj4dPp/qYhspMOGoHaCry0IrIJGFbdYhhhhVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfQ/mjd0Ujbf4E4fCQe04MunQk7E5fJVzZSc4hLdHmKS8I6hLsnkZHPlxmCymT+I2XFzqDtWouf9/zR1n64k7oFk1534PaVJI3bCy4vxLwgRouep7ILcSInAHh6ELoJV8RlIVm1GZkmctmHBNhQljgiaevs9iYRN+ySXsFwzy8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fT1bFwM+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A11C4CEE9;
	Fri, 30 May 2025 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748621098;
	bh=oxQR8fyj4dPp/qYhspMOGoHaCry0IrIJGFbdYhhhhVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fT1bFwM+t3MIAWr+obZYCHkFWwPxeZJVtBamSDY/5312AXxbF9XqJ6hnRcROXobdh
	 512y4KKnALRoFMohufhULj9CzrGdYAxSpfInigbv25P9av1QDRO5ARXiDtgPfoAuuJ
	 0FqHiTzUNnK1JxlF9/BaG3bk5KOI4L6+5tNKAE2UMcLNq9UVMZeZu9hTEbj3r+HAnR
	 Gc4QhQlqFocHXDJrSgL9U6SQifnelf6618m/nR8gdCSi5f9GAqoW7B6egHijn5YNm8
	 mHpgmmzumcmb2FUQaERfjQtvaWaX5sQNWCJwiGFEvbNT8UsHiR/qcdJ3eFUu3x2lSj
	 dfRA+VQo2BYNA==
Date: Fri, 30 May 2025 17:04:53 +0100
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
Subject: Re: [PATCH 1/6] dt-bindings: i2c: renesas,riic: Move ref for
 i2c-controller.yaml to the end
Message-ID: <20250530-dorsal-blighted-cc3047c718a1@spud>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530143135.366417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="duad7J54NVAQa2mN"
Content-Disposition: inline
In-Reply-To: <20250530143135.366417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--duad7J54NVAQa2mN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 03:31:30PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> In preparation for adding more validation checks, move the `$ref` for
> 'i2c-controller.yaml' to the end of the file. Also, relocate the
> conditional check for 'resets' into the 'allOf' block.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--duad7J54NVAQa2mN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDnXJQAKCRB4tDGHoIJi
0gNeAP4zjx+ABV3+VKOo6m6PaAVfQkf2w0fsMUoyaqfGbQmxvAEAuUcQ8m4VKuZu
uiMsh7qB5un7GJdhmvrT7r1bRGZrxws=
=KcRk
-----END PGP SIGNATURE-----

--duad7J54NVAQa2mN--

