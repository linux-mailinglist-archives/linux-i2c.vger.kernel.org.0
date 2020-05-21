Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDDC1DD968
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 23:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbgEUVVw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 17:21:52 -0400
Received: from sauhun.de ([88.99.104.3]:54094 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726814AbgEUVVv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 21 May 2020 17:21:51 -0400
Received: from localhost (p5486ce13.dip0.t-ipconnect.de [84.134.206.19])
        by pokefinder.org (Postfix) with ESMTPSA id DF02A2C1FCF;
        Thu, 21 May 2020 23:21:49 +0200 (CEST)
Date:   Thu, 21 May 2020 23:21:49 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tali Perry <tali.perry1@gmail.com>, ofery@google.com,
        brendanhiggins@google.com, avifishman70@gmail.com,
        tmaimon77@gmail.com, kfting@nuvoton.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200521212149.GB20150@ninjato>
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-3-tali.perry1@gmail.com>
 <20200521142340.GM1634618@smile.fi.intel.com>
 <20200521143100.GA16812@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline
In-Reply-To: <20200521143100.GA16812@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> From a glimpse, this looks good to go. I will have a close look later
> today.

Phew, this driver is huge. I won't finish my review today, but I am
working on it and am maybe 2/3 through.


--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7G8OkACgkQFA3kzBSg
KbYcCw/9H7oWUrWBWy5C49NVa1N+n9JHdtx5KFE40DwXAwm2mRCSuoMr1JP9Rq5M
IFVgQp7Kk1mZ0jDR178dMQSYKuwDuFkOMDrewvQyOGPbGtn38FyInpJ6Te+uVyBS
HNJMGTluuvvM6840KdZSkRYZ9ynptA/JwSfvKoBk9/UAL6W/4C1LR97a4AEb/JFT
1To5HWdtArLvqSdfwvAaZyRghNLM2bjrp46NUFsfcXvxbZoiRZJBlmqBPJqkO4sw
wyVdSW16rdxMrAa6sFlcCjnCCZWusEgf5hdUtm3dRqnELLYH87iLqZpdfpMyOA8E
YJSLRpRBj2GUlmvG2S2Kd2H03UUyfspn9Qxe5T7MOpYDuoQQoOXrjH88kqTyEVty
3pkQ0z/oo62JsfgfjJQW5cBxbRhIiwP/rvMai1eXo303chCA2ieP9cT1bPbw8BXY
uJ3Xl2Botr7hgj7VywLHN6cp4S5m4iWJVbjUZfM2vAmSKTSKvBcIR1mVVzfZgWJD
vE9PsxfHtt0EOAU8WE9iseFJPOvzK7tuuaibHaD6gVAaNLr0Nv4adcM1MwSCicum
PqkDvXWuP+n6HdQ9+L/FA63xAtbT5SRQIFYhMBxots9hOYAUxK5gOnoHJYbAqB5R
TY2mr5I/NekkgzmBbh0ZRWTRdCmgfQCXmzMku6xaM4D57Weuauk=
=vjY8
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
