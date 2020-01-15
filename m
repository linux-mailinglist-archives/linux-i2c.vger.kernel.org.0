Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE4C13CD89
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 20:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729575AbgAOT4Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 14:56:24 -0500
Received: from sauhun.de ([88.99.104.3]:41034 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729025AbgAOT4Y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 14:56:24 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id 334D62C0742;
        Wed, 15 Jan 2020 20:56:22 +0100 (CET)
Date:   Wed, 15 Jan 2020 20:56:21 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/12] i2c: taos-evm: convert to use
 i2c_new_client_device()
Message-ID: <20200115195621.GB23789@ninjato>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
 <20200107174748.9616-7-wsa+renesas@sang-engineering.com>
 <20200108115822.20871d77@endymion>
 <20200109094228.2e058653@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline
In-Reply-To: <20200109094228.2e058653@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> In my opinion -ENODEV should only be used for "I expected a device but
> could not find it". For the case where we simply don't know what slave
> device to instantiate, NULL seems more appropriate, as it's not an
> error.

Well, I copied the behaviour from driver core here. -ENODEV is the one
errno where no messages will be displayed when returned from probe. So,
I think we can keep it as is.


--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fbmUACgkQFA3kzBSg
KbZROxAAqc2hmKmkG203rrtIiUXGmbpTvszqf/43X9B9O1wXnGdxx1x6WSWTX4YB
XxEdu03zUqg0uop2ISE3lb9QhS9de4X0WRGwg+U1y2jAwgDXs/ZPNC1tpkUsXl97
2k61rSY2Xzgit70Lul4Y5JpZ/xEtpx9FFMrREMCkzUz7D9xol5gtnX+nkiOVJnPn
Pq7FN/Euvo3zpFHoDW5DFDsSM110d1KbSM1+gE8BxUrOpJVX1UHur8NQKcvMCMBL
vc7bG+UsLZi3OJb58wpkgnSrFJaWhulcckjWTkPMnWeFy+0QZA5EJindpaSNE1sw
2X950JNs0I8SUO4BtyEJCCsHMnkibaU7Pa57WN6DtYM+DX7DX9I7goQSGHZ5mN9M
0zz6eMQZyk6qTab+lhk2n9yuIyBhjqE4OZoxKJ/kKDj0R8lxT35NLBpNxu52/g6v
kfbJY1SkhwCeBo2aBmHZG0Hcj45Ef51RPZcYdyYSyEFzVBIpTUF8JbpvA1UcH08f
1BaIhlFQKNp3eadlq+/hsnyiKs1wsogvOFirDBm6D0JU0k4CSLuWGXtBIexbYiIO
Dx6G9VmKa3w/7uNzXVOWSX5ukiWEUeH25/WnPkfrYZBy+bsbtPn5zyyv+6Z90eK9
mgNOgEbLxkrBrUligXqMGD5tdyufSH02hO7OkgxNGag9w726V7k=
=kYJM
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
