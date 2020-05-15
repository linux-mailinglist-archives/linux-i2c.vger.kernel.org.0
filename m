Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4025C1D494B
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 11:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgEOJUp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 05:20:45 -0400
Received: from sauhun.de ([88.99.104.3]:33612 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727803AbgEOJUp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 05:20:45 -0400
Received: from localhost (p5486cc07.dip0.t-ipconnect.de [84.134.204.7])
        by pokefinder.org (Postfix) with ESMTPSA id 3025D2C1F6B;
        Fri, 15 May 2020 11:20:43 +0200 (CEST)
Date:   Fri, 15 May 2020 11:20:42 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?Q?Adamski=2C_Krzysztof_=28Nokia_-_PL=2FWroc=C5=82aw=29?= 
        <krzysztof.adamski@nokia.com>
Cc:     Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: Two separate i2c transfers
Message-ID: <20200515092042.GA2077@ninjato>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
 <20200514145005.GC1589@ninjato>
 <1f6b97e9-9ff8-2cdb-c6c5-16304f067d47@nokia.com>
 <20200515075303.GA1083@ninjato>
 <820e15e2-9267-1bbb-0809-4e9dc19d566d@nokia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
In-Reply-To: <820e15e2-9267-1bbb-0809-4e9dc19d566d@nokia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So this does not really solve my problem - even if we do get the lock
> by calling select(), we will simply release it as soon as our
> i2c_transfer() is finished (and will let the other master take it,
> breaking atomicity of the two operations I need to perform on target
> device) and this is exactly what I need to avoid.

I was assuming that once you have the lock from the arbitrator you can
be sure that the other master is not active and, thus, you maybe don't
need to read the status register at all? But I am probably wrong here.


--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6+XuYACgkQFA3kzBSg
Kba09g/7BgjAnimhnX2/ALB+xHveQh9YWInrxSYsu7ruCD7ExjOiwJ3bTZcyz2bI
X036nSlWa/kXWeAcNVzG9GSp6BAknadlNVc9KINSUQ/XJwJc3GgNqkCcgBwpIZhA
elSe2CzVJBKg/Vo2FlB/iKLv586YGR4T8JNWkEuC3hyKB6NG7klHiFAaFE/ZyMDJ
Y7aDgbV/9e1iz4/kbFwzHUg05jUR9aISbfS4alKq4pEhAh7Tzwogc3OWjGHL3iN3
ZL3jnW6c+wtyTskrkRNIELWcCQrw9TWP0/J/R2gySUJQ5UumO48g7hrOEcWAInZd
vzPgR+3fPfY+VbY0/LarDVTCP3IGjKZ9QmPSQveTMIKIylud3Dv8OQ282YpebO6b
HwR+EcNlw6KcT689n+60j0pfL8yCHP8UsXmlXPy1Luh6yFnbWGq4fMmozNowgFA5
gg7Z57DO2y6wXwbhltilGUq4V2bfQjciQEJOo5jQ/RCN24if78WgcCd6YtxURPPP
47KThr8hVHAbJ7q3Nz7e0EJw3kDG+33BVdElzsDpM9vzsk4iV2z2ggaQLs9wW20t
9/RqKBg4xHAuGTrjzxkMO7KGHzhGBKgD/UM5mOW5SsnT+mQ9OwaRbjVvr/7E75rF
kGBQYOEIiQ6vszkv13Dz4eEhZvuo10WmLg50HmiteuBB/wlCakk=
=zpz3
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
