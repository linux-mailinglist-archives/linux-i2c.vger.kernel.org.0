Return-Path: <linux-i2c+bounces-1926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B04A4860006
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 18:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E242A1C22352
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 17:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8791E156998;
	Thu, 22 Feb 2024 17:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnTrKsDC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D94156961;
	Thu, 22 Feb 2024 17:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708624146; cv=none; b=X1LoSQ49wJhjvI2xf5w3QemNLpEGzAG7rySAGR6oySWRvRHKo9r+9l2aRQS/7kAxQu3hBN59MDfHqP0qap68dfv5NXsK/+NBKoNDnMUBGi4XbCZruPIpeLViwVaVuMhf//wYnIKRS9Kz+caP485ZAFezSE+f8S8rJgE9NODI1cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708624146; c=relaxed/simple;
	bh=qQIgdPAJqtE8XXmXub0O8Rd/yeQbkMmh3GTE/TK/Tn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERqrl2UUsOIt9UUfzvkfqBH1RDN5NbeTg+w8lrpUVe5n77Y3ZOXTkds1Am/zEfwq4Ubwa12E7AkdLHiu/ux+y5UsGxhkcRC95qQV63nL/qLTDyg9hxygpQ8PJdDaxUGQBSOcBI+5IxsqvmO01/ZufGNjcR9dJrB9nDJDw6J8gR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnTrKsDC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE6FC433F1;
	Thu, 22 Feb 2024 17:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708624145;
	bh=qQIgdPAJqtE8XXmXub0O8Rd/yeQbkMmh3GTE/TK/Tn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hnTrKsDCaXq389V/MLeKuCIQhyo+83RmLnaEuKxroeIjmu7vdV9BGBZb4T8wg9xfQ
	 KLqh8Uvx9DGYffJGHexbXyMJ6q5Ft+dOTR3b3BZ/bnxgpFaX4iDawETtw4kgb6i5v7
	 x8FR3b9BDl2jUVqyP22qzkceHPvWGxyT2LDKNolSFe2vRU5t5MqXY7WrXJ4sGR7irv
	 0ai0DDNl0Rq4oBwl0zYDV7tnSgfEqrfq0xo8qTmdRL6LgdgSMVXTecZ9OfRXSFDkRz
	 gxYrneBs78MbG9/2ZvhNyh++YUNWiCazHIgxIkbe5Czj9vluouYNjeplmB+SnwgvUN
	 gKC68PthD7Rlg==
Date: Thu, 22 Feb 2024 17:48:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Remove obsolete i2c.txt
Message-ID: <3cc9a239-4985-480c-bd93-2776878089d9@sirena.org.uk>
References: <20240222174343.3482354-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tY8a9DQ5aOL2GSlO"
Content-Disposition: inline
In-Reply-To: <20240222174343.3482354-2-robh@kernel.org>
X-Cookie: I have accepted Provolone into my life!


--tY8a9DQ5aOL2GSlO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 22, 2024 at 10:43:42AM -0700, Rob Herring wrote:
> Everything in i2c.txt is covered by schemas/i2c/i2c-controller.yaml in
> dtschema project, so remove i2c.txt and update links to it in the tree.

Acked-by: Mark Brown <broonie@kernel.org>

--tY8a9DQ5aOL2GSlO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXXiQoACgkQJNaLcl1U
h9AWZgf/ZwqHiNRUE2Vn4dacJ+y7BDJMn5e9t5FVKyff28cZwq1ayS7w+9hDUqnk
dHhYCf28sN2pECB/tiDKzC6Uh6NzFJXBqkT6smD7dRZn2JyDob6caqExxDiz9OF/
bD8ZX0eAo54TlOS9GLDth9iT465twaEU2hBl+GNDP26jGxN1rl2E2ylrYZJAD9aI
I//YgDvN9bLmPiMW+IFe5ekj2xe7wsE+9Ih5dXg/ghDbEyE+b2aSp0Oa6qSyoGU6
7MNFsdc15uJuUv5bmOXYYxTmQw1/VoK9BeVMeOFusHWMshsP/zH/y/xTYC5/Gngq
5YwQDCScCwcInmAmk90oUyZxQXL+YQ==
=23+8
-----END PGP SIGNATURE-----

--tY8a9DQ5aOL2GSlO--

