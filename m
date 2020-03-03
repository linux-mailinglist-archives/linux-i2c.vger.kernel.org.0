Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60EAE17836F
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Mar 2020 20:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730488AbgCCTyd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Mar 2020 14:54:33 -0500
Received: from sauhun.de ([88.99.104.3]:52942 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728731AbgCCTyd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Mar 2020 14:54:33 -0500
Received: from localhost (p54B3308A.dip0.t-ipconnect.de [84.179.48.138])
        by pokefinder.org (Postfix) with ESMTPSA id B92872C0872;
        Tue,  3 Mar 2020 20:54:31 +0100 (CET)
Date:   Tue, 3 Mar 2020 20:54:31 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        debian-powerpc@lists.debian.org,
        Mathieu Malaterre <malat@debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] macintosh: windfarm: fix MODINFO regression
Message-ID: <20200303195431.GB6555@ninjato>
References: <20200303125046.5157-1-wsa@the-dreams.de>
 <87d09tw9is.fsf@igel.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline
In-Reply-To: <87d09tw9is.fsf@igel.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > sound/aoa/codecs/onyx.c
> > sound/aoa/codecs/tas.c
>=20
> These are loaded explicitly via request_module (as snd-aoa-codec-%s).

Good to know, thanks!


--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5etfcACgkQFA3kzBSg
Kbayzw//YsWK4+DusvCfptElHxJY7dRalfYF/ddNNzqZ4WXLEEVSPsXY96IS27PB
hEoC0lrIxcW6bIlAzZAIFmeJtx5zD+REfK/nPqrynsGg7o0yAxBSqsqDRD72+rVZ
DRzdKcSaUqDEb/5ndSpmBtHQ/MAt/mro/hOVkcICGIlxL5UdeahE9Ls3ktXtAVYc
rZ6b+1ImdKgwvJ3rKvsap1rnZPnhlMYxLkWgem+D8wD1bdana+lS4FjD5R3QqE89
0FC/e3vCzwq1t034V1ivywroTcL+UJF3u07BAZjaWh/l0v6Cnw7HMAXdqN8uISLi
NmU4ZSArp4+haD+eJQsWZkhxTP4Swvo2WHDzjv9QS74L/yb0SuXs2pz1Ppg1nVpN
taKu+IAbVZPEP7Ndz7CoX/1/cC+TfhiA1V9M1jM+olZL7lBLWDIrLhjzbzTSESb4
23zTtX7JQ/XwKyCSVHiDO4YJaalRiItmaZfTZB619TlhzqKQ1iH+wuD5mXEi3l2H
M1gGZmaAKtBZzL9JOwsoEOtltr9xPEnrWaw8r42kVyLx2iUcPyg+XP3ijDJyuebv
YKiL3GxAqF45tJsjBt5CfosxRW1eofmnP3Bx980Ibxpzv4xxQvq5PgYQ5yJ3Ue+l
Aeo+yd9rWUPIzpRhngwYPetzRSjN3Jr7NwWe5VMI7bR+8EV0yn4=
=QPwo
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
