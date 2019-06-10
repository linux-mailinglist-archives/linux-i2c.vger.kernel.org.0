Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 398013AF47
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 09:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387714AbfFJHEO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 03:04:14 -0400
Received: from sauhun.de ([88.99.104.3]:38756 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387614AbfFJHEO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Jun 2019 03:04:14 -0400
Received: from localhost (p54B33062.dip0.t-ipconnect.de [84.179.48.98])
        by pokefinder.org (Postfix) with ESMTPSA id 9A49D2C077A;
        Mon, 10 Jun 2019 09:04:11 +0200 (CEST)
Date:   Mon, 10 Jun 2019 09:04:11 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] hwmon: pmbus: protect read-modify-write with lock
Message-ID: <20190610070411.GA2673@kunai>
References: <20190528090746.GA31184@localhost.localdomain>
 <20190607223217.GE869@kunai>
 <20190610063639.GA18981@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20190610063639.GA18981@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

> patch and send it to the wrong list of people. You can ignore this
> patchset, it was resent to the proper mailing list instead.

Thanks for the heads up.

Regards,

   Wolfram


--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz+AOcACgkQFA3kzBSg
KbY4hRAAqXfWZpHXSFJXXt5Ly38m8FEyW4ZgFvbXkXvpO3AfnlxsARiQYUmTPrIf
7bsLvuJ6f3UfX1Y09zkNCaBDnHvuA0kw9qrA+2P6aOZfhZq3M3XzDUnnOK9UZA4y
XnJ2Ei/2wtVFXxyi3ftFI8bCUACTZgrjE8EAgN5eV2fssSgdyxAahW/4bHD6Cslz
5RFgzqbZjf71/PtzEk3QQExAOFj+zml+dw4wvw6hSNK8taTZ+qlolvPXG+7sRDfd
izfclABMYBTskX2QsTLBkJ7hbLYL7iA+sURNobvChx9azc4WDwW8EeGCkEAjCLBf
LhIvYWtVDd1NDhUcwhi4bARjxjCct3fME+MbpPuMsfPBUccRXpFa6be9VdU6JWHO
3HrR5P9CwIw4HuwbccvXrIDkDhBWJL+E/hpTXtcyiZ+Tj83W2WLfhpcwAT8nnsQr
85QfgSAhwpqvat8rSNEEo/JbAnv9vBVFR0ooSVO6rbbj2nYjINESLAQTjUlilDgt
OM/HpDuBmWlnYArRh9iS0giu/2fZZ2Bz+TM44q8S3WnhT9O2UP9yKDRXQVH78n4A
CxAyrvnX0YtaPvwl4yvWrt1j8Ge228QcKQJHL6hz9asWHiKAAaR/cj7TOhkr/2Ci
PBK9J+E1/7uWt03G7TjO9Ugo3KStb9/OC+8nrEPkBaWEgTIqGQ4=
=DtHV
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
