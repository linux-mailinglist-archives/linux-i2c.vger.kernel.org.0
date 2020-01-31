Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5B8D14E940
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2020 08:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbgAaHwH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jan 2020 02:52:07 -0500
Received: from sauhun.de ([88.99.104.3]:57282 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728027AbgAaHwH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 31 Jan 2020 02:52:07 -0500
Received: from localhost (p54B333AF.dip0.t-ipconnect.de [84.179.51.175])
        by pokefinder.org (Postfix) with ESMTPSA id DAA6F2C0830;
        Fri, 31 Jan 2020 08:52:05 +0100 (CET)
Date:   Fri, 31 Jan 2020 08:52:05 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: linux-next: Tree for Jan 31 (drivers/i2c/busses/i2c-stm32f7.c)
Message-ID: <20200131075205.GF1028@ninjato>
References: <20200131150606.34caeb7c@canb.auug.org.au>
 <7cd84961-d1f5-03eb-2e00-8f51b2f7121d@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uTRFFR9qmiCqR05s"
Content-Disposition: inline
In-Reply-To: <7cd84961-d1f5-03eb-2e00-8f51b2f7121d@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uTRFFR9qmiCqR05s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> on i386:
>=20
> when CONFIG_I2C is not set/enabled:
>=20
> ../drivers/i2c/busses/i2c-stm32f7.c: In function =E2=80=98stm32f7_i2c_sus=
pend=E2=80=99:
> ../drivers/i2c/busses/i2c-stm32f7.c:2199:44: error: =E2=80=98struct dev_p=
m_info=E2=80=99 has no member named =E2=80=98wakeup_path=E2=80=99
>   if (!device_may_wakeup(dev) && !dev->power.wakeup_path) {
>                                             ^
> ../drivers/i2c/busses/i2c-stm32f7.c: In function =E2=80=98stm32f7_i2c_res=
ume=E2=80=99:
> ../drivers/i2c/busses/i2c-stm32f7.c:2218:44: error: =E2=80=98struct dev_p=
m_info=E2=80=99 has no member named =E2=80=98wakeup_path=E2=80=99
>   if (!device_may_wakeup(dev) && !dev->power.wakeup_path) {

I dropped/reverted this patch already. Sorry for the inconvenience!


--uTRFFR9qmiCqR05s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4z3KUACgkQFA3kzBSg
KbZq1hAAq6bAWr19wCe8JGJQUi47jjeqRmNGP5gM5ns3TBfLqiOw4M/EtCOdw7rq
fPXzPsE3wfmGqsSXjfIdfwf6TjWRWjhg/LXc4ZRnLbniefDqK57M0H1zdeC0CnCJ
kOiihX9+DfnNOZBipfJVXsfH8bp0kYLbxbPJNwBSZGQL7CJYtDmc7Bqr83Zk7SME
2asnwMCAbwSQpUVE0I7qh5HJVVVEPxSr0fg3C+k8cFGkg80upe/Vb2ux095uP9wD
aW6YWtZ8CSvMcBHn8PxqOQbcYt67NUO1xLTqjbaAfAPoe1acTQ3VnqEcR/sI7577
sHJvRU5WR6N16FJB+b6osbQOIN3RtA6gxvHdJM8X1H3aD6Oe5uXG/njZy1gXZYi0
xVaVlKaS7xx+hUGdG9h81qD4cLrcAL57GSeT1VIwE/KDJJ9g8mz0A18xqyXpYf7d
ZTcXecOG/UEmcUHX6gvxMqZEgQyRqAYHGC8u1+l7/vzbcKwgtDi+fCZISTJ4/1/Y
wY5fbV3gGUQky8vwyu6jJPMxuozfxJxyoDk3PpgqqjNL66MRadvFiETbcR8zoMI0
SeJpnS3gIgrtbr/YofSqfuYyu5vX7rw3N6QzH8r9FBGeBLJXkSLq6cTLl9ZHwCvF
urCpcV8bLrXtXnj1KoOMPgKy2bl+cCd3PwrK855IOZd+UxsLzhw=
=18/2
-----END PGP SIGNATURE-----

--uTRFFR9qmiCqR05s--
