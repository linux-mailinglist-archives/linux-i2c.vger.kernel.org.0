Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E127DF8064
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 20:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbfKKTp2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 14:45:28 -0500
Received: from sauhun.de ([88.99.104.3]:49440 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726946AbfKKTp1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Nov 2019 14:45:27 -0500
Received: from localhost (x4db75ae4.dyn.telefonica.de [77.183.90.228])
        by pokefinder.org (Postfix) with ESMTPSA id EDD8C2C0428;
        Mon, 11 Nov 2019 20:45:25 +0100 (CET)
Date:   Mon, 11 Nov 2019 20:45:25 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     shubhrajyoti.datta@gmail.com
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCHv2] i2c: xiic: Fix kerneldoc warnings
Message-ID: <20191111194525.GE1608@kunai>
References: <1572931665-24560-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EgVrEAR5UttbsTXg"
Content-Disposition: inline
In-Reply-To: <1572931665-24560-1-git-send-email-shubhrajyoti.datta@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EgVrEAR5UttbsTXg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2019 at 10:57:45AM +0530, shubhrajyoti.datta@gmail.com wrot=
e:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>=20
> Fix the below warning by adding the description of clock and dev.
>=20
> drivers/i2c/busses/i2c-xiic.c:57: info: Scanning doc for struct xiic_i2c
> drivers/i2c/busses/i2c-xiic.c:84: warning: Function parameter or member
> 'dev' not described in 'xiic_i2c'
> drivers/i2c/busses/i2c-xiic.c:84: warning: Function parameter or member
> 'clk' not described in 'xiic_i2c'
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Applied to for-next, thanks!


--EgVrEAR5UttbsTXg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3JulUACgkQFA3kzBSg
KbYZVw//TTZ0eVWifTkXHkxrAMgzWsx1Z0wbMRoYCCM5NaJapOcaDJyiNKT5y1hv
q0nEgFhFwvWXaGvZGD3mNZ1MkmaIuXSyyrWRxUxwmo6c+do4yXOhGTWvhKjCkJUK
+Bweo/Rcpzv/4Yqpksv9lxHfuobWym8q1RWErHpsU2BO7xmgP7w++W2r25d0J7JQ
S6iZi+0cyGYSbfUr1jmmAUAi+I7CgFGltEC+2CgddAar3Zgs4T7ymQZ4Z5mKUzPG
Yk38nzt81dQJffHpkNvTs+0SsOf/+pBatJoUP3fIPTzn2PLvdPDjXd/4SL0IXPgA
6Ep9tkUrS/DSs5N5PdJnf88hKii9Oa4N+fIxxteQM9HOdu/uRR2asduNWij/osf/
GUoK+3OEPrqe63aIACDBr6XGj22tsPtzhCd8q3l0O9D8+kLj21kzcHxpBtM1l50J
4Zi3sHzdYucfQwZ2BnYyAqLOccgFDSvPI3XFNjcyDjb6cHt8qFXjIMvtp9xXmaye
iE3XPJBQnlTH/4XLU6WS6EvqpPHbOnnXuYAGx1IOMZz8NgZgKRpCdIVocyhw3jr9
irxM0SWGqc47VWjZBs+oGHsL77/oFEZnnndUcMWSf4VWXL8mybXon6SQgxC2DRer
J0PexqKOibJtSAmflq9CxFjieEB+qIquxDm/EiJcwUTS141eybQ=
=w5OC
-----END PGP SIGNATURE-----

--EgVrEAR5UttbsTXg--
