Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A81EC8D36F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 14:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfHNMsS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 08:48:18 -0400
Received: from sauhun.de ([88.99.104.3]:48520 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726522AbfHNMsS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 08:48:18 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id ABA482C311C;
        Wed, 14 Aug 2019 14:48:16 +0200 (CEST)
Date:   Wed, 14 Aug 2019 14:48:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
Subject: Re: [PATCH] i2c: rcar: avoid race when unregistering slave client
Message-ID: <20190814124816.GA9716@ninjato>
References: <20190808193910.12365-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <20190808193910.12365-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 09:39:10PM +0200, Wolfram Sang wrote:
> After we disabled interrupts, there might still be an active one
> running. Sync before clearing the pointer to the slave device.
>=20
> Reported-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1UAxAACgkQFA3kzBSg
KbZ2KxAAtCgIpAKBP1G0zxZhRU2dC5/8co9r8PyjzkpoI9pNXa6L4C37ANcmGjXJ
GsjAOCg5Y7MOJ6TByIQBJ3+aUyRpSs6ukCSohqKdRK95d3QkBrl3Ls2xaArG7Hpj
/DFdet0uwjCMrH98t90QodWj7zMh7DN56EErb/fQUlwwJTtG+Rt97nSTdmzIsaFG
g+wuUHZOz6g+aDGS5nfR2wZ/P85cfihJqoG3hqcEkdzZGr8b9YYDiE2wvTjUezzL
4UuEw4XO6gP6jdMGBKyeZwEWNJ/kbpFTUAp2ybbXeqFWg90Q2a6yHfy3LelSQOF5
GwX3QEqShTpk7i27OQZEbcAeKqspWa6LU0WgskwQoHQw2V4RwME2CX+TPVXVCSl+
jqB4ow6S6K8lrIAzZ7UGUXK7jPm8sgWMiKoMverqDObzDyz23h6LUru437OCkHGG
45An+e8AsDvsSD54iZLtcuIiMSIo82ilO6UjOVQ8KB2/VtTcTo9XlVVbBa3hFXAi
ygge0trjQbrCe86c57++Z4sp8eALzhK/XW1ddZZ8PBYAnSEjxvLSC4hmGUNsNLCU
zcDs+WZ0YGErjKqVW+JDnR9BSgiGhvdB72ukuIcK/uJG7+lc+N5ZyYyNNDIuH3u7
LJFpOK3KHSep8ctFGzOSFEegqTggTiSySFij40iXB3yfU3T2/n8=
=Gx2b
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
