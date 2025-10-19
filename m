Return-Path: <linux-i2c+bounces-13637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3A3BEEB0C
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Oct 2025 19:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1A0C189B33E
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Oct 2025 17:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3970F207DF7;
	Sun, 19 Oct 2025 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="diNszh8Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F011898F8
	for <linux-i2c@vger.kernel.org>; Sun, 19 Oct 2025 17:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760896452; cv=none; b=WvY0fKt9TbsNDFY7p6YkaoqQBF5z0WgMDOlt5I9yfK3ZOnD4ed9YTlPwDlAsfFc0mU+HO65+QFx+0i416I3Rae57s58eOJTyeIpwdElzyqYZ4cB8/HLqraYM+3ICgtviqRVaCfxKtrHGnXNfPPFTXAZw/J2HNJDOKAf/GQUOZc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760896452; c=relaxed/simple;
	bh=LPohAfeHNfFHsaU2R0CVXTA/hDYzjMX9mjmN09Okbnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhHD5GcG3nb3RLATLdH5lFlKBbDCNAhjqfrCPS284JkdFsR/31WXC8MXlXwVZ9MVXPvbXuS6bJu4FBTb1c7PuhEz9Srb/RB9ZyM3zo3HrWArsNhqKwJX5bAg5KwPtCrEBBRjWT45/YI/Khf4h/GKP+A3yFIRnAaEeaR05/5VCUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=diNszh8Y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LPoh
	AfeHNfFHsaU2R0CVXTA/hDYzjMX9mjmN09Okbnw=; b=diNszh8YI/El7YX7KzVx
	0X5XMaj6L1E/jBkzRaV0f+rtcd7l2t6oIfW9yEHcifX8FVEmJkheG0+vxPBclgyd
	1nvVFeTTrt4YEerVsdj+NjuUJedf5ftI5GwNMRdWcLpb3FQaGwtJSmjQ9bA/mvlJ
	Pj8GTZ2vWaxREGTcgfDkS6L8PZMX2y8WVhkA4aaE0VgedMa+u5e74MAj72wGkNOW
	maQ9aYhPP+z6ZNYehc+KIZZVmT8jD8faPikNlmmwFs72oqAjVWwZofZZyabxFjzj
	tF/qB8lAVSq5mBPi7iLCPAzO3yJJLcr7gwKiqeCHh4Gq+O5xTrxvmGP1dimpwY5G
	zg==
Received: (qmail 768932 invoked from network); 19 Oct 2025 19:53:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Oct 2025 19:53:59 +0200
X-UD-Smtp-Session: l3s3148p1@Ze6zpoZBwNMgAwDNf0EaAGfWvYNrcrsi
Date: Sun, 19 Oct 2025 19:53:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-i2c@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c-designware: not possible to write to different i2c addresses
 in one transfer?
Message-ID: <aPUltv8jbxDJ8DcC@shikoro>
References: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>
 <aO-KuJ_T9cXsNpIh@ninjato>
 <aO-kZUwqcoqnFfTh@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RwZ4ECJsfbDUhUw1"
Content-Disposition: inline
In-Reply-To: <aO-kZUwqcoqnFfTh@smile.fi.intel.com>


--RwZ4ECJsfbDUhUw1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> May I ask a dumb question? Why do we need such an awkward transaction
> to begin with?

Because it is allowed per I2C specs? So people will use it.

Interestingly, a patch has just now been proposed which I haven't looked
at but I wanted to let you guys already know:

[PATCH 2/3] i2c: designware: Enable transfer with different target addresses
https://lore.kernel.org/r/20251017-i2c-dw-v1-2-7b85b71c7a87@bootlin.com

Maybe you guys can have a look at it?


--RwZ4ECJsfbDUhUw1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj1JbIACgkQFA3kzBSg
KbaTow/9F3rHsCfTudGQtoiCurSy35+Z5D4UzmJBstT6JTZtahePRnSROWTGXXHr
ddGnKougjTmQ+rDp9fqhr9NuP3n0FuWFBklEkCoD3v5Dk619jzz1v2WRGdZk1yYy
knmDwb4aL933qPFthqFSfn6AnO6kmGyIKVvB7lZdhaDpsgxN1cdqLcmfPKat1bB1
aMn/pKiimZLkNR2tR766SMwlFAeYP8OZOrX8Q1wjgqj+zEiqsqeORUhBTHrpgBxi
wpAM9LwCtm5j0wEq1pLNIzeXV+K+TFsXjQtSNU7BLi4fxOT+w5qZoBWUqOH2HN7K
1wRbDwxSM2RyMnoZXh9PvxU4c0YSC5OSF63kniUdIbjwl1RVHhH+fmS3NIW/LZLh
RBk8MDe6TcWzovgidFZuLpH03APwQ1R+/8EsmHJo9EBN+kdqku7eHpHdLDVJeoFc
sWBPvaDq7Tb15U0CaPg6b0i/rANAkF7aV1ICOoGNKCUQrRxmSLLwxols/jVJHzrR
l9bKKlmcUpcBUJl4ytKV0PrJloJoT4tU28y37E3IbAPripvlVzXrfoiG76WSWJ7v
EwTVnL3wp3bVVBnQT3IpjoH2iMHO1OFFhWXL4f2M42eIvG9gP2CLd9DV6rXaokcO
srqMqBihOZb7x7Qmn+rSsa4sz3qEqpqjd02+8Tlf77cJ1KaB0rE=
=VrDH
-----END PGP SIGNATURE-----

--RwZ4ECJsfbDUhUw1--

