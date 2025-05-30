Return-Path: <linux-i2c+bounces-11177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCF4AC92FB
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 18:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A545D3A76C8
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F79C235079;
	Fri, 30 May 2025 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwiqu090"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B311A194124;
	Fri, 30 May 2025 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621205; cv=none; b=r9bSxMHk4QjYgCLqHNFIFcw/lQ4tRWsxa+GlGxzQG+aLbRtkuALB96yqFh8fyafxAxpz8haih389OydN1UFtueimQX4VPWG4uZStiT1W0dOh2IJ8APlS019hdCE1XV/683tPm2nR0jblfrmJOgds4tvaOxuPExBDNeMjKur6/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621205; c=relaxed/simple;
	bh=QE5vZGB4Ai+yRaeiycLEe0jyVNRUeLHTkrCHAA4Iou4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yrp/u9olqyBEc6/sto/c/YUkhUVqr9bSjBsRJrXpm3iXfCUqDPFTFfcwTC5vDZ6v/VQSY/VLpJl115q99EPOQqFEWJZZMKwLyCBz2uFKnLQd9GHYMxq35gloPAq4j8NtGLoUHBqejkUhHEPzrK3y6AI5vrc1Xt/hLlvjFPgiFEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwiqu090; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04216C4CEE9;
	Fri, 30 May 2025 16:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748621204;
	bh=QE5vZGB4Ai+yRaeiycLEe0jyVNRUeLHTkrCHAA4Iou4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwiqu090/qhzPkXyeBmBinFeGCzivQHGPhQYkSn/uD1aNWWg/9mcNJRrJ2XFvJPE5
	 O/sWCAVYme7W5w1O7ZRIdqE7gbyasvamQOxq5hOLoSDuzu6H7eb8Ayr3Gk6Oxo7e5G
	 UR4eLFvRqFENyGzF/nD0AEVuvG5uY7kK0Cxh503v+rYsFoVuuDgnemf8z/uhledgOe
	 T+nYH91VkZkoDluvlejL4NW8H3qwyATeOLt2CkSuu47ZKuYiiW2Ntm9U7/k0c++NXH
	 +vsG/do+93DqSYLjAZeEzFQkjEaV2bv63vXP6U0jhmo++x/h545FCrrvIUBn99NyVi
	 iDF1ER/xff2kA==
Date: Fri, 30 May 2025 17:06:38 +0100
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
Subject: Re: [PATCH 3/6] dt-bindings: i2c: renesas,riic: Document RZ/N2H
 support
Message-ID: <20250530-gear-sneer-6a8b186f6a20@spud>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530143135.366417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jZNX5/bk39sC52rF"
Content-Disposition: inline
In-Reply-To: <20250530143135.366417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>


--jZNX5/bk39sC52rF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 03:31:32PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the I2C Bus Interface (RIIC) found on the Renesas
> RZ/N2H (R9A09G087) SoC. The RIIC IP on this SoC is identical to that on
> the RZ/T2H SoC so `renesas,riic-r9a09g077` will be used as a fallback
> compatible.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--jZNX5/bk39sC52rF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDnXjgAKCRB4tDGHoIJi
0mYOAP0chDMedOz4gTJJJvgNzUXjKkdlOO9Jf2lTjMHcRDQnXgD/aVXzcVFwqL2s
BPKVIG0d/5NNZOexx2icbsBHzMr1AA4=
=x//Q
-----END PGP SIGNATURE-----

--jZNX5/bk39sC52rF--

