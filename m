Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60CAC38410
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 08:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfFGGEB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 02:04:01 -0400
Received: from sauhun.de ([88.99.104.3]:40708 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726575AbfFGGEB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 02:04:01 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id 589BC3E43BA;
        Fri,  7 Jun 2019 08:03:59 +0200 (CEST)
Date:   Fri, 7 Jun 2019 08:03:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bitan Biswas <bbiswas@nvidia.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
Subject: Re: [PATCH V5] drivers: i2c: tegra: fix warning/check/error
Message-ID: <20190607060358.GB1035@kunai>
References: <1559885103-9113-1-git-send-email-bbiswas@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline
In-Reply-To: <1559885103-9113-1-git-send-email-bbiswas@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 10:25:03PM -0700, Bitan Biswas wrote:
> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>=20
> Ignore checkpatch WARNING for 80 character line limit at
> places where renaming fields compromises readability.
>=20
> Delay of approximately 1msec in flush i2c FIFO polling loop
> achieved by usleep_range call as msleep can take 20msecs.
>=20
> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
> as needed. Replace BUG() with error handling code.
> Define I2C_ERR_UNEXPECTED_STATUS for error handling.

You removed the word checkpatch from $subject, but you still did not
split up the patch into logical pieces. The description above already
outlines what those logical pieces could be.


--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz5/k4ACgkQFA3kzBSg
KbbgTRAAnTLiDO728xUWu9TRt7xV7nL0szeMhE4O71rzXpd+Ru7m5yEta8k1HaCz
WOisQkIuNFJaCQC5eeeJK5HTSshuHLtHiYvDLWbsbl9YUmdzK9JQtFTJavlxJFUB
6ZryrBPXQufTRKRtbYf1I3Hh7Ow+tVjq5pfFrdrF7OttryTe8h40SYqxtRhj78mk
WkXte7hvVach56fYLQldRqHMGacnGOoePC9P9Uoh5X+kvHdxrOI7NScH2HWFcCtE
UC6NnEtm3ZdlYFrvww/iKlZmj6f7tDww3TpEoMDJQ8mPfZu1AWQdCJ4Dyezf2SgB
j1lJQDO4JCVnpxhfWnvWfanAuqCM3SmUonXk2kcaNeaF3T4Wtv/Z5XoR+wXOg3qL
64drNdEulCk7aPzW63zQGlOessCJKUz1I7LDnzKOqKVzkPqNmhlk7nLKTxvZ5UkQ
/kOpKiyt5cgwYHfvfGHxWjbSh9F0IouCYUi/OymMQX7KCX1pb8sXDh6QqpO84Yiy
2IihYu0swkdjpxAQgvnzy0UhWpJnzjyjxBkriiuUUkUYhUWeoWDMkLsQXJUAX4nB
ArQa/KHCA9WxQ2cMiBideFTYvhvoaKq83+qhySzdyUbXjbuJXpXG8DtBNZm+dP44
yaGPrJpXdeMq41zJ+CGjagdK+n0wu3xih6jmgBy+Hq1aZXqr8lo=
=6AkS
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
