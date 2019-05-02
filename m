Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40CBE12040
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2019 18:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfEBQbw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 May 2019 12:31:52 -0400
Received: from sauhun.de ([88.99.104.3]:55664 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbfEBQbw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 May 2019 12:31:52 -0400
Received: from localhost (p5486CF77.dip0.t-ipconnect.de [84.134.207.119])
        by pokefinder.org (Postfix) with ESMTPSA id E47442CF690;
        Thu,  2 May 2019 18:31:49 +0200 (CEST)
Date:   Thu, 2 May 2019 18:31:49 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     skidnik <skidnik@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFT] i2c: designware: ratelimit 'transfer when suspended'
 errors
Message-ID: <20190502163149.GB11535@kunai>
References: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
 <1a8172c8-3d2e-1897-88dd-d86aa0130ed8@gmail.com>
 <56faab09-c2ec-047a-886e-669d0a106e7b@redhat.com>
 <39b2ddc1-0f96-8977-f57f-840025aff4f2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline
In-Reply-To: <39b2ddc1-0f96-8977-f57f-840025aff4f2@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'm going to report back to Archlinux bug tracker that the issue has been
> fixed. Please can you tell which kernel release will have these fixes so
> that I can provide relevant information.

The above patch will be in the new kernel next week, be it rc8 or 5.1.

> Thanks for the great work, regards

And thanks to you for all the help testing on HW!


--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzLG3UACgkQFA3kzBSg
KbYeYQ//XcZ/aAX4I697OFVIz8v0lpiUIEUdyAB+BuOQyz1+t7J2M5gE1gcXwSoV
qshikbw8MhnYXJwt/6dVh/+kPo0FjmZwbIFPOLtfUib8noClkz0H1StIsqua2X1t
sDQKfgxSmwQRxdgBpMHL5x3aLJ6LibfmejsXjwYOJW3RWwlwwbvGtwpnvIlWH+aF
xkPZ/lB5eI9hU/LU2v6wGlA0tMssmjnzyRK43g4N3u+0ozk1yVksLxF4OSdsxH2P
8GIGzocf2i5lSZ6qlmnnnT5Cno9TLZMn01V3wDU1ON3yU7DJdJMdS8XJNKSH1Zok
hbtxSr0SP/+l4aSjMEkziZ79P0eIo0C953Y+9DDf51rjeC7cC7gZV+5+Xf0ra0pu
3ZYqW10FdPCdJ3DQH9+LbrVHJXPiYBBIjOYzGtCDERCQ1hAwW2g5ZHZ4edN8EBPA
C/tc5SOvW9czsbu5Egkfxmu0/UdKuehPsLQl6LlIdDv1pqExp9ctQVecvIaGXEgS
ez8HFDWiFpQZr5kbbznBrAVWrIJOo+w2f/ZZbnff4IEUCBTOkRZRnl+mzuaIlRzg
2MmMItSOO9cWYDaJnbAz9UxInuECSQ+uCS9nV6gJ9ul89vlOS+xattSTtPNmz8+Z
MGKDag3T0O8qNB1it+oh0lhLlN5yUm1EhOVmo6S1DuqL0gV+DJ4=
=+1g/
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
