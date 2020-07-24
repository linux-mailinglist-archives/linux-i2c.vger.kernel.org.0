Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E935622CEEC
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 21:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgGXT4p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 15:56:45 -0400
Received: from www.zeus03.de ([194.117.254.33]:59996 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726411AbgGXT4o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jul 2020 15:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=De9qJk+UWFtcXvKCFRa1VA8MN6GK
        du/iSQllqn+uHSQ=; b=Dh3GZQjGYfqUrddlvdRNrAk6MTBcay5Tt2w8MQHcgr8L
        1EF1mo5dJOjRs0gPEEpiLZfl+QIR3bzCt1U8g0cQPdE+7ow1Ok69dgSMeK83V5Ci
        ipqSKNJuJsbyI2POrOFbOuFpc70fF2tIEAx1TTYbrm0qWUxUXMhntGsNT8327ks=
Received: (qmail 3787874 invoked from network); 24 Jul 2020 21:56:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2020 21:56:43 +0200
X-UD-Smtp-Session: l3s3148p1@x2s9XzWrPJ8gAwDPXwcRAJKYSnl1dekZ
Date:   Fri, 24 Jul 2020 21:56:42 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: revert "i2c: core: Allow drivers to disable
 i2c-core irq mapping"
Message-ID: <20200724195642.GH1227@ninjato>
References: <20200630162440.8453-1-wsa+renesas@sang-engineering.com>
 <02adeb3f-761a-32e8-6596-81ccb7cafa6e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2oox5VnwalALFvA7"
Content-Disposition: inline
In-Reply-To: <02adeb3f-761a-32e8-6596-81ccb7cafa6e@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2oox5VnwalALFvA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

> > Build tested only. Looking for Hans' opinion here.
>=20
> I'm fine with removing this.

Thanks!

[semi off-topic case]

> So basically allow board_info to say:
>=20
> "There is no IRQ and do not try to find one"
>=20
> This could be as simple as having the instantiating code do:
>=20
> 	board_info.irq =3D -ENOENT;

=2E..

> ATM I do not have a use-case for this, still I think this would be
> useful to have. Would you be willing to take a patch with the above
> change for this?

I haven't checked your code change in detail to check for side-effects.
In general, I think we could have something like this. However, I am a
bit conservative when it comes to changing something without a use case.

All the best,

   Wolfram


--2oox5VnwalALFvA7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8bPPoACgkQFA3kzBSg
KbZOuRAAjirGTofgq/q9sprb0SZ3sfkZ1d9VqGeEFZbVBSMLC44m5A0qckGrF2p9
AMRoQhV+cbGnQD/LrfXzv8uxLvI67/Sf8kL0Uw4uFVRtuFTajZkPEnjhb8TbWN8P
cEIukOxIY0aBrBFsM7MVaUO2E/JR12/MUD+7LY5S1Sg3hCyV3mAyNzuP6lHslDqw
0/lnQ3M5WOBVFy+IZp7cFQxfAVzSPY0vS0l8ew7fwepBhqCyYe7cFb0WqqsKr5uj
2rK/p4TJDaUjQy9j7BwYlObQzPEekdz+V+oDe3Uk+gxCmkPoHrnGPONvEtfsrMTD
Z34l1mtGpDNo/Wf6t3WdY6p9347jwZbwNWxS2YwWohMHB08itro1898+nztEiaMc
U/Xk3RBJ/gVE/zGk0Q+R2e213C2rnrQAHVffPktgiYXHjS2wlkuWUy2tgFMwxoZJ
1HmjbWeq2cml4yapk1snU7ccgYJoLjBRyrThu7wf7cwZU7KwA0nv3S+JJN1XiLte
oSoKwMgTyhLPmr+ThjpsZH1aS9WcHlSACISeGjWupc6kICfo00M38/xeVpE3Kxqf
pW700Zl4mAzSl+Sc3FOtBwYMfJJNlPZdx49LWb9lFCv6VNeaNTmhi0fVuHPS8MtE
ZbcTAFuIyeUKAmKzoURbdEsGsj7PM/oLsM6SCk7rpuKET7RQH3I=
=zDUB
-----END PGP SIGNATURE-----

--2oox5VnwalALFvA7--
