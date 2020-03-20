Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 218B418D159
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 15:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727501AbgCTOoG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 10:44:06 -0400
Received: from sauhun.de ([88.99.104.3]:49174 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727315AbgCTOoF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Mar 2020 10:44:05 -0400
Received: from localhost (p54B33339.dip0.t-ipconnect.de [84.179.51.57])
        by pokefinder.org (Postfix) with ESMTPSA id 9A49D2C08E7;
        Fri, 20 Mar 2020 15:44:03 +0100 (CET)
Date:   Fri, 20 Mar 2020 15:43:57 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 2/6] i2c: core: Allow override timing properties with 0
Message-ID: <20200320144357.GA1282@ninjato>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200316154929.20886-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
In-Reply-To: <20200316154929.20886-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	struct i2c_timings i2c_t = {0};

Simply '... = { }'?


--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl501qkACgkQFA3kzBSg
KbbzVhAAod0ds1IAHIoHWkbjgQwv+H+tSiOUL1WJcCQeQOByG43CCqOiZBuJzxqI
3WxSGUZK7X/CxCm11cAtdgnPB4/07XBm/ZEHpBj4xwJ/UviW04vAgrwKdbrbQGa8
58m8LoAyZsfkAK4udbPGczQMM6qK1tJAoHDmyzY/RR/5NE5/gZ7elfpvCEzE84MY
5xUZQV0wr8qN5r9i2hLfLwI6BjW2EeINKORnQvSMNlyuQpBdWTaSMS5Wg1yw80YD
2ezj5Aaa6tw0Z6sQjCv8WCICmG+TlfANI2k0i+WRMGHUQSNmv7aulejC7U/YP0th
EB+MhNWXVQfF1O2OoCR//Q3PLDCf6nIlUN/Lla33ChUGKqSosj8B1suNuCqlwq5O
YadnCTeZPckMsc5IJOLL3wRChPt9Kc3qnUkLApwqP+9UTI/iO/QrBPqiGB+eZqcB
7Nhv8NuF6uydpy7qbRlO+wOv/bDz/+3jrt1iTgJClQo63fUHPCc0MveZtmrO/UIe
c8ARhJ4ZjU0ELQ6g+j94VL6VWBouLPlnE7VOacMht+2V3OYbNlFVmR0XcM7cCIoC
BEghmFXljfwQshnripkkv44NGGA+EwwCYfExZwvDDwVVpsshdD5dly6dnHVc4IAE
QI3xjU1oW/8wfxHTJ31sOfDGe3xhwof0H3CqANpUHDWpdxMEilw=
=6zHD
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
