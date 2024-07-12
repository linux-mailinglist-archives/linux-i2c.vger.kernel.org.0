Return-Path: <linux-i2c+bounces-4954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1309192F5DA
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 09:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8317EB21F2B
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 07:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C63A13E3E4;
	Fri, 12 Jul 2024 07:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IIrcofc7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B8213DDB9
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720767627; cv=none; b=FZBZjcOxzGhQPSacBCuVQD7ZebaOcAfQOWyj4h7CbrOLxBY5AJ+N2F+InrP22pWPkUAcXOKmbzgLJcwnpCFI3ctGc2B42ubhTg1cvRytFd2rejXaZF8tg2xsyzFQceTnWd1wnfRPCVsCVPkLRGeIKJL6HSUY7EUa9EEO6aysSwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720767627; c=relaxed/simple;
	bh=VNcvaiaZUWAnq8epY/ecisXA67PrNtaNo2Mvsz7wHn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1wM62Ab0ZtgcF16YGRDoYJCC+v3PKx49ObBjGKUVrT5ILGxeKWwJcx3UKMuD0xa8scKS0WrAfdHcCDBbBfMw6H2XnAyZGeNOSK3NQEoXqQSbDDxdOEZ5tqbjdnYaJRd5G1F7gjvk/bIss378Y7tIm4aQ0V5gBVDWCX9+zBEdb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IIrcofc7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VNcv
	aiaZUWAnq8epY/ecisXA67PrNtaNo2Mvsz7wHn4=; b=IIrcofc7GHfCOw90lMgZ
	6W+tK3+Yi5eJKIYT9uayea4J9XmQk3yMbcoSzrgxMeH+1lrekq+6vMeTqNVExINV
	LE4gcVRjetcLO37+tdDn4+ctHu5x0hmsOHFeb7Wuqmx7xt95bfjdL4Lc/c6vakBK
	8H6ZR+w29xvEdT8L117wd8BYqCUx+iqxxC7F8kM+uInC3sDGRqis6lDlgBw+7QOr
	ZEXNqut5zxaqPqgiRsgXU7eq57DJw+oNIsEPLSxbr105LZNNhr3uXkBeyTJHpupG
	vVED/CnQWtO+S6cgXNumHvy0f5OLtBG1xZB0sU/2YL/YtZ2hrnbjw5HKTCcvAN/5
	Sw==
Received: (qmail 1062565 invoked from network); 12 Jul 2024 09:00:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2024 09:00:24 +0200
X-UD-Smtp-Session: l3s3148p1@no30bgcdmrIgAwDPXwmZAIsFIv4n+Dpm
Date: Fri, 12 Jul 2024 09:00:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: gpio: Add 'settle-time-us'
 property
Message-ID: <ZpDUhxjIxzxfabFG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
 <20240617120818.81237-2-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rt7xgI5lf2mVWBld"
Content-Disposition: inline
In-Reply-To: <20240617120818.81237-2-bastien.curutchet@bootlin.com>


--rt7xgI5lf2mVWBld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


$subject should be "mux-gpio" instead of just "gpio". It could be mixed
up with the i2c-gpio controller driver otherwise.


--rt7xgI5lf2mVWBld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaQ1IcACgkQFA3kzBSg
KbYU7A//QCNiLS52X9IU0LMHcaXPQU69ox38bTFC/zHgkdEKzvAvULk/tWsSZRRb
33cGO7TvzAAEHbIQOC1Welp00CdY2+A5fUp2OkLlubdUjIpMbrc7ci9cGD/3qk7i
VZ4PWmjYDIezW7EMkQOFbwfH9MDRh4rqPiHglvXHCfRqVfEqcM4TB4BBE868PbA4
fSz5XI7lITGITbhGiQKKiGERqhuUUK3srocwCxApUau60u7CCyPQwpqX1dEtsL2T
aXC53/f10NklbV1oHzNHiXUBhaaTMKqH4PMl/7MuBxi4rZ4ksVMQm2U6hXhyZswb
irxDYyz6jJzUENFBNpKafMFGL21294EHXSExuzyxVuf0a+GsdRbwkafJx5QbktcS
GZHyhx/Xa4ZDl5e6kWh6QEYrSt8yB7H/MlAz5vW20xuzwmb9LJIVyv5+xUMr0Hnf
HLyFN+MC83TGsCLgtHGcLi4LTT+lk5BV1kHLoxKCX3MoOf1zq2uext9dbgBSFQwK
lTw3aHiukfNkyHrOWdOWtMC8JTcLKwxB0Rf5+xqnhPpz7EWKtL8fCW58k4CrZsj7
n+5P1BvV9icc7X8chIHLsUhMAyJdOYqcDlUdaxEtGsQ0oByqTQrM0rofLnSgpMhU
SnwZsDhhLizap7XuxNNJ+361ktfhovaxPYqfjqejkCiI0XompPg=
=BK75
-----END PGP SIGNATURE-----

--rt7xgI5lf2mVWBld--

