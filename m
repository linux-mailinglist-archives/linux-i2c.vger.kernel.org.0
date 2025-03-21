Return-Path: <linux-i2c+bounces-9971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6702A6BE35
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 16:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F37103B4941
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 15:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C96D1DE4E5;
	Fri, 21 Mar 2025 15:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jIXgKt0J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5A21D95A9
	for <linux-i2c@vger.kernel.org>; Fri, 21 Mar 2025 15:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570411; cv=none; b=YPwQUi5+rnlTFkFOBk0Rb/aapn/NuFcjJRVv0eUqvQ90Hs3II4F+pheeGYzQrkOZGQmW8wcfzJWzuJW2Uq9jyvgbVB6Si5P1onuyL0myjeg7nKABMs7IyYkZhKKZm5WJJqcmTQZY15ilsV9FbTD0zN4/iMsXOMvLYls/Rb3Fc3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570411; c=relaxed/simple;
	bh=h7wMk5xJQiuYRTA9seubj2JOoaZer7gZ3AkwQXbkLMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIa7usGNauTW2AElCdHMEJohaYR8XMr/wEKmpVjvfcPiIYfEvMSQGBsAJr8ddKbqcCdCvzrKdijXj93ktELq6/fZ7ER9iPxwXwrJdJxcR4HUVQm7v9jJTMr7K6LHOShI0X1CYExMiGcHnmjiGHgy9Cw6EeqNaPWYUVFlWPEBLPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jIXgKt0J; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3atS
	F2HRKp41o0+hEpGEldmL+PiVf8SnjXURcUIuoTE=; b=jIXgKt0JmHGErQJ8py1L
	ZYE5yN+hZXqPnFUFQ73zOjeF6Ujl5kB/qW/2PsLR5qHrRxJg+nKSrt6MC/IgLKd9
	vVCYFBPFhlNi9YGe+gpMbOrvIqaIA3bRvSlNevibjkQkUA6Wf2OTDtkTNyd0NpGl
	qni0LCTPtyfpEg2IyjCIWFlSTFCPmc7YoGfazuV8uRuntVTQs0Z27IWhFVJnZjTX
	87Ez1M393iractUxgd0m06rdqenboRiwt3iU3AmZUNUagjQjl4DLp4iEPaMN7l8Z
	Bx0ensziTSvUUoQ9M9Qd9dw0kCt1QunuaIbztxqNe0I5Jzo/mzYm9dYLE8wBUikf
	GQ==
Received: (qmail 1291536 invoked from network); 21 Mar 2025 16:19:57 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Mar 2025 16:19:57 +0100
X-UD-Smtp-Session: l3s3148p1@qn2Mydsw+skgAwDPXyTHAJp038nK7dx+
Date: Fri, 21 Mar 2025 16:19:57 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: i2c-host-fixes for v6.14-rc8
Message-ID: <Z92DnVAtOzHIfCHl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <pe5su4wqtac6oo7deqkuzihrm6oorqsonhksb2lshujaocyimk@ed3kwddo7ci6>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EubtGhyDD0WiEUXj"
Content-Disposition: inline
In-Reply-To: <pe5su4wqtac6oo7deqkuzihrm6oorqsonhksb2lshujaocyimk@ed3kwddo7ci6>


--EubtGhyDD0WiEUXj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1a=
e1:
>=20
>   Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.14-rc8
>=20
> for you to fetch changes up to 6ea39cc388899a121b5b19b6968692e9460ee4a3:
>=20
>   i2c: amd-mp2: drop free_irq() of devm_request_irq() allocated irq (2025=
-03-20 14:37:47 +0100)

Thanks, pulled!


--EubtGhyDD0WiEUXj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfdg5cACgkQFA3kzBSg
KbYvxhAAinX0xI1moOF+NzL9FY9UOQ/2sw7ZPnwFEXHoKoF5ESZ0HACxuM2L6XaL
IpijeLUnXfNA+UAtqsn3gaH/fzQlcYCY5ngXShRZTC1eNoRGAncHlM96SsRZfEjv
CL+is/VdG8m9X18ZPCzu4dcyEgYXKG4gmM0m2b0fuNVtacZe6J7+6oVyvc/erx/i
g+9RNPrtXvqfKNfgnvqi81KTH7d2clSoWvmjcGrGN05JBJ6rsdpQ5OUv+ND7nqPN
QQMvi+MuoPiiox7Ev/WIWcQiCtkjjA3sbUJZp+7qAi25c/Bt90BvWEH3/71/EOSh
MyaNtX/EUUdsGHx89Jlx3JpcoJL1SzMvmanPVC4GAApTLjFqJODBWesV/jiZruPA
lWn/GPx4mWJVdAqdC8tmH02lyoXLgY85IfZiJFIryYLbwY2fG+GMVeyybr7jHHKp
lyFTqbGL0MT8VR06JtaoYMZa+EmwthP+FwfgPoQiTfdmU81aIpqlJsdi3wfWlJcn
ZNDQZr3eIBq1qTeJGyKFaQ/bjXm22Vy5ApUeQaJX6Ksnz37ej2ZbO6lkKN8P6z1S
jrO9X+i4MU+5c+BVWl3w6ej2g2S8pYuGjF1BVWU0H5FGnz6Vnaoex8kGlOrIff3a
ZQC9ueR18BWdyP8WJjHLiKINSe38zXnrhvGeVfFlZBQuwz/TP0Q=
=PckO
-----END PGP SIGNATURE-----

--EubtGhyDD0WiEUXj--

