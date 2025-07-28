Return-Path: <linux-i2c+bounces-12053-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EECEB1371C
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 10:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 647F318872DD
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 08:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548A7231826;
	Mon, 28 Jul 2025 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iNeeMEJk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B2B22D79F
	for <linux-i2c@vger.kernel.org>; Mon, 28 Jul 2025 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753693165; cv=none; b=lYN6iRKir1XHwDLUlo3bRFKKETFQDQAU4UI3icl+/fQwHiUN5iotGhYXps+pA86FKW8OmFjuZr3G0lwBl31+d3BcxResul3ObP+52pMiQeVnKGf8E5i/cDFRktXuMc9luVutoka4lmm5JC1X571iYG5LCpoH7wlL+3hBNs520eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753693165; c=relaxed/simple;
	bh=xLg5wrRv3uIutSp8GiAgUsSA5JkF9P6KCUXkTQXZfb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSX3QrOT0EBJDOjHI88gwrfzBVf+p0fjEsFkrWEUly5mPYY1U2EbL+KZpCrRY75TmWdi8hXf7P0xOjziagBMosl0/uNN+4/J6yONMcLYUd/gUPldcImKhH3gw8m3w8Q5A8qnvxoxLYGL9+ZARC+pu8Vcl7s0tQ+697VvlYu+7oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iNeeMEJk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xLg5
	wrRv3uIutSp8GiAgUsSA5JkF9P6KCUXkTQXZfb8=; b=iNeeMEJkla4iJ0QliodP
	FsN0aXW+MDhR6bNeu8HvrzA/SIzqKOZf3T1OYthK+hjS7ynKZeHqdnaiUG1xk61Y
	AnJoIGa/ERimtCGhcNd9+/sJ09TlV5/17f5svTYgN0ubFpHUmky/F1IDhMNdCbJd
	unzvrP1aYy5OswFj6S+q9lRX2u3KjbHndGFMxl4AaSe355/aOcVseRThPmkTi+Gu
	mYAhaz1zAk4ZKxgBPWikjaRnOXlFKYz526DLAQjm5jjBt9vCAVTcrvPYGLv6KmI0
	R28XWVjbGm3YmbSQZpZikjI6+ssMbROathYr9DsNLXiTrbCzrIZwDtfCTbzXCPLZ
	Hg==
Received: (qmail 3375602 invoked from network); 28 Jul 2025 10:59:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jul 2025 10:59:21 +0200
X-UD-Smtp-Session: l3s3148p1@B5nogfk6yq8gAwDPXyC3AG0QzsW8mHdp
Date: Mon, 28 Jul 2025 10:59:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "fangzhong.zhou" <myth5@myth5.com>
Cc: westeri@kernel.org, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Force DLL0945 touchpad i2c freq to 100khz
Message-ID: <aIc76DpLL28RLimy@shikoro>
References: <20250620052832.26614-1-myth5@myth5.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DItPbqVh5hfarFP+"
Content-Disposition: inline
In-Reply-To: <20250620052832.26614-1-myth5@myth5.com>


--DItPbqVh5hfarFP+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 20, 2025 at 01:28:31PM +0800, fangzhong.zhou wrote:
> Signed-off-by: fangzhong.zhou <myth5@myth5.com>

Please add a commit message indicating on which laptop you encountered
the issue, what happened before and after the fix.


--DItPbqVh5hfarFP+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiHO+gACgkQFA3kzBSg
KbYKOw//T0ofs9q6ex9h3NBazj6e/ikGF5HaJd0aeotWVtADV8ehIgFG66qIKJd3
gmIpmPm6W1zS4XZ1Za0SqvM0/zGA6Uy/pU+IZDayKOjv8Xsm6qK1WbPfAwSXJyme
fo+6BZfV+8l56aJjjyNEgtxfBXnHt3Skq394yLj2Vivgsg+BNAsLfuMJkjXU+QhR
Q/TSG2+2zSmpCc1wZqNz3Q9I4JLraHLpUOBbvHOug9M82vgN3FJn09t/Cao/CWgh
X4dmsPAfC2QZ6c7knVWAqZvDKqgUPplriexYE3mMJ/n9FBP04LEfgQQCLmLYJqND
AYdgWOo2B86461Hkrq1PaIDIdA6K2Zls/PDCPcruS7zZKzCEg3DWUCjUP2DIeA4d
j4+x/cEiTL3NalduJDmX2VHLVPsFsh18X59c40TmjepaEeCGdxNM4bbd/OmTYWlo
dT6V9psur3tPyEXmVkonpRp+78DL5Y6iwmjC72awIXcKJIBnQc8+ca9c0j7SmmL4
BFv1oSC146fj6ZjzwrAobJ6bGy+93cNN+mADf1vcL8zm7SbLzsZ8Drrpdk+0QleJ
bbQXic8PEu2qcetwsOfzBIiu13B8fT82RKxq1GGpkR0RJ+TgNBZx5pCWgznUXwjy
K3dZhhevjF0Nuuq8mdIt5xDIhtMI/WXIiUlPfTIYJk0+iFAT8rY=
=iGLu
-----END PGP SIGNATURE-----

--DItPbqVh5hfarFP+--

