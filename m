Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A02DA196368
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Mar 2020 04:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgC1Duk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 23:50:40 -0400
Received: from sauhun.de ([88.99.104.3]:46254 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726225AbgC1Duj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 27 Mar 2020 23:50:39 -0400
Received: from localhost (p5486CEA0.dip0.t-ipconnect.de [84.134.206.160])
        by pokefinder.org (Postfix) with ESMTPSA id 404F02C1F87;
        Sat, 28 Mar 2020 04:50:37 +0100 (CET)
Date:   Sat, 28 Mar 2020 04:50:36 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/6] i2c: of: reserve unknown and ancillary
 addresses
Message-ID: <20200328035036.GA1017@kunai>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> There is only one thing giving me some headache now. There is a danger
> of a regression maybe. If someone has multiple 'reg' entries in the DT
> but never used i2c_new_ancillary_device but i2c_new_dummy_device, then
> things will break now because i2c_new_dummy_device has not enough
> information to convert a "reserved" device to a "dummy" one. It will
> just see the address as busy. However, all binding documentations I
> found which use 'reg' as an array correctly use
> i2c_new_ancillary_device. On the other hand, my search strategy for
> finding such bindings and DTs do not feel perfect to me. Maybe there are
> also some more corner cases in this area, so this series is still RFC.

So, I used another search strategy: I checked every
i2c_new_dummy_device() caller in the kernel tree and made sure they
don't get the address to use from DT. I can confirm this is not the
case. That gives me enough trust to say the above issue is a non-issue.

Still open for comments, of course...


--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5+yYcACgkQFA3kzBSg
KbZ9Ng//dnoXJcsOM/i5HdaeoT4RtiKz8dQZpX6hMND/LRLTrKeuk7QYfcmHGD5O
mTZkGIQJh2TcLPIb3fJ2457+c2rJvDY9UBdFlaoRNgn/X5Dgvp7wW7Nilq1GVHZV
w/+aPpL8rRM5Bty7W+kSWWUisECdGjVNEOPbD6O1klsb2Cq61rdvmGqCivHHjTFV
5Y/AeqZEIUWyA9Ga5LUg7EX/qOhCG+i5qVsYDj66qb19jITb6VY8/VLdZqLPPzIa
xtGipLEwe+JmfdBSUWY7OX34nMz2xLe3wWMyMtVHLvG+tqk81YJD5E4nNfzZObSK
Myi3F7X1hO3Vid0GBkB56xhwU3ZezIm+cGJA407hcCHO8GimbRxXax+3fR6GsIBQ
ihTUG1ZkUBfuakm0JvW0tE75qS1cR0nlcIyLwFKPXo0nrPaLmQvY+VtlLwxU+lp1
+dtKxOHUEuQpUxCKBu3gRMI7f/OizK78nytTc5HDkWf/tJ2X3qhXWIdiFak7GF9L
dR6DSB3WCXhAqNQiMjeCQfQDYMf04bqzknr+Y+Xqo2ltP2oGtNvr+8Vdn3+ajEob
KYdfDZvTaQBJe/NrS6poQdRX/UqydVJh1dgKwsRNMEnG6+2y3w4SrVzZsyvahAx7
DPlpG5Sxfm5/jpf6NaC1GQ7/rppzXjm/m56e6aXxGQ4yDsVbiuM=
=scYs
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
