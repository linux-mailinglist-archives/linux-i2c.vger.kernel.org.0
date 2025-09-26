Return-Path: <linux-i2c+bounces-13193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E270BA2911
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 08:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F526561277
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 06:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A36B27F4CE;
	Fri, 26 Sep 2025 06:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FnIwbFiB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC0F27E7DF
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 06:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758869261; cv=none; b=GBa9kDdR2xjb1Muw9U9RVeVr27GpKK/i2QM8vOVtEdLlkna0RsiPJpB7zzVrSLerS1VAbPAsZKDv1whCFmfCwU0pSQgEmmm+Iokvvg0U4b5MX2mYKP6DhchxehGB4hDcrwQXc29OFEHDRFWmZH7Q8Jivk17bZT3rEeW/7qyNHEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758869261; c=relaxed/simple;
	bh=COunz1JLa1fpmV1AAJupyIS7fAiGMYlnjvCJNA2KWK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4PvF6vIY7h/TwGJoyYeXgtPE0Rp1dYDUTmsRdgSWVffgxppHblFiVQNu8JyBK15L1LWRoLTftKY49nHADV4SEM3SG6pgNoaYoM7odCCubPuQ7xA3EpnYh57bKiaOK4uL3GRyTm3aTE2zhU9SejNSxc567jzceiv7mXnmU4PSo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FnIwbFiB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Zg5B
	R8TR0pwXhS1HMnn+PMtDRUEhr+0FbUE0xjhN2ok=; b=FnIwbFiBtLNXA4GM3Xad
	/H/dtDIRdZ4Itp/C6UXVxubIduzYAwiR5lmtuy6oZ9KHV78q6c8RG9tmbPfE6ozV
	LF/FgZfyaggUZ5wW2k0VpvH+M16zCuIYNm7VpIPLbcAfrNXG/0RiHbs0ySJrc9NJ
	SEhoW8LymZ6tz2eascEXDe5AkLf2+qFYCUmsxXu2sy5/k51pDFOjG5AG/prsd9gB
	NxFIVdZV8fLev9AN2FWjBd9sI/XwcKoy0XunztJg/nrKKFQ7tGySZhNcPB3HuzDp
	mqZMVY8VtUSKDbQRBiEiDw0Wd6ozEyjHNK76d637RDORBsgmChaARi9RmmaDV4pZ
	tA==
Received: (qmail 2152516 invoked from network); 26 Sep 2025 08:47:31 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 08:47:31 +0200
X-UD-Smtp-Session: l3s3148p1@+BPqqK4/0IUgAwDPXwQHAL/S9V79e5yL
Date: Fri, 26 Sep 2025 08:47:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>
Subject: Re: [PATCH v7 04/12] i2c: rtl9300: use regmap fields and API for
 registers
Message-ID: <aNY3Ar8bernz4kCI@shikoro>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
 <20250831100457.3114-5-jelonek.jonas@gmail.com>
 <aNW0jiJQHcS-FKwr@shikoro>
 <476cd546-1bde-4ff0-a785-2e6fa21b79d4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="htY2TmuyroWQDCdS"
Content-Disposition: inline
In-Reply-To: <476cd546-1bde-4ff0-a785-2e6fa21b79d4@gmail.com>


--htY2TmuyroWQDCdS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

> I just noticed that it seems like an already applied patch got lost [1].
> This was supposed to be merged to Andi's i2c/i2c-host [2] and actually was
> there until the first three patches of this series got merged.
>=20
> Since I had already issue a few days ago trying to rebase the remaining
> patches, this might be the cause it also fails for you?

True. This patch somehow got lost and doesn't apply cleanly anymore
because of patch 3 of this series.

Are open to resend this series, rebased and with the lost patch added?

Thanks for the pointer,

   Wolfram


--htY2TmuyroWQDCdS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjWNwIACgkQFA3kzBSg
KbalGA/5AZzQHP/5+gcHsGeveIpB6If9w0fi5dYGUCglTAVLQpRx2xnBp4dOrnbZ
ZF8OeEPy0VkhY0c0vuMtyEvkLAPt7xT6h4Ed9yZGcNn32axeJQ8Q5m2LAyA8meyl
rV0NZeGGQ4r3/iRmdsE69Iab4iprmS3gZRDPyv6PkIDsTQK0X+RlCs7wwk6CWXxN
12wLxEE0VROVXkAj9rQMAdwJFDlo9wnz9Wi20FwrXaSnxhua5dHWIgKXoW8Kj3Mo
KL0JAn6QE3cNAN2u9Y7bBpH2z2kfaJNgmWz0zYsCnA5sItmven9OiBVfKdgRCGXv
zTKSQyMQmlI5cMU72uYGRwCVKsMH4IETKyZWZBBn4+we8a+kHGB6SLicCmE8vhlW
+XGt/oSE6TCLZ52IUwAcshWgF3EqepLcVvypjm3/eGycRM7+Lb3NKJQheJIBXJrB
2VstLTcEl1r3/PQnBM6P4iJ0Gdit92L1PhQ8HNoYR4zBjQA+U1HQfO94r+Cri+ZQ
ahh8fB+mNM+00PIBCNIxs0tD66STvQBXM09tpJUv9BJv3R9YYnvb4SQjb4Q0QU3A
/ux0kn5vopQdxlvN6gTGovlE5Is/e7d2/y1yxdPZntk3qBc8UGfym4CheeWgJh/6
dgSWs/wlnFyrktdUOwvcwDXh6wTC6YZScRLtRCGD5H+OiIWfWhs=
=c2bU
-----END PGP SIGNATURE-----

--htY2TmuyroWQDCdS--

