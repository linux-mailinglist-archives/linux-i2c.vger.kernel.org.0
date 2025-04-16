Return-Path: <linux-i2c+bounces-10420-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 154CFA8B9BA
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 15:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 825D51904318
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 13:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E573F17B50F;
	Wed, 16 Apr 2025 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RB6csJSJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908CF6F53E
	for <linux-i2c@vger.kernel.org>; Wed, 16 Apr 2025 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808426; cv=none; b=cJB7Ov9ZiPoWcXZqiLVQcn45IZHU0etWIkXKZgNsaSa3JXSRk+46naahjwvr4FvOvPcpBKHk8kA1OiPZqW5Yn6j01qoSSgm6RM2UofhdU8SVSzcgxYeIMuY9exZVB8cPxzrTTtShM/Fnmwtcs+VjMLK3oILP9Bv5a6k/BTp/3/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808426; c=relaxed/simple;
	bh=Nv89k1kYxqdc70dbe9HBFXPQnqMqZiePva3dt6JWt8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drx8rhzrMKGo290aOW1mZC+U9GhHwv1pV2AypBpQHjkBuSi4jK1ExMPCJB1Rei8en1/xOYk06X/qoTeRF4/lnjLdlYGUb2DZbSkkupX0wx6JC+DXnVRzRs/kBx3NKd70b3e8d0n6GB0FM3UOmVNUV0WSmiqInpPUPeRgEikyagI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RB6csJSJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Nv89
	k1kYxqdc70dbe9HBFXPQnqMqZiePva3dt6JWt8I=; b=RB6csJSJ64ojiQ81SrTO
	7uKZ52c8bVaCNycJIQiNaFNxHBcsJHEk2QtOhkuh6JLqAl2mFjsumno0D1jejVQy
	Ost/SujD/lqJdpBoU0q8L5XkxaUijFnDS1accoUKIwTz/U277/NraPqof1hZmGge
	LzwyabOQ162xk7y3nxjN2o1FA47lzoncjCs11mb0Aol6atNrFVabEnBxGzssZ26w
	xwBGzripe4ZFDIz63gqGijp56MgsxOWPTRHlTNRoBXcOa23MZCz6DsHE/VbM8qLn
	cu41iWUNnI6D74YCbShe6gexmN3OsZjHeu0EVxOdO6ogiQ3VH0Rvt2aRoThjYMFS
	6g==
Received: (qmail 728004 invoked from network); 16 Apr 2025 15:00:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2025 15:00:17 +0200
X-UD-Smtp-Session: l3s3148p1@QoLi3eQyFJQujnsq
Date: Wed, 16 Apr 2025 15:00:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 6/7] i2c: core: Deprecate of_node in struct
 i2c_board_info
Message-ID: <Z_-p4HL2pUvEUvWg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-7-andriy.shevchenko@linux.intel.com>
 <Z_69Jml3-CKi13wB@shikoro>
 <Z_9NEK7BDrvAQ0Qo@smile.fi.intel.com>
 <Z_9UHrgho0dGoUrG@shikoro>
 <Z_9WtfVzSDuxmqLK@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SZn/1InEaoqcNZKV"
Content-Disposition: inline
In-Reply-To: <Z_9WtfVzSDuxmqLK@smile.fi.intel.com>


--SZn/1InEaoqcNZKV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> At least the main objective is to avoid new code using of_node.
> The rest can slowly rotten on itself (esp. if there is any under
> arch/ for some old board files).

Do you know of some examples? I mainly found i2c-powermac and I3C core
with my two approaches (coccinelle and grep+awk). But maybe my search
pattern is weak?


--SZn/1InEaoqcNZKV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf/qdwACgkQFA3kzBSg
Kbbdqg//V7MdLUvRji/BXB6UY4HbFos4o54H+hFZSXyQ8eBo0Nv3tdjm02zsKQ+4
/Ja7mpK/oauk2lbvO8y6Aj5QxwUnUPTR3DWYtGA9boMZPX8Fc+lri0+gjhxG6O31
n3BhBN7oSFf/wDVwduE+HQf5CDzoHbshROurkx7cr1ER/C1J8OdhSRbEuVhRzPfx
SYLTyTCrafloPL1kmVU8vQFmpCqG4R510De7PBZI8rFhCGXMDFPu2SwIZiD5EfQ8
R85a6SL+/zjzWmJvtsRsRMyW8fjif1cQJ4U85Fj076LhGz5U+20JEH1zIT5dUTha
biWfao0iUd5uH3N0E29FZiDwO/Db7yTh088NhCKKnu6gF4bwddwcuU0O1oh8Gt3G
rTh3+uKVL5U4jCa8bDzHF7r80yCpNws2gIIGgKa4oxab669La3nIrg1Tfc6C2dO6
nryQ4mZzkmrx2yHCowyk6R44Pn5REGtq5HFWDTs8ZzKFuxLpb6KfbYX9tQ9csuvg
+MJXBOtSS7t5KReflpg5VfSVFhPrHC1yP73SiZwK6dgwkP/EW7aFDb7aQOPn1Q03
BfroPSFaO3yP7n+SWJQ3ULaB0KnfdEX+cHsHpBlQKYvFACW9e1DvDdiZB8rcZpbp
lTmogeK/CqTmr4jJEezAO7zBX1xeaA07Sa/tD9x/tuS8+92DhWk=
=NPxJ
-----END PGP SIGNATURE-----

--SZn/1InEaoqcNZKV--

