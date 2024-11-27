Return-Path: <linux-i2c+bounces-8246-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5539DA6D5
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 12:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33C36281C0C
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 11:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319B51F7060;
	Wed, 27 Nov 2024 11:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AlY7G3x0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A041F7079
	for <linux-i2c@vger.kernel.org>; Wed, 27 Nov 2024 11:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732706734; cv=none; b=I671kemtJvbjo6tOpOBKwlE3fspRk0hjbj5kspM5jmQHXbH3eCZ0TGrhniypV+cdBOrDQvlpQtmlF8ooXnznw/B3amej7wzFl90zbC6zhoGeWSB0okf9CnXCJJAGWUuoG+ywjSonEYgYcgBVMd8R5OP68HsJ039UD7BRQvqzEgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732706734; c=relaxed/simple;
	bh=x3elDZwV4IMG894f3SFjoGFay/Y0ySNgX6SrSM7Pd2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrtrtwAsUcOiLQ5dVq2EaVT2T9ZDf39PdnDGWvC7XhqLrDelHRLrz5JCUd25vgQBWE+yWve3Km7P/3YNFMNgia/wwcavKl2f0GabzzEZGSb/c3aP14zyiqvFSebcDW7GngNmC0NOz1Wot7WyULz8arKmdwsHm9NUyyMeOF0X96s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AlY7G3x0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GSpG
	jsxDWNUuFpYAlnFU1AS1wIYi1rNWDyVC+7Af9dE=; b=AlY7G3x0P3rRuwnjyvTu
	cgsBPZjc6/yzsA4Kw7wZeDbbwm9pBTIR/N145jGWGi1Q2hlZp9AUZDjrYou/miFF
	O7NNcAlrCvyriWL1qhpxDiYfoXN7JiF+q2mreC9GnKm/rBGZNCZCu+IuN/+W2RLH
	G+smxIGOfCw5G0tocMHqZtsJJUO3PHm7puEZwbIJpbFBsaKKTpD6IKNkseTz2vyf
	ppfOdHiTOA3Chc8APyK2s1Oe9tb8vZUkKEnoqrVnXotYDpSRwa1emx9Ttay3KMZm
	+E/hr1zldFiCtcW3jvXCD3thbtRJdrwBe3OF/VM+XUoSjFGzF4BdYLdSwd0HFzAD
	8Q==
Received: (qmail 536474 invoked from network); 27 Nov 2024 12:25:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Nov 2024 12:25:30 +0100
X-UD-Smtp-Session: l3s3148p1@qvEgOeMnyJMujntz
Date: Wed, 27 Nov 2024 12:25:29 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Liam Zuiderhoek <zuiderhoekl@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2x: Fix whitespace style issue
Message-ID: <Z0cBqU9REtCptfEE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Zuiderhoek <zuiderhoekl@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <2921f50a7e2f112f0c16e116d2992da8a0340cab.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tUTGPAX6BjnqBTOD"
Content-Disposition: inline
In-Reply-To: <2921f50a7e2f112f0c16e116d2992da8a0340cab.camel@gmail.com>


--tUTGPAX6BjnqBTOD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


$subject has "i2x" instead of "i2c"

On Tue, Nov 19, 2024 at 09:25:21PM +0100, Liam Zuiderhoek wrote:
> From 0107b1649e3f74f1cd4e0695968edb4d81028f91 Mon Sep 17 00:00:00 2001

This line made it impossible for my tools to apply your patch. I fixed
it manually.

> This patch fixes a coding style issue in the alignment of parameters
> in the function i2c_smbus_write_bytes(). It replaces spaces with tabs for
> alignment,  as per the coding style guidelines.

Two spaces after ','. I fixed it.

That all being said: Applied to for-mergewindow, thanks.


--tUTGPAX6BjnqBTOD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdHAakACgkQFA3kzBSg
KbZxMw//TdpSjUsO7iqYKEaXPG/WkEi7ZhN08JWvOYuo7+aQrBJie7eQXYjL1hDd
MIfktM3rHbUA+NrSXyUJnmnfKREMWMsmBYifKzzy7V7x4pOYyVI4I7wFbFIS2Ivw
I8K0daDNkHeyDm/13qdgocfmft3A1EI1MpGesIDU9+lGUWniEHHPT160ReW7ruvh
KPUnmMeoOSJYNnzOyEONSeLrgGVCh/ccr6BWSbEyVjIYW3l9nJZ32D5ZnE57g3ZB
/FU7PB4BYGxGIzgawQFP83E+ALHgW/HJjwWE3Z9lbDDPWqX4ZOC6UmfYzyoY6fOt
tTwBUe8V/RL7W6SXttXO+W+i9MW48dW2CGM0RmSs4234QL8e8ZZU3tiQlzhCnt/y
cdY3IDr+kimkOOfnnC8g+nD7IFo1zTQZ0r0ZrQekseK0ajv9NtJyVtPgIpT0zB9Z
LqsUUFDnOOr6DA3sFXCHltqsaRql35VsLiJm9Tgf2I4fxLD6ZGjP0TxvoAiHDJCX
i4/3SoqtsqOeWHKjzoa2C6hU+Pd4C2j01dt77/ohk2NupLtHiPjvQppVQ2YXDMxb
nunJMV6ALYrs3ohPD91BVqQeSVtSSVzpAkXLzw5LSJ82WjGaTbfAapQcyy+fuHyq
iqPHosrDcMMY0ge0B6ZrTkiCVj6NBu7ouIu/GR5fEuVurgoAUP4=
=7LXZ
-----END PGP SIGNATURE-----

--tUTGPAX6BjnqBTOD--

