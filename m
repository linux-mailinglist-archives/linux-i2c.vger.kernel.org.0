Return-Path: <linux-i2c+bounces-9085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A459A107AC
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 14:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71B67161C45
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 13:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730FF2361EC;
	Tue, 14 Jan 2025 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k/pPFDnu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89948236A62
	for <linux-i2c@vger.kernel.org>; Tue, 14 Jan 2025 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736861108; cv=none; b=iv61rK1GeC3P92wPtVpHB4vuvZERSrH31J8zj/jV65UECb5MeAGc0t1FPgEg0a5zxxMPfTvP7KCwt/coSM2CuyBGzLUs6yUkHQEPik8z3e9iCf3OJXDqkciy8ZlbhpPFJ12dcJUcFo1I0BqHrmXCiE6M9Nr3inerGrGxfSnNizc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736861108; c=relaxed/simple;
	bh=t2uzuk0kLJnu3HNNauy2mKOeUnTjrLQyAZL5mXOIak4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rpa3oAY6ewS6YNeK9zyAk0e82K0meMSdJ8SFezaAoE2JF+UiPf52OEd4ir1PXo4ernIQ7KZwdPijOExA7WKcNtY+xKwNRiC93rE+cg9Ai5e4pQ2g4shTGdmk7IWOFRj4FWzy8v0RO3yXQagDc4zwf13QfVAww4rZ7zI0T5JDlE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k/pPFDnu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=t2uz
	uk0kLJnu3HNNauy2mKOeUnTjrLQyAZL5mXOIak4=; b=k/pPFDnuDt0ybQF5I1ZC
	CZt4vcDBOxdDMMT0kZi3fIM07sbJeiMl1+HnXagY/ma8oll9D1GmYh9NxjkryQqc
	ZS8DIvVabzMtzjQOSWHPZHEa/n5V4X5scmTCdJvih5Ny38DHF8PCMOpsdl8ga8gC
	jL91pnB5Qz5niBcHx0pIm1+mq8WKVVubmuHKkRk7ICrWClBRytBBxBaT1fVjAmGy
	e0+5d59XpI/1Z/4lys8RsjTceYIkNexT6irIRU5ZJ8uEhpc2jrENRnnqUz820ELL
	nzBOOZbH6uRS1aBUrIlNaLVldewwEzURq9dxZWtQPFI8aCfI3ecpatCU+cPvna1d
	kA==
Received: (qmail 220075 invoked from network); 14 Jan 2025 14:25:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2025 14:25:00 +0100
X-UD-Smtp-Session: l3s3148p1@e7vnfKorL2RtKPCo
Date: Tue, 14 Jan 2025 14:25:00 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Actually make use of the
 I2C_DW_COMMON and I2C_DW symbol namespaces
Message-ID: <Z4ZlrGp21sSIBV2A@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
References: <20241230155948.3211743-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FtTnzDEycz4onxC9"
Content-Disposition: inline
In-Reply-To: <20241230155948.3211743-2-u.kleine-koenig@baylibre.com>


--FtTnzDEycz4onxC9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2024 at 04:59:49PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> is included. So move the define above the include block.
>=20
> Fixes: fd57a3325a77 ("i2c: designware: Move exports to I2C_DW namespaces")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Applied to for-next, thanks!


--FtTnzDEycz4onxC9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeGZagACgkQFA3kzBSg
KbbS7w/9HuIdbMn0T00nBPhDefvFVrvp5nl4tGR2aJspRhhAe43iG3ToJeEJ3KbM
k7mqOxhw9XW9cRbHXwYAXtdamcGOsE7aoE1XIvWZZn5NAuCZTqqtFJlohcTyo8Zi
QbqFzZ58thM6XrcmhEO/nUU0rEAGhlh3TEHPY1zpW+oHFNeFj8NPW4J+9qJSCfOn
AG17f1HEirytMLS2Y+zeGDEoNZAWLi38bzPlB0gpWrRWQEFevUZ0Z8tXYuHyCehE
P0rewBqRM6XMWegegtGivVSPsvV0JEJNSMDvv77fFhq9qqI1R89W0DR09RUa+lsS
XTswYldHW9PTkpKvyJphwqYeuH9s2uqMQhztIvvloj51oU9s4hqYI6TDLQmwVFoB
xoPvPso/VUAhdWP9HVLmhbwePVyNloeREcnXNkypVJv7zYcHxDNN+pmOpPeoTP0e
sQEgerPPWyZMTHqNm29o9yGevm47yVf/88Tt7xBi/Th3eO1YCot9N4iJTMYCyYlI
wbqneRwaA0ZQcy7z5DUKMc0/FfHCnUA3YFMMQTSZohyKeY/+OTS5l5vkOxVCrZQb
LgN8EzFZFtisuGGix2x5ISZZsFck0gncgw5tmds7reG4tct18XeiLW8YtSvN43KQ
kJuBUjgo2QcB3k+P6iH4gqWBPmjKt3ClUOrDKz77EvTTbUQMF/M=
=FWC/
-----END PGP SIGNATURE-----

--FtTnzDEycz4onxC9--

