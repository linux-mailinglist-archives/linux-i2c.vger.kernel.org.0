Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C41F45A0A8
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 11:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235450AbhKWKzn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 05:55:43 -0500
Received: from sauhun.de ([88.99.104.3]:48678 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234186AbhKWKzm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 05:55:42 -0500
Received: from localhost (p5486ca86.dip0.t-ipconnect.de [84.134.202.134])
        by pokefinder.org (Postfix) with ESMTPSA id A128F2C009E;
        Tue, 23 Nov 2021 11:52:33 +0100 (CET)
Date:   Tue, 23 Nov 2021 11:52:33 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Green <evgreen@chromium.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>
Subject: Re: [PATCH v1 1/3] i2c: mux: gpio: Replace custom
 acpi_get_local_address()
Message-ID: <YZzH8fSk6B1n9WX9@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Green <evgreen@chromium.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
 <304efdfe-db6e-051e-b61d-e73a8dfa1c53@axentia.se>
 <CAHp75VcF1TZ5hH42-D+0sRkYkN-A1r797LdHGMT93UO4Sp3wLQ@mail.gmail.com>
 <fecc80b0-e24b-409d-5f60-82b899f0bdba@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="meIjsH7BA1Ore7SF"
Content-Disposition: inline
In-Reply-To: <fecc80b0-e24b-409d-5f60-82b899f0bdba@axentia.se>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--meIjsH7BA1Ore7SF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> @Wolfram: You're finding this series in patchwork and will be picking it
> up as usual, right? Thanks!

Right, will do so now.


--meIjsH7BA1Ore7SF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGcx/EACgkQFA3kzBSg
KbaXAQ/+N13bGsQOkSjn4Phfs1jQzubQo8FR08/SzxDTuD5WJoKPI6EkqOLpUHzq
ot44+RajN2QoAqYtFM7UNGOsz2D8A3wGnB7QjvTpJlnpX7bFMJ0j0wdzVy5Qq07x
dU4RZRjJr1hNGQGTAuTTky2JLbQeOYgEyM7yiuzMnrOLWi9/2tRBedW7nMmZo5Fy
aT58BjSvcC2YvitDqfs2XHHelYJZpRk1dPq+VKfsJiAP+gYOkH8TCwpcxGPFbnP8
HlSqjsQNaWfIpMA5teavozeey0z+86W5QZk5p3L5432CkzpiZV2XZTL05cpl44Yp
PWkRsfQXn+SZYmKzA2xzin9gUTmuBchTn4mSOIt+nvbs89T1JLpZRlrDCDzA5kfM
fT2mhEFr96MUtIN5WCyPt1HX2JUo3mve+ZCnGLoRz5tv0Py1TrJIlByWQIJxaIBu
ffHAQNSQQzIf97NV0AIQ5VPeF6XqBKP6xRXcOuOYRDecn5wdbf7i1nAW9ajt7Pqu
NQMldlnZCxWFtis3lP5NzPDGZxMP0JyI0Hns8pf2Ls6nhRPm/NnsC0d5DJ2d9NsX
7NXE5jrKYEiYy41ip0m+K86+sj3cy1l5AjMds7l/LK79dTYof2/db3Vv+/A6GfR1
hdzy3L/CLyDC5k82TZw+Qn2e6MX6QlREkENIbb5VTiX1Zyqf+y8=
=ARCc
-----END PGP SIGNATURE-----

--meIjsH7BA1Ore7SF--
