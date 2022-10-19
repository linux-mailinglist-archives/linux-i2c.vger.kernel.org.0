Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1E1605113
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 22:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiJSULf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 16:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbiJSULe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 16:11:34 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B1C1B6C91
        for <linux-i2c@vger.kernel.org>; Wed, 19 Oct 2022 13:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=jP23/8oNXZDtmh00ufdfE7zkPkL/
        ikPEzUVgX0EP4hU=; b=a8a161dB1G12z3w3RCsuDs9SiOc5nZsIoFMIBZqJcx0q
        /4wWw0OViHWEhkTL6psCGGIoFkkG8IPWEPB9S7J1UszIvaViRsKKA5oUgA+hQglc
        VzNNsDaHf5ZgEGrNCGEMek4aIMNkGZxI5patPQq0yR0olzW0MeaLSPNyPlOg7a0=
Received: (qmail 804148 invoked from network); 19 Oct 2022 22:11:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Oct 2022 22:11:29 +0200
X-UD-Smtp-Session: l3s3148p1@KwRf0GjrluQgAwDtxwGnANC4y/SuZCIq
Date:   Wed, 19 Oct 2022 22:11:28 +0200
From:   Wolfram Sang <wsa-dev@sang-engineering.com>
To:     Jason Gerecke <killertofu@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH v2] i2c: Use u8 type in i2c transfer calls
Message-ID: <Y1BZ8CjSnrKi+Yos@shikoro>
Mail-Followup-To: Wolfram Sang <wsa-dev@sang-engineering.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
References: <20220718153448.173652-1-jason.gerecke@wacom.com>
 <20220803145937.698603-1-jason.gerecke@wacom.com>
 <CAHp75Vd6yEctJoNT6TpJ1+h4ZQckyLsaUSeSCV4MHqg+LUDkcg@mail.gmail.com>
 <CANRwn3TutF6skHQHk08dFUa8gLMVGxui_QN7YK6nDacSpRHtLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BGtONydHGv42/zAu"
Content-Disposition: inline
In-Reply-To: <CANRwn3TutF6skHQHk08dFUa8gLMVGxui_QN7YK6nDacSpRHtLg@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BGtONydHGv42/zAu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I believe you need to create a coccinelle script and run it over the
> > kernel source tree and then create a patch out of it.
>=20
> This would definitely be necessary to unify all callers to using
> unsigned variables rather than just swapping which callers generate
> the pointer-sign warnings.

I am all for using u8 because this is the proper type.

Yet, if we touch this function argument, I'd also like to remove all
inconsistencies once and for all. Removing some warnings here and add
some there is not a good choice IMO. However, how to do this switch of
types cleanly without too much churn, I sadly have no good idea yet.


--BGtONydHGv42/zAu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNQWewACgkQFA3kzBSg
KbZ3Gw//crNGkl16EK/1GS4zVfBem5hUueVH2xbQhi5++pK1z+ykw7ap2dqC5WC6
kOJjK8nXpGaQJS4wPatM8jYP0uosEd9fpoZG3ULYnnzH6BYdzk/BPgpPQ/0nUaXp
I63fhBeafHComQkTzfqTZo//qWQkp3DVtyBrA6rfiQyVz8afJOer/n2T772pA3SP
kYTGL+A6KZQSztTkezKOJYWGPoUXupCLzVgPzonALtiZivgkiGS+OT40JHmPk6GA
IkvuqE6DlUw5qMx3rTz+oYBO7mijCVms4eBjlzh88vEjmq/UdLh+3RQl3gaps6fh
iNa2F+BJCQwMJt9NDvvLYeDa68VXNbcSvLkDIJXXP4WzBgkaW3wMJ++sl+f7Q+hB
/jjkiSOLf4HkJl4ocbWkZwRrqJzuqQWJezkdyleK7rREQ14uSEDoyT66znrmQapF
maiyP+cv1903PnVdKCq2fwg3q8gS827DI2zmXWFKdPAfT4e0Uvggb4Wa7icJqR1B
18As6Aews6zo3Dr9cJXgQE7oXz2r0NHQok1+pmXPaMmhGBlFvAoxEO0Ir72uK898
C6dC1qdBtD9ET9JIL16R5N0oaIWfksXlosPp323Y5J5k1dBKAk6emsNKnNYpdJCw
bH/876TSZ98j2PHNJUY4MJzneKEs3zNAAw6ZBQRFoNRf93n4rrM=
=gNnd
-----END PGP SIGNATURE-----

--BGtONydHGv42/zAu--
