Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7D517F647
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 12:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgCJL3M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 07:29:12 -0400
Received: from sauhun.de ([88.99.104.3]:47678 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgCJL3M (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 07:29:12 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id BA8692C1EB6;
        Tue, 10 Mar 2020 12:29:10 +0100 (CET)
Date:   Tue, 10 Mar 2020 12:29:10 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Cc:     wsa+renesas@sang-engineering.com, linus.walleij@linaro.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: gpio: suppress error on probe defer
Message-ID: <20200310112910.GV1987@ninjato>
References: <20200309211618.25535-1-hamish.martin@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QILrdhYozogw5Vly"
Content-Disposition: inline
In-Reply-To: <20200309211618.25535-1-hamish.martin@alliedtelesis.co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QILrdhYozogw5Vly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 10:16:18AM +1300, Hamish Martin wrote:
> If a GPIO we are trying to use is not available and we are deferring
> the probe, don't output an error message.
> This seems to have been the intent of commit 05c74778858d
> ("i2c: gpio: Add support for named gpios in DT") but the error was
> still output due to not checking the updated 'retdesc'.
>=20
> Fixes: 05c74778858d ("i2c: gpio: Add support for named gpios in DT")
> Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>

Applied to for-current, thanks!


--QILrdhYozogw5Vly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5negYACgkQFA3kzBSg
KbYdoQ//WZs/WZ3/2tcZpH+a410MtuKfCsPcn8heoZckOU3WJ88nfCf5HYQcz3U6
GCl3bUC8zpWRpolCPyybn6DGcZuIHXQ2w+8fxM5f9McDwksCgPXSi0in1xXAa0K9
felr82Su/IGzWZ9Iaonc5iDbMc5vGwSqCYuTqmwwAXrbsKHSHtQT44jzXI5mR/o0
W8uL9dXBVhpLd8SObYcYJr5kTa4T6iqPUUiWpQclLC0DMRbceiCIfZ9gRhuyqgH8
ADPSGowgQsXtuYGz1e+bp8UwLhOzF1Q+2P3gNqyc0VN00tFNB9+raJUOXDq5A+BO
QFfN9uf/Ooyo/VMjz4irxUgDdQognQwr7Jo5XVG0UgqbTZOSSbpLzP8Vo6G3Pouj
/9zgypFM9pPi3XF+sS1/Njp9iV0gCz9vPHAq1x4oBUbmkjh65tdeqzs4uCzAf3ox
bWSlaHHXTJB99rcWyHAz5eFRJpxMUIQTXfVIZ3V766bLhmEX9ngiNT3+lPIb+OW4
qnh/6bjVHX5udlXmRwpAnA7AWkwEEA7CNUt8pcCHT4bDAfpechTgIn63wKCnfgad
sHkJUCuY3UUyF72eYwD5x+f/8sZqp/FaFC4pVljbKdQDOn5Rdbynl/+37Kvetlyn
MWwNB14E5VA0qyzuxaAKss0uMp+yBc9TimqeP0kJdO2itmFQR+w=
=GV9x
-----END PGP SIGNATURE-----

--QILrdhYozogw5Vly--
