Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0A58DE08
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 21:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbfHNTrR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 15:47:17 -0400
Received: from sauhun.de ([88.99.104.3]:52202 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728394AbfHNTrR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 15:47:17 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id 12B992C311C;
        Wed, 14 Aug 2019 21:47:15 +0200 (CEST)
Date:   Wed, 14 Aug 2019 21:47:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Max Staudt <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH v2 1/4] i2c/busses: Add i2c-icy for I2C on m68k/Amiga
Message-ID: <20190814194714.GB9756@kunai>
References: <20190812235237.21797-1-max@enpas.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline
In-Reply-To: <20190812235237.21797-1-max@enpas.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Thanks for the patch. It looks mostly good.

> +static int clock = 0x1c;
> +module_param(clock, int, 0444);

'clock' determines the bus speed?

> +	i2c->adapter.class = I2C_CLASS_DEPRECATED;

This is only needed for drivers which used to have a class and decided
to drop it. You can leave it empty.

> +	algo_data->data = (void *)i2c;

You don't need the cast, do you?

> +MODULE_LICENSE("GPL");

Your SPDX header says GPL 2.0 only.

Kind regards,

   Wolfram

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1UZUIACgkQFA3kzBSg
KbY8mxAAsWO7FshbNWxce6/Ayk6ygTA3Mk2nG3PbYUCIZAWV5pj//O8wuhX/DKSy
J+11DapytlncEORT/c/V9upMPb4ojyoJCaXNgAjfzTkUYywLSa3IAgAighJge5yb
B8N0MfTfw/zUKzw/HSXgZU7OWSO4HRgeGQ/QzUky4CC7J02jfqTkD5itJyu5te2k
d6R2g1b1o+Bby86zmk899QlELXqULx7g6hphljH/sbEFqwK4RpqWmyfkp+VBN49L
RDY1BtnqWeS9lwLmDerWrSgCy7MDMa9d84YH0L1S+rQzdITVSKx4NqFZ21Jzcar9
fvaqB4Oga4LKiBwfc6p2st7WTTKgxRoG1qfNY4am+8cxTIBWwfhECcbV/uRL88Qd
knbCilRYm0+MoXqHIlhpwhJI7CqwKsFoqw/Yx5zT6XCDV0iif1mQ6gzoNJ8PDNm9
9kyK7penhj558f9W56CIWVNMvmlBmoeQv4xL4j/pFRBZA09YNrcvPfhk7wWebHDx
lbcCyDqulyyV1/OHCQ+/UwCCbm2EUc5sAAISfaZflbtq1W208VoOPyxyhNV7RJXL
6mju5RemtxU8JtFTDF79Vtm4/TaPGscoYkKuRqpfgWDdb7jQ++7b5q7kOMJ9bJOg
d0a9Jk8tPOZV6jXlsYCmxUn7WlTyCOh6mrHwvbxhFjaEpSPGGdc=
=gqvS
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
