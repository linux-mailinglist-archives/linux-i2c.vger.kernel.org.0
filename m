Return-Path: <linux-i2c+bounces-2145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 796CA8702B5
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 14:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A15B1F22056
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 13:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DDA3D996;
	Mon,  4 Mar 2024 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KwqCMVpf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111933D547
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709558981; cv=none; b=sKiyZk3qYvXCzapWpQDk/4HwIWmIUJdWNe7QYvkR+3jqigEPD+k7AGKGd4PEp1gd01DgKfcx3ewPF3RgN+zf6yiB5L3F2uXAmrsYJ5jGkSFiJuLuBxMtKZzV1nvaCAlyNBZkCaNXoqtWJE/oGrHVd5qDYBqKda/zZnS4SD2i6ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709558981; c=relaxed/simple;
	bh=j3zBV9qVoAJHdQmyeW5l585wwmTJ9B8Po4AWJH1NgJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwPG271j5HDdcUFjhMwLkKynUUNgsvPusdORjhuHPOayu0E0S30g0Zlaktl6kJy/WvGpGQVqR5YjgoCG9EvMvYfpYR+8MWYDrQShulVipChi8tbFKsxId7FFX6xCeaKSNiQTOmozLeU5y+nlEStdXvNfnzJXJGb0RUMt/zD70cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KwqCMVpf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=j3zB
	V9qVoAJHdQmyeW5l585wwmTJ9B8Po4AWJH1NgJ0=; b=KwqCMVpf9ImgiYNSR9je
	RtUxWwRFmJbfA5Le1e9IV0rvDmnj8TfLTx9s7cCThrM4a2XMsU0MAk0dOnLiErCA
	ZFgTDaG3FQi4ViuqGVkHJYQ642jxLyDn3zkS/VrFgcUX0tQAt+CWhe1IUwckCMXz
	Xwis1BSRVLIIDBMaa5/cPsFiZAyr6mnPJnx7mO+QPY2I9WWkrsRKGl7KQDUK/GXe
	onFh1GVBmDu/P4IBcR8+5ELpgj3Lo4IJFcH/RZcCSa5mrsL9Xiw29zO0r9pQ6maJ
	pGZsSiQL6/15pO3CCaZX7wPG+nDj1PvuXyPBeg+J7sucUh3M43cvMBkjswls5iTt
	5Q==
Received: (qmail 3514478 invoked from network); 4 Mar 2024 14:29:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Mar 2024 14:29:30 +0100
X-UD-Smtp-Session: l3s3148p1@eEApt9USZtAujnuA
Date: Mon, 4 Mar 2024 14:29:28 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] i2c: constify the struct device_type usage
Message-ID: <ZeXMuHFfBqarnUfA@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240219-device_cleanup-i2c-v1-1-1fc5a8749c6f@marliere.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j+ose6nliXKhBxMm"
Content-Disposition: inline
In-Reply-To: <20240219-device_cleanup-i2c-v1-1-1fc5a8749c6f@marliere.net>


--j+ose6nliXKhBxMm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 09:38:47AM -0300, Ricardo B. Marliere wrote:
> Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
> core can properly handle constant struct device_type. Move the
> i2c_adapter_type and i2c_client_type variables to be constant structures =
as
> well, placing it into read-only memory which can not be modified at
> runtime.
>=20
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Applied to for-next, thanks!


--j+ose6nliXKhBxMm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXlzLQACgkQFA3kzBSg
KbZ+DQ/+NQm6Yzorm/eBd6O6EoKDh9XXr9Q3s68WmKXqv+z9sAUbPRgUbpJaC8Wp
Q1JNTA0cO9iKQJIiUaJ5uYVJ9mAwbzUDC8bIkzw0xbLn8CpTkel3Kk24SGQ4pV39
R+vTBSeFGG7qwWGkU1G//2hF9dQucXpxI86Uk+gY1Lp5te1HuqFoarYNI5A/yNns
JV7PavMgTpUnaOF5NxD/QCBxxAPmh+wr6bU5E+nI/SuSHwSoV/9ojyWwo9t4F+GS
fiMvv9u5Xp+A6eGa+9untKo01N2rTtFL+eWTYWiGwTeotn3rSQThmzFINp4OloxK
9zTxZTisLDH2vhl87BiIRxreyY1e7Gbd1ALaJTMtdOp9ODQcOlhGxo5I8FgqpwRW
nxEQJURTFU4qyYpZQRowafKpoN5Zgj3f0jJw4HeIfsMjuuD8qdIhVJDjboa4t+a7
jF1ixQ5KrieJPMvpcjs2yROf2UCdt/zQcuj/AtOcgblueR4Yby91RjvQ5UFurCOd
ugQdcIQtIn6CdCJzulxy1woNoUTZGE6TU/Bk8gEtbZhz5sCQbxkPZ1BmZAtaL2Cb
+Gn7XN/PPN54/UoZroF2hEvrNtQywQgHfT4fI/7OzssRgdTji2EWBvGwf7G5XXp3
O93fnSbdVHa2MDKWfF6dWWT2kMhHuS9xvRTdwXWwE1ZxXSC6O5U=
=S+9g
-----END PGP SIGNATURE-----

--j+ose6nliXKhBxMm--

