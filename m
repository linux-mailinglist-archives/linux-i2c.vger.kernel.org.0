Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE8338EB06
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2019 14:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731482AbfHOMEd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Aug 2019 08:04:33 -0400
Received: from sauhun.de ([88.99.104.3]:60830 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731340AbfHOMEd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Aug 2019 08:04:33 -0400
Received: from localhost (p54B33431.dip0.t-ipconnect.de [84.179.52.49])
        by pokefinder.org (Postfix) with ESMTPSA id C07C22C2704;
        Thu, 15 Aug 2019 14:04:30 +0200 (CEST)
Date:   Thu, 15 Aug 2019 14:04:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Max <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH v2 1/4] i2c/busses: Add i2c-icy for I2C on m68k/Amiga
Message-ID: <20190815120430.GB1916@kunai>
References: <20190812235237.21797-1-max@enpas.org>
 <20190814194714.GB9756@kunai>
 <f33ef44e-61e8-0392-7f5c-5a0bd7b42fff@enpas.org>
 <20190815071228.GA1054@kunai>
 <276714fb-6b3a-1e99-0744-bfd037305724@enpas.org>
 <20190815114809.GA1916@kunai>
 <54185c85-8c26-916e-41b1-af9b55223e7b@enpas.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline
In-Reply-To: <54185c85-8c26-916e-41b1-af9b55223e7b@enpas.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> My suggestion is to not touch i2c-elektor at all for now, and remove
> the 'clock' parameter from the first iteration of i2c-icy. It can be
> added back in case someone complains, which I deem unlikely.

Full ack.

>   When the PCF8584 is addressed as slave, this register
>   must be loaded with the 7-bit I 2 C-bus address to which the
>   PCF8584 is to respond. During initialization, the own
>   address register S0' must be written to, regardless
>   whether it is later used.

I see. It must be written a non-zero value to leave the monitor mode.
But this really needs no callback, we can hardcode any non-zero value.
If slave support is (ever) to be implemented, the own address will come
=66rom the I2C core.

> Okay, so we don't care. Cool, then it's safe to kick the 'clock'
> parameter from i2c-icy. All 2019 boards (which should be the vast
> majority in existence) came with a 12 MHz oscillator AFAIK, so the
> default should be good.

Most drivers don't allow users to change the bus speed, so I think it is
safe to remove.


--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1VSk4ACgkQFA3kzBSg
KbaiGBAAodEGPift49JeBi1yJrTTGr4RWOodih6yvhYigloZgzzCOjujdcDFc833
5dB5EG7SwdqLD+Kwda8tbsCPgfuYXqtdVbJALZWlN7NyLQpA/0zOIPWM8OEZ5g4/
1WWFZL403EJNRtDNAQ7EMa/gAw7IR5fqxP0CIbyuwmZ5AANyyxzXHJcUl5BY7leY
qkKveL9sSbRRd2iKUEpu4bZCZXECZMeowqlaUz5Rmvi7bYAIUhe70GZE2jcDWALF
EckGVh0BqnzWhjUck0AFpSScHQbwwj385JWlVEs2GfCiCppVvNp/FTLuytwgcDI0
Xv86OeXeh7SyZD4SGwj5wdGd386K3y+Y0ozUeq/bPyal8+mziEAN/trWlBbLG//Z
MNanwIB9Lp+5RXeLqXh7iDLTEEiLqZv3InaYXZq5PuNNKLePBMA10rDeg0+cruVX
PWzJUlY2MfQUnqxP+yVCSJcaQ5R2EkUdIcSqIHoXDpaHq6tih5hq64tK+u4Q8pGS
o9KdzPsNkqCHRypQ2HejoRBs9HzNz3TXYRhGWXPUL4wR6y7qmEC5UCxXZ7Hb2gLh
aHPr3XFkdXUQr493p9qJiFvtU8opP8I/QhG3FC9yPfbbeKDcAKMclEwxyaHyZALE
gzZ8CIiLXX6o+ID0pKFF2wXVmseASzZ8X2j3JmBhKaJU+Tff/Io=
=l/xN
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
