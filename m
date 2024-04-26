Return-Path: <linux-i2c+bounces-3198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 002D08B30AE
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 08:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B28861F247C8
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 06:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2BF13A865;
	Fri, 26 Apr 2024 06:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Aovnyn7M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A74139D01
	for <linux-i2c@vger.kernel.org>; Fri, 26 Apr 2024 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714113804; cv=none; b=JtviJNakyOYID5tfqahkY0ZBvZ4PQlz+DCiDE+GNpk4fzjtkqajQHmZ3qCgEStmLaG1aa2MoOT/N3DD2nzqJSAKpvxDXnHzfEVPBX6vimHKG6ZmGrL2V0gyq1DOIRuREjItMaOgHNU/JVsP/EA0N0Sw2pwmk5vL+c3VIQzxMsM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714113804; c=relaxed/simple;
	bh=kYUTjB5aTSGF2TQK5XYiK2mAbOsGdxDcVLCjjxEiT0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/PdXF4Nc2OgSLReD75XtE34VkxCzG+VXhsyNHSYsYRFuakaSUQ/WKzqAMfal2LWZUHiRpNYCZ+1Wzho/jZBbIfZyOxk9yHwWndZLfUPm70jJc9XSqWVm+OS2S00s20QSBB9IuPhfQ8LLY379GfnJDbGLo2y4nA5lM30+VqP2rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Aovnyn7M; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CasD
	sRSW62tQ0fOK22R/K9pzPMmhzNCVgy4JXEF8SAE=; b=Aovnyn7MWbdMBbSTleEI
	OT32nBWdLM9tM6W16nMKlrzmXalVyqOPl15HuDb+wi0uGdK1tXnp3yydtPuTXLo7
	6TkOBfmP6ieE85J65z1voKh8w1cOB1pRXA9Kn5wHaxpskaA40pr1MljfAC9Sp422
	MvKYQdJwCvCIyzR1j+TugcLUzF6r3/aWDZ3i42OhpEe8BM2hx2mpOJdEz29/fvbL
	KrRyTerXvsNe8JhaaKl8ppNz2V4KpbUcaqM/i2RR2w+NiRaNDoEikqi3A63OGfhZ
	e7v+A06/P2UhalOZM6b7uhE7zbAfgcWqfiI4m48y4n1zqipFmtFNh1/4jOPTOpEs
	6A==
Received: (qmail 1203724 invoked from network); 26 Apr 2024 08:43:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Apr 2024 08:43:19 +0200
X-UD-Smtp-Session: l3s3148p1@BJwVOPoWnoQujnvp
Date: Fri, 26 Apr 2024 08:43:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: smbus: fix NULL function pointer dereference
Message-ID: <20240426064318.ujhe2f25r5uwnctl@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baruch Siach <baruch@tkos.co.il>, linux-i2c@vger.kernel.org
References: <4269631780e5ba789cf1ae391eec1b959def7d99.1712761976.git.baruch@tkos.co.il>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vfjx2lacu5437pfb"
Content-Disposition: inline
In-Reply-To: <4269631780e5ba789cf1ae391eec1b959def7d99.1712761976.git.baruch@tkos.co.il>


--vfjx2lacu5437pfb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baruch,

> Callers of __i2c_transfer() must verify that master_xfer is not NULL.
> Check that before i2c_smbus_xfer_emulated() call.

Right, thank you very much for this report! I think we should have a
more defensive solution, though. I'll send my idea next. If you could
check it, that would be much appreciated.

All the best,

   Wolfram


--vfjx2lacu5437pfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYrTQIACgkQFA3kzBSg
KbZHRhAAnEfy0/i6isJymatPYguBh5Lb7PTp8ZWcmS+6TvxD5sSkvus2iSdv7wLW
sPHk7s6b+dYhe3rbj3e2gwq4AbaxNZW6mkewBhm4xV1aLDkJWpZPKAcG34plEEOC
QNkcguFiMsjdQrRFk/4baS6kLKYyiMistHIQBQHrh9TWR2Ng9hP1jBWSMqlSLRxS
ZcRIWtIxaZyo9dLnkfxTrpHvj3Nsyx0oU1GP5xuZ3c/TPgBi9JB7dzYEpjhtEdRT
NFzrXPz5ICIG1zUF5SAd3xMUlIpFOj9nge9X8Yrol5DaWQ5kgCtzBkXbQWzVT1XW
2Zw0F88GBLqEIrbZa8t6HkpCQkp9u1bXIqh1Ov5JFkPfYJT3xlbATZImvC4fIqzt
VEp2W8pGqOWyTgRcs4U4HTt2ZMMyGCqPSaNUXIvr9YF5fBCHibixq2uMQza/Ni6K
i9+llJn/CzEQCcuvno48vlq2xF+ywdnh7JOYJCOS7F5V961dxd1L5hS+qhYT071W
zPmQNrWcipe+EQTqYZJEbCC23jLeiTsz6tyFrstoSRohF3oJU4KBLe2V7rBzV8qh
VFeLobrRrGVYsPmWtAbRa7FF8Hc7ndDgBmZ85ur79PJsqM4iYiq4A0YI7wBCV96C
TxkppNJtDydSrPZbI+GgFzsGD7C2jPzao8p3ZFFQGga9cd6WfFY=
=L95t
-----END PGP SIGNATURE-----

--vfjx2lacu5437pfb--

