Return-Path: <linux-i2c+bounces-4329-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D91916385
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 11:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FAD41F23B9A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 09:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC20149C69;
	Tue, 25 Jun 2024 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TeViRHta"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659011494AF
	for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 09:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719308867; cv=none; b=SxYUSzQQQzhP64NTztO6tsW9gXa+kjl6pwnMvtjaAbTKDQy+KVfPS8TRLgZxxSTxM3oCFjd7suQCIZ7esYU6ALTJqtMwZY8aexpjGyir2vcTzi6ooGYlwvUZ2/Chr+/20zdcupF+2crSe9Az2DC//7m4324PxvEW0Ga4Q6F6pFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719308867; c=relaxed/simple;
	bh=e3lvolvxZ+UC6hfoFFhI4UDFSzt40WwifiL+2H+1HpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4yyBqMM8S1/QS2qQayr6XLUoiIGKBiCgijZFRKDkXvPuczsXmuXJgycBZbX8lV2T6MgWLBgDtfgQSiJPynFG9vO6X0gK8EF4m786gpe02i8WlDBID9YxEzMGZyKvY5+avPpVsXHHt8+ZlBwZJT4bRCBTTF+CUgAow8i6GcSTLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TeViRHta; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=e3lv
	olvxZ+UC6hfoFFhI4UDFSzt40WwifiL+2H+1HpM=; b=TeViRHta/v5iLQQTZ4iG
	iOjVPJCoqA0b7NcdpEc1Kbc/ocxDKQQKKmXoPKlGlV9hnXMjRv3uHI8NfNFTImxv
	bMi90gwAlfx/5xq+s3cCukgHPqwYuikRNRFgcpSCfJN2LgJYLTtrQTZiU3YUE24i
	s506x8y6XU/1EHZCAmvwlTxd4cuzfa1hg9S11IGeTK/RHBJMUuuBfkKnHvBvmKMJ
	hnxIbIg0HweTiRfOSZU08bBCHWoMiFMsJAU8pSUZZVcnoi/zvwPy3UY+vzsHkE0W
	iwJYrBnSv6HquAHfwL7CmUrl/q1eIaLvrk5KcNZafNO5h9oObQQz2BNQcTmtAlFU
	3g==
Received: (qmail 177093 invoked from network); 25 Jun 2024 11:47:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2024 11:47:31 +0200
X-UD-Smtp-Session: l3s3148p1@b0NWybMbyt9ehhrE
Date: Tue, 25 Jun 2024 11:47:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <rb2fmtnhaqicg2behqfijfypfsvkqatud4h6klal77u6scw2gp@cznyn5vof4x4>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
References: <20240625083131.2205302-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="khtvnfbzgbwr2f6e"
Content-Disposition: inline
In-Reply-To: <20240625083131.2205302-2-u.kleine-koenig@baylibre.com>


--khtvnfbzgbwr2f6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators.

Any preview/RFC of what you are aiming for with this one?


--khtvnfbzgbwr2f6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ6ki0ACgkQFA3kzBSg
Kbayrg/+L0TwjHkMq1Mkk6Ky3+yr1aIguktyA6jozGTlMvs26VoMmXKoyupA88zt
RH1NXb41cBkb2Gmpa934Fgr3r5ysBdklM19t6giK1x+71No0jSx5KKskFpqLzzDw
5wZZHWii+zUJ54odeZc7PyJkzAw1R3qAcL/USNsFK5FV2noPCPu+rLpbdRG5kqe/
Zc9O1zUM4urq4vaynRXgnOpb80cyUxX+JGZJW/oJkt/7prS5wxwU+Ib6bG95kJ7q
A5tcWtexAtc8TPsLxgKzwLb0rpwNweaxGPX4I2DIguQD0NLJ+EehIrd9GZonGcJn
K0wCm7xSYCxhFWZ3FCGnE+EDXs8nh5gDX7PDi4qX6764MIhwAWPG9/wPyhOpDfoz
pLmAYSvxczaKEaGEjOSfrGbMquUYxfx/RaIMAj9YiFpZT2Zi4jarLU5ScAxFWAj6
1Aib0cpyB+ZtZ+QehzvUmHdya0NNIi6KVicxpZnzRDrDQCoCwhT1zB0Zx7gzDG3J
ODa6D98RtTkUM4L5gFbCRXXGbrRO8oUF6QkmZsmMUZEHdxhqlWqLEKC54FYr9cU5
z5pWj6C8dxyQAU3e0/jxocusXJIYeXKziNK2aVsE/uhI+j73zroOifJAsum0vBIz
vxxd2i1jx7aDXqcX/9ija7gI03Q//bNGgnQ0wlRoEQeO/qZBAIM=
=MDGv
-----END PGP SIGNATURE-----

--khtvnfbzgbwr2f6e--

