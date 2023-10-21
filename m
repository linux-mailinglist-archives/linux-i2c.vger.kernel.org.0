Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E24517D1ED8
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Oct 2023 20:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjJUSAH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Oct 2023 14:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJUSAH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Oct 2023 14:00:07 -0400
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BAD7CD6
        for <linux-i2c@vger.kernel.org>; Sat, 21 Oct 2023 11:00:03 -0700 (PDT)
Received: from localhost (234-123-142-46.pool.kielnet.net [46.142.123.234])
        by pokefinder.org (Postfix) with ESMTPSA id 4613CA42E24;
        Sat, 21 Oct 2023 20:00:02 +0200 (CEST)
Date:   Sat, 21 Oct 2023 20:00:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [GIT PULL] at24: updates for v6.7
Message-ID: <ZTQRoS+ccBluAssN@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20231018084610.13693-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IJ9NCN4ruPteZuC8"
Content-Disposition: inline
In-Reply-To: <20231018084610.13693-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IJ9NCN4ruPteZuC8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 10:46:10AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Wolfram,
>=20
> Please pull the following updates for the at24 driver for the upcoming me=
rge
> window. Details are in the signed tag.
>=20
> Thanks,
> Bartosz

Pulled, thanks!


--IJ9NCN4ruPteZuC8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU0EaEACgkQFA3kzBSg
KbaZDQ/9FUsglipchVlPO10YWeC/sl8FZ8nV30uNee3gmvQqnM7U8lejxsYQ1mXd
t6k8Q+s54ryA0nCC08xy7AIYXWgl2/uH6O7p/K7v8HderhTRHo+4BGcRGdwTsK5m
o0AA6vTF/fJy32FbelIVsC9rLGoEsT1Dx+DRP/b5IhPVWWT0ii1T4uyXo1p1timw
cO0ujlVlnZltRuxaKdaqesAcgKeDtpkEBPqK7F1RTaguYewy1P+tIO+9/vwt3GdU
p+ZB7WEXtM+tZOAeG1XLbca9SQ63yAGsOqoxZDQNGvwjcCUsZCQiz4RXHujpnJ+b
1lFzhYez7sYrjq3j9arQYnkYWw7eYFi3QJCvTnh6YNV1fwgYeeO0q8IMT8UOMwvO
w3YugqMVA+L/Ea3M1wY3VddR1pbfYqW5mapedXJi+XtgrV2MtGfee58ggwLRgTXw
QI2P7AByD7bEWtAhsjewniyREeylSV85VPDumeUFeHva659qGm2WnVc6XvfGenZ8
2i8wTCmN+6jSTbbzL51cvZp+wSJa/ET4JiWB2YvilZrhctxuUlQwmCrQ/WC24B8y
bh07Nub4x2tnpPO7ocTn59H7BjLmkHQjMMdaJNpC0xmrg2YrXx8IjW0ylTk3VlJF
E94/YKB6A8D8WAx71oMg076dL89Yxqkkjef2BUQrzT/q3gp4uLM=
=1VP6
-----END PGP SIGNATURE-----

--IJ9NCN4ruPteZuC8--
