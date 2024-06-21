Return-Path: <linux-i2c+bounces-4193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA439123C1
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 13:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8028A1C25333
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 11:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6740B17278D;
	Fri, 21 Jun 2024 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lNDoFqPM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE48E135A65
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969788; cv=none; b=tHUOPe9XafUgsz+Y2QFp2MRbGXt2FpQ0HTvIgkliyJxTQQW47v5ALagSMsVsI4hydV5qhSX/g8CVaVmk89RRvYc+CplGkGbEnzVs87ESlNY2SapGkCaFbQQM5ThmGuVJqiEl9UuisZSTVmjlJKkoONn2IHTJ958Vzf1+IlLhou4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969788; c=relaxed/simple;
	bh=2AWdgNEjp/ZhWXNtkjNDFWPjysgoqMKMuu3u70xNsKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9/1b8d2U5rC/VFyOWvgGOWeSaMcJ4zsfT5VBZ2wABbz08gTZYsUd85tAl7Z/dlKhDhEIt7VLTgzHjAZub7OFO/RCY7o7HYNlZk5oumEDlS4KFYqLjQThA43Ziv+9cKl3WW71vGxF+UHqFjuMU7+7gXqRj66uATYeT85rxt8vVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lNDoFqPM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2AWd
	gNEjp/ZhWXNtkjNDFWPjysgoqMKMuu3u70xNsKk=; b=lNDoFqPMDD7KS3rnYEe2
	lQjLQY9fCdB+KlA1ECQlmHNLysSFcIHQp9uX9zjjyKpM361M08Xr8rXVojzF+MLb
	VcbPkBugSNLjNBjeN6XBUtXGv0+4AlZuRbmqTL15UyrknM3fiuaeKftQDlo8ddWK
	1GruKsDh+2fbqrCH9qymHIu8YR5xWf8J/BKGb8y3HOUmenpEWBbIqHa0UNQXQaE5
	VktqsUz3pFli4RySNMkFYFYAhmvVeUunPPIfOUiASdnwv+ROBo+sTpwyvV/CkOjE
	4YfbKpyRlmPbs2ELB7LY0Hv30NLi2kxsSLSkuB+p/IN4eVe60FXsAh67Z53e3YM3
	Rg==
Received: (qmail 1356317 invoked from network); 21 Jun 2024 13:36:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 13:36:19 +0200
X-UD-Smtp-Session: l3s3148p1@2gMY12QbRu0gAwDPXzjQABqqX1QYyOSW
Date: Fri, 21 Jun 2024 13:36:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: Add nop fwnode operations
Message-ID: <27irngtdi3bjhocwjrgw4etg6ieg5fq2g4bgkuyzxhedebvh2r@rlol5d7osyax>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-i2c@vger.kernel.org
References: <20240614081418.2506288-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="grhjjdyvvuwolhei"
Content-Disposition: inline
In-Reply-To: <20240614081418.2506288-1-sakari.ailus@linux.intel.com>


--grhjjdyvvuwolhei
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 11:14:18AM GMT, Sakari Ailus wrote:
> Add nop variants of i2c_find_device_by_fwnode(),
> i2c_find_adapter_by_fwnode() and i2c_get_adapter_by_fwnode() for use
> without CONFIG_I2C.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Applied to for-current, thanks!


--grhjjdyvvuwolhei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ1Za8ACgkQFA3kzBSg
KbbjnxAAi7iKDfPtS70No8yqIFpuuLNNIApAh3EJUacoJumoTDAM0QhaO4ht9b1t
S1xDzx+QcfUURi3C2+CkF27rNZg74bjkmsHPO+2ueKrXw1WBBPcJMJfHKPr098o0
HZFOeRkZEWhbWIUr8HyhCR7SoqxXkCSQaapXhqgCj+tg3SpypU5osCp0Srwm3B/F
IqSZ+uoSD88vA6EZX710tEkBij6MHO4onzQY7hw+1K7pusc+lFHc0u5k9yeUy8Ow
Xlqcc2zlTEMF+mLlHyqzEkPBMCMmyQH1R2vo+WZtCJr6pvcj5CeMNCzktMIJhOVR
A7GVIJsTMrGMFGkUfp92LEjYqNcbIwUIuPJEoabI4tOIpbTjImQDG2Q9ag9EwLBm
kOO1QiJpi7GLnEFCX9d+T0+bjdokbWohOO8ipVebcH42sw5t5phhaTGAbEmqtbHO
rFS0avGvJB1x1t1tNUe4UP99pI2whIm5H9ekAoKkbhfq7M9wOPOU0gCqEzLWoCf3
YPUpWNN3bEm00WSknHunfqflCtl0BzVG6jsIzpWCZkPSkKeS6IAAB2SpQ7h0/Gfs
pNA/dktWvhGEoAEif/DPP39WbV2Liavf3us02tuVjSp60de9b8JtTViHf+iveF5i
GHjtQ6H8OtEkzKDxAIGbrX/qxdjYXx58qljjNrTckVVIdjx+qTo=
=b86l
-----END PGP SIGNATURE-----

--grhjjdyvvuwolhei--

