Return-Path: <linux-i2c+bounces-3996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA558905CB3
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 22:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8140D1F24F83
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 20:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9061684D04;
	Wed, 12 Jun 2024 20:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eIxSKhzI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E225584A5F
	for <linux-i2c@vger.kernel.org>; Wed, 12 Jun 2024 20:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718223680; cv=none; b=NLl3qx7bKT1sFBYjYS39TxUjlU/rCeCb2ukNZmq6kJQTlGOFStACT792BA+7MrQDritvwD3OhSEzvbM8NvXWoEHzR9JrDkzyCoE971i4C8OyHhx+Cz+QiuV4Ymz1CkuCjRzINjCdsWkvAbP68MFmR+egOE4bORhlzRVUXWd4YKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718223680; c=relaxed/simple;
	bh=Z3LCtPuWBgt3B8PP4A93a4ldAsnXfNj/7glDIm7408o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4AYPNirRhFp0GYtqxMPWycolswVdbpJARTZz2xleyomtKQQMNvddXQPuVwdgIVon0ao2rZm88bq5mP/ktnUTz82aoJlIBj5xj9rzCIvc5RkT6vjnrtyPanxZNT/HQKjy4VElGUpQrytwf2I39c8CzUN4iJoVR3jwhsrlD1tw8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eIxSKhzI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Z3LC
	tPuWBgt3B8PP4A93a4ldAsnXfNj/7glDIm7408o=; b=eIxSKhzImrvmincnonP0
	Ocm+g2O71PCexJL8NLUWYpSdeeta1RLBbn4zjBHC67ZfhQF2kmDA2EDyryZPsFc6
	zQ1ae9TXf1rTTWkoEsiKx3TNQDszjesHW0thloiZm31SMPpeFGI/cFLvK+oRnNUY
	MMjIRz3wAXmWXqqCdfV5RFjpgDFx/hYIIC6xBpflvKbRCo+N7CkrPXFhk/UgBrsv
	UfM8d71eP1Sw5H0z1H4Df7CHLgi7qdroJehuKywgaQStnGnAbTYDmKW7/HTAtpNh
	fxnoVo44ryHYeUZoyaVfETYyr3mZj8MMcTJuvD4Hs+QoY466Zp0SUoErFtj1I2e8
	rw==
Received: (qmail 925661 invoked from network); 12 Jun 2024 22:21:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2024 22:21:13 +0200
X-UD-Smtp-Session: l3s3148p1@wq2pH7cahulehh9j
Date: Wed, 12 Jun 2024 22:21:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: smbus: Handle stuck alerts
Message-ID: <54uga6gyib76qxy3dhgsrwf4x2tbg7644m7cquc7zyw5fzphvb@y5eb54wfvau6>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
 <18c810b6-2961-44e6-b890-5c6830fde995@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="himoqd3sedg4gqza"
Content-Disposition: inline
In-Reply-To: <18c810b6-2961-44e6-b890-5c6830fde995@roeck-us.net>


--himoqd3sedg4gqza
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Looking through the patches I carry locally, I just noticed that
> I never got a reply to this series. Is there a problem with it,
> or did it just get lost ?

The only problem was that I didn't have the bandwidth. But luckily, I
need to work on SMBALERT myself now, so I will handle all related
commits around that.


--himoqd3sedg4gqza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZqAzQACgkQFA3kzBSg
KbavlhAArhDf1JESwjFul5jRxDB4Ola/uDZTDfSyw12+ISVTCj5ZV1H3+IlijZZx
4moGaQfpuNsuqXYrcKTNZ20zBx5oqBxFN7ay7A81Q4zv6CCfo+HJP/s3bFzK+2EV
cFfSMasz/QRAlN6p5Cb2YoMnxiN9GofOZYzMp0jfkksyCv9ew+TmqP6WNXaR7252
RNSSJFLROSHqedMJBp/pYB39cCXe/EnaxqDK5VlDuyFDgVulscGT5JWB38we+knP
eGa6EEEi2IwBK1jaH9NiNntD6dG4dSUQRfvfYKn7vvlcvGXdGiC3DAdYIV8HTOai
SnmwMNjCLGFmGn7epp2wQKbtoUDt+P+QnF2D6xgP5wo3Onl2SjHGq+Fa/cBOYPEv
+DxyI23EsqZ4pT6alwtGaxZ03YKEl9BSyNW+BGIUudPyRR7dxJnttMPaOFBfDFTl
Dt8+brc+PkxEqjr6Q4xAlw0yNdWu+E86HgG6bKYmXzhkCxuPgMZKdmuM8APxG9OC
9E0oKmCruriHgzOznWEsplAaSCDscJkl7wezs973/iWHRt07U4VsewOmF3nUKp9d
GRiUqfgvQcXofwc8pYoeuRgjE4hfYReJ9UChEZyYxvYQLjJj5f8DyH5RYIUnwa/L
x4zrgLZ3gWRdbWXFANGJM4gLAO9uGbV86Wp2AUBNKiwpXzm59Pc=
=Oi8N
-----END PGP SIGNATURE-----

--himoqd3sedg4gqza--

