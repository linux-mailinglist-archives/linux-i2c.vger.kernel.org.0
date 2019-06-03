Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0297133982
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 22:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfFCUIE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 16:08:04 -0400
Received: from sauhun.de ([88.99.104.3]:40288 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbfFCUIE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 16:08:04 -0400
Received: from localhost (p5486CC42.dip0.t-ipconnect.de [84.134.204.66])
        by pokefinder.org (Postfix) with ESMTPSA id 983CA2CF690;
        Mon,  3 Jun 2019 22:08:02 +0200 (CEST)
Date:   Mon, 3 Jun 2019 22:08:02 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Steven Liu <steven_liu@mediatek.com>,
        Jan Breuer <jan.breuer@jaybee.cz>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v2] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver
Message-ID: <20190603200802.GB2383@kunai>
References: <20190506105746.16397-1-sr@denx.de>
 <c43fac92-aa5e-b2db-6667-08c12cdced67@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline
In-Reply-To: <c43fac92-aa5e-b2db-6667-08c12cdced67@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 07:12:25AM +0200, Stefan Roese wrote:
> Hi Wolfram,
>=20
> Any updates on this?

Please don't ping me personally. Reviewing is a community effort,
especially for I2C drivers.

Also, in the (sadly long) meantime you or interested people could have
taken the review of recent new drivers as an example to improve this
one. The stuff I found in this driver was to some extent "the usual
stuff". This likely would have reduced the reviewing time, too.


--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz1fiIACgkQFA3kzBSg
KbYt2w/9H7deNpJU+p9s8Ox8Dd2+4+f7GqNPX6jPYcHSSPQHJ8csNIKVXojl9DIJ
BcNd8QDnVpvAp1NUk462DmbFkGJHXoduF2NiUujmpppEYJ83g/AoWH8vvCI4+QAS
onYn0HLha5b9tcj5/OS9vVhQSr9q598b6qwFqnKSXEQ6Y/X4qGUTnZkMhmKbooxy
RSaCc1yNifRyBEXC27tuq4YVZhuW56cj5TVj8qfxteFk2aIZSn/EvtTH6efBDgky
1katjJLjpx17vzYYQknH6og9N+Z2ndLkuDyBecJprND0Yqpf9QglDuQseIQu+JQK
mDnmKH+bV14jOGB1q/O+1KMsVUUh7atkpAo5vFL+r+8j7N8Vh7tC8nzOHkFT8JUr
XUuBQTIEQ82L7jFXuLjLrARqL+bpkZ2cKPxsyuY4mMywewAKYCA2AMyO1gHdfAs/
V6TgKf/cewn4gNpWevwJOsC78wYuWM8S5aH/O4jzDWGzEjN8SfZihpTUcP8wcFJq
9103ZsNpIzuiE0o+ihA1aiL7qQx17Zty98yml4FdlZXLjw85hNHKSejS5bMiBXg6
eaCltbtNDWlhqdJBUT8McHtakYEmg5UBRMDX6yODIPOo5xoW1VGyDZT8w4De9YiZ
9JhYGgX52O51jEJmdbDfWtjzK0u1ryPcmlTqbjq/SBIfadxETOs=
=xd+w
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
