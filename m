Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7F018E911
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 14:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgCVNHP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 09:07:15 -0400
Received: from sauhun.de ([88.99.104.3]:49960 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbgCVNHP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 22 Mar 2020 09:07:15 -0400
Received: from localhost (p54B33042.dip0.t-ipconnect.de [84.179.48.66])
        by pokefinder.org (Postfix) with ESMTPSA id 5111B2C0064;
        Sun, 22 Mar 2020 14:07:13 +0100 (CET)
Date:   Sun, 22 Mar 2020 14:07:10 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, tfiga@chromium.org,
        drinkcat@chromium.org, srv_heupstream@mediatek.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v12 1/2] dt-binding: i2c: add bus-supply property
Message-ID: <20200322130710.GA1091@ninjato>
References: <20200306034946.11223-1-bibby.hsieh@mediatek.com>
 <20200306034946.11223-2-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <20200306034946.11223-2-bibby.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

thanks for the patches!

I have a high level question about them, first.

> +- bus-supply
> +	phandle to the regulator that provides power to i2c.

I think this is not clear enough. I assume it means the regulator for
driving SCL/SDA? In the coverletter you mention also an EEPROM. In your
case, this is driven by the same regulator? I am skeptical we can
abstract it like this because I2C devices could be driven by various
regulators in the system, so there couldn't be one "bus regulator". The
regulator for the EEPROM should be described in the EEPROM node. So,
this "bus supply" is only for driving SCL/SDA?

Kind regards,

   Wolfram


--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl53YvoACgkQFA3kzBSg
KbbmJA//Zjc2QrmIRCG4HJom18GhehdHUXQf5RRVmRXUs2RU224XHcIb+xS7cLab
UykL55m16w9CoSxLKbi3J9eSM9QinOY6wBfX0+4kCgWW4JpfAcV3Z8iBnsdLy+ex
pFoh0Q+7+cVBOHBFpCbehiapaaJCwaPkfHFflfRRvi+UEjs7gV4YvoMBSLITIazQ
+l/Uuvik/9y4vWTWfPM79/dlJWuCduR8C4Ztwq8eaInMJLq0HMUK7DC1xXH0Dw//
v48EQKzb1eFgqfgtj5j/DgpzEFPnklTnQeWWn1Hliok/XfBR/bOWhoX/JvxK79wr
2xFqbUDolfc6+ZiIcnD1lwaz3mvTvtkNYKqRPTt7aTkB1AfZmIXzA6U5fToSoth5
hyAvplSySfze0NcbsKVRgq4VaY6Cs6aqy+CElrcVVaDluPuapvPEMIj4PXaUvNH7
FNaY9cObeAUf16IT3X8ydWfHpDP21OdWQ+xF26oVTFY1Bf5LcoMM89/eQR9dqf9J
MqBJZ+Dt/aiCP/gOWQrWbGOqFzd66T8M2CHhq58TD3ctsi1Q/VVWxdUD0khkWwG/
2Gh7Y7veJ6KRzkugcL09yEfLKARDrGxbyf7G7jr+tpQrAtFNt0qtz8b89OUhONoQ
etzNokSbdhRWfp42rph3WpTsd7NPk/FxhYS7sHuJDLWOc9pCPek=
=9eBS
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
