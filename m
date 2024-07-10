Return-Path: <linux-i2c+bounces-4811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F016B92CB10
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D4D71C21F4E
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 06:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4748C6FE16;
	Wed, 10 Jul 2024 06:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HWx/VAlW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8A7522E
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592986; cv=none; b=Z3A82IALvG6WVAfZfN3vH3woS15XHzZ3ZkzcjkWT1cM4S07nfA43WszVfFqZlDrJunKKVKniTLb077I+WB0jBtF7G7SdNH4RCZ8dNOsBkh+ImU+/kBvOlvHUHfqpsZd2uZ3QXzhPEdoXoea8EQBey59mOMGh4+BfbMedvf5oASg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592986; c=relaxed/simple;
	bh=0LeCYgifEtDjwIApEekRRIa7a2c+iCDVuMUvFa3BoKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8NA6MyZ5T5QGUTG3BRStCTSuXy6p0rATdv3I7SRusSmp5snEWpWwSSDU5rgDwAvNdXJEz00eSWR1+JNJCXodJutTsG8JQvK12ercbVI+mKlP8HflaGLe74XEwKbTh/Tyn6g5OVJnklLcyiwsYNC1Czjq4qSYBCv6PXCOIaYnmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HWx/VAlW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0LeC
	YgifEtDjwIApEekRRIa7a2c+iCDVuMUvFa3BoKs=; b=HWx/VAlWcDIs/Do7o3j3
	HYDCUm76zsuu5TUOtpUcWS6owuxwqGie4w9DXyi96e+/srK0pXnUGQavIUdcnc3j
	YaswKN0WZ69pekn+VzPWEwTAMqTbzbCre8qddG/MkDYKd/51DUH9mE8H8QKFEYr2
	YqY1RqNg29AYoIYzU2hyaiDdhm+Jpmhi4b8QWxXiu0baR9qcId5i6wtNW45nrvHP
	HKVI/sXZFtud9+EUlof7MerBRX/42mwa2tk/hmwgAau5gGGTmvCXZTlf5Pn3fgsI
	imKATNo4KYBuAFsGO5HGnjvcAOny5X5UcoF8YuTzyxB/BnEt9YgzYb+R+Gy62cpf
	Aw==
Received: (qmail 429862 invoked from network); 10 Jul 2024 08:29:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jul 2024 08:29:41 +0200
X-UD-Smtp-Session: l3s3148p1@YsZxxd4cfIUujnsa
Date: Wed, 10 Jul 2024 08:29:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] i2c: rcar: minor changes to adhere to coding style
Message-ID: <Zo4qVeIjGCQH5zXn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
References: <20240707082848.5424-4-wsa+renesas@sang-engineering.com>
 <f93eda7e-e65f-42e9-b96d-e88290201ca0@web.de>
 <Zop2vNCrzDmEKKiO@shikoro>
 <Zou2g8nGBD7Pv8kR@shikoro>
 <5trq7ondxem43rfnckonywhrucvjvecc52pvyik2fsz64ivknv@r22caitz5y3s>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IhJEtiCBxsxZ2Uge"
Content-Disposition: inline
In-Reply-To: <5trq7ondxem43rfnckonywhrucvjvecc52pvyik2fsz64ivknv@r22caitz5y3s>


--IhJEtiCBxsxZ2Uge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> That's OK... if you want I can remove those blank lines before
> applying them, it's just two cases in your patch.

Then, please do that. Thanks!


--IhJEtiCBxsxZ2Uge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaOKlQACgkQFA3kzBSg
KbbtzA/+Kw9xO01OGlslCruzbmZYhVCwLvE1SFNHOoutCgb/qBXc5L8Vq2V6akCB
EsaVXvDdQfQ/xA/YxrGLJdwEi+/38wum8Vece7UxZLIJ9IV5aEJNOXA1Uu5hbBEV
fCyZNLUMNHFgrdMeRbuLczh8sMz599hbbSoicBsxrvwtxUYX3dKxV8e4S8FqQtqa
zqJqDI07SJsqDpzUeixZXRK39ozODJY1V2Bglb5Lp5UXzpDbq5eDKrS9PrJNTyYX
1daqkXWr/NLpVmtg6uot/V9mGj2PJSvQA2BwFDQXg+ikKMbQZCQaXNgFYDi/WOsa
GU+I9nx5JjzKAZZjbQ8QqJPE8d9UEbKDFdJ+/91QnC3ONE8Qy6My+TdJzWR88QVt
NlAwq9548g34FwAUXG/70XOnooNZowlj6yt+jdmkemCsyoGmPv8hZIEiR5VF2qik
exlEk6ceDXm/PJ+WfeyrRBcag4KBj0zEjCQE22hnzHthDIxX6bSa32+ZwXlU6l8n
29KE3LmDg+6TGiU++8OKatnqdyuEZf6q5RBMyepfU8YBmy5Kb0AS4skMF7niMgc9
FD9nLc1USju2Lh7bEC6p+Eer+OAciOtSGpTzZ3c1iw+5kTBG4ADmvgTx6Obkb17H
F9enmw7Qjf9ss1MRu+ZR7TPBezEwZ6/inOiWU4M1umCSptroLmY=
=jV4i
-----END PGP SIGNATURE-----

--IhJEtiCBxsxZ2Uge--

