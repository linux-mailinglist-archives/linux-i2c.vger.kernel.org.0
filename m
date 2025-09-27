Return-Path: <linux-i2c+bounces-13251-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C8BA63E4
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 00:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F6D44A0491
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 22:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3E61A9B58;
	Sat, 27 Sep 2025 22:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZxDdRP0Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE2625
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 22:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759011366; cv=none; b=mtTAm6v3dKX0KwN+3+OTUbL/YWK2AYWjqtfZNt6fNDYuqZZyP2rV6G/kfSqLUzWnvaYeP9pxPkURNESs/GA59L5pus5oGk6TirBPZn5feJsuSJEpPmE+So58+L+KR/IJY5aG/i9XzzorBnYSzTaWZXOK0pTglIU8kUT5bUTtarc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759011366; c=relaxed/simple;
	bh=8vZRA8xRfEWHtkYllia01JpTEqLlFc+lx75FdnO+oo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f66P+OHiSl51s56Pzwn0orPf+CTfhC/iPuTjDB4zrTa4M14b5BNmQZ+RzWawo9FsW84xYwtA7w9xNm94ZOlldKYvacsG/7NN+LIm2FkYs2LZfg+xEFY2sgscWJ80F7EPQE1W27ahRSF/oY6EHrHCpqc6C5inBBO7PG1x25/SllA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZxDdRP0Q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8vZR
	A8xRfEWHtkYllia01JpTEqLlFc+lx75FdnO+oo8=; b=ZxDdRP0Q11za1yd8Vw0S
	39MC2odiNNSqyQy9M8o++tRzYkll+aTX+jZIG4I9rB+A95mEkRtGIWi/gIeGI5e7
	7raiklWdW1rMR4zH2k/IJfcp01W/uAxmqGO91NMXOkZx5UtIklw8bj+BqUAzlR02
	ZycgbVLUAowkFdQMtNj9XjN4O41gXaeWOSlkZaDUrJg/1vBG1zoISTG1zCuwbbXp
	9AhiMmzjieRoC2wqOEf+DtxvbdE7plcD/YyCHWBhd1osnLbUsfDjgeU5RLIrwagP
	aGxTaMbnE3+SeoFuXcQslZh4UqQVOmYhvO/wsZUwQ/Vt65KOoS/UMnlN49xC57Ca
	sw==
Received: (qmail 2700299 invoked from network); 28 Sep 2025 00:16:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2025 00:16:02 +0200
X-UD-Smtp-Session: l3s3148p1@YU5jv88/kN0ujnsw
Date: Sun, 28 Sep 2025 00:16:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: delete email for Tharun Kumar P
Message-ID: <aNhiIcMl7VBk98NK@shikoro>
References: <20250925204020.4544-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fpi23hzH5U9f6IiJ"
Content-Disposition: inline
In-Reply-To: <20250925204020.4544-2-wsa+renesas@sang-engineering.com>


--fpi23hzH5U9f6IiJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 10:39:44PM +0200, Wolfram Sang wrote:
> The email address bounced. I couldn't find a newer one in recent git hist=
ory,
> so delete this email entry.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--fpi23hzH5U9f6IiJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjYYiEACgkQFA3kzBSg
KbaZDQ/9G3icVYvY8mxCYm9hx4UxRs563Dd8VyMI5SHYF97mVqj95vtlwoOj1Uz4
d/UZ7/8/rXtd16vT/soIrUhPGTx7bMe6jbfWpJx+C91Qnn+ZOkVl4Z8DsXQuRXyk
Co1NuR+MYkrz9cpWS4muZ6WSH+gAUcSKlnGicMFW/T/EE9UwDy//+Z43LyGNBkAY
CtgdVUKhCQEAxuFJtihcq1Ct7S57elEQBiqPLLy1dEsRXR9ADv9XbiahZe4BgLob
CiojrpKQislOeWTnC8kb5oyjSUJhu7gCEg0BSvrafkqDMm0VrTj3b4UY/J8HXe6Q
fBO7wiLCini9kEVzgkhObDiuwAnogwaZ1+iziMnr3XMAL9L5kmFzJ25CH/+g/8fp
fHxsPu82jbQhHki1cNF2w5QI28oIbYZeKpp2zL5JYCyxsZbgcDtKWpJZT4ONb0kf
RdsV9f/zIx/wb2GrJuilrh8/a7ogZwFCxLdsvu9QdcGyUQ8lHc/eFNAip2g29ps4
+yg+VJDFLJUXE2AKj30O9m+sxDSfjeoDmBYkWjThPaupEN1eFp1oLPWYKc2syTgX
TtxqDePB8Ufxhs+y/vKiXPxW4NvtpG9p1NyEmeIMI28NcGMIUIOKe5/tjyipVbEx
u0XBGQlDHV9HWprecBCzBpNfqPBysAU0SX47CD9wQZphICfs0Mc=
=Qvgk
-----END PGP SIGNATURE-----

--fpi23hzH5U9f6IiJ--

