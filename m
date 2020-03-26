Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFE2193D76
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 12:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgCZLAo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 07:00:44 -0400
Received: from sauhun.de ([88.99.104.3]:48932 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727953AbgCZLAo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 07:00:44 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id A1F5E2C08C2;
        Thu, 26 Mar 2020 12:00:42 +0100 (CET)
Date:   Thu, 26 Mar 2020 12:00:42 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] i2c: refactor parsing of timings
Message-ID: <20200326110042.GB1538@ninjato>
References: <20200326101647.1756-1-wsa+renesas@sang-engineering.com>
 <20200326104701.GM1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline
In-Reply-To: <20200326104701.GM1922688@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> However, looking into the code, I would go a bit further (perhaps as a separate
> change) and export parsing of clock-frequency, because tons of drivers only
> need one property, i.e. clock-frequency out of firmware.

Cool idea. Could be easily something like this (typed from the top of my
head):

static inline u32 i2c_parse_fw_bus_speed(struct device *dev)
{
	u32 speed;

	i2c_parse_timing(dev, "clock-frequency", &speed, I2C_MAX_STANDARD_MODE_FREQ, true);

	return speed;
}

Or?


--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl58i1oACgkQFA3kzBSg
KbbA2Q/9G737L2tDrk5fYhU1XYx2LS0HeO+o/mzC9sjqcS19znrgxRvzySd4zcrV
hB4LJZXFM2DQ164UK2X1iAHOYkWNwsjUBcZol2x3wSKm0N6Y9XaMBmU7Viajqgj8
aM1KMM4OL0Nx89pl0xw7U5o3qJ2fFtrV4A3jgbjetwgCaDI29S6vtjEqSZGCsFat
Q+DITbl6CFg/irbM4ptnw4zy2Ub60aRJ/pc5sN1JQWSbMhQifxcNdkEdXe66wPf0
UL/FRFa/jNUYUtEKFBkjtUPVCEf2em4L/VbMFdBw5bHxsuHw/lZ5YtTcPqDTLUfC
Hor+Dy8MtzgAlLmz+r7YYXL+tR2c6l2fAWqyAW28wemeIMZjT9wg9cWIKBrXkuPP
HU6lllfvOlHAeAk7PZDFNxUnSxs0aExpRW3vqOVDsdFIwBKIhwj5qk/vBmBtD7E2
3qk5xcBSDgsowyAijlejHggi2G1rLz486Es3hEj9ZEzgMNobhwRmWHtQMvRAaur/
0D24+WhZY/fAbBFYK2ozrM0U7ddQAH6srWfjEvQMQfh2qud6ffYkHZ0/kktBJ6zy
bzi7xuHF4av4GhLUDYxNUfQ2a98o0dTovclVzouZPeND0ps4JjzFFmzPMw5kyUNr
1nUDS12gImZQFS88l4UW36lfqC+aCVV6HQ/AKkqD4nKjp+qtKVU=
=O3+t
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
