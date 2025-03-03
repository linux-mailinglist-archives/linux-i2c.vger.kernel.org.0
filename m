Return-Path: <linux-i2c+bounces-9724-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DED7EA4E953
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 18:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42E15188A3A1
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 17:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACA32E338A;
	Tue,  4 Mar 2025 17:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PRD1IODV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2CE2E3382
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 17:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107976; cv=pass; b=C3stocpwgYIZWGX0MgcModNUF6X/odJX46cgx2ky24/pqw0rvux9Oyfm4S/2LIkT9fj0HR6idWeb1tFYo6AgD2TTnL8qW+fcq7271S8EjxMEgRcp3v2R5sQMSQf+trwm6xsREKmAQB3r2ObndMFqTXkiEjfdhmpynGRe3R1B+Pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107976; c=relaxed/simple;
	bh=1zSnC+icBKdpSfr4vWUYgocPh0mXIzh1OrfARyFoLEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myE9WyVROOtAPQcj33NnbBHWPJZ2qO+yMCGkgC+o63/pi/rsn2WgBE3jDc4udwS0yi+GbMh24vEfhv3Tif9d+G9c7gKx0yc56GFDU+6X+6QKM9/lgXF3ESSAp768ThU98ZpF+zAv6lIZ5A7LE9pwQ6wlRgZpyUl9pcen2G/Xmgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PRD1IODV; arc=none smtp.client-ip=194.117.254.33; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; arc=pass smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id B0D8040CEC8D
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 20:06:11 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=PRD1IODV
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gxS4Wb5zG2td
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 19:24:28 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id C70EA42741; Tue,  4 Mar 2025 19:24:20 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PRD1IODV
X-Envelope-From: <linux-kernel+bounces-541096-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PRD1IODV
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id CF8034209B
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:34:56 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw1.itu.edu.tr (Postfix) with SMTP id A70F93064C08
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:34:56 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 294771891802
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 07:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3941EB1B5;
	Mon,  3 Mar 2025 07:34:44 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C6A1E5B76
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 07:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740987281; cv=none; b=bCPFdGqaCKScKuQOfIkLpWlDIE2qkEc9agUyafvMNvkxas7sfSEEEmJ4rZK0LFuFdNd8v/DU7P/o8QN9QpeWP6R28/XreZur5Rw7sZ3TG9sErb/8t788H29+LhH0uexmn2xn8nyObYBtIMcvAHcFdp9oNZHyY5oTV8UT5JIrD20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740987281; c=relaxed/simple;
	bh=1zSnC+icBKdpSfr4vWUYgocPh0mXIzh1OrfARyFoLEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fghwn19zNwXO8JOTWlwxcgdppJZ9lwoz0pXbH56FSdCLPWeyveAtnk9wPySpOUrHmKWrwkvrquxx2ANTIl3ic5GXi/QhmIg7exsjTB0E4Sj7jIUCU7zDT/qtbscDb0rSU0cwj5EEPovCdrwsttrwrUijODMhAqJVYY97LHpRfZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PRD1IODV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1zSn
	C+icBKdpSfr4vWUYgocPh0mXIzh1OrfARyFoLEA=; b=PRD1IODVjyetk9PkfKVn
	I3DTQxbokjFR9CNV1k1rDupMnM/JGjzUS18352ouDZ9JIWTKQt/YS4T02t8jn9cg
	of1ZWTrehF93/fBzYGVY8b67JkPzgi/3cKwKAH2XmuWxM4Z4JbLLPOy4LAC+qAK1
	hoFQz3PtzrjHi6RaRPJ0wNlVWaEL/01EqeTYiiGJ7S4zyJAsYAmDM8vKs+4wWMa8
	MqweoxK4irJeEsDphjlzn13XuWr2xkPnYZeGzj5kWZwzIgeOGRJp94FjvCA7hk5w
	k8t7MfIgf/MhF48fHW4wTkVN+LEdaXB32gpO6kRjOJ0txyqAkDJwvfgWJogrAy10
	kQ==
Received: (qmail 2114209 invoked from network); 3 Mar 2025 08:34:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2025 08:34:35 +0100
X-UD-Smtp-Session: l3s3148p1@EAweMGsvGLUgAwDPX0OvAM+yGPZJhv6R
Date: Mon, 3 Mar 2025 08:34:27 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yao Zi <ziyao@disroot.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH RESEND v5 2/2] i2c: spacemit: add support for SpacemiT K1
 SoC
Message-ID: <Z8Vbg1diEdmJLEs4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yao Zi <ziyao@disroot.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-2-21dfc7adfe37@gmail.com>
 <Z8VHaQsqAmhtQnbv@shikoro>
 <Z8VWH-ZXv1FWQU3u@pie>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0aDRa5CnHJqKCDfW"
Content-Disposition: inline
In-Reply-To: <Z8VWH-ZXv1FWQU3u@pie>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6gxS4Wb5zG2td
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741712659.4485@ahSW4Y1Gd7WKwfZWkZNl/Q
X-ITU-MailScanner-SpamCheck: not spam


--0aDRa5CnHJqKCDfW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Reusing existing driver has been discussed earlier[1] and the answer was
> no. It really has been a long time.

Thanks for the link. I still agree to my opinion from back then :)


--0aDRa5CnHJqKCDfW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfFW4AACgkQFA3kzBSg
KbaxAQ//cfKlnoUMtjtK9YaJubYHDqIemUJxUQqf0FEn+JQSFM7DQ5ojyLmCm/yi
gQf/+MXQnWbeQdgCFLPM4QvvGBEK4xqI0o/eBajw09+jzSNBQWhjw6RbKX6O6haB
PmDvXbOz8MiBGHPLF67V5xOMDRu+IDpOVmCBcIf66hknOdWJ5bdj5frK+FwcT3IT
xOoxjrRRPR8GUu2Z+ZlAcINWiniH/+bIotIIfNE1AGPIWAxFeiolhTtjSw7crFaL
1GYmD9Dli15mtEZdpkIXuCRVbJPabHN8GDClwxuDZKz4fI7N80QK4p2efnN0GvQy
q29Tb2qB9fOne6fI1NVSgmLQd1+5G4KxLXk0z0LoSUZPI+fWrGnDudm/0WdlG5PL
Fr4/OrZMHr+0QBK/n+ORz8pkc5jekj5FHn3jc6cDeF0csHZ3qR/QntDm/UgRAvKw
RlGB8QOlBiNtCa70Mdm6ytd4olZbJm57lkylUY9jT9yLBrwfBQEjhJsaD+DIzDe4
HkUREpfEE6XJi2gFm9hAqcVNfC2nPR+Fn7BvVeQ4suKQoTAFspyJisBm8wE6+NYo
6F3JCP+ySrh4c+mWegDQBmJyd0I/6M4vMtIXG66q729nQ52DmQD9n3Xed8L0hkMQ
snVCNLPmAtBxBwB4yMAf5tR7eSVFdQZpzV3xxDJ/54Tet8oJWSU=
=5//C
-----END PGP SIGNATURE-----

--0aDRa5CnHJqKCDfW--


