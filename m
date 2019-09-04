Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25CC9A89AF
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 21:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731424AbfIDPsR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 11:48:17 -0400
Received: from sauhun.de ([88.99.104.3]:42926 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729993AbfIDPsR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Sep 2019 11:48:17 -0400
Received: from localhost (p54B337F1.dip0.t-ipconnect.de [84.179.55.241])
        by pokefinder.org (Postfix) with ESMTPSA id 08E342C08C3;
        Wed,  4 Sep 2019 17:48:15 +0200 (CEST)
Date:   Wed, 4 Sep 2019 17:48:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bjorn Ardo <bjorn.ardo@axis.com>
Cc:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c-eeprom_slave: Add support for more eeprom models
Message-ID: <20190904154814.GC1157@kunai>
References: <1567497091-18270-1-git-send-email-bjorn.ardo@axis.com>
 <20190903174359.GB2171@ninjato>
 <ea04722c-81e5-1fb3-d5fc-0ee24e073025@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Content-Disposition: inline
In-Reply-To: <ea04722c-81e5-1fb3-d5fc-0ee24e073025@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Yes, now I have made that measurement.

Cool!

> So it happily accepts just one byte as an address (that is no NACK), but =
all
> bytes read afterward will be 0xff (but the device will ACK all of them). I
> have tried to fill up the eeprom with non-0xff data, so it does not appear
> to be reading from any other address.

Interesting.

>=20
> I am not sure if this is a behavior that is worth trying to mimic?

Not yet. We can add this incrementally once we know most EERPOMs behave
like this. It could be worth adding a comment, though, like:

/*
 * FIXME: What to do if only 8 bits of a 16 bit address are sent?
 * The <your vendor & eeprom type> sends only 0xff then. Needs verification
 * with other EEPROMs, though. We currently use the 8 bit as a valid
 * address.
 */


--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1v3L4ACgkQFA3kzBSg
KbZwoA/+ITW8HBXKkfH89DY+0RikUy33Ck08ZDw4PY3WjiriXcZ2WPvte41OvBmn
hkIHeqgCc/pZeUCVsn3vt7zoVorSocND90rWZRBDCIlXpoOD0DzcpOfteYaYh0Ni
HkBMljnEQQSTs+JLVQspt3gn5i6wAupT1eDzxwSUH/e89ImudAX/54oz1GP92Gsz
Iiu6XPVfTs1qLVQ8ad1+oUHi5IO7sjQYpi93MDUbXsgSMzcAKfnBLOgra6zjVgzC
MYoe9YCvzo/0D/UwkzrxL/KYAPDXHGP5UTsJeMJfTNvYNnKy+Dj9nT1VnA36+Ntk
bt6vNCZwbN3cjnDlW/hFtZ9m9Urx596oP1fkVVEGB9rx1f9q67ZPcblepEhD/xQr
yyT8Pz8JR3VTb5KW/0l80CNKtUxxU2VzSVD9dOO4hPNzCwAPMTGGjNxFdIAPUS2D
+gwLiqraZ7R1p6PztZFQJ5druFvCmy3kbeZQjaM4hfakCbtKdGKpnaJ+K5vmTZkn
Y6Vje6pW97vugdG9IXrt51dUeF+lu291Qkk+6OMghPtbUn79r1Cv0Ha1TodxAnOi
Nz/N+Q5Wrin4qG3TLO+HtnO/vswsyPHpzyW6a/PJVBAtC6kasNGC1eQFeD3vh7Lq
ofv8tYEk7CpwJOUqsgoLug81uYyuAa1Lwosu2wNsVrIJ2woUQTI=
=foGj
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--
