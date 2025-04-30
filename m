Return-Path: <linux-i2c+bounces-10714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD5EAA556D
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 22:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2524D1C20D7B
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 20:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEA42C109D;
	Wed, 30 Apr 2025 20:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="V0RZWuH8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4552980CB
	for <linux-i2c@vger.kernel.org>; Wed, 30 Apr 2025 20:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746044268; cv=none; b=VBfjKSzJBOg3BzvBAMEEpR++RRlxEMWolDDfEX7ylGWVghv/emN/hb2Mdl9LhmZPqDmHxzzN8sqXxAlRbxIrSFiOh8QE3/NQqNsBDLxU6UqoPS3vGidEGtF0b2D4Xybq9Ll2DGvM7eVeSAuXDObsaWgdRcB47D2nAA63eEteloI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746044268; c=relaxed/simple;
	bh=EwWT99xkQ2n/1ZYpH/tZDrSnhshf5W156FCCXrJfbtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnoQbS3q5RDdKPQHd3dHrl+4WjpHNQjGidoAguMM/kBpif18m97WFQy2/kRM9hoxxcmO8Q0A5GFL7V805I9Mykcc+GWX7zuxAItAO5Dun1Yy3hXfMJVa2g8L//lGw/IP6ldDBjIdyWE6B5DICRqSCai33HjmTzOqEpwOu50BcPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=V0RZWuH8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=EwWT
	99xkQ2n/1ZYpH/tZDrSnhshf5W156FCCXrJfbtw=; b=V0RZWuH8do8jIjXufJer
	ZI8I13dnOTE2Zb3DogANsCEL9oN5Ky2rIOMYqOqly1waVif/kqo2bxNPHbYs5zBi
	AjsonSn7CJ5ondvTiM4ruDZg6xQ+djuA85NpdG4yYrykJzigkh/vJ8Df3lWqtqCD
	p94YAGfM18iUY5NcwzLFYxed1Ph0W8V0jWYHPOsl40MiK8UgRKg/jSUqKMLOe5cR
	/ZErY53/Is6gsv4DB2CWOCC7kzGqmMOY1injnNuSJAVd/Ac6uvVR6AG5oWvZYJ2f
	LGkj2mvJRUjAhZoKQqrqCEfKecRAiiuWmKQ1UAQOGoKkJk48cg9ZrpbP62+dxc3f
	sg==
Received: (qmail 820543 invoked from network); 30 Apr 2025 22:17:32 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Apr 2025 22:17:32 +0200
X-UD-Smtp-Session: l3s3148p1@dXJqmwQ0rIoujnsd
Date: Wed, 30 Apr 2025 22:17:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v9 2/2] i2c: riic: Recover from arbitration loss
Message-ID: <aBKFWxIRaa4W7TDf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430194647.332553-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430194647.332553-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xc9BmgGPTvJDciNc"
Content-Disposition: inline
In-Reply-To: <20250430194647.332553-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


--xc9BmgGPTvJDciNc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Add support for detecting arbitration loss in the RIIC controller. For
> certain slave devices, it was observed that after I2C recovery, the
> transmission triggered an arbitration loss. To handle this, initiate
> the I2C recovery sequence and retry the transfer.

Does it maybe work even without triggering recovery again? A pure
arbitration loss should not need a recovery procedure.


--xc9BmgGPTvJDciNc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgShVgACgkQFA3kzBSg
KbZ+Vg//WnKuRjdfhUE/gzYSlWTXDxkF1E6KRuo2KOgrETrLofYrID4gD4jSP4jf
Njum/Za5Hnw0SaW5W+/TGOHxpld7U3q38nTqjNYv1aBEIv/rkPx/Im1CiVXv+7kQ
cflmUImnhF5HjM5PjHB+0dUVsIb+iMunATVZOGoCdisR7btP81/H6r3NNjR1L3oV
qf8ew0yzia8V2K6Y03WvUMpj4ZZLEUKjoi31UC7aNLpiwbAQY0kXt0VJJdzLHZIM
6Ytc1pjNsG+nFrKqyCp3wAuK5IeW/YR3uoQaBQ/5KKHBfrgMjXCkGbmRmZ1kTRfV
AhI2V0AeuRkjTdoA2DJonSxhquCaKvI2+0I7/uiMlNFGnQxeNzEzww1nM1oPQa+I
7aquG9ExroJDlhAESnxPsgjJms7ACApg78xitDY78zGhWJACBwVYaAs9phfkH8G5
tExqxxX7SfqkOo1SR20UyW+ngstWUEYOIG2N/gqtV6UFHseUDjNXsLEHllRGVBix
fcpSV5FBISRHmYIEMx5zj4jDoOZvinyw7JRDl0IA7o1LNBCmEELvY3txcsulGfI0
nxuK9gUBKfjkRmYv9Kdg02lcUb4T/iJcM2aumkOn9xuLVHF4mnFsLrCUhVPS5YGB
hivMs4SqkcUf2E0Ld6l3x/0W7cdw8B/WAL6h1fyWAMPnnxkN0dU=
=UkXL
-----END PGP SIGNATURE-----

--xc9BmgGPTvJDciNc--

