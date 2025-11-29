Return-Path: <linux-i2c+bounces-14340-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7DFC93DAD
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Nov 2025 13:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 67DE9347511
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Nov 2025 12:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A187630F55A;
	Sat, 29 Nov 2025 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DNtiUBNt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EED30AAD8
	for <linux-i2c@vger.kernel.org>; Sat, 29 Nov 2025 12:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764420210; cv=none; b=ErF80OfLu0y9IF1TInLrQGvlj7ue4Nv77fe1J2GtACg3PujhXxDHRrTHjh1aQ7Bc4zRD6NasmvoCH78ecgPVKAbLA4wbtJ9/XIC5rkssfDu2AZUj2u0Zw42EY+UseqgD1UjmTlRC1fN8qtEO+pfP52R5o4Z5k9JRlH/GO+MRhkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764420210; c=relaxed/simple;
	bh=gaSbPuhWn2Kn/zZWwlQRDQP1k44vTFfjid4GqAYxCXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGgd4sGe4L8Dr3d9nFeJdcWZ5op9mmHXQ7wFFR+w/W1tk6nJGxybuYAVh++wdrPdLm1IxlZ6lH88z/bl+CdazJGJ1Uoh+QvPlB5QQIVT8USgPCEgIspwhD5E/PxAHdwIwKS/oj753lU8IMwxs/sFdrasXklP5R+JjOJdqhtLpxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DNtiUBNt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gaSb
	PuhWn2Kn/zZWwlQRDQP1k44vTFfjid4GqAYxCXI=; b=DNtiUBNtk2kzPfimXOFC
	06tn4rIc/50olmSfP7Rjg+94pGw8gmSlWWqCjb1jGUwxSub7wZBhVOTE46q8K83W
	nLVUlUOhryCRy8wzi/CjHTVcu5WYdxVK85jDyHZpg6OhcAe4ECWKpkKH0HGTCoiH
	EWN1YvcSDov8Z+GQ1EFLfHASHwLICRDkoVgPFI6t6rzIJAqcrMgB+FPrG87wQphJ
	goQGR8LL6d2adgIwMC1bgYiS1YaVD0QftxVOWDyI05B1/ZBb0ckSPze7q+BKWf9b
	1HyopYKIT3MYLk0Et6FIicZzhjRGVggT/DD2zWWTT9kv9AdLhc/krZWfTUBKwBK5
	Cw==
Received: (qmail 4020742 invoked from network); 29 Nov 2025 13:36:44 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Nov 2025 13:36:44 +0100
X-UD-Smtp-Session: l3s3148p1@zWyL/7pEp/nd+uUy
Date: Sat, 29 Nov 2025 21:36:41 +0900
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, andi.shyti@kernel.org
Subject: Re: [PATCH v2] i2c: i2c-elektor: Allow building on SMP kernels
Message-ID: <aSro2TbT_RHiM4AS@shikoro>
References: <20251122141717.28570-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gs+6wHZbcI3P0NCS"
Content-Disposition: inline
In-Reply-To: <20251122141717.28570-1-linmag7@gmail.com>


--gs+6wHZbcI3P0NCS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 02:45:01PM +0100, Magnus Lindholm wrote:
> In the past, the i2c-elektor driver was broken on SMP. Since then, there
> appear to have been some fixes and cleanup work (as pointed out by Wolfram
> Sang) to get rid of cli/sti usage and rely on spinlocks instead. Therefor=
e,
> let's allow building the driver on SMP kernels again.
>=20
> I've tested this driver on an SMP kernel on an Alpha UP2000+ for a few da=
ys
> without any problems.
>=20
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
>=20
> Changes since v1:
> - Rephrased commit message

Applied to for-next, thanks!


--gs+6wHZbcI3P0NCS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkq6NkACgkQFA3kzBSg
KbZvMA/+N2/T/VvsmlKQKoveir7/GSiM7cYFP5RoKQRTzHBLI4OP67ajKFyW64CK
abivS4CrX+AkbSdKdn+cJnGPi3Dcv0cYKKNI7YHy1FaQF/MEe7lSgFk8V++srwi+
svASiixXzE8wViLBrF5mZvwB8FNKdzEhmIvr1lMcgQinJ6BRTqaSSUSlvUitRxFj
jFup8u9iNwcEjoKmiQ2Icv4eCtOvKbm2FqCm5b3AJc7o3chEiDGjLXbdWKGcVJTy
xC0G+3EAW7HdqgSqJf4+scUYnyDkoJaUfLcIieBEqxDXu30+OafWdzbOX4HGTfpD
ZN9X9lb9fZLvEkmoZAZ6ZASm2fIefL2XuG9axouuQI8XZ89T6EQ63+EA/PrIkcYi
QFMl/JfDh5RUxtxJnyEql00qY3zY6p3F9tYgpQjax9L1J9pfsVrXdC2Y4kcXLU5p
QKzvlrFJ9ukjzsarksv58BVpQvV1N80ifeCQ0GpxbxOGovtVBWa2ht/x9y4iem2t
6bh3UU53+dgwHDiAXm2CclFuRUbPw5A1DewsOtwpLE5cxmHEkxeDV55ayAa3b5pw
wVpABo5E5nvjZrGnwUhJf6p88Rwle9xdDQ+1Avj7R+0L2x6aYOEFczbkHdOmV4Sk
0IHvVhrE1y2VyIaq03wYb9GjaKE/afz1cCgyLV1bfH1hDUME1u4=
=TLtw
-----END PGP SIGNATURE-----

--gs+6wHZbcI3P0NCS--

