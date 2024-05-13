Return-Path: <linux-i2c+bounces-3480-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB568C42B9
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 15:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DC661C20BBD
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 13:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00076153585;
	Mon, 13 May 2024 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hXMQD3kP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D3F14EC7A
	for <linux-i2c@vger.kernel.org>; Mon, 13 May 2024 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715608761; cv=none; b=qXoNffVLFtEMxwGluVt7/KlS0L/f77jSXuXl5wDRBxf1atcR1KLU2nXy/5OcBG4Y93Q3dn/apY1VgroQ39NqZnNOyVGOmwbOzPcFdOL0k6jkjyKw/h1wlK+MjRh65hrQPMh7zViML5lJ59ItSrcH1SScXHVGZ7xfN+yiDaFsexU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715608761; c=relaxed/simple;
	bh=Qw+M4B72oFcBmoiPowiQcKHwqJWCeb1qkGKmYUqGR/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7lwjetAtyMn/QBO/HEi+Y9w67n6V/ZoYiFxg5LWu7AAufDbWcIvsNPcCvDEIWX1nAB2+ZHFljaH6wt4ysysef5yS6GMbeJX6Q5DJgvd5LpdgyqfT6tpeJNzQ7OQI4aku6MzIN9OlNSLQp2oKZeKu56IsW+d3s94bMJLms9PVm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hXMQD3kP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Qw+M
	4B72oFcBmoiPowiQcKHwqJWCeb1qkGKmYUqGR/U=; b=hXMQD3kP02/SZXeIMkHt
	VvryBkFW4lI1XLoucCyHIbadMFFxRPPRm437aLBoTOKBlVCkf5Poa2a3eQPE20Ho
	vDecRIfZ0+mHmhfkn7VZPnvnTaYqIKFmFL074eHE3hiV8PrkDMpGmZncypyqa4y8
	opFGki64rwNrBw4tLE04+7Y7dcnhaYShtP879z2H/E2uPGgqGd1tTH2xD/1YuPUp
	8iWxveaRxPVCXrf+8+tMvPWWPCP+o55diNuqh8uS5UCDeLvbI3lbBtVoYBg2hZjw
	Jp+5pkosVOOWuLMzzXv4ljlVZCq9hGERS9PM61xXw7GTxISgHwoOm2bdCBJ5GO0O
	FA==
Received: (qmail 2169342 invoked from network); 13 May 2024 15:59:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 May 2024 15:59:15 +0200
X-UD-Smtp-Session: l3s3148p1@BLBmSlYY4IdehhtP
Date: Mon, 13 May 2024 15:59:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.9-rc8
Message-ID: <20240513135914.ul6nrieeljeuo7rp@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <pb7vi7igdvqo6jlyjrd2lhfgbrz2kx5nmmw36vcdy64ndwbs3r@e675jdrgq3lj>
 <sadxp73tm5zhfgsv6ufroexcoq4cg4j4quljry4bsojkzniw4c@m5mhet2w5f5e>
 <2mqgax6smctnfpkelum7sbz2ukqraankpudjig3sv7cwx2bgsi@tgslonensttd>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r42mjh3fiqaoejef"
Content-Disposition: inline
In-Reply-To: <2mqgax6smctnfpkelum7sbz2ukqraankpudjig3sv7cwx2bgsi@tgslonensttd>


--r42mjh3fiqaoejef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If you want I can include them in the merge window pull request,
> so that we fix also one of the two dependencies there. Then they
> would find their way to the stable kernels.

I merged now the 6.9 request and the 6.10 one on top. All seems well.
Did I miss a dependency between the two?


--r42mjh3fiqaoejef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZCHLIACgkQFA3kzBSg
KbYe8A/7BnsEXIvZ2TLx2AR0ZJOAAU9PS1xHURxWw86BmrvWv9QX4RiyDYD8w+Cx
4h4ObDLg/gO1+PDRYLMSxuM9S4CwHydD55uSeIrFJe4f1TevAUtZwDvY9eEjdMun
PMEuv6x960sGD/YZe+SLU2LTO8YP+1MCIMBvGpJz12sj01bOKSBGPsR6hRUe1XJk
3To2mR47YU60fiwK9Zqcsilz1BzVZbyCnLogzeX1aWpE6uDtPDwQguM6ybYZb2XU
GS8sqNGKYm6Zihr6L/PvFG74YfcyHY0LZr6+Ygt3gg0v4w6pKQQPsUN9+yt7cqzE
7KO6F6WOxtYxTvN2XW6VDcTDGh6k0HicqC71JGPhj5rR2hYqrklu86b7z/Ab8bPo
a5Gw+d1DDO+VcneCc+9Yh2hdeACR4O+hEmr1Z7HjZW8mnc5bXdyYn6jNGTApAziT
J/lbB5mZ+wNHxawoZf64CvIDjBu/uOg51/tpwBefQjhkSWogbLBXc1coefrZg/HF
TwgymNXmDHfOUM4mNk98MLF4gnewuID00+F9w+jseGxBSTexU0biteuWqwy/4Khs
lSoqluHBexkAGGajMCrnSuX2395blCCfg5pa8bK6/VsyhY091xnOskd+p2aZ0pvH
PaSwnfrYADsVQgbe/0ReSmvTHtKLnX9aYwslUGDpZpew8Lpiu18=
=kpU6
-----END PGP SIGNATURE-----

--r42mjh3fiqaoejef--

