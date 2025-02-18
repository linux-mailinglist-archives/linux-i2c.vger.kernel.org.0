Return-Path: <linux-i2c+bounces-9476-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 847E3A3976B
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 10:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6A683B1973
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 09:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C64B1B4F14;
	Tue, 18 Feb 2025 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UJjg3al9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B294418A6DB
	for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739871865; cv=none; b=T+3CcU1r5w3DhHLGAVACWU0v1o1SC/E1x4xGl5Cd7qAqmQBXuz49If+00KwrLPSg0dvp0lObp2Jn321TjXIOL+eozFOspe4GuzbLj86qjMT5T1FXhdVSAwd8D7soyBipRc9QTwzaN5k4BjZgMk0fTAf/dqSZlKMzeQZqH2b6Cs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739871865; c=relaxed/simple;
	bh=qoi6LxEMpalgU83ggujCJAnnrjOnCDKocBPLLQqmkkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRQAhQqkXxQ4NVC17wUD4zOZam5o/4IrBNNgwgV/hLU5sEKda6FYeFyWsOlzEALeJw9ohYUJ2M7DsFqhhPdqTPPS9hvyeU/32MMUpCSOS0VrDnrGguMBuz06qDb/llMG0KmcL4Hc7hxLtmPmH3nqX4FXcHFuywcLPHmEkusLmNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UJjg3al9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=sB8S
	Fwu5nSX9nIjlJJh4sQrSMnzRHvLAbwRX6fcJQog=; b=UJjg3al9zfqIhi+lj69U
	HnzpYQ3Jlj39bJMW+69QYIO7dUwawZrWCRFGt82UavgUtBIuqvrHiFhZjhgm/h2r
	5gc+9YU6muxUzTydAvxYxRMAS+J4R3Z5u2DKUWYjGdX5JXBeSIUdpEZc5sJQn/b4
	qbpNF0YroU1ri3QzmXBXLbvBjxk/ww3LYx+tTaCUldzrKIQ0oOigNQxTtGiuHhdx
	HAzkN1YNboYsPMDdwp7//KjeZeR8ux3DeLFMIdORh2vscj/9OWO7COUB3H+X4VH1
	yej89Dm68E/lcW6gK5INm4KgXve13pnmTuAjtf0H9z3vO2EIqx21rMJXt+wDKscO
	hg==
Received: (qmail 147627 invoked from network); 18 Feb 2025 10:44:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Feb 2025 10:44:16 +0100
X-UD-Smtp-Session: l3s3148p1@CTfye2cu7MsujnvP
Date: Tue, 18 Feb 2025 10:44:16 +0100
From: Wolfram Sang <wsa@sang-engineering.com>
To: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: i2c-slave-testunit over i2c-gpio bus
Message-ID: <Z7RWcBxOvNpSPmWN@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@sang-engineering.com>,
	"Matwey V. Kornilov" <matwey.kornilov@gmail.com>,
	linux-i2c@vger.kernel.org
References: <CAJs94EaOtgzVnPArj27Vupobr1jgDF3-tS_+29_RfumL7TO2BA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L4cC0L/73LFVXQmV"
Content-Disposition: inline
In-Reply-To: <CAJs94EaOtgzVnPArj27Vupobr1jgDF3-tS_+29_RfumL7TO2BA@mail.gmail.com>


--L4cC0L/73LFVXQmV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> As far as I learned from the i2c-gpio source, the module doesn't
> introduce itself as i2c slave compatible. Do I understand it
> correctly? If so, would it have any sense to add i2c slave support for
> i2c-gpio?

No, i2c-gpio is not suitable for this. It would mean Linux had to read
the GPIOs constantly to not miss anything, e.g. the remote controller
starting a communication. With all the latencies involved in running the
system, this cannot be guaranteed. You need dedicated HW for that.

Sorry for no better news,

   Wolfram


--L4cC0L/73LFVXQmV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAme0VnAACgkQFA3kzBSg
KbbDRxAAjXx07ihBDBkE4hyjTovCerQvzTSFiwsmiejGQ4C6IPV8yQjhu1Ms1N3n
jl3TfXU/4rX5doFKP6K9ud/wxDQw6lUbOEB4ERhrGsSd+YNKAk8QbkbUrHpUeN8v
nHkmMPMdePDkl8QnF1TXLiLypmua9yv7OOEK+Y1R/s60jYvFWEziK0SaA0HgC3TZ
XucrazTKqltvgI5eHBhBKgPYXQYnCaNhvxWe1m3Z++2b0yqdvTMzJDex1pJjhfKA
hT2B/7pqgdKYYbtseazbZzIJixuczdE57u72MygFPPPdnQF9IK0d+M+MLVmPXNwL
Izlf9mAGWQ7F95uvWMC67GCDVY9Auei5Buk4/Sct+cdg29+2KX63ZZu05o3PO3b+
YX4EHQjMEY+lwzOvBaYwC6YRQbwzBB7Wjft6NAI54RaaWDpTXONFh7fmaOC2dpF9
qC9FzJUinlcWK9614crqibKWz4C1P4aKtKNE0aHlfB4gNtO2XE6VBdHf7X4NPDlT
+jl92rdqMf9+V482RHljjpENjH6EUl8zkAcZRfNLbtHqbSMvGhHYHAyMXNAPPw2N
aHkA12xSJEYybYkQuXjDIeb37GxQGzQEc1DpAsT9/U9O1SrtIYWE1aCrvXov4iCu
ln5xFebgOIeRc5espJWlIOxZB5uoPz86zxgPl7XJFrhOvlGcmJY=
=ZI0d
-----END PGP SIGNATURE-----

--L4cC0L/73LFVXQmV--

