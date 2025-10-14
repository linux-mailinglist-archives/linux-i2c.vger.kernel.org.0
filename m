Return-Path: <linux-i2c+bounces-13480-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E80C5BD92F2
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 14:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E851840109E
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 12:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B102417E0;
	Tue, 14 Oct 2025 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k3FURnV3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69E12F8BD1
	for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443254; cv=none; b=T8UYh9/7zc+96/DNbkKXfutziRz9DVC3OA/IkMKhbvWqRHV6wTdmyeScbkgLDDVTMLNQjETvtmPQdf2YdpekYrpXAt5DLNvwV8lCQC2pGth5jq+WfYIHyaZOcjN30JpOVZJEn/ydE2AAXxxFJKnV4U413wEW+nncWx3P9gj2q4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443254; c=relaxed/simple;
	bh=isISHzLuWiTrYUr30pEfw2PJf5ZwBFeljh+qPceiI7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHbICJG0REu6QkbCXhR3nszDHShxGakkI+CkBjCd53BOYKNaZHL0wPgsnQCGVv1PXUJYwakU/oOSXtQsMdy6Mfn6cdVNMeB+7XYAvxo4Qq1uu4DD5tKHo3/sq0UyZ3R7ukAa34Q0FCsdWYAxNWfRO1W0PIEinX8QF2mD0+svpw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k3FURnV3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=isIS
	HzLuWiTrYUr30pEfw2PJf5ZwBFeljh+qPceiI7g=; b=k3FURnV3CpMJvv5T8nWa
	aqGwRUmKAO6Zcw6utrtKxMK/S9b/WuaG5VCaRCLm1j5m4X+5o25xnXqymo6xB5+k
	tPnfJmokgNUDRmWPhWbPGAoN4P3GZECLofYxIqqKdGtTxrsqbD7VRi9qHOaE1ABO
	QaZuRt1Mmy/kU45ar2tKWYOt7baXdEPMgY6N4Bay0NaPeoJEZL8Ne0UMuow4WZ6r
	wY9a5oqc+9Q1pAayu3SEW/K7h9dpuKc3PoRh45O6e8d98wFvl7JrjNFUBiV5Qz8j
	zyDkKZkCJu7JEzlxvjP57QF2pXvo/ARjUhf24BF7WVojo6hh3SXb1m77zoW4nFAt
	lg==
Received: (qmail 2954040 invoked from network); 14 Oct 2025 14:00:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Oct 2025 14:00:49 +0200
X-UD-Smtp-Session: l3s3148p1@KquHIh1BCuAgAwDPXwQHAL/S9V79e5yL
Date: Tue, 14 Oct 2025 14:00:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Convert apm,xgene-slimpro-i2c to DT
 schema
Message-ID: <aO47cYF3w7KG80lo@shikoro>
References: <20251013213120.691285-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WpD3fSrTpRm28vYp"
Content-Disposition: inline
In-Reply-To: <20251013213120.691285-1-robh@kernel.org>


--WpD3fSrTpRm28vYp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 04:31:18PM -0500, Rob Herring (Arm) wrote:
> Convert APM X-Gene slimpro-i2c binding to DT schema format. It's a
> straight-forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied to for-current, thanks!


--WpD3fSrTpRm28vYp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjuO3EACgkQFA3kzBSg
Kba5/g//cu2BkgJ6ltDcPa/7Hg7lO2MmNXbIUo6lzxuG3MJ9zUX8mDXYoxnUxk6x
jN0U9/s554Vi1V+PzRqKPmhTp35R9Iem92/4TI950nWRzkI9/shAq7mAlfIZTk5T
T4Q2zh9lBMZQ7Tbjz/IZNuYLqhw5PgrVGYQ1Rpas4QaYLDjTtZoN1edhB/KACX1Z
dwDKHtU9Bsdu/HsR9/AcDkFonFsvGc7yDpWw8zyc3NMi2I7f4ZLAUG7ETdn89zAw
294E+dXa97uEtxRBmjLV+UPRBYnRnmRtvR2Fi7k45yBytPqwKNg2UtMKMh6HDppc
BFLk+QfZBsvW2wwssCgP6HCpyKz7cD2eleHT2QzTF8D2KNG6HUfvcFELw7alHAQO
dEJvduHyLrOCZIJxE7Q74/J4MWxeLtzkLiHMqYTTfOriqW2T8wRHiTm+1u60diNS
OmmRE0he3cZX6V4fhFYp9HPLiMdHxE3iS0SLKZ241XAEtZBWYmNZglM7V1hn7rgI
JLSThowF8376LIDIa0IWILzKbmaA7CkjjqBfsUwnRf8jxSvG1oJRofaEH8y+azGr
HOg/9JNTS2Gt3y/cXBaX+02XnLMXXsh2ATi2DpOxzeh28XZZCSMOQpb84E/H5Rv1
z1jGfIJgiS9vG+GiXBQm3rFg33cS8sr+xBXzH6QYlwDEebveQj4=
=7Sv/
-----END PGP SIGNATURE-----

--WpD3fSrTpRm28vYp--

