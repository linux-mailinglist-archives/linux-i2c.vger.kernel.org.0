Return-Path: <linux-i2c+bounces-4347-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328B916E21
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 18:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2082B21C9A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 16:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD965172BD8;
	Tue, 25 Jun 2024 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJXlPnm4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688A016FF59;
	Tue, 25 Jun 2024 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719332904; cv=none; b=DAFFulxCoZeimdApvnIZ6nNL40FaC5wltBuZ1GNMJchWcNQ2/M729jlpoBWciYRUo2DlqTKEQLU25/wJInj6GT/+DiomLu36BajwWiMEyrTNFK/4EbbEycl2yWaVr/MT12yFA9WJN/q/GcDyM0rCueRV2VGj+hxR+fgsniVHGlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719332904; c=relaxed/simple;
	bh=lAIs47e6ByHYRlE7lmHPomaMZB8KF4axXzIUJBIBYLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbgLlBPsInzYmS3/NB8fYe+ouRH4KNeQfNRgb1oUSsHWpp/oW3L/TCnHEjPzOjqIH/vcX+opqnpZaWuuBA0ALr5pHaasypyXwQpwxk0BI999XbGzmhcD99QQCNu3hzBCeqdfWWRuRfexgFGGUl5DvO91BPllBB390PQe0tJ7QfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJXlPnm4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E10C32781;
	Tue, 25 Jun 2024 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719332903;
	bh=lAIs47e6ByHYRlE7lmHPomaMZB8KF4axXzIUJBIBYLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJXlPnm4ygfkvjOnFFFCYnppxIXN6d9PYrUKRRwL9RmzlRbSpGiwCjgzCY7TQJ5bm
	 kqn8MOaRckqZHSAaDFB8Zrra+W1lq/dWU1/YLFFlsOtuNKubErqQ5tS8P1ixEYd6e1
	 xq3HYeDY/gZZAqRNOjTHH2bJWK/ATlAk6tfq8x4CGrVHyh8RaIQ+7WDcVeFbqFpYL5
	 G7GkhdWv0tucl7PX20VmLcjQtL4DnQZa5V66fshWOhiRuwYyuY2JPgKji51YOMvU5C
	 bB0jWlbFHfDEPYJRfglQ0s5in46GgN9meIXPgL9czaf4abi7GfZbYrFJ88wTbDobvv
	 wQjL44nbEuaMA==
Date: Tue, 25 Jun 2024 17:28:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Message-ID: <20240625-agreement-harpist-f3b31646da40@spud>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-9-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="onrf8GZp/AhiDHmN"
Content-Disposition: inline
In-Reply-To: <20240625121358.590547-9-claudiu.beznea.uj@bp.renesas.com>


--onrf8GZp/AhiDHmN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 03:13:54PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
> the version available on Renesas RZ/V2H (R9A09G075).
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--onrf8GZp/AhiDHmN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrwIgAKCRB4tDGHoIJi
0m5HAPoD67GiW5fhQfJmviBDT7WelIDnDqFiU973Bes4rt/6GQEA+fR4hnwPzuWX
JLyNSh+JtY1uL5zYDybaiIfMBdJ6Ggk=
=RU4D
-----END PGP SIGNATURE-----

--onrf8GZp/AhiDHmN--

