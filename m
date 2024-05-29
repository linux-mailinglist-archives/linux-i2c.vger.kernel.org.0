Return-Path: <linux-i2c+bounces-3702-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C397D8D3487
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 12:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47CBCB22C2F
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 10:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFBB17B402;
	Wed, 29 May 2024 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CmWYY7kT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75207178CE8
	for <linux-i2c@vger.kernel.org>; Wed, 29 May 2024 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716978491; cv=none; b=S6trpQNK7gQEVeVvvXLG46KYx04Lf2RyxpuvRbakTb+KS9N23bW1sHQmd6umzl71ntKNV1HeDebaxEsLZylZ+kF13S0aSOZXOF9qhwiXca1HH9q0XMP5BbWXVFdiSnVdjF7CXOGq7Qzo6jQkebgpMLaViaC+RDah/9aDh3KRDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716978491; c=relaxed/simple;
	bh=y7p3l0oglWACzgxbaMPo7wp3eRe7SuiZC//urcH+c2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYF36+ThNCUvPcM3Vy9uB73csAgju2/vgSbqhNx6y/witLrSnzxnX+YzadK1D6QVgdtsfNCAkzczFxwPvqzO2GC8QhY/cc3+KgZOsc4gKmk0U11VOd4JlR/mzIqWEenuwJyUT8lcM+83RM0Ld26m2bml9xBHz5tDDIwWVps7yLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CmWYY7kT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=y7p3
	l0oglWACzgxbaMPo7wp3eRe7SuiZC//urcH+c2c=; b=CmWYY7kTC2Es21bZ+ioW
	ahGY/I29AG5zamKjk2waZoZ+WBHMkHOdazG0wMXWKCdWJxlYpsffH8Zx6+ISbutQ
	+ebCYp2XelrRSarYPImNiyTyyn1FhneH7wYKRQykQYhdi3vVd0Fs+zHUTfyA11fC
	zp2xj8qaWYBEf9+yihl0cnvdOpBIYOkUXCrD8zVxI7KN0JAtrcqN24dOV4F1R1Un
	bbIuH55DYqux8cqTqir3E/izIK6gJkeyoWu91fj9oZpOTGzkZeUaTynZZijUeesl
	gseEjJgNBB9opIBB4/8gL+q1IlDtXm3rstZ/TPbCBY5zge2P8e1zgah0J+9uo+kn
	Eg==
Received: (qmail 536340 invoked from network); 29 May 2024 12:28:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 May 2024 12:28:04 +0200
X-UD-Smtp-Session: l3s3148p1@VOCjNJUZ4McgAwDPXwS5AFh1mWvQq9Po
Date: Wed, 29 May 2024 12:28:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: egyszeregy@freemail.hu, devicetree@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c-dev: Introduce "linux,i2c-dev-name" property for
 device tree of I2C controller.
Message-ID: <mnzj5bqbiuwt4dqnenwctejdnqccqzk2x4tkz2ukqssrmdmsxc@7srnfnfjym26>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	egyszeregy@freemail.hu, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
References: <20240519165504.19627-1-egyszeregy@freemail.hu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="adz2efxtjrrak72e"
Content-Disposition: inline
In-Reply-To: <20240519165504.19627-1-egyszeregy@freemail.hu>


--adz2efxtjrrak72e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Optionally, an I2C controller may have a "linux,i2c-dev-name" property.
> This is a string which is defining a custom suffix name for I2C device
> in /dev/i2c-<name> format. It helps to improve software portability betwe=
en
> various SoCs and reduce complexities of hardware related codes in SWs.

(I thought I already replied to this?)

Highly similar to [1] from 2021. I don't have a super clear opinion
about this, so I'd need help from the DT maintainers. But the discussion
=66rom back then stalled.

[1] http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D237908


--adz2efxtjrrak72e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZXAy0ACgkQFA3kzBSg
KbakWBAAm1IkX0tO/4Y5kwTdx3ODo6eOVGSZO6RkRmuFikw9lq17+6pWLiiOMEKN
U9WQzznDplV1jl1yqsPeL8XjZqJL1K9QqOkJdYiZtWxIpdl6jkrOOFKmPwTbRspZ
dTQ8hYXyJRrpMAVbaBgak+EtTYJSI3e3cAR+1oTNlR0M+PEwQ+Oz2hBhflFgGwox
Z2znGpDjZuWKsDdXX64bMOhjlYUltHq6hgaShm1LpX3QCA6EJttcOlgD+mN1/zKZ
wOMcFHtzmz3TShUfkFyOhqE6Lg72Ir9iNk5+HqC81h/VqUT0ohisMbI/MGAjsNNB
uQTHO92DmELJJRii6u1zRPy4Cfk6Unc/sRrlv0YNZJTCKk8EH1HdJqIw0xhdl/jj
BSRslNmsv/Ae+wkFM205AeDgtcwMS/+HqKIgM5Zs5lmydhOPUa1UxtEqCvqkSrRi
cdaOVPyNzYfZC9TBpzhzb7vBvRbS3IEqkyWwCknlTQtO5D+02+mysYifFhvpSUMW
csaBEVFXWguDCX3F2G/2q+hZsjw2TRzYTT46CEyiImytvzIrl4o90X7RkV09evQX
1Yzn2rZ3G9rbI4Of5/CshmPUIlJJJJ/OqznaKr9+kFMxB0/bNytjLE91YsGfXef3
gG9XG33MrXnJPgQl8if/kk2Rf1bLTvLM+JPP9ZNvHRQACUWi0yo=
=3BAA
-----END PGP SIGNATURE-----

--adz2efxtjrrak72e--

