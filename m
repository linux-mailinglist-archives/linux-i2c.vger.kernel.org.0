Return-Path: <linux-i2c+bounces-11931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF957B037BF
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 09:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31F2C164090
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 07:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAF222F755;
	Mon, 14 Jul 2025 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Njo8M172"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC72322A
	for <linux-i2c@vger.kernel.org>; Mon, 14 Jul 2025 07:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752477585; cv=none; b=Mb/NfapvMirFoOS9vtKRmszAtZ9EfX7Vz29YqQpbEjRTxdFV53R89sz0gSKZV2BkCs3jjEUpiKpVDInq9WpAROHiW6JK2drrKMuL1PcTgmCDksE7SQM5hTdQ/90gAYUjKabKGvKlJJdKYg3wiMxmy8MfH+FQkKZUWdYWWYIOWr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752477585; c=relaxed/simple;
	bh=SDuKZD2TnP+lleY3hFgFcTmmVR6TOSHMIhwxFA8JRsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIsigiOzeDHJXe91qLB1rnLYNVqBc/Mf1j3QLrl1+JEXqEX2V8OvWHrPsd/UfnGPc8YpNjLGijaLSWGR5jd2iwT0IXt19vVwC1lWYDMXig7NxVlL11DL5OXXlHGWMKCUPTTJw3UNRG1G6UILhOaM+It0wF0Pk/OP42Fw/hH5jYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Njo8M172; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HbSW
	1NLJrlgGlPS2uW7duBcztsacLzOhniaQCIIos0k=; b=Njo8M172ihkJ5cz6q6Tj
	YWDqe9okkv/WFTnnNwYUuRDX0/RZC2ieYK8NzyKwWkuERCEI46M7jbD3pMFzWje4
	f3TlPqraPCmA+2asVTord5Y6AwCb4MTMJcHJh17A6YshnEBbEIbjF6BVZIKVpvrI
	yo1OBXXPyt+/vrbfjNtX41MkIb1fvG0OrOREFB+omA2TivOgieKwKNvMZOhZtVIO
	d4tQWmN0aXExwmbiOy6c4LsT/aK+FAIWlBhFf21tX3UG4nRPT/3AL0+i8ovjBHpB
	wf8sCHc6VGqtJ2+VRl9mS9BGhUHihX3fTLLLGBvJm37oOwAfoMbgNON/31UQsPoq
	WQ==
Received: (qmail 2363846 invoked from network); 14 Jul 2025 09:19:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jul 2025 09:19:39 +0200
X-UD-Smtp-Session: l3s3148p1@7Yice945uokgAwDPXxNjAMIr4MhSGEU6
Date: Mon, 14 Jul 2025 09:19:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: I Viswanath <viswanathiyyappan@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3] i2c: Fix grammatical errors in i2c_msg documentation
Message-ID: <aHSvixooGK9rFT8g@shikoro>
References: <20250709153644.10778-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UR9CYOjWuOKnwHxq"
Content-Disposition: inline
In-Reply-To: <20250709153644.10778-1-viswanathiyyappan@gmail.com>


--UR9CYOjWuOKnwHxq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2025 at 09:06:44PM +0530, I Viswanath wrote:
> Fix the following grammatical errors in i2c_msg documentation:
> 1. Makes only sense in =E2=86=92 Makes sense only in
> 2. may have changed those standard protocol behaviors =E2=86=92
>    may alter the standard protocol behavior
>=20
> Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
> ---

What has changed since v2? Please write this below '---'.

Also, I would need an ack from a native English speaker. I am not a
native English speaker and to me the above does not sound like an
improvement.


--UR9CYOjWuOKnwHxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmh0r4sACgkQFA3kzBSg
KbZPCA/+MBi7jS5j8B6HL+Sb9SZNq0Ad3H3eXzi6s10bNxoSQJb7tT8xRXdLwMc6
A1pGRNXQFOuLXJE3s9Ozp8ifibf960IeSJFGD1PCOGz2HGhoEJml+m82bAB4us/w
8LS8alisJSjt/6Ow2tN6jnq2PherQZHQSOns3+2/zmJlfalu0FmPt0qDE1+latTY
V2+u8+7b36+EjACNFCo9nDokUGfrjMz+PrKBwjr+HoWzmrsBpXkay9Uf2IlG7SJ2
0TsCJc8/jagS5eBsaTxHAgSaGkutAyxZix4rv2w/u91LejfhMYVYm+IaO7gw1xjj
DpILxeLroROTcGVqVnN7B6m9YALbuOzsrQEKzkilzyukmtqgnrN56NoDR2laQxZH
PN6EZPfBuceXy50lSqSNqBnRRwpiAkJpNCpPC7ssKgoD7kLyMcUZ6TaJCEEn0I47
Ru/nVtO4v4GxAkcylUQqRnXBxqz4mWl8NDLw01TYPJOQ8U+059pZumVAkUn/tqik
yGegRiqh37pAwMIyMVkL8hVj/Khchp2xUM/Ha5VARTTSidDiBqswrc20wey/VFYv
0bzTUeMAFhi0l3+rIv/h6HNGpBqBHwKhBgXVZpTiyNYzbzYQWOH/Lmt95mI0H5XJ
g83zNCshWYjDCdz3wJUz/P8Uo4zwf+Jww342o1Bi5DZ/FQ/ETbY=
=aMpq
-----END PGP SIGNATURE-----

--UR9CYOjWuOKnwHxq--

