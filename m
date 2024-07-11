Return-Path: <linux-i2c+bounces-4894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB4792E344
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 11:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B548283520
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 09:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284481527AA;
	Thu, 11 Jul 2024 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PebdKXp6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E9D2A1D1
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720689390; cv=none; b=hoU1w9pkb0WeHnP1OlBQEj3JaCwc09uyxL760+YE9NwGlL6tSayWLvi4RG6JMlbvGdviEKqt5GC7Oty/OTu4/4SUP6SybG2r/hhNO2ZBH8DyrMHVXIJ2w8y7ciPurtI3ZFsivGcdaNDh5tn4s3zDc+fiK5myCniRCNq74BAc+NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720689390; c=relaxed/simple;
	bh=bPWTlitN4NEmj/P1UkJHFlLDBdQs9bEVDdmB6EIe/aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMszqEvMdyESBI05Gx6IfE1M5F9GsYRcsqINJERU+5rcKZ3oyMS0U/T36HmwdgrwcApr4xaTSKuTtvj0O+sr5wXUXff5tvDsOpSlHup5rqhWaoYUsLzwu3Z6radpZRtTSIzQoIPAAYNHubsDtmbcgOggFncr3HO8xF9Tp+KPRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PebdKXp6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bPWT
	litN4NEmj/P1UkJHFlLDBdQs9bEVDdmB6EIe/aE=; b=PebdKXp62IyibYV5UK3o
	bWjarIf5LCdWS2zefAgMaXN8lajxrRubbmtHJkoYWcRkX4JKdXd0uB1kNkOrizN/
	CFSxHdnfmMrQAN45aJb+z8TeGBCIm5J6Rr/jMoN3Xo5Fq2dWAI0MTQrlFBnmE5gc
	ZaXDtR9BSopfPNf2YtMugX+JSiwZTosJKWW96D99Zgx/D6PaDCDK6crQjbSGpTMd
	LiQq9wvTLavaJJP/x3KXh6Zc2pGeQNNtdvH9zH6nlE+qi/2M4HxNs2bAJzvSKSks
	o9AAvKm8ZRnM0VymaBNQhKESEFj+zlaBKi6MEEOanN4jkptoGP8B0g4KYQJVWECU
	Og==
Received: (qmail 790733 invoked from network); 11 Jul 2024 11:16:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 11:16:26 +0200
X-UD-Smtp-Session: l3s3148p1@BLCnN/UcQtAgAwDPXwmZAIsFIv4n+Dpm
Date: Thu, 11 Jul 2024 11:16:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Chen, Jian Jun" <jian.jun.chen@intel.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: delete entry for Conghui Chen
Message-ID: <Zo-i6hdoYpISvwVr@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Chen, Jian Jun" <jian.jun.chen@intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240706144150.2668-2-wsa+renesas@sang-engineering.com>
 <20240708061937.p7lhz7eho4dh5bv7@vireshk-i7>
 <Zo-cGVD_mvezDMoZ@shikoro>
 <1d339c92-edd3-4373-93f5-a612db452277@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QBBFiNt9r3moiJHm"
Content-Disposition: inline
In-Reply-To: <1d339c92-edd3-4373-93f5-a612db452277@intel.com>


--QBBFiNt9r3moiJHm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> I'm honored to be as a reviewer.

Cool, I will update the patch.


--QBBFiNt9r3moiJHm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaPouYACgkQFA3kzBSg
KbbdlQ//f8y6hkF28iFhuq3rBsC2Q4GlHfKGpLbQJtiAxlawZHoZPx66Ltv6mDlW
kyuLMBGXVLZHrguSNAaE46BxXOQdqVnZoSsDps96on2dTcOFYoX2o/FE+l0RXPwX
mmPeJ7f20iSx9qT3IoFJlAhhMw+fjqeq+rlhb7eJQ41xHJkIHLXhdrY8to2A4MUu
ooRXMKj8cl91NcgNV4ddj6dTTgLZhzvSuYJnl9eA/zHijQSqiRl3aZkrlDnf3fAo
6nAUw4jTa5kVkreG8P4ArEh+3+sG0JBXFfUGt3psLpivfytLHfUNYwvUx4k80A9w
lxmgOE9w1evU+1I7JL23PvvgQUqXfKz0dry/2maAsS3K9Y1z0ZcRvOEAFciprft7
3Eh4nm6FekCqXFNZbBYQcjq9yzPhDi/Nq+hRfK6l5pKIreo+vGuvhmzomUih40In
ZUkCDaGIkRWwq60KMw1xhM+RyZJvHf+W2tbIRuAAhkrN+9KMhcE8EKWiMQ6Wr1wW
GWAsV3C4T3x21N2zfnMlq8KEpPkzf09Bh/X8j4WmGNCC84j8HJiXK2UjsDaNnhJa
z02cD6GSmtIaGRsm4YPw7/ItmyaY71aNVxD7tqYOrkssUDTVVjnqFv+LuItjLgwx
IT7HFkqwG+XgbrNEQ9HMjm723X5rwMSeI96reAO+NLqj4R/RMN4=
=k7Au
-----END PGP SIGNATURE-----

--QBBFiNt9r3moiJHm--

