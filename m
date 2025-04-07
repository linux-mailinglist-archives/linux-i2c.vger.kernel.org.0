Return-Path: <linux-i2c+bounces-10124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23359A7D3E2
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 08:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4BA43AF240
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 06:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0E715E5C2;
	Mon,  7 Apr 2025 06:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gmp8piJh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB9533CA
	for <linux-i2c@vger.kernel.org>; Mon,  7 Apr 2025 06:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744006526; cv=none; b=e0/MkxUdreUMxUuAURXycKM5pmLMEHGxvMRPdWnSTZjjJQgpBuzFOA17aCkpocMTe8k2HngNrfEIeAARpt/Zsz/LcKmS9kjnyyvR4dSbaDS+pCOlCSHQw6pmUzaPp5wpKbsnkPv8oeKYxayuWJVAi3XDoCM1ir+wJZUaImSTA8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744006526; c=relaxed/simple;
	bh=yP+x25/g1Zht4iZEgFA2Lh6XuxhZBfNgO2iyRpPLwxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPvaa3aiUAmAKYNfYBsH/aE4dxORqZJcUCyUob/Ereaojv2fJ+9IbrB2wm+e+Bp+E4cUyw2v8M72h2KNtHo/D593PbrH/K7F+eExgtggHI2YelRmtqZsYODO92N0SVBRE41W1P2pUgeJFsZ+6Y4Tlw6ACFqxFwEZmdp++aukjCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gmp8piJh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yP+x
	25/g1Zht4iZEgFA2Lh6XuxhZBfNgO2iyRpPLwxM=; b=gmp8piJhPZkHcV9LXBI9
	HGiPJmPeF2w+cbsjwLwZVkzTFMsupGXKi7VREQPaFOixK68U+wR41wFoMZGn5Yaq
	ywcOsrCAKt/AXKbFZQgey942NDE8LPy9PsoJFS4oYpyTwYO79pgLNMV1gb9P/L59
	XUQDW4iiTt/UBAchp2qYJ05t5oodnYqLhLUzIwXi0cZlSYCdiX2wXUiwmiUJltKe
	Xz6Lr+viu5Yo2cnvH86wl/KzDUzA86GCc0BcYrju0iky5W+WzSyKFzlnMFZcrM6S
	VgmfEHU6dXEJ2THhPyLwwMSVQBLLB//M38N1KP+vhYWgcFjdfkPesZyByIin/7Wc
	fw==
Received: (qmail 3679138 invoked from network); 7 Apr 2025 08:15:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Apr 2025 08:15:21 +0200
X-UD-Smtp-Session: l3s3148p1@twIxKSoyLOogAQnoAGhPADT4hf5MsYxB
Date: Mon, 7 Apr 2025 08:15:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Shirley.Lin@infineon.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
	patrick.rudolph@9elements.com, bhelgaas@google.com,
	ninad@linux.ibm.com, festevam@denx.de, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	Mills.Liu@infineon.com, Ashish.Yadav@infineon.com,
	Ian.Fang@infineon.com
Subject: Re: Update driver xdpe152c4.c
Message-ID: <Z_NteUAIeuDdDPls@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Shirley.Lin@infineon.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
	corbet@lwn.net, patrick.rudolph@9elements.com, bhelgaas@google.com,
	ninad@linux.ibm.com, festevam@denx.de, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	Mills.Liu@infineon.com, Ashish.Yadav@infineon.com,
	Ian.Fang@infineon.com
References: <3f7d0644a1f844b8b3ee9b3139b85339@infineon.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="08dv/lvaMeHPiplj"
Content-Disposition: inline
In-Reply-To: <3f7d0644a1f844b8b3ee9b3139b85339@infineon.com>


--08dv/lvaMeHPiplj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Please help to review the attached Linux Kernel patch for xdpe152xx driver.

To shorten things, you could return -EAGAIN as an error code, then the
I2C core will retry the message for you. Within the configured limits
for the controller.


--08dv/lvaMeHPiplj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfzbXkACgkQFA3kzBSg
Kba1zRAAn40S++gvFSuqXktSkp7Syc6yZRiDpThbL6GBEVCEnc4F8LChR6UXZveg
PXhLG0kYlLxiSi8rpeUNkMxvroDaw520Zf+Z+KcvRM4kJuqQWDL+EwBYVrlVr/Zi
gNMYwbncrP9BWRbyl1CdPXRk6KKeF6SKyhGdP4w9cUp3MiticdQSeST+9WdBF/ZJ
SNCzeM1MT1s7KHiJ3AghFdCsuHDisKa7BQ9XhDyECZd60UdH72EcXk0SMesXKe0U
oJGk8/di1vuNp8VGogZdiagAfyn3kATopQq5v3XbJBIPX1saMBsldITUKTYdEDxx
6ql5eA/YNUvNkpH/+nJkbGlC5PPlgkEnzfNAyJzxgtD44t7n5McsEPiSv9AwvMtO
dsRzhWcXx/DAqEK3RZyak3WGG7zAcCnuWQq4+tXr8cqQwzsrbh8OTRjNPbgMO2LQ
X4E+rmIwj/vfW2jscFwwLGyBgjkNnjbJ48z3UMXuecYB82278/TVuJ1xcL4kegTP
thJPuP/iTfDbp/5obcz3SOUoJ63ZNRhVfr2ecPNYTKR1SQaJpFP4Y5dwJhCgNclc
VsfFptDnB3lQQso0yq4fXx25ON2XBtFyuHeG3OwNWbGjBYlm9i8vtNIXlKV1dTSw
E9kt+G6uxxlk+xWvGf1R612u5Zv76ZrkjXBxyUg1Ey5VZEoi+3s=
=ciG2
-----END PGP SIGNATURE-----

--08dv/lvaMeHPiplj--

