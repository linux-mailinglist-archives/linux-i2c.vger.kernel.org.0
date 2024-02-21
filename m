Return-Path: <linux-i2c+bounces-1898-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABDE85E469
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 18:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BA1A1C22DAC
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 17:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5888681203;
	Wed, 21 Feb 2024 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDcMzBDU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E171DA32
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 17:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708535996; cv=none; b=k1a7Ijv+5GljSed3fEBNg5XaZYz6wbXnE9dLQ1PFCGWs1AT5WY7fuzgsIjXlSQAYYeNL5PoI0+Ol4wnZ70TQ90RqltgDCm/HYhcnoWucqQTLFRx1ugdBvWfsbPYG84tnCAOOAQqoWkU/HIdG1u+OiBpnFqpLBHBcP1MzV4cimNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708535996; c=relaxed/simple;
	bh=dnLCuFOs3c+GPF4FRwsf8lBsY9aDG/PjqCo4sPv5sDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gB7ZmhFAEYxKvP5Z8+m2M7zimJzQV60lr05Vxi4OnxIlfOoM1M3D8GLIGveC7AuNwolUt3xiWOCDRyWrH79/uqSpKnJuonkDIkRdaDTQ+gT0aWbP+1SKYevWPkbAJbSGDc8Vx8oBKPZ2YgFPr5L6957meG577arg5f/ZBivxq5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDcMzBDU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1B9C433C7;
	Wed, 21 Feb 2024 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708535995;
	bh=dnLCuFOs3c+GPF4FRwsf8lBsY9aDG/PjqCo4sPv5sDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDcMzBDUXD/f6TOLBLvS/kDeriT/wUWNy9P/y+A6TJzqJmueAVMBsFte86XWqagGS
	 W2rkOG5wPn05jRpWE9GqbUUcfOIRrfvUQGeGAY+KheqR5zzBqupuQ77mUlVs5+Mx5i
	 zV38wf5/saEq1WRiARg06wXTewaacW4eImbIHBUg/j6VLR5u38rNxlyHywc/e4b1aD
	 4NSi08iiKT1zYTmlXyoiysYgwPqpvvwPI6m3fUiXKixWo6qs9TpiMpCBjk1xdWsi0q
	 UuNotrodsaP3QC/Q21TmZ/FcmijTqGcOdroZGWAnNCPAly80iAqwMQeg8aCx3GnOcq
	 q8oR2Ji5Ibuew==
Date: Wed, 21 Feb 2024 18:19:52 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] i2c: Support i2c_register_spd() on multiplexed
 bus segments
Message-ID: <ZdYwuELMH0r8EFU7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <9f37f64e-f5b8-4928-8716-6d2846c2688a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iysZKZhN6F8a3BJw"
Content-Disposition: inline
In-Reply-To: <9f37f64e-f5b8-4928-8716-6d2846c2688a@gmail.com>


--iysZKZhN6F8a3BJw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiner,

> Note: i801 creates the mux platform device, loading and probing of the
> mux driver may be asynchronous. Therefore we can't call i2c_register_spd()
> for the muxed segments from i801. Instead we have to add a flag to the
> platform data, so that the mux driver knows it's supposed to call
> i2c_register_spd().

Has it been considered to use a bus_notifier and check for
BUS_NOTIFY_BOUND_DRIVER?

I'd really like to keep it inside i801 if possible. First, all these
flags in mux drivers only for this corner case are relatively intrusive.
Second, selecting SMBUS for I2C_MUX is also a tad too much for my taste.

I understand that removing CLASS_SPD is a worthy goal. So, if all fails
we could still try this. But I'd think with bus_notifiers it should be
possible to keep it all in i801.

Do you think this could work?

Happy hacking,

   Wolfram


--iysZKZhN6F8a3BJw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXWMLQACgkQFA3kzBSg
KbbB+Q/+Oq60woDOA7i+AAkBZTNuN4KkDI8sz1WU/oD8n1CNSVxM1DVzPrW9ii0g
oV6NFQJGIiIyl+9cjMTZdQMvdsRTpfrTnjvkdQvVnFs9u8kt0CXL+PsNNUE9l3yj
eRcB2YnLm/u28HTJUVCSZXIdkKt391mQ070731jVXsEu87jD20Kv9U+scwdkGkSD
wGCTYdnQE5BLL4RW6hr0vzKBMHJJ453c+0rt+G4yHEKs8sguzJNR0ZOeyHi/QDu4
VjF/TEYlQsJMylM7IZ3I2gO5HMoUUZrw9mtsLeSj2mRbPotoBUePmwv1bO+llnom
i+dbrfr00SMJ3Gxy2gobq+JCSnn6kJPFiH9i6IMIX1F863VL+pU+sllaoGJybHGC
eH+AWUM3pT2rbRRNU+3J4YYkTH0v+6bs7e3LjIE+SuhtmSILmJNOTbHDHFPXs35H
9+i7wLATkapjKvUJuknWVua7Sqvk+EHnetb9CpIUL5Ta02D1ovB8KLKf0KAbPeqB
bK2iKnf0gzlbNECyeBFpS/OpKMZFplXTUHLkG04OLzmZJw5Gp9ARG4ctVp4WqTbk
kbXmnU1z8ph5IMwNcrxcXPs1mLjgAUbqjXcUcwUAPTzBLcbS0Eel6mqEe1TweK1+
G3+GVOiNcgYQ0h1Q+G+JqNudwnl/whVJXLRwOPp5zqpuFsB9PYQ=
=CZ4c
-----END PGP SIGNATURE-----

--iysZKZhN6F8a3BJw--

