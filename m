Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3AA8119C41
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2019 23:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfLJWUP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Dec 2019 17:20:15 -0500
Received: from sauhun.de ([88.99.104.3]:42728 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfLJWUP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Dec 2019 17:20:15 -0500
Received: from localhost (p54B330BE.dip0.t-ipconnect.de [84.179.48.190])
        by pokefinder.org (Postfix) with ESMTPSA id CF20D2C0616;
        Tue, 10 Dec 2019 23:20:12 +0100 (CET)
Date:   Tue, 10 Dec 2019 23:20:11 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: remove i2c_new_dummy() API
Message-ID: <20191210222011.GA8683@kunai>
References: <20191206002322.12801-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <20191206002322.12801-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2019 at 01:23:22AM +0100, Wolfram Sang wrote:
> All in-kernel users have been converted to
> {devm_}i2c_new_dummy_device(). Remove the old API.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3wGhYACgkQFA3kzBSg
KbYLQBAAlxZPLxHvbjeF017vrPl+xILG7b0A6D+jXhs2lvlJB1DheKyF5p9DT3+H
qVuGomZQWg5x6MzBQyrIojiZ5icikKpbOTxEyu4FGRIKJjzkqrkYvJFYIw3Do9Bj
zKprijupdlpqJl9Vc+XV9CSEF/AmxbQnKaEXEa/PpIaswGkSYkChWeEjJFnDwYQz
eivcNZ7R632fkBrbln4mewIhWph/KthJf6AlgJfwvAnDoTbMvPL2AuBPvXP1WK0s
0IYzKpGWc2DvyUU6w61NHBacomuyA93BSDxsYiuqYoeFtbDPQUEKC2/HwokgqMRb
Fk0ZvWYfamzIccJM5lbCA6a6sc8K6lleoe3qBnUedVj8kQhnJr4VblJYJ5yhxYAD
qZTgr1JxC7r+xgrvrnL8dzbc2LXPA8YNiwFwLrwIvmADA/hA7M5IbomvXSv1S92k
zh5X5O7UmFJJOWpgZNVWlGzl2IiBPv2SCRsY9CQdW25tAjITw9zB2XKhzLKI76LW
8gI2AbbtBjWWfH+OyWnqX+8Z6hd8MdWt2pUw6ySmwQbItkbH1ZZbhK30WQlWG/Ah
5zUv/KA2/MB/k/6LaDUBiFQuZjCbD8fx1fBA8RO1xYXDsQOTqzTYcywPNKaI8F3f
HKY7i0C58USvhotXvW4Cki1/+tQp8Noqd2X9wpjWPZMSrZ69ObI=
=piLt
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
