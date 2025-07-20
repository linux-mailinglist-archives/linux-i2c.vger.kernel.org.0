Return-Path: <linux-i2c+bounces-11978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 754E8B0B799
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jul 2025 20:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF383BB778
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jul 2025 18:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4555E21D3EC;
	Sun, 20 Jul 2025 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GplWQXR2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFB516419
	for <linux-i2c@vger.kernel.org>; Sun, 20 Jul 2025 18:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753035604; cv=none; b=WrS0tgu86IJnCToMtKsmJPa6Zis4HxM78EBT48EsJAukBVO/U5ObZNuS2RMVzlGhtSuDvcpxU2zUsEk/4SqXRmevHsHQxq6jrIHbp68wTpkPZQ3xa8WmSEFEz3tO0cmvLP4nHW/kArw4bXw1vRmuS1Q+38UL2IY+Z5yws8YJoa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753035604; c=relaxed/simple;
	bh=yjGTJxq+gQ00cd7jkVrOljdwuphwD27W3KkaboY2G5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axk1zV1GqeVcm43ZjHRdO7uUCMlBxVy+ZYelb1UKSGUB4WiqjCaPZq2bk+JnULL7+BcOZce/XDz4aHuvEbMlG9vdpS+w2q36mA3DiuxkEs6eeYY0kmsW2Ylt1/wRn6wib9q2xQC8VfLuHGOStw2CIkju6d7RTYL5wWr0cNajL2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GplWQXR2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1yCp
	2oCgThbpfPI/eN++G8tzrbPhCesb5/tj6oULTZg=; b=GplWQXR2Dt6q5zKzJBqx
	DZqYtV6eK+8CIEMGF8HuvdAszAhfdl725AWleUSNdUhZhNl/Pf8VVvrCppsFY1D2
	a2tOw4PhEM48BLzNE3DKu5C8ly+N7kdHyV+EgmUwukfwG5Q9sc6d5onh48/Y6z8g
	+FY+CQGXXYYWW7ftPBMoYz37qA4U9jvpmRmEztPgDJteiIz1gQ+Pr+xKfC4oOPEN
	DiXMtPVnoMMIi2CWf4awR6X8Rp+nmZmNiGo1KfQ48uYcfSs07blagtd0XEayHB0U
	2vh3VMeC+dc1bqRfvPA8QsM9tAdLmTSDIsSWuBi6NL4gF/9D8FKyolVjjE0Bh72N
	+g==
Received: (qmail 611277 invoked from network); 20 Jul 2025 20:19:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jul 2025 20:19:50 +0200
X-UD-Smtp-Session: l3s3148p1@wjupZ2A6Iu0ujnti
Date: Sun, 20 Jul 2025 20:19:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.16-rc7
Message-ID: <aH0zRiDe75dAPHkk@shikoro>
References: <2lbfr4r4icozrhnh5vgitzc6dylnxvh7x6fkdytacsy3oncsfe@7usj2u6nbk45>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FWCJlpabTez3TVVl"
Content-Disposition: inline
In-Reply-To: <2lbfr4r4icozrhnh5vgitzc6dylnxvh7x6fkdytacsy3oncsfe@7usj2u6nbk45>


--FWCJlpabTez3TVVl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> in this pull request you have included also the previous week's
> patches. Everything is rebased on top of rc6.

Sorry, not pulled. Maybe they slipped through the cracks, but I wrote
two mails *not* to send me a rebased branch but an incrementally updated
one [1] [2]. Rebasing public trees pulled in by someone else lead to a
number of problems e.g. original mail of thread [2].

So, I just sent last weeks PR to Linus. If that is in rc7, then you can
rebase the missing patches from here to rc7. Because that one I haven't
pulled yet.

Makes sense?

Happy hacking,

   Wolfram

[1] https://lore.kernel.org/r/aHSsSwLcSzJr5knE@shikoro
[2] https://lore.kernel.org/r/aHYK9RWJ7GqTzvY2@shikoro

--FWCJlpabTez3TVVl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmh9M0YACgkQFA3kzBSg
Kbbg1RAArQ6i2RDrRBwarc3ChnSDmegBDy+R6LzyIiMTta/dqPT3Jq4v/HGKkXaQ
DuYXRzuIv9rJNkiu8f+cR6y1dF749dVTs6Lp3uXv+iNFnH8XTSu6AkTNF+oG6LLn
iaxRMzQlVcgugz+55S05W8FSsId1hPKWpcqgPhw9BWhDw4n4Nsw+pgag3sZE4esw
+HyL9kclmIs8+0R7o+kayhnQB4YPKdXzLbKdrKjd51Cer6tLxBucspoL5MpU/Nv6
hp2gXwzFEzc/bvO+PtRnGkoQ8yTHkdwD8HLTwnCuY4u+jQeAMSizyucmCmuQ73MF
WTG4Ldwkmtd3PStUxOODvFxojQ5xKsRiTRSIprRtn5kEz8U/hhZQhEIAgU8pOwYl
vi6nlXPtIMssLoH0+nVP/vCCZZMFqf7sG5W9+8F4gVEaZ+I4xdWRRuCcHqrEaD5r
LkyVg7Yj36kNMH1NeACmFO7VenHkEX31QAeW/dgqUrd0chkjtZ4VPbO2FFExcKLS
j3/kDbJ+njsfesZTyQQlwilhee2NPQ0qlzNymQuIE3xp3e+dCHbMu5wenZQXupFn
WXEZQPpYhTIcfGLF9ZovCbdzctRGTE5RS04kcN+a5rxYgCZdiTmM8VW/FUEKy5Hg
s7YeXugsKU/eU1zqHV2mPYQruXXGbxpKhCw9YcpwxaIitzvVAoc=
=u35t
-----END PGP SIGNATURE-----

--FWCJlpabTez3TVVl--

