Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1EC15FC1
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2019 10:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfEGIuQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 May 2019 04:50:16 -0400
Received: from sauhun.de ([88.99.104.3]:42074 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbfEGIuQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 May 2019 04:50:16 -0400
Received: from localhost (p54B332BA.dip0.t-ipconnect.de [84.179.50.186])
        by pokefinder.org (Postfix) with ESMTPSA id A4E942C28E9;
        Tue,  7 May 2019 10:50:14 +0200 (CEST)
Date:   Tue, 7 May 2019 10:50:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Roese <sr@denx.de>
Cc:     Jan Breuer <jan.breuer@jaybee.cz>, linux-i2c@vger.kernel.org,
        Steven Liu <steven_liu@mediatek.com>,
        John Crispin <john@phrozen.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver
Message-ID: <20190507085014.GB25688@kunai>
References: <20190503130602.13144-1-sr@denx.de>
 <CAEEQaa87Z1nYVu06AzGKw5+G07AG73LumiaH9oUB26wz6B6V9g@mail.gmail.com>
 <63e5c143-0803-458d-7e63-57f17f64bd0e@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline
In-Reply-To: <63e5c143-0803-458d-7e63-57f17f64bd0e@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Might I ask you how you detected this issue? Did you experience some
> problems in the I2C communication on your target with the push-pull
> configuration?

Push-pull is not a good default value for SCL. It kills multi-master
support and you must ensure no slave will do clock stretching. It is
really only for very specific use cases.


--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzRRsYACgkQFA3kzBSg
KbZ9XRAAlq2jRtyHJ3HiD76h3oA3lZizo+WJlIwTrChKeUs2JO6xrcRN+4A1GlVg
QNZhokeWguHIBZ0254pb/Se6KhjhMJjdkpHuhFXgmZW4W5jcdWtefrJrHIpluz48
yz/V/CqQ1+Pix9Z3E8PcSnnta/E9tIiGhaOQjSa450//wuAsA9intm/uNHD5s8Y/
BpHP4/yrrPXE0JAcfUBaFKxpul0zk8b6xsSexpyX0tlYA4KVTiFxMT35ekwHo4CR
fCVRatNsgFvZdUMmjQ9dyRa62MBVmMKj2s1O1oY11y8YjNbvFyjKfmVlHKoDohBT
EFjZatLxPNw2LmJj1RGhKjR0ogf293oZoj/UtyCEel6yJxQTpueTIY7nGgt15AW/
LudQwPBlC0c9x609pEqEF0T0kaFj1M4DElojZsKyFyBkSN54l6wfszm29C6BsQ8V
ThaBHLZuZWfHEbXfWWaURGSHAlSfWIEBIsFnmzjh0A0mfQiJm9O4rzQYuon5Sl3n
RMxheeTd9o0rJThd8Xl//NoYUwhrQg2hXbIX4MF03csN9+K+a9PO6NyCSqgCQe+o
rj7hyBc/0nL+rF6QzWheXx0Zdi749xXGrSZNc1i4U8lyZBk3zNQPVwRcZuddBYhQ
taL/QS+QVKN/IeV+MzjlYyHpN8BZcwNOFHN05ELxDkAQrdAPQec=
=IOvk
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
