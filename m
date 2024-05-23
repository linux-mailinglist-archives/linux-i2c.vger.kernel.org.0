Return-Path: <linux-i2c+bounces-3651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DF98CD7A2
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 17:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA019282CF0
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 15:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909CD18C36;
	Thu, 23 May 2024 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XpK4HD6z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B3D18633
	for <linux-i2c@vger.kernel.org>; Thu, 23 May 2024 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716479314; cv=none; b=p+HAIoEGoISWvOHDVsoxz7O3aYjyOeLqMz29J65oijtA+ACv90Dr3Joux16N2qF2lms03uulMAL+j5nF8V+Zn67eCI94FAXfaAAW11PysB9nWDcJS8pV3NwxgLb7981GS3AMHJuKToJnHQd7Pu84dVQY2QDreBibWuUF3Yd44Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716479314; c=relaxed/simple;
	bh=joRVzwdZMfiuRYTp/LAgcznS1tEIbKXziY5L8is3Xrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaCdK3M0nGRZjrm7mqRWiw9aL1kk4F+t9wSDg1eUFfS84lObZV4D0B99RJ3hyBpnKyXqcf66imZqAqz14vgjHPfNhbvyVKlLs9o5U9abQy8+luF69D/Dy6q3BsCyO4OxgcVkJnzaIjiU1UsJVlqEDWnuPqOUDQkCMJtOTNAU+rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XpK4HD6z; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GMCX
	jeQr/kc1haogBJ6sSOcdurhMSQkjSfFlJEVXoZo=; b=XpK4HD6zv+jNRT551lE6
	xjYMyvu+GOUxa/57m2+S0DqornBlPEC8ZG/zmaQTDrO2ssAmi/KCwU2SX6H33rKH
	JhDvu1eHYyq8YrxP+qzcQ/aZf2OqAY97YwSuBU5V8Vi+sTzNWhtSjXCGRNfP6tvY
	DTtV5V9xIqNqWRPSjwAoHDDHoNdWSP1XJFc4iPg0A5ehPicRuMdgICPYnS1zv24c
	5WjXphKW7364gyFfZoM3qGALSi9iH+NF7QD2gvJjo1Aeufnvv5rMnLk2HgLSbE2d
	6DF8aLUbTsyxCEHkbyK3XIV3W5t8qVa1LtWM4nQyEv/3sIGtzYheN1nyqzcuZTib
	iQ==
Received: (qmail 1173772 invoked from network); 23 May 2024 17:48:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2024 17:48:21 +0200
X-UD-Smtp-Session: l3s3148p1@dycF+yAZ1pQujntm
Date: Thu, 23 May 2024 17:48:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [GIT PULL] i2c-host changes for v6.10 - pt. 2
Message-ID: <20240523154820.vza7xbdkgqyyth6w@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <2qtn3bk6pat2xkw7qz34pjpgh6zariuz6zjxhmuuo2jcddfpi4@xn6aqqppl3hi>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k276mwu3dvz5qa7m"
Content-Disposition: inline
In-Reply-To: <2qtn3bk6pat2xkw7qz34pjpgh6zariuz6zjxhmuuo2jcddfpi4@xn6aqqppl3hi>


--k276mwu3dvz5qa7m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> now that the dependencies are fixed and no error report has been
> sent on these two patches, I can finally send the second part of
> the i2c pull request.

Pulled, but I can't send out to Linus because
e22e0e483b2c76728ccd119fdcfea81eb176b3a5 (drm/amd/pm: remove deprecated
I2C_CLASS_SPD support from newly added SMU_14_0_2) is not in his tree
yet, only in next.

Happy hacking,

   Wolfram


--k276mwu3dvz5qa7m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZPZT8ACgkQFA3kzBSg
KbZRtw/8CoUEMB+quI3WY1PWm+RUzwTzLqJxc6N+nWbNyg4RY3riARW2skQeyF00
t+yM46bZxg3YQUm19IH95XTxaN+BbX5F79RhYFO8vKI9ELPLZyeInxWulxg+nWGf
ifP2Mgk6wlJG6RLce1pNfmD1WnYzpDI36KOzyDFYK2If4XWeg2siLjnv5XnObmcf
trjr0pohqmSOPu74XNLnCGQ9toQofqObta+VbLlQ/F12oyRqoH+a07pQDy1u04BB
qKyxmgm9Z+1hSwLWbooK/jGPAMupk+bz0QewN8d6n57zcnNfDeeeXOtmYfU+EwSg
C7Njekt0LHCXiBBgo7dH6ifg153YxBLu8hYH4abBtk0lXx0HfsVx9IfxzlZokELI
24izDi7BnbhE5vMwqK89zRTumvsTbwh8fFFAIvdYm0BHdqrcWZmb6lq7leqp/3rJ
97ybh9ccZ3R2OBB5TfVSbpie1rnKQa4NDeR6LrpmLiaeV7UtLAwT/mTab2P2rUyF
L7v6mfq/GkmiPxaSHV7LxZnzN14aSUwuSePt8scumZkPrAAAEwFDGtEvOYdmVvv1
eG3NWIvPoIhhz98g8cnKq6cqQ2yDmWtXWoUIP18aKY6trrQFnsZShdXGUjeGAyIb
LD22iRIJaSxAV9e5bV0Ys8mDteGD6WioGH+H8tNOPFOx7wQNTnI=
=Xl9G
-----END PGP SIGNATURE-----

--k276mwu3dvz5qa7m--

