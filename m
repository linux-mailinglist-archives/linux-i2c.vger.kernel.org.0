Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE6D21444D
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jul 2020 08:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgGDG0z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jul 2020 02:26:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:58150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbgGDG0y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 Jul 2020 02:26:54 -0400
Received: from localhost (p54b3324c.dip0.t-ipconnect.de [84.179.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8F5E2075D;
        Sat,  4 Jul 2020 06:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593844014;
        bh=imrzGBXg/8gxNCcAkc3JT9nBNnLldbDwcqkk9y3JqTA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SG/Tkk681wAgxVMPgKw6FxldiDWD8hH3kI3qlucftRKGht9pQl0VF3YoNu498sTrY
         o+mZ8wb+kArPrtWTtUq9sm1C32v3s4hrf1RoaZm9Y03RP9kjtetrAdbcIDI/L6/nHy
         iq7UlNCOtCN6lTlw/AK9qmo0FO+MbMq+EgQGIQ5o=
Date:   Sat, 4 Jul 2020 08:26:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Barry Song <baohua@kernel.org>
Subject: Re: [PATCH v2] i2c: Use separate MODULE_AUTHOR() statements for
 multiple authors
Message-ID: <20200704062652.GF1041@kunai>
References: <20200611110534.3274710-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QXO0/MSS4VvK6f+D"
Content-Disposition: inline
In-Reply-To: <20200611110534.3274710-1-jarkko.nikula@linux.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QXO0/MSS4VvK6f+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2020 at 02:05:34PM +0300, Jarkko Nikula wrote:
> Modules with multiple authors should use multiple MODULE_AUTHOR()
> statements according to comment in include/linux/module.h.
>=20
> Split the i2c modules with multiple authors to use multiple
> MODULE_AUTHOR() statements.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--QXO0/MSS4VvK6f+D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8AISwACgkQFA3kzBSg
KbZcwBAAqQhr8pWJ/7JWOmrh2Xmg+Bn0s1CFkfWJneBJRkbvaK24c5m0WyKQTAqy
t0cXFGPsbysNN9k7hnL1Vu9YxdEYiRKr+avBNg9iBnN9fTuicq92ZcSDZqeTJcLV
qj0rBiJImne8WIcL1+5c39Vcr0HrkQRXFOkmqPrC4vrUkex/uioBGFnfXW31OsOF
PVBgLUpjoAQBld+m/FjqREWIbh817x4dmjLyuJkdOLbktWYZAHIVFS9IvzDqT2gc
u0w8pVOQ8Dvm1N2p0aUyk2N2Ng+c8G5NgidfPpBmT+984OkRspaz6BIQVPd139GA
rN7PuX/kWZ6qXw1lRv4u/bbv76OHJxPuQGtEk4v1Ra7SzBRQ2XgK2/8Ksjy88kCH
9gJVBnOs0UTQ8Tokm44pHECgAMxvsUE3J/htVs75hKseSypJ2qtB4WpsMnqCBu1Y
QwSHiVo7yon/v5GehDzqUJ8BqwsoCfZdbMZNxRq/nUN0YOLBU4PUM2CebRlqwcMq
Db6jmPOvX3qvJUjTSC0EbELkpNDr4ip9+Nv14PvQ83supBs3qL80ld3twYa3p3bT
T/XTm3L8ipIz0mwS9YsWTBexmFNyNbVYjj2MUyjEpgR3xlMEBqqBQa+gFbQSKf+1
IEbKlXEfNLJKma3H3YjJjLyJnCUW/2iMFiXAOPsnpCCenIVDf0U=
=atw+
-----END PGP SIGNATURE-----

--QXO0/MSS4VvK6f+D--
