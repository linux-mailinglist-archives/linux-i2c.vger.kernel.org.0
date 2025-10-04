Return-Path: <linux-i2c+bounces-13389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B9CBB8FCC
	for <lists+linux-i2c@lfdr.de>; Sat, 04 Oct 2025 18:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EEE33AB4E7
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Oct 2025 16:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A45277007;
	Sat,  4 Oct 2025 16:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c3APQXzw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE1826CE28
	for <linux-i2c@vger.kernel.org>; Sat,  4 Oct 2025 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759595439; cv=none; b=JQGTCU8W4E6y+h+/Hc/Ao9whhjpG5WfNWCuCYdOejLwDz7FiwKjhJfTXyaqkfveIuT7Tn9LfG2SyLsxuzOq6qlpCnBNy6T/cZAwv1bwfobI1MEKbCYL5RYq4r1i2sY/trYKRxsSSbM3owzfmWNCWgQk3OEmJ70sXPGIxi/oxDA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759595439; c=relaxed/simple;
	bh=+H1mbWGz5J6k8yaeXH+PkkNq6/kaZnFVaJOkdI/cFB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UR+ojSS8Z6aWBSxxOjyS1jzrbfKsCUeFO8WZf7t0i+6tS1CZA8X24dFR54hfD2FdmPuEdojXnNfwAple/wWd+T3T25NqndE54PDJMQbzjjK9Ss6QlJ55kzwpLLSu7TktYJj1fSo5syy4IlWDdN6Kzjeertgra/ndyOII/lYmeD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c3APQXzw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+H1m
	bWGz5J6k8yaeXH+PkkNq6/kaZnFVaJOkdI/cFB4=; b=c3APQXzw20sxP5cuRth1
	uTG8IdJsQg/jDyVo9hA8fmFfXuY4Ks8w8eYf/60bnN0aLJ/8+iwVdLhd69tNYEhk
	1vKYaJp5YpljL6XxMybFNNhrZubcEWSADTFZzVVJ0+nRMpKT8BnPoWUG05cdcAlJ
	sszq1/hWNsq9Y0RAMpIxnp93bk9bLLzuaTZ9lTERQvNIXNmUHQ+LSmvRBEAeRSFw
	/rdL13ToV+PQZTPL+e12rmV8SteMyBTITzu5ub0Yac2DmhTnF7dSov5+gPD22ERY
	YDvZs4VsU8srToWBB3tV8rSPEQmWOT+Q4ukdmi9zn3xusHyRY9ltcbSQT9wSGTAI
	gw==
Received: (qmail 1083198 invoked from network); 4 Oct 2025 18:30:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2025 18:30:23 +0200
X-UD-Smtp-Session: l3s3148p1@kNQjvFdA4NKSRnW9
Date: Sat, 4 Oct 2025 18:30:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.18, part 2
Message-ID: <aOFLnsD-_M0aQ8GV@shikoro>
References: <gtymsa6dx67vlus2ostbsxxsixrubzwkqgr5ljqwjlufthlcqi@api2ouzwmmta>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BSQI9M4BVqBPXWLF"
Content-Disposition: inline
In-Reply-To: <gtymsa6dx67vlus2ostbsxxsixrubzwkqgr5ljqwjlufthlcqi@api2ouzwmmta>


--BSQI9M4BVqBPXWLF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I wish you a great weekend,

Thank you, same to you. Pulled!


--BSQI9M4BVqBPXWLF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjhS5sACgkQFA3kzBSg
KbahKg/9HPkS9tHa0/eu6cinOGV7Hd1DJoabvZKNmfEqv5WKE5s+oSl4CtudR8Xm
hWHs/mP5QJMKUzi0uPy5ukTMGOEG6vzuELyf8ho/3pLYS6ivu8dp1OMOQ5SJP4q+
ldNT9Uy3rihp2cf500Ck84ZVIgyjJP7zd++SH/nUha0cVGQhBl6tukWG9bBzai29
X1LFAE6HXiv9Vww7KXCt+H8De5CRt/83bR8rO15t9DGeUBu40rF2Hd/oMGwwOf8k
QofzOmznkhdibX9fRPHvJ3hxyacdIIzT/tSVLD5iLvEagKT/GTKUcTvGG1BDa1bs
IaORaiiWLJiBZlRB1OGQZiSHcKEwcLXpCNQycikbAooVZBNF7/KoxUjby0xZXVaX
22/8V7jpqGyqmhXVTbqyFajqrSilXaVXBMbapWfibKkwY9IArtJMbwb9XWL4yLph
Kifllwn6h60ds+Hk1f4HJJzM+MDhYUO+sLugzak2AHIXYxhNeEV3WAPUsoxMwQkL
sIPZeSi+7cNsrzAVnGPyOmarfDfjx39SKS/k2E6TQw4Pdxjhc/KiD9vd0yROpjye
5mb82ydvqdAwCJBElqbDGh5/TonPJAMTmRGQPv5dx19gIH5/cABVGZ/6q67qW37a
WRvYLtarV44JMtpZZ7JTHfGGCWw08EWf6uulD3LcQOj8T25Gs+0=
=ZM1H
-----END PGP SIGNATURE-----

--BSQI9M4BVqBPXWLF--

