Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14419461143
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 10:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245199AbhK2JtA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 04:49:00 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:51704 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245375AbhK2Jq6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 04:46:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3D06461228;
        Mon, 29 Nov 2021 09:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006D9C004E1;
        Mon, 29 Nov 2021 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638179020;
        bh=1I6gp1g+Ps1EV2GGGX9ANn5UXWA7+VMYkxPz7fw0YsE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eq2J2UUWApOCoKLP7oCUyn3LDSKGQS7R7VstWgOg1t5mHgOv1r/AH3zdFucZ01zAK
         uRMkvod15RAghWF0rsd2Nhmi3Veubp5eYHOQ8t4Bg1UsMpbI+bWGKCmZYzsL5Joh2q
         Ys/jdlC3xLz5ZJ8xvVUt40Z3aCMX9iEuPp2DEAMcjeST4KO5wlR4f6/xOofK0dLr3s
         sf/Uura75X3hPiSvi8Xl1+l3TrPGJep/TiRlxKqr1MdMg+ksgmXXgxOK2Vano7SaKk
         aj4G8kNF7yugthzOow77vMFCSnEdcGBQZCNVb/H7u1xB/kbiI0G7xzc223GmqQwTVm
         YPlYDlNxQ6WKw==
Date:   Mon, 29 Nov 2021 10:43:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] i2c: designware: Fix the kernel doc description
 for struct dw_i2c_dev
Message-ID: <YaSgyV3DBKiQJ2uS@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6B2jc/gUZgI989zL"
Content-Disposition: inline
In-Reply-To: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6B2jc/gUZgI989zL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 12, 2021 at 02:34:59PM +0200, Andy Shevchenko wrote:
> $ scripts/kernel-doc -none drivers/i2c/busses/i2c-designware-core.h
> warning: Function parameter or member 'rst' not described in 'dw_i2c_dev'
> warning: Function parameter or member 'get_clk_rate_khz' not described in=
 'dw_i2c_dev'
> warning: Function parameter or member 'flags' not described in 'dw_i2c_de=
v'
> warning: Function parameter or member 'functionality' not described in 'd=
w_i2c_dev'
> warning: Function parameter or member 'master_cfg' not described in 'dw_i=
2c_dev'
> warning: Function parameter or member 'set_sda_hold_time' not described i=
n 'dw_i2c_dev'
> warning: Function parameter or member 'rinfo' not described in 'dw_i2c_de=
v'
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--6B2jc/gUZgI989zL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkoMkACgkQFA3kzBSg
KbZXGQ//dBJaW0a5dZwqv0w/MgeOd7BPpV58VHrbZEuj1aikljCTJAlEUAVkJM0L
nhlfCoPRThejU0fQms4Uj03svHjypbmOkuSkfSdm7FMm1Q9+aBpsbc1H2tXDc1mw
NhqbFPtPFCfpkAMoFmSIDkTtZAQgKCGXiiS/U8F1AgPAqSD9X+iZ3Xgl/YD1mPhW
6L/vP2o/8G4B8FdVTRKXYQsRKoYdrW0AJXYa/4D+0iN3nng3Hy4O6xoL/nS7beEP
sBeixQGfKMjD+JeON30oFHSbMXnw3jmeUhCAwTdNWZFyxR36L1jd7xTVeeutesDM
/C5cXW0sgzICZXW16wYC0pZ3kZNw5J8VObK3M4C4cV/FFqa5qCh93j+PHTNPu6/m
uOxtoLIqlOnPvbFHJGUBqYb5pEZzoljTNQ21RTu2RMXLFyi2Dpl2KOYJz1SGgKZm
0OFwbXtQUlpNRlinLmP/eNZU9O5vvK52J+JotcSBbAnSpycFWLRqe9K0ItRaU7U0
FMGXiT6INSmmfDJPmRZPBQuYN2dK2pogTvei6EUAib3oR6dkBYdKpmArlbX4KcEE
aWM8Goq+PNNru4jAlqsp3/FYE0bRl2VSZmZdsdEkqRSnMJwCBzIKCxAUVy/6dr2E
dr6rMrN+UrGLg1Hni6vaQUHrdPTi+AVqds6WN1X8a8cf0W6JDBY=
=+9Ym
-----END PGP SIGNATURE-----

--6B2jc/gUZgI989zL--
