Return-Path: <linux-i2c+bounces-5045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC576938189
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 15:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 832611F21634
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 13:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C36912E1EE;
	Sat, 20 Jul 2024 13:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TSjblke9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3468405D
	for <linux-i2c@vger.kernel.org>; Sat, 20 Jul 2024 13:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721483114; cv=none; b=SmOEuk0He151HFSMgoWKteyroQy9eH4Shgp4t/oTaSAwOAcDgTI2hrsuLCo41XZG6cD4kzPZROVr/MtmMweXGpjfJjlrFGtccF8EChWN5+4zoghKvuKHIQYnhQrM8GfzlVg5pX7r+3G7EMifryisZxvQzkN2W9s1BGMfWhADsLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721483114; c=relaxed/simple;
	bh=R2gBFB8UlDqHlYeJGvV0sDAvlR9JmWmslHfaWoZkzgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sah4iUMpMiFCTX44ODkP9vG36q/oMdSkqDnjoppsVIIURhTe9cCPJugr4RmRfyeH2Rqtc3+uXY/iBS2CbX7dohDsl0uMXFx+wy/bPEqjnhdVt/jkUt5blO6edCnJXbxds/77M5YDuUWXLlFApZSuxllSpVC2e1QUi5DKujAIVhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TSjblke9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=R2gB
	FB8UlDqHlYeJGvV0sDAvlR9JmWmslHfaWoZkzgE=; b=TSjblke9vtm4gZGWPEEq
	dkjp9fvqXkA/po15Y5dyQcpk10wq3AeU8rgtBNMTUK+GnC5mCOmkKQAJ8cNGDULX
	dauW1GcfUvkYlBsIPMIMh7umdZllbRDyfyWtcA6dclJWTOuO37TItRqSQgPgv1vA
	toA3BQWyn16DoB9OKNj2EKCBz2tnJVRywoynFhxcdOIfHUFi+bs4jppEWLqCzzFk
	JpIbIdj1i5k8MuMosg+jJT4xltxqmHC3ASB7eAutzum198GSILuCC8VmPA3J/cMg
	Ora9K4h64XHEqhNVQCaLHAxg0dsUGJhz5p09pRocAZ2OPvCOugqbUIAPIFRmOZsQ
	KA==
Received: (qmail 1473780 invoked from network); 20 Jul 2024 15:45:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jul 2024 15:45:07 +0200
X-UD-Smtp-Session: l3s3148p1@xiEVBa4dhtsujnsv
Date: Sat, 20 Jul 2024 15:45:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.11 - part 2
Message-ID: <Zpu_YYAILdHLIKR5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <csu2tvshcxyz7yib2mrcczxa345m2qu6lavngulzq35b2hi7bz@ao5p3do67q7p>
 <ZpudPAKFtrIszTMS@shikoro>
 <fg2byff6apqkdztjmql4x7eknpxdokjpwne6zwyrrfdpjugcr6@joo4vdlvgb56>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U5GN6b1BvEv9h6TZ"
Content-Disposition: inline
In-Reply-To: <fg2byff6apqkdztjmql4x7eknpxdokjpwne6zwyrrfdpjugcr6@joo4vdlvgb56>


--U5GN6b1BvEv9h6TZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Oh, yes, I wanted to separate the Reviewed-and-tested-by, but
> then I forgot to remove it.

Thanks for separating them. I prefer that as well. Maybe time for a
script? :)

> Thanks for checking it. I updated the branch and the tag. I'm

Pulled.

Have a nice weekend!


--U5GN6b1BvEv9h6TZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmabv10ACgkQFA3kzBSg
KbYeCxAApDi5FfebnZmQaPY+1KK8iM5zLb+E/7l+d1xvrwSGcXBEy67FC7aQE0+E
TSd0CKqp00YpZbGBkL6t2QUofE71CtiZYkW5GM4K5GIln4+mUD6KZ2YvpGLTamVu
iGHj6Tz4oBa5XxHwENd1qMr85tG7DALyoIP9CdJTXcshlHLdmZjRo/aK4cTevQxJ
vkro298xjL/fsnLhrqjEEJ4WSUAhnUhumGTa+/A3USG/0ncHqmZgCKfTQ4CNYNMy
11W8pyVolxjTaGxphx+Xk0fjREn5A/vQsQXBiP00CweQFHTD7bJyn/wOhAnJpYpE
USODKjjDe4g/7Ta4LLsJqC6WWFoxPHRw3U4RT4RhapQTltFabngi8soVWJbTCqHz
Z/Xsv/v1/cGkW/tANAPFmrfA6WJyt98DfHTXI9QjvDihcAxf99Af8jRwzIAx7ul/
HTyrYm18dCLgAPDhmW5lh4aC0OHcT8znhJKV28tkiT0zQYeb6QyhAYVCQrtCq8TT
Tsb3ARQhOZbfcUU3N2wGToAZvRXZHrb2X5EHqlSh6dq3wDfy7z57qfL9x4ZMnmhh
Ua+tZL8benbB4oXilb09mtXfnCvsFI6ktC8pmZk6bzZHDB6I+iR1z1gnxjB1u70O
eyjPLNnBHPMZqXOn0rhZWp+d64ES/5oe9YSsaP0JXnG+ivd+fTw=
=n98G
-----END PGP SIGNATURE-----

--U5GN6b1BvEv9h6TZ--

