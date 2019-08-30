Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5671A37A3
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 15:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbfH3NSd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 09:18:33 -0400
Received: from sauhun.de ([88.99.104.3]:54214 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727718AbfH3NSd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Aug 2019 09:18:33 -0400
Received: from localhost (p54B335BE.dip0.t-ipconnect.de [84.179.53.190])
        by pokefinder.org (Postfix) with ESMTPSA id 0FC4F2C0095;
        Fri, 30 Aug 2019 15:18:31 +0200 (CEST)
Date:   Fri, 30 Aug 2019 15:18:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: max77686: convert to devm_i2c_new_dummy_device()
Message-ID: <20190830131830.GH2870@ninjato>
References: <20190820154239.8230-1-wsa+renesas@sang-engineering.com>
 <20190820154239.8230-2-wsa+renesas@sang-engineering.com>
 <20190829205752.GL21922@piout.net>
 <20190830124554.GB2870@ninjato>
 <20190830125338.GP21922@piout.net>
 <20190830130035.GF2870@ninjato>
 <20190830130603.GQ21922@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+QwZB9vYiNIzNXIj"
Content-Disposition: inline
In-Reply-To: <20190830130603.GQ21922@piout.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+QwZB9vYiNIzNXIj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Nope, they should be incremental, aren't they?
> >=20
> No, your patches don't apply on top of rtc-next

Looks like you edited some whitespaces to match opening parens before
applying? I'll resend to match these.


--+QwZB9vYiNIzNXIj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1pIiYACgkQFA3kzBSg
Kbb8+w/+KeHiboloZaBCltc5NV0fDqJrg2IAVmShtJSlHmG1CHEo6Hro1TfcvlvI
d3FkVVAxbfs0c/rA9LhX0yEj4/XuLniDWcXJyGkP3bh+qrS/I71565M4plMZpBQk
6r+phpCTBvLOpE11ChaL4/fXQz+oSCliqfm81h4rBEkcUaCIbqMCgOe1XMRuKlTj
IKGI8o/qqREb3tARm/1WB9RUacuL3rzUVwXrBzYokDzkD0Jod+X7UErVjVx+698B
gEuaC54u/q+ixhLkwot69kQL07/ad/UNlQFh9yU7C3XC2cNXF74d46KTvrLO7tev
sS3WsFaeVPE/CzQeQS2lN5lWK9K8EG5F+9x85Pb2snOsAFTRCrtkKKMPu1TLBa9R
uXI6dyQV2hyTzGgCuqJ6FDu/NvVXyuSqNzRmgw9SqwpWYWKglHxxmQo0aj6t5iq2
jbw/G6RqrNZTXQznx7FMYufW5mkBSV1Jw4/1QnVDV0bzRC84Gn3uIBTjMri1u/lj
zRr5nxZalvfFP5eBBToxoBY8As4xvFH1PC5+/K4LYAStkqS1Zoq//+xKfK4LIo3a
hz7zUNxc967DDVTZZohEDiJlytpevoc091df+SER/3L1rfgqNQGH3v1IXnrHS6MV
5TW8KmvKKxVRMD1i1HxJkJm6CrkWOMiko4jZSTsWu9Js/tnsFX8=
=QJMY
-----END PGP SIGNATURE-----

--+QwZB9vYiNIzNXIj--
