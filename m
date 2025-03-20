Return-Path: <linux-i2c+bounces-9942-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9BFA6A459
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 11:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14F3D18916F6
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 10:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACF92253A5;
	Thu, 20 Mar 2025 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QNpOVbTv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A32224B14
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 10:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742468303; cv=none; b=HpXAKMJrFeJQpuhxUI5D4QukmEs+H/bYYZgrRmERwR5rF2Hhug6CuJo60aiXSjB8IjNGK4M2Zs8295qHc+O0C95R3FeMBW8vCj2mSRoz6aCfvlCIjlxdHElEI6NmGhyQlv3YxaqXNPO03JEcs9lUXLricQr8hqMUdbjKUIx/cjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742468303; c=relaxed/simple;
	bh=VZmlhPiRioKD8JQT0RriZrihgupYPCfgyQh8LfVp0aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSE1YTbCd0WDWcWQZW4g7QbV9ilglkuryT2xcxSemqeFOqX179RDYCEd2fUk+RE6SA0Mxl4t2XS1ShwqLMaw4Cro7uEdMDtKqZJUZxWbOsetUSiqBSWfkG2YVCnFnhttEd8L3/x0TIrXDlMdlcCXUDsQKLCIkvnIpCnmNJFZah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QNpOVbTv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VZml
	hPiRioKD8JQT0RriZrihgupYPCfgyQh8LfVp0aU=; b=QNpOVbTvI2Xxs0a4nSeD
	e2YcIdaHFWU3tcDO6iQozEivmprhsF41/CSrPiuVM+WJgREDqGGmDSV4/i37Guf9
	hXiM5FSsQ9RkuWDdbLZeZMoQSq7PLDaCFqJCt05wkQCZEJ377r8xs7lBsyuE4vWf
	POYFRWakwxc+mu+eZfNq4jt9md0TBhthN7i5P0s7tnP65VlzXoLRKx+/KfIjFtsx
	UIpFiO5PI/y9scyE9069Q2ly+yP4aHo5b+NfYqDPTfLLdQp7fFabGKUV0zsolsK1
	fDGLlj0q4jnAoITz4b26CJaPJUi5oLJpmBOzr3Uh/JHtX5QJWDYS/xixgdoxGIYC
	Rg==
Received: (qmail 619648 invoked from network); 20 Mar 2025 11:58:19 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2025 11:58:19 +0100
X-UD-Smtp-Session: l3s3148p1@S/8BBMQwDq0gAwDPXyTHAJp038nK7dx+
Date: Thu, 20 Mar 2025 11:58:19 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v7] i2c: riic: Implement bus recovery
Message-ID: <Z9v0y7MLH9MgH0xj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Andy Shevchenko <andy@kernel.org>
References: <20250203143511.629140-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <co7wju4k5lrg5vx6sakm2m7fkmvupjkjuniz6rjdb77kbqidgp@bryc2akucoaz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tNfU8lFiG3SKvJJC"
Content-Disposition: inline
In-Reply-To: <co7wju4k5lrg5vx6sakm2m7fkmvupjkjuniz6rjdb77kbqidgp@bryc2akucoaz>


--tNfU8lFiG3SKvJJC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Wolfram, if you don't have anymore concerns here, I can take this
> in.

Please wait for my still outstanding review. I am sorry for the delay.


--tNfU8lFiG3SKvJJC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfb9MsACgkQFA3kzBSg
Kba5RA/8D0Nn2OvEjEPzwQ3kPx3V9Eu+lYjHLL9GzDSsCfvFC9lRmubRwix9beLi
70JV23cDTWiGC+1dYmzbeAVNq393LNR3kP3j78ASIBMWk539EgboqUbUpJz4+7d8
c6/dNF0I8jd1sAR5KQg6fjzwDQviL1SW2s6FGFAuk/m5e6v4wm73QxqpMI23QlI0
TJTz08tmNXrVIOABnVbtkW8v48BPbXDlteSTSK86rawtrGM3Ospb9Umq1N9vIwlk
Uiopuo/9L51QqIFwNJYwjBBhu/lxjGJH7CmcgfCzF0jPQ4m0s1gStToN3cs/EJFN
fxfUFT9SvdFtWwqFd6xlbKkMl7LF4erI3bDBc/LdefuYuQV1vGX4m3LHO3JIlAOC
nGtGjIo49CBpIg9e2/IXlQbztCq0tMn790z98d3vNiBZRN6mf12l8cr3i38Xifgi
RGz7r13rJdgTzna7SaR7/2oC2iV/IVpi10GgB8d49PtxzrE6tEGrTft38H0OXUPN
odjCTrYq6jD0DhHcJu34iLBsT1HQtN/Bf1kh6q21ixlzxaVBzoa63dQEQuL5zXMe
Sg6D5JgbitS0nTyMu5LrTzeyQ5vozDitkQbimr/hlOLVORpdzTT1xBCfxmnZ1XKo
bA0SyUNpb+jfCXr+/ij/6SkngonSs6Il/O09BBxKI2cjLgbVRrM=
=Ilwd
-----END PGP SIGNATURE-----

--tNfU8lFiG3SKvJJC--

