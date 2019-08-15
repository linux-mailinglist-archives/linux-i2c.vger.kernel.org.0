Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 109528EAA0
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2019 13:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729668AbfHOLsM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Aug 2019 07:48:12 -0400
Received: from sauhun.de ([88.99.104.3]:60696 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfHOLsM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Aug 2019 07:48:12 -0400
Received: from localhost (p54B33431.dip0.t-ipconnect.de [84.179.52.49])
        by pokefinder.org (Postfix) with ESMTPSA id 8B1D12C2704;
        Thu, 15 Aug 2019 13:48:09 +0200 (CEST)
Date:   Thu, 15 Aug 2019 13:48:09 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Max Staudt <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH v2 1/4] i2c/busses: Add i2c-icy for I2C on m68k/Amiga
Message-ID: <20190815114809.GA1916@kunai>
References: <20190812235237.21797-1-max@enpas.org>
 <20190814194714.GB9756@kunai>
 <f33ef44e-61e8-0392-7f5c-5a0bd7b42fff@enpas.org>
 <20190815071228.GA1054@kunai>
 <276714fb-6b3a-1e99-0744-bfd037305724@enpas.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <276714fb-6b3a-1e99-0744-bfd037305724@enpas.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Well, the other option is to remove it, and then add it back once
> somebody complains - which is unlikely to happen. The clock parameter
> is PCF8584 specific anyway, and  I think removing it is a good option,

My suggestion is to do that incrementally. First, get your driver
accepted. Second, do the cleanups which affect elektor as well later.

> as I've done the same with getown() (where in i2c-elektor, 'own' sets
> the PCF8584's own address).

I wondered about that. Can the PCF8584 really act as a slave, too?
Somewhen I need to check its datasheet.

> Question is, if I remove the parameter, I'd like it to be
> non-destructive. Do you know of anything that can go wrong if the I2C
> master is running the bus on a wrong clock?

Not sure if I understand you correctly, but if the bus freq is too fast
then devices won't respond. Too slow is not a problem.


--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1VRnUACgkQFA3kzBSg
KbZm5w//ZH5bqq0+UY1jHI1GqmJONqeU3hd2TQSeY1JC2ZO44Z+s5p/G/9bV1tJQ
fU4JTMH46HRgwHP3NmmLlPXJ7IjQIPxEkRt63EJ7SNcLuRGUoB4vlRWLQlNFb6gV
8+y9h6v/VjVUBIiL+INntV4EN7PHKOgic1unur9Mlmu+PxZJ0HP5gQfLgvTBYzy2
KaPlhcgD+FMioAq2lLjioZadkDGnlR6teppe60ot9lBo1awbvV0iS4Shyc5kF8BH
WohI+0Ipt+dkz76hsUFEd9FdxUZ+Uv7YQDvfHhjBKyECajeWGwgFC7ToB4aMj4V1
ncFQBO+jHrs49Qn2d1st1QzpCru+zs02f8cb3H5cwYOQmIbXuhyGQKJcbM6+JBbe
2iCbQ8Rk03QUSKsa7VB09l7bZEsaChMoT0Swb1R9BFV+PtfEyPWpnlU0HJ3nh516
qEQfqjrQ+g9QMCEjnIYyKPvwDnmLBl4yxce4F5Su9O8N6gRAQuajnvVWAgs0NlTh
s3yOm8tFVxzaMwgoEUp+sQwlgZuYWwb1iOQlgQWKFANpupLSRJ03M+d6Jp+EmjrK
RVN01YsbiQmEQMCx/aMPKPpulXLD12briv+OLTVY/UxtuwC5RikHHl2rKkWtW8Oi
eOEGP2+cYmZCXrSHhFN4n0wwgsS11aGyu2tnDQ4pMsanAZcnNf0=
=5C0S
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
