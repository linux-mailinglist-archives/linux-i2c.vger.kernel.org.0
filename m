Return-Path: <linux-i2c+bounces-9478-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC51EA3980F
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 11:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A65341894DCD
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 10:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A500A230D08;
	Tue, 18 Feb 2025 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XsC4gIeo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24136653
	for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739872970; cv=none; b=BsricjGw/3T37UtpDJmlukiTlozThcVr/HfwhR5hdSTkj8nRZNzPuANrlvJr4fuz6kwnPVEDlDZmqPs363lBANfBuLo1z9F4VTLSxagozFoSN4QRz9MMg0DvD7f+sNwnB5Bs2P1J3+6Z1U8o8yutN2ID8tHsHNwgd16suXDwgUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739872970; c=relaxed/simple;
	bh=6vetKfh7RFoXrrPsOICTwJZKw3RV/gvF5pqKZT0Ib54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPo1e+mvFGFFWXSSddoDOC/EJ7O++I7VlpSRtoBIUzGP4XWmfiMVKE7rEQSu/GCrXLpZC/YeCeJlN1q9a/OeyBkwrIEJ91gsQwmd9VgNlG3Kr4gD1mbqjS5WtmVxCZPpakuHmFko/yydWKkuPUetlBPSu0F7wLVjW402/RH0yfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XsC4gIeo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6vet
	Kfh7RFoXrrPsOICTwJZKw3RV/gvF5pqKZT0Ib54=; b=XsC4gIeoUOCWHpVzQGN5
	/B0m4jRTxcDu8Rqv4oPcoQowpsXzze3tK/fRxVjPe7XGqlh4+OwyOzoSaUlevDpZ
	481u72X/kGD48YtBdxkMTD7/t772KoPibdb78sDJWNYq91jKrXw7LpXTCWI2zP5h
	iZof3PS19T5U8bIolZDpqd285GwewkFj6+0CKajLk9EFRdah5GSkCQYkrzTvLz9i
	dx2zKHGp843ha9gmB4coJqRTr1sshK+1zKcE4jdjFtJGC9sV3pbijF9Op9JIDCU/
	CAqo5xJJGbZnLnTc8xjLILDvXOLfYgDdqzW/C9hBPnQqioPPmsEQxjr/lZ4N10Ma
	Ng==
Received: (qmail 153260 invoked from network); 18 Feb 2025 11:02:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Feb 2025 11:02:38 +0100
X-UD-Smtp-Session: l3s3148p1@xx+fvWcuFNsujnvP
Date: Tue, 18 Feb 2025 11:02:37 +0100
From: Wolfram Sang <wsa@sang-engineering.com>
To: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: i2c-slave-testunit over i2c-gpio bus
Message-ID: <Z7RavX4Ro26AZJir@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@sang-engineering.com>,
	"Matwey V. Kornilov" <matwey.kornilov@gmail.com>,
	linux-i2c@vger.kernel.org
References: <CAJs94EaOtgzVnPArj27Vupobr1jgDF3-tS_+29_RfumL7TO2BA@mail.gmail.com>
 <Z7RWcBxOvNpSPmWN@ninjato>
 <CAJs94EaBRDkx5grA2yC=e_Zgut4RK0ZGQnUS2Vc0fABTC9UJSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lbx+JAEoesaRQnlV"
Content-Disposition: inline
In-Reply-To: <CAJs94EaBRDkx5grA2yC=e_Zgut4RK0ZGQnUS2Vc0fABTC9UJSw@mail.gmail.com>


--lbx+JAEoesaRQnlV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks. But isn't it possible to attach an interrupt handler to SCL
> GPIO? Or do you mean that the latency for IRQ handling is too high?

Way too high for most systems. I made the in-kernel sloppy GPIO logic
analyzer. From that experience, even with constant polling using an
isolated CPU core, you would need at least a dedicatded 300MHz core to
monitor 100kHz. With interrupts, it will probably be a magnitutde more.
I scrapped that idea for the above analyzer, too slow.


--lbx+JAEoesaRQnlV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAme0Wr0ACgkQFA3kzBSg
KbasRBAAhgDRLiwZPUOdU8QPODVs3DUlIRGbPPoOuUO0GT/lNhs7RNAjHndrorF7
FBn79zzSl9Up2PpbCRJG+g+ZppMV8h0T5G8PPs7sHCgoozRaCkmlXCEqVd24QR6m
6T3rjuFD8ijZ5zmlnJNcOGqieDKvM6OIv7veGCwcCY5iHAEuYjiJQ82wfiRgdZX5
cOM1HgFtYGDR415QGqfQwZl4ZG84z7yhG23JserVl/YcCYKsZQapeVMDV7zuH+Q/
zQmfy39ATCXOwDa18zfhdpwzfixQwBzDSG7a8BngWEMrkGkhfvg0NvPeAdnlyIKn
aZtCkgMXv5jv2v8K+8akSo+baaOV/Y4z5vbdXmYgqXqWY1p9KuV1MQe+tVX95RN+
XNuXS6PDs6HFWNCa+DYn1x1gDf03hDkZM4aRPxmlCHMD4F3V4LHUpKoKVcr77JBw
zWpCOaiNg0d6zc3+TV1Apf2JIC4JB73rOIzxI6V+WgzDSSg9iVZPgmS90HyPQFIp
xU+pHORguYMdKV8tKQt3S7lgFOGI4rXFCohxn/AwJZ2OLQzloBZ5ei9fTKUnvGtk
k3Vb+ItuUVdC3wEyA8UBMpwlwvwKOGeQO+naXUAWGJCSrLP+nFWauZOlquErkPZW
C/SkVTXZJL4a0D6ChPF6ngFVBwxVsLfu2FH/TdXBzWqX4+LxKfI=
=hurP
-----END PGP SIGNATURE-----

--lbx+JAEoesaRQnlV--

