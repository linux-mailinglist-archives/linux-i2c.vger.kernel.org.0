Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 031344F048
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 23:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfFUVKS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 17:10:18 -0400
Received: from sauhun.de ([88.99.104.3]:56038 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725985AbfFUVKS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jun 2019 17:10:18 -0400
Received: from localhost (p5486CF54.dip0.t-ipconnect.de [84.134.207.84])
        by pokefinder.org (Postfix) with ESMTPSA id 38C412C077A;
        Fri, 21 Jun 2019 23:10:16 +0200 (CEST)
Date:   Fri, 21 Jun 2019 23:10:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v3] i2c: i801: Use match_string() helper to simplify the
 code
Message-ID: <20190621211015.GA950@kunai>
References: <20190621113624.47877-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <20190621113624.47877-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2019 at 02:36:24PM +0300, Andy Shevchenko wrote:
> match_string() returns the array index of a matching string.
> Use it instead of the open-coded implementation.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0NR7MACgkQFA3kzBSg
KbZdLQ/+PJiD70H+122Q78OUK7tfNMHhHJUbwmgXV9Jc5OpaKJXa0wbSOTZ94QZJ
NlANmbgr2Pb7Ejs0cnhxCczAMCpl2ZM8KS/xhX6otcS12EI0CfKCyCfUqm/7Dpk9
dAbc9A71M42udAy6BR0XACkBRVFpIRo3hnpBQNa3f1QpT4lFLBmwGMcMUe638Q18
AS/96FF93uoxC2szNwxhxaz4w+xRjFFlxtctO1ss1JuyfudMrgmAA6h7boEIDLe5
Cpiok+6XqnZxfymvBuY7Svt81qK6grpDXJLA9z2te4vIyLaczSZLKlaJ1us1kyWW
zByQitAPNCXK8b0xbGqwwioPsp1AsN5YIg2DPiEoRcd+xWXzD4yDmQY0c6YiVhve
6H1xgLfMKIQNksAewdCLGgYvYngLd/X/YIy+bbHD1IO6un/0lK27672OBcD4zbzT
p4crbSM/Cl8NswJ7/Y+hU/oz8qRacIulk2zOVwixU2jPnpUk1JhohWLABNoAOndB
bd47Vgk36tLF4+vc5Iq3MVNErDcqU60xj961IlJnfhK/Ccg+gaFhTvdZl7A+djwb
DuIxmSJT+9YPT3nMtGZRUO9OFNV8IOqYMROwE/1HB6EYTRPKfh1bOKz4pVhFwAdG
Gci7EHn1fKN+ha67mnKNLnK8dyfFzWi9Juaz95HWIIJVCvBK5Iw=
=Apij
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
