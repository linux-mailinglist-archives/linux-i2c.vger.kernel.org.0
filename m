Return-Path: <linux-i2c+bounces-11064-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 531EEABD313
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 11:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BF4B8A737F
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 09:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD32C267B90;
	Tue, 20 May 2025 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hEp/g49x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194012116FE
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732536; cv=none; b=POVgInjEHY018xLmEN1pJ3RVNemPjL34XwKAdjRE9n257ZHOrM12vprVANjzQ1GC2PMOOxJxSVDAgie/bhs/SqOUvZAU32smPm9bMOU0cNhjzH7gcqltiJMroEFmjRXDFY5I98kVF5yGtHxQ6h1FHDWfJjd8d/BvHfjZ8Q24yZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732536; c=relaxed/simple;
	bh=V4sCxXvxpvRawCtXxPYoQQN+JYu9kxt0EaHHdA8X3vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3OPAez58F+VCzilRt/5RtcNd2TeV19wE8Y57q6rnl+dOaYpF4knTHjhJa2biBOacJqbpJcqXnuwlq5+picUekjSj0LD6pLbyTQA1xrmrnWD0xRuJV/O5ibznAgUvzYoVtryI/Y19yGZr6ti+EEO/GQkW+vzBuwvdU6mnXIdB0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hEp/g49x; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=V4sC
	xXvxpvRawCtXxPYoQQN+JYu9kxt0EaHHdA8X3vQ=; b=hEp/g49xaDhjnfiVwEk9
	CwdRwTQPoBJ54ZoGuXbTEe5qo3K3e3yrJg3q+vaE2/+PcyFHfrn8igsKLWoEsnka
	2pCB99ysH4giA/enQV3E+Maq53VjraM7R6ISniazrQL0NYe5mpUt/d2aHY9+Tj/J
	lcV35nEmyg5IEB5+OzlY7JMcrrKt8IZYRLLtzFVqc2ejnNbRG/UPdzxyom+LgRrX
	vGbH0fS6RAMRlBF//0yD+Z14G1wtWd7zN7aQBMtbDNJycSlFGEIDHgXXoF8Mpp0c
	YFqu0C55YKoFmKN4cw9ZTNR6hZmzbozvi1+y37AVLEfL4sqUdgdPmqpnals/u7WH
	Cg==
Received: (qmail 2812780 invoked from network); 20 May 2025 11:15:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2025 11:15:21 +0200
X-UD-Smtp-Session: l3s3148p1@iP8asI01VnltK7KB
Date: Tue, 20 May 2025 11:15:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] i2c: powermac: convert of_node usage to fwnode
Message-ID: <aCxIKd1QjIpaviBT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
 <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
 <enlo2gjoh5qua4phd3lnmmfr65zgx47vto35abwuwtpdy7ocp5@yd6mrc2yepws>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uTfnXA1eP0jlrO8H"
Content-Disposition: inline
In-Reply-To: <enlo2gjoh5qua4phd3lnmmfr65zgx47vto35abwuwtpdy7ocp5@yd6mrc2yepws>


--uTfnXA1eP0jlrO8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I took this patch in i2c/i2c-host. Please let me know if you want
> me to take also the others.

To avoid the dependency with your PR, is it okay if you drop it and I
take this patch via my tree?


--uTfnXA1eP0jlrO8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgsSCUACgkQFA3kzBSg
KbZAOw/6A3hDs9YQUYhu+1GXDjNFXv8Hb5AsfmmVZi5znohVcaBQNbiP+W1ONsmc
JYoazgpmysUb6ki2iVEGBzv56wUT8FVbzl60IzBaRIDohYXbBL5hIohM1snOmmVU
tUmQnU5hHEOAQxSKi1manKgLUpLxONNCIbNwAGg6jWmlCyRIMGUDpLuo3x7hpnMa
td1l6YsnbohsET5+tETJEFnzG6z1utXQFyAXM4WhZLvNV1ovwAoKuY63UOpm9TAN
80kR2W5DifS0wphUbZisTE/ZMTaIehrZGf/W8cMpYfztWYWg/u2EAxlfafShr0Lx
3PUEZCCYduS/1CMv/W7SmnO6wl+vxegGcQErsnr794XpX/2/9cq8C/G4/lst3ZNS
/zhLKUFR4Is+Y0S98XMB/t9pTW1YkX413BG13XcSD9OcOl2sZB52PaPc0y6fNM/o
+yNsFDGOH863nfL8lEPZ2d1lSR6QtSMucLuh+WcCPCPok1Ow5BoamnrA5owZTpHy
JFEtiSHmbpBIXL7eIJHFglYKRlRy2v3sOrdAmN5yvyNRrDG1TDsdGtck0tXvR0UX
DudPJc9ZqJcCWlRP0pU5JbFQpTSEIAsAAdra+kUu6gspkgDoqHXFgw2tZD3cZktV
qkKgr8J1m0A2ehocqy/WdLSgqwP3mawZdB4JHx22o6piVgwAJiQ=
=k0Qi
-----END PGP SIGNATURE-----

--uTfnXA1eP0jlrO8H--

