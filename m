Return-Path: <linux-i2c+bounces-9125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0BAA140C2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 18:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FEE0188E0F1
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 17:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230AE232438;
	Thu, 16 Jan 2025 17:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GfjTG096"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42B9232424
	for <linux-i2c@vger.kernel.org>; Thu, 16 Jan 2025 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737048043; cv=none; b=mcMyNCgssDKwKVQDGjaOM1y/VS6bCdwbhOCIQV5lHyltfiosd2xUQ73PI1WOXVow/baPfQW6rDovRlp00SsodxGuJ9UNTnPqETwvOylzAMDD6VmamaeJ5SMdFHN9kLHTZ4LI8K4UcziuE369AHixUbVEgfu8BZXRvUg1C6D47bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737048043; c=relaxed/simple;
	bh=GvG6l7bLN0QM7oc7ouYXhnZDyhRjsCINfnh22VWAAOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgEGb3m9aCn2jIOKX0H4h/W5pehZUtRw7MVRXgXnMg6GVrKOaDTcNYNPL5GAGRNS/C/lDRvWWSYF3oxZEIBVBC2ge+x3XZRO96WK+owB4vCUwKfdThTieJZrPKj8ZKf5a6bECLaFURIPVludZRsMVcGg0rqjL/UW89Oxy0vt9LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GfjTG096; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GvG6
	l7bLN0QM7oc7ouYXhnZDyhRjsCINfnh22VWAAOQ=; b=GfjTG096Tf72RB5fV3PX
	y4s0yWBNtF5Qwredsa6bL2YZNpIaCpfFTjUEBKxJcO3HkFa+8/ii147D0nQRh+Vi
	33DlnGf+etVY4v0T/xnHMkHZ4QghoT5MLwWTZT9LaPUuD202RcTDyypCGPBXf4Wk
	9Jqy66+oGFRtpD0xWkQwugECwSPnSISW6Gck4TACHfQpDT1sdxoDvL2Po9ZEPJCq
	xZvvT0ZhEt+y7c4sDlM6qcJe4KeAPWlsyik2NJ1ft+9/HvJaHqaSrz+DUCNMzKkY
	pVbhpp2o3v8736nHgiHwns1ohPQhBfYzE7iZWfWopBIlmzUf6SIkuaiEzq5hTC2c
	iw==
Received: (qmail 970152 invoked from network); 16 Jan 2025 18:20:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jan 2025 18:20:39 +0100
X-UD-Smtp-Session: l3s3148p1@qa5ZA9YrsukgAQnoAGFKABs35iVLDC7C
Date: Thu, 16 Jan 2025 18:20:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: fix NACK handling when being a target
Message-ID: <Z4k_55MJS-ISfV0O@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20250115123624.31172-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rtNP6Jgi9j+CsWyN"
Content-Disposition: inline
In-Reply-To: <20250115123624.31172-1-wsa+renesas@sang-engineering.com>


--rtNP6Jgi9j+CsWyN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 01:36:23PM +0100, Wolfram Sang wrote:
> When this controller is a target, the NACK handling had two issues.
> First, the return value from the backend was not checked on the initial
> WRITE_REQUESTED. So, the driver missed to send a NACK in this case.
> Also, the NACK always arrives one byte late on the bus, even in the
> WRITE_RECEIVED case. This seems to be a HW issue. We should then not
> rely on the backend to correctly NACK the superfluous byte as well. Fix
> both issues by introducing a flag which gets set whenever the backend
> requests a NACK and keep sending it until we get a STOP condition.
>=20
> Fixes: de20d1857dd6 ("i2c: rcar: add slave support")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--rtNP6Jgi9j+CsWyN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeJP+cACgkQFA3kzBSg
KbaTTxAAl3siFw06Z2sQTzAWcZqVOMMKg/eeopzaytul0iB5obbgDOf6UDUk3nK/
rDEg1Bnq9WVfg72SdpZDh49eCmhfDNhYFFZZtijIrrHoQhFNlZKk5IWDHWDv8DP6
n7JR1mfmzQ0IJH8q1ww3w0rYIbuyula3Qv/BJzfXV92m7zehaMoQ345RP448XPnJ
VW/14CFLOhhgnSW5XAi+gEejtSvbs/q3xdx5sksgFG+Ga8LwgLDHoxKh2DDJFFLL
jvNsHzhgp20dAtFg3yK+P1ua1FFznbQW5jZR9hSVzb/tBac+yKcPYvLLmAdA2CYR
STnzA5TFDaAp92SEsatThxlHU2RFBo6Gn0p+XQ1Tx6moyKKNU2Bxapodz2BaBNEH
us/iGSRvu7zHMBrfljJLsBix3ScCaRoT2D5NWKkr0XMHRgJoDmUtMVL+o2rXzRt4
u1xfFTWXf9XaI/FKEBIEnfISWebJAZynnZtRuCWzT883yuErLtSSUsj2ki7Cta50
JLLWwCoRW5IiwYpB8YHMHxt4xnr5GO8+9yjZtq/oRQp2dqYP2iOI2p7PnFlZOeTa
7sfSh4Uo2+SGKTfX8VlWrjL8ZG5YnvTaAdIM+3XUvl32KQ5ltjsqxjouMGNVuJQv
sRyfZgcKlZ+dB5Z/0Te6qPnxSSg+cPQYDUDFU5b3Hg8L9GxhpL8=
=SB01
-----END PGP SIGNATURE-----

--rtNP6Jgi9j+CsWyN--

