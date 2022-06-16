Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3704354EBC5
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 23:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378315AbiFPVA3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 17:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233525AbiFPVA3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 17:00:29 -0400
Received: from pokefinder.org (sauhun.de [88.99.104.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6ADA960062;
        Thu, 16 Jun 2022 14:00:26 -0700 (PDT)
Received: from localhost (dynamic-089-015-239-099.89.15.239.pool.telefonica.de [89.15.239.99])
        by pokefinder.org (Postfix) with ESMTPSA id 4AD7F2C009E;
        Thu, 16 Jun 2022 23:00:24 +0200 (CEST)
Date:   Thu, 16 Jun 2022 23:00:22 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Xu Wang <vulab@iscas.ac.cn>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: Fix a potential use after free
Message-ID: <YquZ5iADDamgQ+9w@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Xu Wang <vulab@iscas.ac.cn>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1577439272-10362-1-git-send-email-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rYtBd5w2y9ac+Wjk"
Content-Disposition: inline
In-Reply-To: <1577439272-10362-1-git-send-email-vulab@iscas.ac.cn>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rYtBd5w2y9ac+Wjk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2019 at 09:34:32AM +0000, Xu Wang wrote:
> Free the adap structure only after we are done using it.
> This patch just moves the put_device() down a bit to avoid the
> use after free.
>=20
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Added a comment why we reverse the order for putting our stuff and
applied to for-next, thanks! This way, we get more testing until it hits
upstream. Still, stable tag added because we want it to be backported if
all is well.


--rYtBd5w2y9ac+Wjk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKrmeIACgkQFA3kzBSg
KbaRUA/8CQ5A2iiywZCEDARYlutF420XPsrdYgQmCh49Gy2UN8PpMOuIDoX10xa6
sf+llbsSQvmPKkeRxnyH51Ctm9gPN8xtVlCFpcZ9+8g6WbhXz0j++i0PUP4YAsW8
0n1MBzxHEuBVRsqJyhZ/JxyR1yjiR6N6RrywsgEty9AYfn9XbXuUz3xlIGd3G5Yj
vQQeC+5a8znfHcfr8MOudpMBb3gaAHF/IvqOuiT6y5gSB6d6QqlC8OeQJ/tCkEgk
FtdVYRPf43mdZBAH4Kl+uneULnBhIx4YVuUlt1doG+N8szUiSXcCuWfGNwXh9Ta8
s1CaGzG4qXCBjCSl+e2bX1hFr787ZFiyyNRaC8iQ6Eauy6dA7ZWEzz9I2wQgHkhg
ALqADG+YENA90QKsGLdDMzkZH3c6udQXt3qnn+TEuN89x8KTIJFuExZGM97EsHNW
1SgFuV56iCYdgWocuD2cdD6Om6bR0q75LlcuWM76w5JBZ6JenPutQbCc6uJ9PZoN
CvDfm043rzsbtCbX1E8OMFPeXmnrF7OSDYrJXWXHflBP34wTcz8dqdJY2gOp31mv
WvPGa36x4swQdKJg2qdenJG5HljDQISVbI1K/OESYMQoOWOVTf8F4T58HsQGjQ/r
1ssEIHcr/sGaiqL/v4nsatV4EQNwnJuIWDwXBXG+AX/3Yor60Rw=
=t3S7
-----END PGP SIGNATURE-----

--rYtBd5w2y9ac+Wjk--
