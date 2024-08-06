Return-Path: <linux-i2c+bounces-5159-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C23948DAC
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 13:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F2A2281557
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 11:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E539F1C37B6;
	Tue,  6 Aug 2024 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RWDU7sN4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1E11C2338
	for <linux-i2c@vger.kernel.org>; Tue,  6 Aug 2024 11:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722943756; cv=none; b=fpFv0NJrgkI+cFb4P0dggRREI62dMgbMeJP0++y3ekPSQwe2M+e/N3eTuSxl4LvgQ8MJMx09rwqh72l0RvBB1r1OhsR4OsLxcsS7jggBnxsu/BO6+/1hXYrH5BMFHalvVyw9l3MFxGTxny6B48Px1iEwDqlh2AnLKERlCBKU5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722943756; c=relaxed/simple;
	bh=+/ZWZXH2yQUZrTR8JEQGLsRmCD9Q31Wt/ns5nVoxb2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIr15yU1qogBp9HZMJIlgJigxu1L/CL/tEWyLyrkaQenIxd8qq2vNBcqemK3xxQLXB68Ja0Jrh0VNEgty6+6f50FijqGX2lRNbEQxkRgd+EWvW4jv0iy9DWN9sErUDBrYEs6CaCf/m+lILpPYjlPtAu1EnxE9RRhhzFfJYHX57c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RWDU7sN4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1ZOs
	q/Pl8RzKVG/8nm/0BvmqijnPSk9ZPcfOVNt8n2w=; b=RWDU7sN4I24e04JTWLJj
	RJ3zSBPpy4gw03QcVwWoN1f4qFm3Nv+kfloTdjOvqEa1MpqBYr1C0HXCKUdTRnqJ
	sOAuviU/2Ckwj5bgZnHukTHIJe1xMEjdwP7y5Wj5ObAKs1yt7bAAtGTEM+jfAh5u
	WTvADGA6Ck7e9bbjYvl0olu2cCEct7U2/fKmxEQxg8Y1p99mI5zBDkCb5NuZq7ns
	QarA18WOfUHXpsQrgO8IPqKkLsAnkD+2ZZmEV+nl14UXc4Wazmu5XZWYpc/uCp3f
	PrO7YHUBd22rsHXCh0+Xtlfm69E90xzZOGFLICDm0cE+qd8AIKfP/mQ5KdBEpIu4
	7w==
Received: (qmail 200134 invoked from network); 6 Aug 2024 13:29:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Aug 2024 13:29:10 +0200
X-UD-Smtp-Session: l3s3148p1@Z/4vGgIf4ukgAwDPXxLGAIH3oZkcU6AS
Date: Tue, 6 Aug 2024 13:29:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>, tiwai@suse.com,
	mika.westerberg@linux.intel.com, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 0/3] ALSA: Add support for new HP G12 laptops
Message-ID: <ZrIJBUJfgiKPCKXv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Takashi Iwai <tiwai@suse.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>, tiwai@suse.com,
	mika.westerberg@linux.intel.com, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20240802152215.20831-1-rf@opensource.cirrus.com>
 <8734njl7my.wl-tiwai@suse.de>
 <554660e1-01ea-4bb4-877f-fd8deb527ce7@opensource.cirrus.com>
 <87frrhaofs.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ITk5q42x0p3gyRsR"
Content-Disposition: inline
In-Reply-To: <87frrhaofs.wl-tiwai@suse.de>


--ITk5q42x0p3gyRsR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, has the patch been merged for your branch for 6.11?  If yes,
> can I pull your change, so that I can apply the patch 3 together with
> the SPI change?

Yes, you can pull i2c/for-current. Maybe I can also retrofit an
immutable branch for you. I'd think, though, that it is easiest to wait
for 6.11-rc3 which will include the I2C part of this series. Or?


--ITk5q42x0p3gyRsR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmayCQIACgkQFA3kzBSg
KbZycg//UXNlrhlWa+27C3gwszNUUbKhfDUc3J7raXMSlBy083U+dDzO5jlPptLB
CYOfUMMJ4fE1BSSadWOBpMAIAOnhdg9exS4wT84rE+/Sp5As7ViL8RltfRtB65rB
i0A0yYNp2fUml8EMiXkgczKCIsNdE64P2LAsze3/22n04DOqwgZ0zkDSU4jtZ/4E
RLRCG00Ck7RkoE6i+9CKUa5OTXwwfRe9if64T0i2v3HSbA6J1vavCBwWIqQMD8F4
zKbD2kaSZfcZ3GEOtEjP/6umeu56r94Rx9t/KNpKHvvOrrwgt4vK4Z2UpaJTawkn
VzLJTLmVlWAkkOupBkLwckJTqIwrU2z+4MpFYMD9dX1oB7+O1URDh/XSvOs2m4KY
GiAJZBAXuVIZHe2BqHVC6HWven6vffvaW2XH26tyXYQM6I2qK5or4NwGC3M9wIu2
/i1DBCtoYicMzlu1tlu6iuFEItP6NpCEEXzH+3VnHC1rMYKkfngRAF3mtm8zzSiY
zSjLrw9cR0mVssFOnI0qVip0gsSWq/PHAzUPvVSl63SgbF7SqdJTLPmcAPEukOjM
+k5tdUsRXRGSLwROiD7Tmg6Xa9k1/l6kgscDHpBnl8w01WuzhLSQQGUD7fQ4w6gj
2/fiIr4CjByKMq8J/le+UfPK26pLXs9u0rPEzH/AlxZyF0SIZUY=
=p5J4
-----END PGP SIGNATURE-----

--ITk5q42x0p3gyRsR--

