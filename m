Return-Path: <linux-i2c+bounces-4951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A0D92F59B
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 08:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B39871F22D91
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 06:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC1113D601;
	Fri, 12 Jul 2024 06:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ItZhMV1s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66429339AB
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 06:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720766057; cv=none; b=hRUMsu4H9eEhqPtkagKr1yaye8/YAodQ482FtEHMPx4xlJ26s6AiWP+8QOz2KSwRBA/nMplmS6pLuuHsdz7rKKE6zr4xbYYSNxxxHW6Tka1XM9In1kxdbG3D7LWhCIl2yHDTZJuknzcollUsJgMn8CRgRx/UgP/o92jW0GxiYlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720766057; c=relaxed/simple;
	bh=qE5WNhqkcyor/YY7ME6FLDIzgVykP89zYw6hRQEWuw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjM7XKEA3AluFbHOaMRdJ1juZdao5Q6CiJEIPGAurFFwcC8xfdCy07hp8Qb0wmWInWbTo9xob2UWfkwvZROogwdoWYUAx0rupYfo0a8goJbSsdAkM6wNS9T62z/AM7wx+u+h/8x4cPPH4D0nxsMBZr7DiC5iSqU5KdIMec/4mW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ItZhMV1s; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qMwy
	j100TZiXpEG1RkEKy9X56Sq1twYVjHIju4RLaFo=; b=ItZhMV1szYGS1WAmXbFR
	3D3U0ITPsuZvoYTG+kgCBPNlT3NKNBEQ6I4k80QfCn8ZHMWwVU45AdI3YzHY4O77
	Wng30gi0zKJnKAnJRTrnGkj9yoNCj6pCezQ0KoBgKPN7npgl2d+lCBbwD5JNYQoq
	/og/oef8+jyAm3N8sEDt/R0fboin03ekCop7YCPyjlZvsTuDH5H+uBMGmbAZrXXI
	NLR+evTRZSXR9CqCZYkv1z/kxkC+bPWNJfxARtl911eeA/CNMkiCZOUsLhDnwW3i
	PO9A34o0qQL7Fcgky41OKFZqddNtJIzCVfKXodcyJT6TYCnSSSGPJKS7cErp1kBQ
	oQ==
Received: (qmail 1055845 invoked from network); 12 Jul 2024 08:34:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2024 08:34:11 +0200
X-UD-Smtp-Session: l3s3148p1@b6c7EQcdgIQgAwDPXwmZAIsFIv4n+Dpm
Date: Fri, 12 Jul 2024 08:34:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 0/2] Cleanup the MAINTAINER's file
Message-ID: <ZpDOY5KKee93lToM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, virtualization@lists.linux.dev
References: <20240711231927.3103820-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z5uXCEPNnIb2FR7S"
Content-Disposition: inline
In-Reply-To: <20240711231927.3103820-1-andi.shyti@kernel.org>


--Z5uXCEPNnIb2FR7S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 01:19:24AM +0200, Andi Shyti wrote:
> Hi,
>=20
> while reviewing Wolfram's series, I received some delivery
> failure notifications for e-mails that don't exist anymore.
>=20
> With this series I'm removing:
>=20
>  - Conghui Chen <conghui.chen@intel.com>
>  - Thor Thayer <thor.thayer@linux.intel.com>

Fixes for these two are already in my for-current branch. (And the
patches were on the i2c list, Andi ;))


--Z5uXCEPNnIb2FR7S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaQzl8ACgkQFA3kzBSg
KbZC2w/+LZgnWmlJBwxQh5TSmeMsk2dilwE2eiHsoXwVM6TaE9idkTF8nwm3wGOZ
0gk3iJD5XHOwHkPuUK0S9qnnDnRWsf2lR9sg9MGLnXc5i8PTvO7HHEGRxBrApi61
FTLg1OQCZUDBaRT7Pf6Yqb99dXMvlVRkdoojYsCTbqY49YDPdBhS1989f4hfXeuw
FQLAH5oJ9DrpfylZOMRiCXhsGmXCb+zpcaeJo3rR2jaJNyfKdBKBEx4CiYP4Bcrk
DBO3Bxt9xQqjLyUVQXvwWntrnSXpyadUYEVvAF8fB2v1x0FYeKLc9DPEIZuX+XAw
aKpjTMOmHwjWkXoTdT/0HphfE5MRJsqfNnpOJXyyM+Z833ty5JTT/+BkybDVaE9q
330Dolj9RFVE//+/Y34bbmb6wfSmbX8L4R7NSSC22qsCD1VHqcMnFsaacE3/CrpH
pJyAvmZ79NhPoPsj6OHkP/4xYw8thbwXzk9kv9k8EQpr1JgI9BL+EKp/DVHB6SYJ
7nHDtGM2MLEkjzhgYRbEFQPZKfRf8OZzjUT7HRwhDk1DhqDjItjbnJ0js0lGtAR7
IWbdYpdxBvLx9xVhfrpxFc+TJLT90i3qz2dSIWm655HpsBTV/I9FW3pb+Qb7Q52Y
0luzSdaNkNUrokqW8biZflYENJ4Hadacfl4ZTc+wx1f45QZesqA=
=1rBW
-----END PGP SIGNATURE-----

--Z5uXCEPNnIb2FR7S--

