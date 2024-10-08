Return-Path: <linux-i2c+bounces-7260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 210929942B9
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 10:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 507391C20E22
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 08:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148C01E009D;
	Tue,  8 Oct 2024 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z78DEJJP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4661E0485
	for <linux-i2c@vger.kernel.org>; Tue,  8 Oct 2024 08:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375956; cv=none; b=IPSJXJjYFml7vLNNoeJ9Bq92uRnDUZZ1rPJwMWha2/1nVMvPdimk9pSGuKRZ5asvlxMoxCMaZKJYuDYNsrYlI7Za+SJasZcxRO73xSFzdFmm9aogbsnjjozZhxde619qGDLbPtgwSvOKNIrnNDiMJwp6RnbnOJYWsWuSMnBbVfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375956; c=relaxed/simple;
	bh=uOmKQ7nUzDGkx7pfIi6OXG6RrYigBkVLaKWzecRpq4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxqI8W3+S3K9rEfS1s2EVf7oZ/pb6CTnNB5gN6pdczkIWNYchDCJIqxtvWaC/OF3WiKgssHJv5QRS79sHRU0xgQJjVzixiklAfXBe3jmSLtyPaKvYF+/0LZQZcvsOVzBdSyx/5CDHQUvG0gDaH0KLCofDnOcOuVdU6vm9yW5Byg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z78DEJJP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uOmK
	Q7nUzDGkx7pfIi6OXG6RrYigBkVLaKWzecRpq4M=; b=Z78DEJJPb2nCXXXnAM7c
	TO9CbEzDuRMnZRrkFvW2UtczkJlfuue1gIr6AMdEiEhnOeT5nhE0wHSfnsTRcXtC
	1+QElCUfxT4vdavOlaCJMRAUPWGlHiGSXNU9/kiJ1ydoXc5Zt0zYQSNtIpzY2AVE
	we/YL2JeZ1xFF/Sp+atQ1K4Mp0D2nyldcS5Fnqrp4E11fsG2b6WI4EXeUQcjkTOh
	EnqOAxcw3zfMOb2cm4dwm6cSMsqxnz3NYWqNNyGPgECksuvM0pzDB6hpEwIVQPI2
	Kt9HrAXDAyFDqz59rRQCwl6WBHyMyukDd71CXEOLPPuHSTXTsxSS0OpOjPuZ6hxU
	GQ==
Received: (qmail 400174 invoked from network); 8 Oct 2024 10:25:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2024 10:25:52 +0200
X-UD-Smtp-Session: l3s3148p1@M+yj4vIjWHNtKPHJ
Date: Tue, 8 Oct 2024 10:25:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: support gpio-binding for SMBAlerts
Message-ID: <ZwTsj_GG6F1UZL6t@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240909110430.28665-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9NVCBK0mdUb9gLPa"
Content-Disposition: inline
In-Reply-To: <20240909110430.28665-2-wsa+renesas@sang-engineering.com>


--9NVCBK0mdUb9gLPa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 01:02:56PM +0200, Wolfram Sang wrote:
> Most I2C controllers do not have a dedicated pin for SMBus Alerts. Allow
> them to define a GPIO as a side-channel.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

DT-Schema dependency is upstream now. So, applied to for-next.


--9NVCBK0mdUb9gLPa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcE7I8ACgkQFA3kzBSg
KbYRtQ/+OYw8JWfZCgsHHmmSFfMKb7cC6+wdF2ZIGbe12D0Z81Dl0XWWW2NnafEC
g3BdcllaexiZMEroJM09K3bzb29Hz+MKi5L6xA9kqONL5e8X9qunPu3fWs3fiWqZ
2TRPxPwmBWSVh/0gnWbAKpfqIWHhpTEYLBsxL2eDut6xw1JXjfVhcRKjo4P5dfP/
en6ZPgdyqLBaz/jE/zNPurVUeRRWDyzAO7bE1QYaIkS/iuWTcJJlZPCrwFQjwrKF
GlOMO6GjHQHPtCdlBl+xtkwRYugFSjTuB8QVCLYkTBTh4xjtZufI5NqulDymGzpc
VXnNiEQN5Psh4aOXTPdZ+yG4h/iS4JsCaotRcqlCY0Qtle/M8tWLrl+eKU04er4T
31R9uCmSZjQxBn8m1QiGbGCC0Reiktw2KeM7M9jfNQ4nfev642MrgaN0mDVWDMcx
vv7oWTq9vxFB7qyhjv0zlpZm4i4DG3RChrNZabU4sS/xZNlvOAv300Um2q3dP5N6
loJSSpjTXxTOVCyI+V1jiwve/mibP414YoNkWs9fJKz6xT8XEEHkUTnbn+4MUwEz
74zWKR5KIzTSApzriab0Xr8YHufHWUJNfTqdwouwBehc877Uy0Tdd2wE4lbAynXh
elu4dQO8RfghcKbNyHU5AGaxYG8r91krjld8qr+h14o9KeNHQOo=
=OosC
-----END PGP SIGNATURE-----

--9NVCBK0mdUb9gLPa--

