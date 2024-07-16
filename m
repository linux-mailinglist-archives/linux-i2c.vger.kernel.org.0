Return-Path: <linux-i2c+bounces-4993-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC493224E
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 10:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48E461C212E1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 08:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C6B1953A3;
	Tue, 16 Jul 2024 08:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S7MmFZsh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538DA41A8E
	for <linux-i2c@vger.kernel.org>; Tue, 16 Jul 2024 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721120251; cv=none; b=bfi1J/U9ioKZpxbhMNy2o0PRVxZ+YTX7E0YdRIAeWsKner3KeM4Xic4+wWE0YPvCPZaxpR5EGnnxrOPuq6Aoyp931w4VK3wI72jYiVw8wUVfA7I3lsTL8i78U6NEmFCuB9N4PW7l56NhgiNB5oc5k4+2yq7m4ofM5dcJhe9a2mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721120251; c=relaxed/simple;
	bh=yeJCUcF4euIW1ANM85VgvSIXdjg60vfaVARSO2/QOow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWdmDpFDj+XhxpqqZX4SiUyDLyCjvFKw1WBuqelJQP7ONRtrcbZ0EAHLv5aFtOZdYq++CyChz7UK5Vs6yZw2H2DnhWJhfeCQ7NBcPuIvFGctkL1YdwkToekc1DSkqipvFpt8KtNVbAigyrXXFbJJZItKTAnGOxtL++Dk3xmfgpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S7MmFZsh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yeJC
	UcF4euIW1ANM85VgvSIXdjg60vfaVARSO2/QOow=; b=S7MmFZshw1xcYQbpvVeD
	rWJiGdBeLErqBcO1pSH8HwU222xhoRALffwpA5aDdQNTzPybV4hESY8PqfEWQVir
	IjGbBnbov6lDVCPholLIUDn8OIRJLur4MAJaVUL9lcT2ZT7m/piANPiRzbKMnLqO
	8Np4NTVmWaYqvPArauuRPqpXrijz6BTLbuLHkHrNKVWGN/hD7hJm7IaY68wrFI1O
	LFDr82R/4s4ZLAJH2gV7KuhPuRI/otH+CdRX32aJeny2fssbaxLTn2Mo1DuysPnk
	IAVteRQwAfGAsS9mKSkyKlW/3DdmwENett6Lmp7aR693n5KvHPqA91rtsBy65Lgd
	eA==
Received: (qmail 160595 invoked from network); 16 Jul 2024 10:57:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jul 2024 10:57:27 +0200
X-UD-Smtp-Session: l3s3148p1@WeLtiFkduWdtKPND
Date: Tue, 16 Jul 2024 10:57:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 32/60] i2c: mv64xxx: reword according to newest
 specification
Message-ID: <ZpY19uka_qPzkw5f@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-33-wsa+renesas@sang-engineering.com>
 <7szxutsq35uaydvbo6bzrpsvnx765de7ps3kpvzs3b4ubczq6x@weaxji5u2p7c>
 <87jzhllok1.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uW0cYyBNaCQUjtwu"
Content-Disposition: inline
In-Reply-To: <87jzhllok1.fsf@BLaptop.bootlin.com>


--uW0cYyBNaCQUjtwu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I think you can find the information in any Marvell datasheet that is
> referenced in Documentation/arch/arm/marvell.rst.

Wow, this is a great collection of links. Thank you for letting us know!
Very helpful.


--uW0cYyBNaCQUjtwu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaWNfYACgkQFA3kzBSg
KbYjBQ//eF75YcYp6BIST0oPNhqB4sY2WQW0hWgchtAIluQX/6hrr3Kdp9YzEiYZ
yJGb91mIGjZAcXJf64U2bC13M697nQa/L73lMajamymoQwrCTnYwGbXcxNOiTUo8
R5V6f0lcaeoXw6HyEusbjpZOBA1NV+7wzvn6d5UfLHouUaq/0fgS8n7vX1cjVtap
1RK2YqXNLd+rpxZTGqesqNFMI7to4+7NoE2uyMrf38ef8DN0PmnWU7N5MrbuUqcn
A53S4fs2H1iqAjIV3SWFkn9sjOg6R8v1Hh9Ek/pjmcuoHrs1hjcinDqBKqp1dGb+
ZTFlmS1ChtcaYDelF37nvTec9GF5Vkd1pCy7SX/hg6fklun5zo4lQMAgmatBFRGw
cCPrYKiJXpuK4ZKcWHGuElBey7vpMVIBQuKb2RE7xpfbctnJE1vto2C6xTR9tzUy
PX2b6FMziMG4bg0FVAhE9LmRTf1eV03Afzn3yY59+fV8GPpgdv7bqzg1dM4m6czF
l9+uLZAuHMZHG6qtZkaF46m+VmBrNUB3GXR8bXenrj1QgwybrrX7zjAXzZ6r+zVR
lWaUaR56Em8v14lRVqQ5gAH66ByqPn0Lg0XzbE9k18M4jTzlIOc5B6o3c8eHBlyf
7mtv4dN/zjiN6VyCQ9OJIjeBxm7ziO/8DoPjS4lB0h5dOJDwcSc=
=N6Yc
-----END PGP SIGNATURE-----

--uW0cYyBNaCQUjtwu--

