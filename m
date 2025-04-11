Return-Path: <linux-i2c+bounces-10275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 650AAA86630
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 21:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B238A19E6DE7
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 19:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6EA27BF8D;
	Fri, 11 Apr 2025 19:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QJU/QS2A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8263A27934C
	for <linux-i2c@vger.kernel.org>; Fri, 11 Apr 2025 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399298; cv=none; b=OMrwpuIHl+t0UYmZ5BiHxlkj1U4RelZR2OJttHV/k36QTUOXajS+PEUmS8VCZGezY1K8gNWel23RP1qcQ4wsv2mlDuDYIThX1YyysssUVuFwDsaFgUop8yEHObCD/+WE23in3bgl4I/MBmvuj6bo4kGwwCYdf6i/7LxCSQiZ2MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399298; c=relaxed/simple;
	bh=VLj0DorodJLsW1PfHe9uJZQcECw3+7sxYtDU5mI64aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHPoKBQ7exfIm2mTZvrcWk0z2zVVSzbMr2CAP1/cs7eWo3r6mkm2ETmLi+t/HL/rgZ2O6rjVDKOKID3z1fKsj9UjruetZlB3qoSxkeYiZMqJuwao69pM/NsdQa30h/q9SN8YCuE5ELdJeVapMsqOSfmHPUeSlEo5zgbsNdD2Oq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QJU/QS2A; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VLj0
	DorodJLsW1PfHe9uJZQcECw3+7sxYtDU5mI64aU=; b=QJU/QS2AMOaR++d2IEI4
	JtwuYaaeh43p0fHCpD1J2LmJEQZXEeigpYtGfbVBzm9zbnJMsOMlcHQ1Qjlq1qSj
	RJZ61vmc3nVw9DStVKWqFdS1zszq+1BB4WW+wdthIYhRNW+d56vybAeSbaCb5bNN
	39hSSXEC0R4+qTSirRS6p9R2ijI18+bpsQ7FljpPFr1vShgNkIT36zEw7LF5ysGd
	6RJqiah8Z3WeemmuYIeSJkH/Etx+4WElmTedaDKvITsUMr29mEGtk6TGAJ49FK8c
	78M98B/h1mZRqjgrCRJ8GEiQQG2aWegummu84vikKOkUDn7U247s+wZ5KEIzdlYc
	Mw==
Received: (qmail 1401532 invoked from network); 11 Apr 2025 21:21:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Apr 2025 21:21:34 +0200
X-UD-Smtp-Session: l3s3148p1@Q8lEnIUyVI4ujnsS
Date: Fri, 11 Apr 2025 21:21:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Anshul Dalal <anshulusr@gmail.com>, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: I2C: can't detect Adafruit Mini I2C Gamepad on Linux - other
 devices detected
Message-ID: <Z_lrvUzBh9oyPPci@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Anshul Dalal <anshulusr@gmail.com>, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
References: <24f08a7b-4a3c-4cd6-82b7-0f2c9ab4bbef@rootcommit.com>
 <8d0c8005-57fa-4883-8a01-343ab9170643@rootcommit.com>
 <Z_k74yFvIHRy7UpP@shikoro>
 <57906b7b-5d4a-4571-a5b2-1ed51ff09824@rootcommit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1AW+N8H8P4bjbUpu"
Content-Disposition: inline
In-Reply-To: <57906b7b-5d4a-4571-a5b2-1ed51ff09824@rootcommit.com>


--1AW+N8H8P4bjbUpu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The driver is drivers/input/joystick/adafruit-seesaw.c

My bet: it is a firmware issue. I couldn't find the code from a glimpse
at the github repo, but there could be a similar issue here:

https://github.com/adafruit/Adafruit_Seesaw/issues/96


--1AW+N8H8P4bjbUpu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf5a70ACgkQFA3kzBSg
KbbfAQ//cH9p0V9/DG0Z7ZPL5yf+vIT9LloGtSPvdtvOnyYqZ5kv5fj5AaLiqvwq
ozsFskDV5VTAP8OKdN1gLV3iiElHLszHGBnojoP7pnRIz3BAqoRhGHSWgznRT99W
WiZZXsn2EWf/IWXLOWL6/uruL2PRd2LyvzYVIdC7jTzB0X4h2NLcaH8uHxVFW8kg
0iQHgsCSEDYpMTI2/ECAkVxpAiwg20jAain+eDCOoyk+G4XjRG+oA0s7cQTI/xB8
8OUMdzm6q7KmEpj+bZ02c2BgCJoXGnAnw5+yaYZI3PpQ8BH4TCoPnDd9tZ0eoA7e
xCgnOSDr2uRsPFI/LFapAjEwG7SGNfNOkLu+Nz9GAYa0HOFsAca50+emIELcL7Rc
7xacadWLjYO9YLAP75XHRcAbswyfbDZqSB1GWNjJWIkYskWlddghXLpwX6fg+kF3
r5Oq3eT9P3LTOEGqGpCDoQhA9xd269Eu4gJa2ae3ctIvTpM5HNw+ZVvtk/KNlAzX
DNBUz4+5RitQ+/6ggMJMAjytNNxxu+jOOrW6WPhIBDBgrgeDiX53wZlyRDmoX3/v
HDVO3nrrTMcKogsnfDC8CWzHn6nbNi1qAtdK81oWlKhTCF6nTVWmcLiTUBBNEPFg
dijRbN2/az0LeTuKqrQu7qg9prEtIkkDpb1xkSLBAD2v5rUcNUE=
=0KHU
-----END PGP SIGNATURE-----

--1AW+N8H8P4bjbUpu--

