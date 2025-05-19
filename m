Return-Path: <linux-i2c+bounces-11036-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498CCABC292
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 17:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9C2E7A09C0
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 15:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DF1283FCC;
	Mon, 19 May 2025 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eRVyM4oL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B794D26B95C
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747668961; cv=none; b=WQup3BfRGRjygwsJ4P4jmIa4n73ZOGTDU/4ap4pAZ1zB2QUXSDe4ZALUekl+HxiIzrKOyjR9l0kh7i2I/JPBdpkPkn4qexGr8RoO7stqdVOiJZznNVRnNhZdDkYkbUUNno0tqyabzRchgYr8y3/JlL08KhddM9Tn0EJkmtBteok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747668961; c=relaxed/simple;
	bh=KcW2cgkRTI3IEfFWGhChUyBFbNCtdCFLO+URQxZxQi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewuL25baGnJ8hPq5aWclpe/ZhUGn8hDSfdp5hFYqMB8M1BNqNa4UZGLqZXsyQDyErO2mXckEFAHkRmjrrrTFhUcZL1ePxkrs9wuKzgKBJ5p1BWZ0X/4u+3j3L6SiM3QKKvx1AuVpKMzrHzffSjQUFqCHd/6uj5CAlGxN+eyQ7tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eRVyM4oL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KcW2
	cgkRTI3IEfFWGhChUyBFbNCtdCFLO+URQxZxQi4=; b=eRVyM4oLfqyXUxLCTkNd
	EGJJMiCa1qnEEl8IhAQHG8M+MxORPS4lg+R7+kg89nM1dUsO1eAWjE8tZwNpy6z/
	P+5M99iQU4bjF3iSubf9bFZTLTlPE+nKcLgY+ibqCvQvX3Ya/xfoq6Jg9V3gsFcP
	ydgPiFxGdPVo4qyqvaetuGoXTVwHnGFOmtsXOATsFuGQtwr9n8Hx4cnQww1qpwcX
	xL47/NpT8T2nGvbN3Xhay/oP0kKhBHVSyAub0sJbzSy6e2GuUsFhTcAIOFvBP4RF
	33Gp1bmHrpEhF6jEiUV9dtORShvfW+Fu3YlbSqBzMcKTclDpU3LIrLIKXPK+rZJF
	WA==
Received: (qmail 2543600 invoked from network); 19 May 2025 17:35:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 17:35:57 +0200
X-UD-Smtp-Session: l3s3148p1@5Idb4341YrdZz6uL
Date: Mon, 19 May 2025 17:35:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 2/3] i2ctransfer: Prevent msgs[] overflow with many
 parameters
Message-ID: <aCtP2dK7eOK9R_xP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.de>,
	Linux I2C <linux-i2c@vger.kernel.org>
References: <20250513172119.09548573@endymion>
 <20250513172330.1b6897d3@endymion>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0nWeApX8nFlIR/1i"
Content-Disposition: inline
In-Reply-To: <20250513172330.1b6897d3@endymion>


--0nWeApX8nFlIR/1i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 05:23:30PM +0200, Jean Delvare wrote:
> There's an off-by-one bug in the message count check to ensure that we
> do not process more messages than the kernel allows. nmsgs points to
> the index within msgs[] which would be used for the _next_ message. If
> this index is equal the maximum number of messages then we must stop
> already.
>=20
> This closes bug #220112:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220112
>=20
> Fixes: 9fc53a7fc669 ("i2c-tools: add new tool 'i2ctransfer'")
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Applied, thanks!


--0nWeApX8nFlIR/1i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrT9kACgkQFA3kzBSg
KbYUDw/+KO6lpFh3n6ofTQj5ubbQZH/gZUayI4J0Wo07JY9AktzIeoWbdQL1Ixfa
DorWFTDL7JUJlkEDHYMvSz8CBaoiKLXx/fr0a+MUdZEHieR9zvHZ7QYW2eWoee8b
bOQjYrFaLcRFLT9e2U3s0poj9QhRQMaqpHxB1F/9GkeBIMxgZoZFkUhngxe5t9wA
jWRJrGwdCwNe+SPYfcmlADkcRdHLjpvDER+kealtxflfP0KAD2r1H+HQvLwcdAic
+CpORMQmr8JdVKysK8uGymNbjOtDg1E+rniNcXb0/u3R6Y5dYyN0IxIGlUsU6vTX
M1+Xk6UW8C5tq0E+H6vorLxkhcVA+sV3u3SZCSxNLT8/h8+w06e+LmZNq4YBFyw0
DejpT4F5omDkoaOp1S5/1DHwm9bXb6Dlaqspx0Aab7BNmLKq7EhvAGna5F5Go8wd
scfB2IkE7KKUhzwkKCWtnkywYg2xPXuS7h+XSWOgabJVRY8F8BxzEGjUFagAYKC+
2JmRG5gTXUi29hS+ANR9qjMMbIluZw8KxlUBizIg8bA2+Lg4C5DOxU9o0znrOo7x
DOSyAFMfp6ZLikUiZ+W7BFwBuyQ2ZsAjfznnapAgDD25y1GaFQICTM/gPn5euZMA
vljDqMf0qvLU21acCMWH7hYr0ehJRdhXg/xfUIyl/vXd1QpKNK4=
=qrYl
-----END PGP SIGNATURE-----

--0nWeApX8nFlIR/1i--

