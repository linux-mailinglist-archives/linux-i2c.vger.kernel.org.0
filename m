Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3A941343ED
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 14:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbgAHNfg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 08:35:36 -0500
Received: from sauhun.de ([88.99.104.3]:35174 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgAHNfg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Jan 2020 08:35:36 -0500
Received: from localhost (p54B332C6.dip0.t-ipconnect.de [84.179.50.198])
        by pokefinder.org (Postfix) with ESMTPSA id B768F2C05CE;
        Wed,  8 Jan 2020 14:35:33 +0100 (CET)
Date:   Wed, 8 Jan 2020 14:35:33 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200108133533.GD834@kunai>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <6760a242-ff0f-c981-68d4-7b9665124e21@bingham.xyz>
 <20200107171119.GN4871@pendragon.ideasonboard.com>
 <61344235-9e66-0d89-89cd-1adef2e0bce1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline
In-Reply-To: <61344235-9e66-0d89-89cd-1adef2e0bce1@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> >> I.e. if say the adv748x had in DT defined aliases at 0x08, 0x09,
> >> 0x0A..., but not yet probed (thus no device is listening at these
> >> addresses) ... and then a max9286 came along and asked for 'any' spare
> >> address with this call, would it be given 0x08 first?

You have a point here. Ancillary addresses are not blocked until the
driver probes, this is true. I wonder now if we should handle multiple
addresses in i2c-core-of.c somehow, too? It does block the first <reg>
entry, but not all.


> The core 'could' parse all reg entries, and conclude that any extended
> entries within a device node are aliases as well, which should be
> reserved, but I don't think it could know if the device is actually
> going to be enabled by a driver (well, it could look it up).

We could argue that if it is described in DT, it should be blocked in
any case, or?

> But it would also have to traverse any i2c-muxes too!

I probably need a second thought about muxes as well.


--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4V2qUACgkQFA3kzBSg
Kbb+Kg/+O8VkFfWJl/ew66Saw1uSeNl111a72csopfJd9PT0Q2lcAGFpWqUDl6Er
JmzII1qp/PNpQ37sX4HmayOmOwmBm2RpboKlG9Yk+cNH8T8SdP3WdiChHNJMUOFJ
O7lpmlofGNNWWUUGG+uizFytSpvem0qYrKmSr9igzGsUk4y7XrSSezWpHfVPkFux
ToRlTdnPZ5hiXP0X0GjLvPHYHbJbpV2eQEu+6wGlT8yioaVr6IHp46rRHoogAluE
Uzluol2v2/WOwIMF+rWOKVLs77/DbJxW87FyKFDSKwfY0B8VtyKFer5C9/C+BLUq
6Z49igRuhSKcWQtb6bd3w5LOQhuKxwIB72ErzNPVib5U180NaydBiZIeeZ+nObCZ
FR3dvoTXREHPS74dqqZxGotGrusPLxSnFSPGyHWX3TwKnCVA+aRGRYjYiX1nkhkA
hOyKEpe4m0PVLDC5myfWAU5elczV4ktk/yWZiHZ97ZHklvnuGZ1EwEq8OZDU0Cs1
KgNKth4mv1Ql9hI77HBmJEBNl2ZvZxBP4fpfpNzI8S7r3QQ9cTY0gebv+ULx7GRA
DiM0Ff44jAr6yx3PFfRhIplWpNNvMeXMYkay1BCb08bqUOefwOtpTISR5jSPtK1E
hpazu2jZptg5vktkWusm/zsI+UqJ1Kvon1pv+Bp5NSPh+Qs+zNc=
=3uSa
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--
