Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3483B463C
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 17:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhFYPEn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 11:04:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:38060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231680AbhFYPEm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 11:04:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EEA56197B;
        Fri, 25 Jun 2021 15:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624633341;
        bh=+nC2189eKCU6T28/hcgTvLONm44gotEpXOHRDCHlrOs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q8YzMdkakrr+6yUHSuakRSX6dve5Mt0T++6DuB0We2J28fogIsOo9FQ11MXaOVy2u
         rMUydL3PCwwARSXaHl8pAA7iOIwtiBSx/3lJhrsDlT18J00aw03AkGPXCKWYYHn22c
         6x8x0KYIP+Rb18j/gcfQtkoTocm2zRF7nf/1glRBNHgDJwkOlZmOLG0/9g7w4UqlKO
         wxMSaeyFhVjQpGqSdpoLNLurW/2P4e4IEX8KG1GvlUu9S74GoSaRbFQEfYfYZfuzLG
         FaVEaVw+r0cBBB+ROFDPC6JXDaskPV1CI5+PhiaB1ieS6y8YtbbfDjtSzEy+ObKl92
         v37ZiTceM2Ppw==
Date:   Fri, 25 Jun 2021 17:02:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 1/7] i2c: i2c-core-smbus: Expose PEC calculate
 function for generic use
Message-ID: <YNXv+2SpsTLStsIE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Quan Nguyen <quan@os.amperecomputing.com>,
        Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        openbmc@lists.ozlabs.org
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+2nERxd5au+gK8PN"
Content-Disposition: inline
In-Reply-To: <20210519074934.20712-2-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+2nERxd5au+gK8PN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 02:49:28PM +0700, Quan Nguyen wrote:
> Expose the PEC calculation i2c_smbus_pec() for generic use.
>=20
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

You are the second one who wanted this exported. I agree it makes sense
for slave drivers. So, I'll skip the required user because two are in
flight. Applied to for-next, thanks!


--+2nERxd5au+gK8PN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDV7/oACgkQFA3kzBSg
KbZ8xg//dLfzMR1eQtBMxT1tUHLNopwRIXCsraVBzK+s0nbpuIDwP7mxiTLlLnQ9
vp/mzzur/NvhOqJ7uBrc1tPIyo6fcNtH9sq1S1hGQcV6kFR/fZ920TvGo/uE1AvN
GHU8vUz2TBjYvctu9fiBIYecfDB0KAkYPHTV6zpANUn2CnifvIdBJ7E38IVUk5n/
b0cZEsjj1HV7Hnp+GHw5CPsHYOV3LP9Nlbu+z++AzcYhhbEXxUEFaiMUS4LQ58Px
idn6ndXW8L5r69OH7Y+YR2EvEKm4rwqs21rnh0Iql1U+eQVYrL9cafa1/uXdah3r
OKWrcFEhyomnHAI8QQ1aK6fIyDB9ms93asIwhKdy9oKO7ZDTXH5gsUvE35L+mhoZ
tv5IiOfNoI6stXCotmaqAWXIP5/B/ucuyEMiA5Dyjfa+uutIHgT+l4tGvchnpe3T
jKbmr7SlGW410XhyVc+No8zD0yug7YpC6IQ+AEWHMsSXR4dIU87ZTxcGRXZKeKv5
agJ5M0eRWRKjJpatkK/7mOumtaIcnT4jyGfXiwKOlsS8XIYzeq6WsT08EpVXQIKR
eQVYbm3Y1d8rI3AYts1le1VqEv69PShYBXuvbm4FG9H6fKkAVX9i2dLGwiS8GiWM
lskRRpMa6GpsLn0t+uurUWkgXzK+c06NBejGsWTs9nq5s41Y1bU=
=X8AV
-----END PGP SIGNATURE-----

--+2nERxd5au+gK8PN--
