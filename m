Return-Path: <linux-i2c+bounces-4891-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A18C92E2AB
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 360C8283C1C
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 08:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDF114E2F1;
	Thu, 11 Jul 2024 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kXATyhs4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB878283
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720687646; cv=none; b=IDrM30+AgyEaRZXj+M/RwtnuOH2ryY0IKoEZTyEkrnAkkDPWQ89T1w6Z3XyN3s2oxkWd1iKJlNWnhU++OPAL9EMXI/3t6eY+uYHB7DtYLt67RahA0nuhA9MaVAapxKcYZT9Xhbqb/2WckQKeS/Ur+zeaHJ6pZtdNTSJC29yBK8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720687646; c=relaxed/simple;
	bh=/UcrM9S9fPVMtzAalcskkXvVlbajPVnGUkiWQO2xdWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GX7uNiJzkF3yagJm8yb1LMptP4sOwlCaPsFHuPyuMGv8LAG6xEgvH9pD+V+Dl9z6YAb/bqvS33zonRM2pV5BrKJv3UYxboFSrOroguDCyrgj0Frv24bRvUb17WIg0vze/ecUn+V4p9//GlvYcQTwWlQR41Sk6yw23iUkc8pocuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kXATyhs4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/Ucr
	M9S9fPVMtzAalcskkXvVlbajPVnGUkiWQO2xdWU=; b=kXATyhs4/LsJkNPCZwXN
	V1fyBCC/+TxuDeQBSDqdIL7K3UJxMefdRXUv5q4GJ05xLsljauaIh8wHeSKuHx1s
	Os5NLJz4UovGqRDyfGTOT4Eh8S9+D/KUSQvHFwNzEbiMj26HcD5K7giB8poixolX
	dEwXFVvY1iEmXd1c2hE86A2XiAGwJFlhAqZvk5Ho3FB9wTe1KCqtgAeUChfSID16
	nDUuLG4NyWLgBSTPRb/gLcABr4Y0uzrL6eMpWIYmMzjsptcG0CzGVeFLVYOnTX+p
	HrX8AzrSpoeamZM9uysq2NOUH3gRTjUczXpVJ5Xd5bb6qqoxJe8dma7j7cgW+PJD
	Cg==
Received: (qmail 782210 invoked from network); 11 Jul 2024 10:47:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 10:47:22 +0200
X-UD-Smtp-Session: l3s3148p1@O+6qz/QcHtwgAwDPXwmZAIsFIv4n+Dpm
Date: Thu, 11 Jul 2024 10:47:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Jian Jun Chen <jian.jun.chen@intel.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: delete entry for Conghui Chen
Message-ID: <Zo-cGVD_mvezDMoZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jian Jun Chen <jian.jun.chen@intel.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240706144150.2668-2-wsa+renesas@sang-engineering.com>
 <20240708061937.p7lhz7eho4dh5bv7@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LlX4jScTkSgHKceY"
Content-Disposition: inline
In-Reply-To: <20240708061937.p7lhz7eho4dh5bv7@vireshk-i7>


--LlX4jScTkSgHKceY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> May be we can add Jian as "R:" here to keep someone from Intel in loop ?

Yes, it would surely be nice to have someone from Intel in the loop. As
Jian did not respond up to now, I suggest to add him with a seperate
patch, though. Let's get rid of the bounce first.


--LlX4jScTkSgHKceY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaPnBkACgkQFA3kzBSg
KbYp+Q//bh9qbtiA0zdbNxQ3P37IvH19O7gILsfN3jffvqqBrVvhLmnjQ3olpPIM
f3jI6TwCU+KlsvGt54IN0rMeF3R3PFDbq4fSbB3NwnucqX+MyeEBmM+nQsc/FPzd
hXH9F3mdNNw0QPk24qOWLWwSe9m3H9yZvJg4wkj8w5jDAREtbTMZS/lPfuRcjE0l
3iWzK6Rwj/v4zf/gbyP/3J3Udea0IJRO+oIdJKnXVbqwV4VyX+uKDFG8EKX84g5Q
UBSW889qOa0aNs7T01Orn2an+jti0j+XAy/UQK10d6hC2UT8YL7p3KeKWKhLfgPC
V8VLdRRrjMv08GCqgkpKq8w0odSuglmOqZ6pQgf+TaVRNic46+w4NI0yrICxEb3O
c/ag3TqtJNvp7UFenM/irqDb4/448F0DHVD9XonZ1hvJr47I/15psxoBPHQlG9/T
zm1FomYQiXlaXubD1U3W1xdgEkV0gbLcS4eMI9zzTiZXQenV1zLcsbkAXJccqUAo
hBsZcueHh9piknxpPEbUfXy8VS9iL1zyo4/zsZMyklY68aCxdcH3r798FJwwIQVK
ryvXe0BLBvGQoh4PK588d6R3b4Lp3tjkBS2jcjph4ncdA+A7JPbQOBkotmRfnrDY
i27EJZ0OqqGRfw0/F015dgSNfq2YBJTk6K/eYDKw4bLyjULBjYA=
=xJIJ
-----END PGP SIGNATURE-----

--LlX4jScTkSgHKceY--

