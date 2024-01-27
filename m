Return-Path: <linux-i2c+bounces-1488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DBE83EB9C
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jan 2024 08:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BC91B21342
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jan 2024 07:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55DE1D6B6;
	Sat, 27 Jan 2024 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DH8voKjv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEA91D698;
	Sat, 27 Jan 2024 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706339533; cv=none; b=Zq63fkYkb8wuXrWgleTdtemDprxCbmji/zTjPBik+pEw7wHA434LDOwQmngfh6usHfXLyr1havnFh8jpevvh7GVjRMy/s1W3R+EY45Z70k5g4s9FI2EVxNj0w3qv7MjtXt0pZjVFF2Vg1YgJzUZAeUNPGiHH5wLZcvn0V1p+q3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706339533; c=relaxed/simple;
	bh=Djha/6IzXzehmCN/Og8Y7c26kt1+x5+vBBHOZGV8Wvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBw7tGhGwvsYv3GPQ1uCHrf9fEKtGtJUpL2ykgisgazQq/bIdK7T444CLtC6SM1+4L5h4Z6Y9S6J6PGKrJuMCf7QeKfdeJw1Wv5NDwBQvTZDzgzXNpsGna0WTf2dU0uVvDM/xyNOmjFnoClN9mm1AYxexVkKvzcVK0QVu0ydTJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DH8voKjv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59105C433C7;
	Sat, 27 Jan 2024 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706339532;
	bh=Djha/6IzXzehmCN/Og8Y7c26kt1+x5+vBBHOZGV8Wvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DH8voKjvM7YRF7c8XNv7VCsf4TfvKt07B2diNs4loufAw3+X2nbiWJeHvglajnyNw
	 Bk6ydgrz8X79EBzFMMWbYSqDja31HdsMwfZ54FLOEZCSvW3ZkQHMF2VNH/N1sqzHQP
	 FpaEJ7logpFaj1L9Vyr952m6MbPUaNV0iCTv6QMquvNu1wwkVAUN6WJ25N2nDr7AfO
	 Ptd0t5R38jMpL6rMG2WLKidl+vQ/bfyq3eO0jfRKwHzbndSC/CgzZdGtO+BTgGE1zp
	 xik4NtyoED6nCs00HE5c9WIrUatnssnd+9bHa4yO+Ty/A9aLwiHg2db2VeDZgWH8qS
	 O1asR6/PkJfqQ==
Date: Sat, 27 Jan 2024 08:12:09 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] media: ddbridge: Remove unused class-based I2C
 autoprobing code
Message-ID: <ZbSsydul5RKCzBTV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <8b40e95a-6c4f-4109-afb3-615c6d1e0477@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PutWuLwQzMccHtEj"
Content-Disposition: inline
In-Reply-To: <8b40e95a-6c4f-4109-afb3-615c6d1e0477@gmail.com>


--PutWuLwQzMccHtEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 11:39:58PM +0100, Heiner Kallweit wrote:
> The I2C_CLASS_TV_xxx constants don't exist in kernel code, seems like
> this was copied from out-of-tree code. The supported I2C_CLASS_xxx
> constants reside in include/linux/i2c.h.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--PutWuLwQzMccHtEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW0rMIACgkQFA3kzBSg
KbanmxAAgd/Od/JSchv22jOmIy4wpwGDw0DDZI1LM3Zpv89+ROrVRslnWFWBQQQN
VMme5WQdl3Gz5SeDZBdspPjfa6vTjtUQiUxFWJLzgrHweDfx1jSPR+n1JitWWwRq
rKuFe4fJD5eqnBofqh6Nc1p3Rp5EdQ3hekFgqzfraRCBqxNTW45vj3zpV5GQ2fT5
vLJ0VP3DL9HNffznibHdrxhES+fHRJBQQl0zc9nDUJzOo2DEZ0oA5ummEEeE0TLS
+L+ajwC4J8MRf8qyg6mpkum/vQkuK9KPf5pTTlf+wzWJdY2BC1F1fC+jf4f8XOqs
F7zumRDVuRHCi9WbEhJz1VRfHYextZwZOLqnzFon6pwLgkwxaTsNo5vOT6KAHIUg
e2ks1TZZmzoN5/lLJ3G4NLto9D+qMXDMVxumqtQF3XD8mbLQ/R1BhciFqgRzM900
N3t7avqrwfebiqVoFUOqRnbNJILdylqrF9lRC9dljUnC6CbLhOGDsVWSlKtX63Tz
BiADwleQ6GZbcDzCKqiDfDmSlfUlrI68zzdXdAcSk4jodIK8o/UPBFgaWULkicg4
U4G2VJuel0tc9i3Zo4H5ywcuP54tbihGTrkIJq3aJqLUqTBXZBCIGKNSvTJb/Seo
C3TNkAjTn53UR0e0Ge/WEJCZHAX2gCOUBL9V6dKQ6WyLLF4tNYA=
=PsBC
-----END PGP SIGNATURE-----

--PutWuLwQzMccHtEj--

