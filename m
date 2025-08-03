Return-Path: <linux-i2c+bounces-12131-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA92B1951F
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 22:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96AF9171BF1
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 20:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763981F09A8;
	Sun,  3 Aug 2025 20:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Eb+o+/gZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E1C1D5CD4
	for <linux-i2c@vger.kernel.org>; Sun,  3 Aug 2025 20:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754252874; cv=none; b=noyZoNtdL+1xNaqVXm0rmo9SoFU3ggu2d9GOGDsWgkyrGhj83YYuOaKRx2sj+3Hg9uuN1pWqoZnRxhJsjrVTmplj1OJtyIRVGb2XwmkSaHXgyMvQX7xja1DramU7+woDiVQncK+KXxDcr+n9/du5KCR5wDZ/w838ZKNWUAMZqwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754252874; c=relaxed/simple;
	bh=Tpg8/g2qAUq5BUKWMCY4sRzY/GmFrvy6fa3jCQfM7uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8hctELDpDyWbFM4Ryo0k1KLLEiHrW8CKdQ77jwI0CYNUiOA+LPgaH6npnrGtVeo7+5tx8WSQdUx0hZnOPBoInRtk6XvkfNvD8DNU/dk9jKsI4YU4pZ6IIl7fW5DmNThgFnN1gkJSjdTAtUGpEv+Pmpu5rfWKjInsK+XmO/R9bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Eb+o+/gZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=r8M0
	rVDMR6W4j4B0COtHvc00SIkpjk0RDGauVpC1RAA=; b=Eb+o+/gZa6qR54kkI347
	o9Z26/SkOspMzTKetwPQc6eaOPvhBfLdqzY5dNUgrlM8s5g+FDhGv891e2rN/lK1
	WAY/dRbj8/UnlLh0sISNsjdwpix5BaULcA7tUIwiTHtIxpprGyfuLycl376ZdQdb
	ebEgYnorYohPTtOdVCHzzZYcTFddQggJwXY/h9hFubQ9EDSfNW4rAL33OJCDLve4
	Z3evd5Q57HxBcKk77/osTuXbEmyXWz3innCREbsqLGUMbPoN0aBh8b+Xjsa+u9r6
	fwmVY0S1a/j0l4eFRKlMRWV2jpOestP4pfa5Ez6z+LPE5XUrUlFFh5C7ubQxn0tA
	tQ==
Received: (qmail 1641297 invoked from network); 3 Aug 2025 22:27:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Aug 2025 22:27:40 +0200
X-UD-Smtp-Session: l3s3148p1@ZBqa0ns77rIujntd
Date: Sun, 3 Aug 2025 22:27:40 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.17, part 2
Message-ID: <aI_GPCUHG4mZU6XO@shikoro>
References: <et2mpmxohgqclvaa47qbx3bdowp4usovgz4fptlm6zfxogzuwb@t3touqocg2w7>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gGXovw60teHyT4qo"
Content-Disposition: inline
In-Reply-To: <et2mpmxohgqclvaa47qbx3bdowp4usovgz4fptlm6zfxogzuwb@t3touqocg2w7>


--gGXovw60teHyT4qo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> I wish you a good weekend and a happy National Day to all the
> Swiss I2C developers (and non :-) ).

Heh, same to you!

Pulled.

Happy hacking,

   Wolfram

--gGXovw60teHyT4qo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiPxjgACgkQFA3kzBSg
KbZDERAAqRGmWlQl6g/l7K5I8duMxNOcN+nIcw+xn9Gh2acuqppOf1iSxuVIC5Sp
V389SdtwzOQiGlYyOnxnv4txQ6kxjeZlc1dh0/LFyHG5XXVIWMoFQX6rQufDhAwj
5GDlv8/ujQqp3PNQ+E4YSAB74MlcCYA6H43//9hYPdgTB1P5RDGP9CPAHwExOzMp
CeUny4B/55K/UKoDTGkEPqdRNsxHxO/JRoQVGN9HjiffPFu++C4MZ7TuGgUI4beJ
uT28fk7+VX3/fexwrt4cDFJLt3KqUjdxFziXQdXFpnwESXILprBChbEaFXCQ8uV+
uFADe9XNt0XAuuWdqGM+V3zhtS7tqGjQqaCWHprKdBXE2qikN49IsLjZBQBxiYv5
FMap9Tq7h5QiMBX0HrbXxlrYk1wbbdveSzdHm5H1fGpqW/z7PwNQrrpSgl5pwf2R
ClBCMEbe72KfzJM7eKunYNf7sPvXlELcbA7bnyYz33A9bFgKOMBFi0hjquAIb4Iq
4sqtI4bd2eXqLHZP/OenutyE5HfcxZFE2PIUgqalcSmzA9mFbhbhDz8tpnfP1OVA
+sA0JsIHWxTIsd8qP3zcbc8WMelg7YWYm1OEmiziUqksd57V+ICvlnISlrsmhhkM
a4vWf7I8au3y1sVah5TVzxV5jNBuCQGmEgXQmEE2U0SZCQVrvI4=
=184P
-----END PGP SIGNATURE-----

--gGXovw60teHyT4qo--

