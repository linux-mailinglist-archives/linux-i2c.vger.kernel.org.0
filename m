Return-Path: <linux-i2c+bounces-4194-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B0091243E
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 13:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 626AE1F21E90
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 11:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2EB176AB1;
	Fri, 21 Jun 2024 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GEYTYKuk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE081135A65
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718970099; cv=none; b=NkXmdSkUKNVqwyTPI6MXWgGf2tztF70Ytcepi4LW5SZAXkP4/7zzSxRUrvGkQTrBIoDYAz0Tn3ILKDV3yJzTkDUyZM3TiR7Px2X1pOBN0/SAWR829olEoK4U45mTfHO6myqpsNOfmA68Gpbyikpp8H5abkgblOLsEK6MJGJZYow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718970099; c=relaxed/simple;
	bh=/dIk4GsbsvwJE2GyMw1zPwJuQiOj+ZNFGivrp+bs3yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsI1lAqag+cNfAUKLRUbAhY9ayb2KzqXrXR4Kvzly5vAAmNChJjdr8+6X8+tRQtD4UotgeVUDxw0KnoTRrWYQY+gZ0Xs5SJnQozU04cNjAEB4Yu+ht5LYL+/anN3M8gnBmgJbmpBPD5x0XawtEC+rxUHqTX2s0ObG4fNtIYsWB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GEYTYKuk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/dIk
	4GsbsvwJE2GyMw1zPwJuQiOj+ZNFGivrp+bs3yM=; b=GEYTYKukOYTDN+iSFAAS
	/dnLXdYhG54JI5LtzBJWXJBOEAOLU5OB5BSWLWY8qyoSGTCA/Y5Jq+eIeXcO/QvH
	TgvaqE9Gald3feQRwLq36avP2HXB+F8T05ZyHJGNhI4+5yh8v3/nPEFUGn7USvWZ
	OlDTAZC1DSkjLLueAHOvbmc275oUPEjp4D/IjZ0mxKD4cBh7741b75XTqISb+FZq
	/ZcL3kw0ZPPwNNRyBd84QMy9j6eVSA8GR40JKcv/9kqyCoHDRe+f/KUm8popmvoO
	1IJaEM7DxIW0H6mM23B7pRu3QnPaHxmu03ccP7lTc6Omv6Fm6SkZ6WAe0LCd3xYP
	uw==
Received: (qmail 1357810 invoked from network); 21 Jun 2024 13:41:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 13:41:34 +0200
X-UD-Smtp-Session: l3s3148p1@jo/Y6WQb2oAgAwDPXzjQABqqX1QYyOSW
Date: Fri, 21 Jun 2024 13:41:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Rudolf Marek <r.marek@assembler.cz>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: add missing MODULE_DESCRIPTION() macros
Message-ID: <4ifsa2bb7edxoxbajejkjc5lps3o2puvzmqpcky5f7ociopj5r@lqez5qd5j5za>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Rudolf Marek <r.marek@assembler.cz>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
References: <20240607-md-drivers-i2c-busses-v1-1-0340f4590199@quicinc.com>
 <171823283902.404205.70695545508575687.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fik6xs7tmxtqyryo"
Content-Disposition: inline
In-Reply-To: <171823283902.404205.70695545508575687.b4-ty@kernel.org>


--fik6xs7tmxtqyryo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> git://git.kernel.org/pub/scm/linux/kernel/git/local tree

That link looks suspicious...


--fik6xs7tmxtqyryo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ1Zu0ACgkQFA3kzBSg
KbZBVg/+LUcLvpmuMVH5Bd9PpNiQDF8FIqEfaTJJ3co/3XcYU7tjCpvd9iFaBVX7
7pZQOYDli345sB4GZ5nlgdphfsNVZghZW3SOJnMt7y/xctGepjMQ3rBkpAQlzIs0
vvJOygTNzXz9WsIb1GI4j9MXH2STi2bLJ4aZFKjf6ud3Cz9KBuVjv6saqKiiFphJ
863ogVDF72yIkKrlgNU5UG0l29H2MsWSYMM3bLfDiIcOxYm2uoCPQQ0UQqpdchuC
3IojANLp+4TYoL2/PKjA2luf5mrEYg8u+YjkpygMDk6KWLdpS/0aJEa3t5l7yiAD
q5BZkD8XFwf83lEuNMN0tmNgi34g5J+K4xbU8yIk3+qoykPE746dUFopt2tHxh9h
jXJ//9AqHAJV53+Fvf1Sk15eDBwRHRWDDzNtVf67kgXQ+mNOApElVHy59AQdpJFI
QwLB6O6q1dyHhuhu9SS61HJ585sMkc8UgXzQfkjFJ4EcTjyZn7LcYkQnliN4m/bn
dblCT7yIc/nDUpGKS62OspxUQhM70fuGhHFF/kiN8f8WHJgn1uOkhAbHFn5YeI16
g+xcV4KeYzyzoG8LATSdb3nYCqqXsviU/TR/Vh4cYxXnY1CBvikU5IO5N4EzWz9+
wExLe9XAzNL9GsWoGQE7rwE0ZDBB69YYkp8IXuVxQuU4Dnk8/ps=
=TPpP
-----END PGP SIGNATURE-----

--fik6xs7tmxtqyryo--

