Return-Path: <linux-i2c+bounces-7751-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F939BB2D7
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 12:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF9531F2119F
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 11:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A611C0DED;
	Mon,  4 Nov 2024 11:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eWxKHeCk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7BE1C173F
	for <linux-i2c@vger.kernel.org>; Mon,  4 Nov 2024 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718325; cv=none; b=d3oWY0+uKJVneibm3npCkiUm4kXuqIdlLBD+NZ+fTDxxR7OeFqKMpoGUERBv80P3RCWf3CBNmyLpxgOdpZlsNc08ACW/xmbf7CM59o5KVorpT1SKaWNoZ546pJGKJKsuJ+0aamkHF2o7hANlVk3ZWW22+Hv1VdnmYM90BoNGVfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718325; c=relaxed/simple;
	bh=HLZTxuDKcTSWRhLOVogHEiv0xG+ZhmnkPGgVJfuIEcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPk9fcAqG6pRfZsN3fpOJCM1zWAcMkVYWwrtlcx577VAVfVYqQh2+yGW5eOtM5kUqJaWPFp2MTkjK8G0NSYhvEGNfR8g/mdk6+MYtxGlBbnKWtNnxVgH11O8/f4BvrnJonNE6xJ4C1oVrHZJ6zXroq6ZEkAJdv/5Wr+1DVCw1EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eWxKHeCk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HLZT
	xuDKcTSWRhLOVogHEiv0xG+ZhmnkPGgVJfuIEcY=; b=eWxKHeCkY77RR0Rqyu/g
	YVfvBhckfgXoSLroHnNhsFuL3RAChbMy+i5fTMxjOr/7EHDSf4r+IsaxefXyf4Hn
	ZCAbStdgemuwng4/jtCMZfPHBAQkjhHd38TpN4ij+JHD0WyTPa0sEgcemBku3XQ3
	bcG8pbU6v3Jw6dCGHbeK/F51GfwMQ4CFoUOtthNxObNoFjNCpRJye1NJ4oadsD1m
	CgUMFUJR2qeYshQKDHUUi7yurNQuYRtOopkGIN/4vteEga1c2zigD7EceyN6eZ+Q
	lVGFX+6Nch4qLOqWP94VNpIZg9hP9wcQjchh7YAZU4oD4MQAb8ZD/FBMQDOawC6l
	YQ==
Received: (qmail 357771 invoked from network); 4 Nov 2024 12:05:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Nov 2024 12:05:21 +0100
X-UD-Smtp-Session: l3s3148p1@nXu2QhQm3bbVHA60
Date: Mon, 4 Nov 2024 13:05:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: Use *-y instead of *-objs in Makefile
Message-ID: <ZyiqcHFJFFnBYmTN@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20241018150337.2182181-1-andriy.shevchenko@linux.intel.com>
 <ZyTIf8l1ghcyzJUH@smile.fi.intel.com>
 <ZyTNA34Y1BRxMhhn@shikoro>
 <ZyTSZTcNU63F2GjY@smile.fi.intel.com>
 <ZyTTs8gFx5r_N5Pi@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GK1lTicwtQxLICc7"
Content-Disposition: inline
In-Reply-To: <ZyTTs8gFx5r_N5Pi@smile.fi.intel.com>


--GK1lTicwtQxLICc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > Shouldn't be separated commit anyway?

Can be argued.

This patch applied to for-next, thanks!


--GK1lTicwtQxLICc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcoqnAACgkQFA3kzBSg
KbafSA/+LaGlv4SQ8VxzztX7srLwTaz5pikyI96vBH/j3GVKBLkCJo0+t/Os2noK
OMRDHmP4DyL0TirE4RyNCniFRN4VZsd3lap7JKy5Q6U3Eu0sDA9Ft1xsbmlPjZ0C
lnVyANnie6nNTlUkdLhJUaqGSyKUtiLLtLHgupuR9/twWJ7FYDEU7CVxF7tRVhGL
8Vuz25dgfiHyYszJeLkah7BKmD+RmGk4Q4nkdBiMi2jMdsJ6KZxBi+ajLnHpfp58
8ZaVjQ2cnZyqSe/it9uwJIU+wZyFAZ5l4XhYB9egvdXXB6cslqr2JV2Cavxd4m7u
Rk5ljBxAd5QayCs18E1jajZOdua7ibPisqcezQtYTxsy5Nretbbrrgv1hTtts7xQ
qGM9x8apurVXrPJax6pPRxfOaDJlWV0nBTeNRSwOu8T/yHhux+l9x5yUyEpCGTPj
QKg/53BqcLk/DGWKxUyVx+jO05HpwLwmlJxAi6WgpMAPi9w9PYIwChAoN6NQPBBH
h4Fv5YrDRTz6jbDFnpCDKVK7kTORVnKiJKH8mw1CrrGEFjww75iD6+9HfMdw/yTX
dzK0i/tPVq/S3GGlqHliSPeCPFsTkUPvGGGpBKeQ3Kx47B2cBWdqjOUl3xuam8h8
kJEGfvTt9Sd5KmuWmHUWsIkKJSAufPaLEJ/xHfbUVbKUwtor4yU=
=320b
-----END PGP SIGNATURE-----

--GK1lTicwtQxLICc7--

