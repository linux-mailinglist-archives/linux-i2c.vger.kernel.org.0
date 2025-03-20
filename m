Return-Path: <linux-i2c+bounces-9937-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 990E0A6A056
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 08:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF220189F6BC
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 07:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432FC1F09AB;
	Thu, 20 Mar 2025 07:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cOpk/4WM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3821EE7A1
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 07:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742455336; cv=none; b=SeZnqqwp6nxxGmpPz/1B2AI9YtDnvd7pf6+rWC5+Ni+CuqWmepMu5yCi4SAxh0Z/oHwf7ewZ3EuX4E1wRa7emg7F2IUBRm17WgwaurYtpbZvcbCZld5vkX1YmIusbw8jV2iUqPZUklTT1H7jtP+AxflCwN7p+3XA4sqWm01FPq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742455336; c=relaxed/simple;
	bh=VxiIaIGYPsQJ5ZaP30ByAl2xle8cn6Fjq+AfbVGI/ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7m7yyv5DBwTd083Vk5z7uZtkaCa0XeIoYiO3iul3qaWrpteJXD222JJ2AEycuIvfuF++BPzQe965wXJ+EcvBFubi2NoQ3FX7DVI/Pe9gl3BW0ZZWrR08karyBIEmN36gbnp8bqlZjZZnZBVtPjGBDh73ANgn/aFZT+WHGQ6yQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cOpk/4WM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VxiI
	aIGYPsQJ5ZaP30ByAl2xle8cn6Fjq+AfbVGI/ag=; b=cOpk/4WMuXL5uLUtxOww
	vj/nPwjyPmSbkFHS6Q3/hqaVkhN0Em3SwZawe+itzCKzRX7G6Sqg7vIVOd8y49P4
	5Q3tOv0o3PWhi3B8mySdtwHP1Rsk17v0T3ZuOiVi30TkuzYMWlfkJtjt0CUPid3v
	YtGAq/ww5YqsT8fo1u4kYCsSEUa0doRtbm3aBx2WKMyx+Ala0Xcx9BpBgl9ZfqNX
	JmPef5hMtVhBdSN5+KkkiH29uZHrI3jLUBvpPkZT6p3pwAKibBmJj0k90ergf9Nv
	plkynR/QP+FKr+I9GsF5WxBAcy0xqiWNvq5jLvuvefpJsyYi2qgeUDglygLcSwv9
	IA==
Received: (qmail 527233 invoked from network); 20 Mar 2025 08:22:04 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2025 08:22:04 +0100
X-UD-Smtp-Session: l3s3148p1@A6Cg/sAwZL8gAwDPXyTHAJp038nK7dx+
Date: Thu, 20 Mar 2025 08:21:58 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: ldewangan@nvidia.com, digetx@gmail.com, andi.shyti@kernel.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com, wsa@kernel.org,
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Return if SMBUS message length is zero
Message-ID: <Z9vCFkt3ycFDBw-i@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Akhil R <akhilrajeev@nvidia.com>, ldewangan@nvidia.com,
	digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
	jonathanh@nvidia.com, wsa@kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320062201.54070-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kcHYkJHyVb6PiCu3"
Content-Disposition: inline
In-Reply-To: <20250320062201.54070-1-akhilrajeev@nvidia.com>


--kcHYkJHyVb6PiCu3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 20, 2025 at 11:52:01AM +0530, Akhil R wrote:
> For SMBUS block read, do not continue to read if the message length
> passed from the device is '0'.

You probably should also check for I2C_SMBUS_BLOCK_MAX while here.


--kcHYkJHyVb6PiCu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfbwhEACgkQFA3kzBSg
KbYMRxAAhRzgjE8EO+1EugWLvKKE+pRLUYgQ/0ogaF7/5hCxFGkpuSfit9xPVKe7
8SLONik+y1yA1H3e+lgLXYJVhX0JR4zIqTSIGr6l0YiFa5L0PLU0Tim1sCcV28P0
RGwVeOkGR6MV6RPRGU3+OzwdmEdD+ewMpIw0D/i4bW09JsOzi9xxgDHeliSfRt3b
DDVew9hJPuBpbYj8194k/sru9mfMAnmKuCj2WZ/rO1xpFBjLSCc2HbkzROI6+WzY
G1a5h1A8SwW/dU6QQqqJ6OZxhgW4ssou45sJBlihIcJ2zj5MeUfmN94UymKBYDQx
FX7mzUTvaY3PqxvBDolipY5spj6GBegL6vajlWdxxzye/93EthDHcxOQpGr7Zn7Y
J82tV/Mwo+fKGCST3XMC63HcpIjADofBUpqgwXDKPVk2hwd+Meh7E6bY0jhBhpn4
e/mcprXsrxCgiKL/Nrt3OWd1U435Uf2qYNXs9L1OGRaCZRzK9CbJg3QvRyUgXILQ
e+nqAlykFkYlE2cNaQTRroxle2mR7X3depYHGUYj6B5sXES+RAq0EahIl/GOwxQN
0qzeZu9XN4KxqCbuWXAJFDmKl5LaVabFhgICWAm+lnv3INLph3HdkQuTMEu27fLv
ranqGLs9buJK7CJgt4axW7a4mYDJOJ1mf4MSWp5ji6SZfLDtAvw=
=BrIG
-----END PGP SIGNATURE-----

--kcHYkJHyVb6PiCu3--

