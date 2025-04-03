Return-Path: <linux-i2c+bounces-10091-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FB4A79FA5
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 11:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 226811897B8C
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 09:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725DE241CA0;
	Thu,  3 Apr 2025 09:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BjQUw+rR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3761F0E4A
	for <linux-i2c@vger.kernel.org>; Thu,  3 Apr 2025 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671240; cv=none; b=T0IuV0cq6AZLWE7C5l4RpFnCrsTtMgEfSMVDOC6BJsV61R/PlN0SJasXrxYA5MLgCkDtuPrrJMrVUrUw8EjYuRM9vR05dE9ViKuljjNDUZvDmt6ElWIHyA8t+NC66qt6vhO8exQUZI3HQyz+X+V/IaSPHsWSgYG9PLzXdpmaqFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671240; c=relaxed/simple;
	bh=l8gTnU2dtKYUn276KVsPVVWPeUSFCVu4U25a1SBfu9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H20KT7tH2nItLLry/vZCrjw+SIhu01abVx+Ox3Echnrq5u8594NxvLW82tPCpfrTPR3gfSJ9DLb5NZC7QgXjVJPIE6TKH6GhBpE+QNDlWHjjmylOV0aLVR5qfi/HsRIAJfKxtxd7nyOkDRndN+HD7Twf853TFiOYolFUokSCnpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BjQUw+rR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VXvi
	2mNF8xXuVLVH/4vQtoyPsrTNcyZMvZgZD0MbxLo=; b=BjQUw+rRjZdBNmlicGLL
	MEXXNZfsdDO2rmu/p3p9d16VYoRxwH8ZukjIw0Put+Y1iiqJ1k6VVWlnGkY7swZO
	VZNrGgNj3e8mOrwn0nz9lR9oJOP9hmrF0CG3glmM9IRJp2v90WNaoDqXkm0hvRJD
	YLmdTCr+FHDoefwAmE9fsC22Yr4U46dEmnM0vc0jRJdQdmAiH15f1QHrQ1SwPUnS
	C7KYqzQnGf6HwtRYbXfa5j+viZc/eNvsiMlCVgmXYg6RQ+jXuN9vbykajnCmyX6q
	YdQfCxiKj7H8Tv2VX/HlOLay+Zd/qbJbd4o5mmu96ziIQBblKq+oMTWam0VOJmUN
	xg==
Received: (qmail 2312070 invoked from network); 3 Apr 2025 11:07:15 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Apr 2025 11:07:15 +0200
X-UD-Smtp-Session: l3s3148p1@Tw+ZGNwx9I4gAwDPXwaqAEtIN5mYkFJw
Date: Thu, 3 Apr 2025 11:07:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 2/3] i2c: i2c-core-of: Move children registration in
 a dedicated function
Message-ID: <Z-5Pw8qyfuB2leG2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
 <20250205173918.600037-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UrlhrmKKNv6iAndD"
Content-Disposition: inline
In-Reply-To: <20250205173918.600037-3-herve.codina@bootlin.com>


--UrlhrmKKNv6iAndD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -void of_i2c_register_devices(struct i2c_adapter *adap)
> +static void of_i2c_register_children(struct i2c_adapter *adap,
> +				     struct device_node *bus)

Could you kindly add a little kdoc so it is easy to understand the
difference between of_i2c_register_children() and
of_i2c_register_devices()? It is not too obvious from the names alone.


--UrlhrmKKNv6iAndD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfuT8MACgkQFA3kzBSg
KbY0nRAAplNQaeD5IqrGZw/9auueghG82ZwrE/bCrjUDJWPyChvWw9Bd/b9SC/a7
7YXifYW/ID8EejvdxNsfyQyI++a/bkXJMptt30SZZGtAHkJ3riiVC3NvUwRxbdud
SsOSSOUbEY+7BGZMvnYjmLzw3PGSX8ezFkD3izMyBYNnBmA6wPYkTstI6qxFCBoi
dJIe7GrLx0CJehgvhDGUPw1snQSizqGJGSjjTbNv/2RD/Y6ntJ4DZ84PNE+DBBGG
/wApN+pgb/IzawZ8GaofQzKlfViG9Og/GxfWYXoYvId5FoUAw2yF/OLSJ5CV2T7m
cmn1UYvmwyow//irO9G9SUB7EdXrGLhd1c6gYf4KlA66Cqd+DnU9shJqiaMCfSru
beBPRcxk6Ss7oVIuC4r3dMi81DRsFc8XGeW+jXtDG8dUqkd6Gpc8wpb4fDODmuXM
SHIWEDszgoWW9SDH4i2IhiHUO+uVXIJhMLMqzvJrV5eLzBuvCvD9+DdkYliRnZlP
nUMV/eRXvjyPtbnOgsaB8osXw5/eG7tJX1ozoyFMf5YwdD4hd1w20LEvfQR+HjMQ
OdgFdgKnl6cGYDnQ22FZsRrjJBLiL0EMmR2GiItlGwnj8P+x4jEKRzx5tgiW7qJq
JvDrf6FevO1UyaeVeVxInxKW7d4fcw/ZHtLlsWA1Xx+RsTDCBeY=
=aFtT
-----END PGP SIGNATURE-----

--UrlhrmKKNv6iAndD--

