Return-Path: <linux-i2c+bounces-3478-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE28C3E25
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 11:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0B87B20A8F
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 09:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3C41487E8;
	Mon, 13 May 2024 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iGi0xfIm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5AF1474B1
	for <linux-i2c@vger.kernel.org>; Mon, 13 May 2024 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715592658; cv=none; b=VqoamT8Uk7VnAP1qTFX2TOGJYwrqJDUXKk7N50AHLqOBH7i9kioL8Y53AXudRdpotXdOEO5WK/8yOQhWckjjKFO2umNcUxBVX0ZtZktK7OnayA2DBEHOgb4LQH2weyH1dIQf2bxWJ+W6u96vn5JFxzy5/kawThMXK84m1p+Yivs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715592658; c=relaxed/simple;
	bh=BAF/xIb1E7qisRIyY6qauTrYxIU/5DRCX5f2FaV81Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJI/0xDFanf9lrw+Uhk/rJSvNUSUWz2Vize7s41dpVjgSwAExR7gXS7c2AfoO/d9ZMlDzE7nDpr/7CRaKPi8n4FM7TUPK1lXY5tt24UXoeE6cgHVoMCzXY4v5RKtinhhNW58Iy+yiFSmBMdvk/WT8ubxNzgcaylU+ETa96Nj8Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iGi0xfIm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BcGz
	rPlqRyCOwTa9nHvRCWonIpRGHhg98o8RAugUT30=; b=iGi0xfImngJdOA6htoCf
	UN2G2VgSxklTU6dJ6DzaLxrf36e3gRwVamJe+JAd/AuVKH27R5R07OX6vwRzKfXQ
	AW9a+GuETnUMX3auwk1/QmpG3ZOU8lR3wnhJP7wa9fU2COugQ14lmBiDkgi49SQG
	SkjPHAHOL9VoYSCw0E3DSN3PQe56lPP1SsFqo4RTSMvEU9NB2MP3dCz3UX0I1qwz
	n9dtCyJ6oRSCaVMqPJAwcJR5RdqJdE23H653oed9TXjbZdoB5x/E8cZKGC2Yv/1L
	vk4gihy+R1QfuMriHAsnA9f6uvzxwwvtjpE5eUwaRkafrnTTVzVu22NeXEbOrdIG
	EA==
Received: (qmail 2085793 invoked from network); 13 May 2024 11:30:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 May 2024 11:30:45 +0200
X-UD-Smtp-Session: l3s3148p1@UkgzilIYStVehhtP
Date: Mon, 13 May 2024 11:30:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.9-rc8
Message-ID: <sadxp73tm5zhfgsv6ufroexcoq4cg4j4quljry4bsojkzniw4c@m5mhet2w5f5e>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	Sai Pavan Boddu <sai.pavan.boddu@amd.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <pb7vi7igdvqo6jlyjrd2lhfgbrz2kx5nmmw36vcdy64ndwbs3r@e675jdrgq3lj>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ywwjpquvue527sft"
Content-Disposition: inline
In-Reply-To: <pb7vi7igdvqo6jlyjrd2lhfgbrz2kx5nmmw36vcdy64ndwbs3r@e675jdrgq3lj>


--ywwjpquvue527sft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> after a few weeks, we received to patches marked as fixes from
> Christophe and Sai Pavan.

Sorry, I was away this weekend, so I couldn't get this into 6.9-final.
Yet, I think pulling into 6.10-rc1 and backporting to 6.9 should work as
well.

Thanks,

   Wolfram

--ywwjpquvue527sft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZB3cAACgkQFA3kzBSg
KbZMjQ/+P59NY+oFi7WTaq1L1iyWSdALKo6Y4bovCkSdf/rBgRNqhpr4DfBRBAbs
3+SPeEHIFjLfdBbEEqbw4vgt9d+RDHglMQb0rK8qMoWO6+RHTjp6FdzdlmaY/jiU
sXtgTkb730ZDasAqn0jvfApj40FJi3Z6KdZPWdxonocShZ7oe5EKx2tflWjJeV2g
L3I3DyP6iA30zs/MlBZtBm+2jCzB43QevLR62H9wrnE9X6ieMWEbD5J5iLq2yMjY
lAX9RGGks89vIbMdEgfu9fm1YZGvjcpGDpfzcB90TrPdh1E5J1mP+aTfiApsreFj
4TKZUEpcb5/iuREcsKNv7L48PjNV9WiV/KB+GYFGAdB4fG9/8ps1sRasL9VZKtNv
g1MgJB0aB/IRhP3jt1BCXuMigZPWBBXRwRQOjw03vJ8E5TanHhG9cU8ECBMbB5zl
E9HgUc1bdkSok92gRxncIaDwXJzoRm8SQT+q/cqm0LmzQ3fNlAQRW5LieEIbzOtF
8SqW9xpkddazke9ucIci6NTaBmQiijbHb51VDLGN+nGTkAVnpuH12mi3aq36xHPo
gDnFLlGpdjqYE0CmuoL1bf2QUL8mceq1uba7X9XMZaxG8JvvDxjNxG2XgJ6H6p+P
LQEdQaTgHOr1mWLcGpA99URMxPnu3DP4gYIkKSm/7uHaATIHG78=
=pbvK
-----END PGP SIGNATURE-----

--ywwjpquvue527sft--

