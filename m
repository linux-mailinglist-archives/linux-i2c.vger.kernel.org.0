Return-Path: <linux-i2c+bounces-5281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1365E94DED2
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 23:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92791B217BB
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 21:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB97B13E898;
	Sat, 10 Aug 2024 21:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I0Va90kk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA33813DBA0
	for <linux-i2c@vger.kernel.org>; Sat, 10 Aug 2024 21:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723326035; cv=none; b=Udp1LFsaJy9aHjtVzwAvKpYluu0F1a2Rsbj3mM0Dabicqnh8DC2bSDalP5I1ttVxKNGMLqr8Z8w6gnGClypzdDBw2OeNJZWtv5YWjv16QldzoDW/jYqvXPI44ff64CuuMyzTZtUUHkq8oqdZfh/9NnlgYmccrrP3fr1Vhyd+f+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723326035; c=relaxed/simple;
	bh=BHYon5OSR7BfFHLVS0srICP3LRfyR6/XZkGst9VbFVo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxP1uqQz34JqwbI/drKSgDgMUV5vVkw/ugCP8mINqYGk8ADr+sZL+GJycE6z5yc0c7ny4dd7QMjlocVr9tMFw/0kNxEfhS+tPutvBWPWx71wzBlL0mLvXr3o/NtRDKwc8HTgJh7X8dYb8+gKByqtwt2TvE4iGi7/jGDZd6bWDqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I0Va90kk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BHYo
	n5OSR7BfFHLVS0srICP3LRfyR6/XZkGst9VbFVo=; b=I0Va90kkCnTphksbIxuk
	AGpqg3a0Gsxd4SD5mnF0/CTBc8QWNS8SkViLWWoIfONAK1NxWEey6NMpdap8ihGD
	TS8IEqeweuqzcWjRYIADKbr8XMaxjAyCRFjHezZX6IGhO2n5z1ndZZ08IZ2MFIjQ
	bv96/lZxAtugeTuMCjkkI0qEdLWpUnd17fpFzduys8xF4qTp6q2T0xaP2vsFgWbx
	wb6y0DbGCn+3mOH4e3dF2j4fOA/FuOS0xZEYdI9jRVEEKsMVv+/M8Mi6qpp6WkmX
	PALfrtdzjb7MtyZ5vNv3y9RkXW0wBK/ZzljzdjOqpOKowqofplRZLDy5rsFQEpkf
	EA==
Received: (qmail 941936 invoked from network); 10 Aug 2024 23:40:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Aug 2024 23:40:30 +0200
X-UD-Smtp-Session: l3s3148p1@3greG1sfZqsujnvj
Date: Sat, 10 Aug 2024 23:40:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH i2c-tools v2] README: ask for DCO in contributions
Message-ID: <ZrfeTT3tsDLGkLH4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
References: <20240807112835.14346-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qUVt9tPuQieUpM1M"
Content-Disposition: inline
In-Reply-To: <20240807112835.14346-1-wsa+renesas@sang-engineering.com>


--qUVt9tPuQieUpM1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2024 at 01:24:33PM +0200, Wolfram Sang wrote:
> Add some documentation we can point contributors to wrt. DCO.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to master.


--qUVt9tPuQieUpM1M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma33k0ACgkQFA3kzBSg
KbYzQw/9GnnMuFH/lluAjOZs9ujkIg6KzMZCKymdBxEA3RyMSxQgVmZQuYhihUwA
btdyH2YwZz+sdhe4H+nY69fTuvuK3e6DAGgwm+D/J8kgrRWGHVhcMYCc9kAC5oGK
BoRlXKTkPjrWXcEBaDohr0VTXSZQLiEN3hY0szMH1yunDQ3zmKAF8I7SzObzGDKc
qOW+exj2iRpFX3waPW2ovQPuXJxph1e2tWVT1ua87Hnk6lAbumNFGSM2cX6zjd0q
gVz2igOUSe6gMF739dgg1iMFDPHEoAoPxFVdSOMKqMEodFSCkwrWJRpAJyaIwC3l
6BfPE5Z2wT35J0WO6Z633FspfkOoZMkFoWxRyFbcinGxry2Ljrj1IqhbdOVtCNrT
/WWyIZufHw28wQ4TuglTrLiQSk/d6UxGcoGao9rkC2+gxY1vhj3lp7FoWpI8cbme
vdQAOEz/4ImKFfL6ypnrYSF4WtNZVMwFMf2TdpaBV7QObwxeN6NUrdc3zF/pBamc
AhWWu0U/f7Q20r+EH/JqKiaPr5sCQNBUqSMEz70Nw1Q7n4UD0QXo/NADSUgEYwgH
x5jXt3GPOBgQYA8hnBbU9Pini7U0xyKmg7oT1TO8kFPBljcE2ZVQaKZS9VZg32oj
F2ykC1xum8O3+H4v+CpChfp9kjbZ5MC0/5vpC+A0t36bMfzrT0M=
=TJZ8
-----END PGP SIGNATURE-----

--qUVt9tPuQieUpM1M--

