Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D9E3414F0
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 06:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhCSFjM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 01:39:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:47298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233730AbhCSFjD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 01:39:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5842164DCC;
        Fri, 19 Mar 2021 05:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616132342;
        bh=+i4cC2M5C4dcjLAtuPh2hSDBnjCTcR4vEYW7jh/wR6w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dq+ONoBs8pFSGds10YBHOz8XLKBGQc52mVIkPT+Z6vXJYsegDgDv43UrJzamc2lE8
         mMRtdUmnTLik3Z4z0irq6Q5n0I4qINStqmVBj1ZCvf9/MZkOg6wBXKH8v+edF6+VcZ
         K+oBS+2Z0otDx+fhN8/TFar1JjfFrAZee66+a0dFxJNiMngdol+GKgpeQboU+c3DvA
         YId6MPDNGZVR4SYja0HaEPU3xF3zG9Q8jt1nIGk2LYc6cc1gfp8PVrT6m4mlbmwS6L
         TYLFfE9BMGCQ+LWMXYOKDT3W6JguXfOebXpXqYuSN0gpd3Awz3la3maxf8sDaDC98l
         8FgKp3xfBfpag==
Date:   Fri, 19 Mar 2021 06:38:56 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Clark Wang <xiaoning.wang@nxp.com>
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] i2c: imx-lpi2c: improve i2c driver probe priority
Message-ID: <20210319053856.GA997@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Clark Wang <xiaoning.wang@nxp.com>, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
 <20210317065359.3109394-7-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <20210317065359.3109394-7-xiaoning.wang@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 02:53:54PM +0800, Clark Wang wrote:
> From: Gao Pan <pandy.gao@nxp.com>
>=20
> use subsys_initcall for i2c driver to improve i2c driver probe priority
>=20
> Signed-off-by: Gao Pan <pandy.gao@nxp.com>

I usually don't take subsys_initcall patches anymore. In most cases, the
client drivers can be fixed instead. If this is not the case for you,
you need to state that explicitly in the commit message.


--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBUOOwACgkQFA3kzBSg
KbY1VRAAmwkj2NT+jJqTBYeyXo9TmNYUfwW0AMLfFnEkhXotWGeP7HKYqkEhTCaC
ON0u1gqsdvsvAs+e5grBjSWw7KsciNqK9UR3Fv1Bxuz72KIaI3miU6Ljqrn3G/2/
zrxGAlybA/ri7R7gKoKPDy8U2L+JcDQj7SGl2Vll2Is3iYJSX2dgNEIq7pyCSXxR
ooIbh5uxXm3Yg5IvaR+4OWHMXDKD/j0OwvEmUQaAyUd14E5QwximQrUBK7yeVugZ
KfPQpR3OZCHyVJuWftT/fSK4iC9It5k9jhzopU+NTv32RB79ZUjZFGxQb/HcLbPk
2DE9JK7gvGgzhGxGdXP20OUh9XefwWhZeUw9pqeEgJxaErC7G4u8hW07froO2/Qw
B1P/bNNu7x67f0OV9yzo3qtk6/bFKUWcdHYqqg5VUD0iTsKz943LHQC80Ayen5lG
yhfPCp8evrZ8/iu3yV9EFHIOUUu1eYOoy+bjT/QfZDLF/Os6rEs4m73NNgq5BnLQ
a6b9SsgWpjZBWves+7kAw6YUKMwpFdseHHcyR6WPGHTTsgkRjckEz9rJPPcSwuFs
6YpH8tfgdKVvxJgM93ixzO2VBYwTmIMFV+idtnfvWG4vMS2zKMvOcYAEzDt6a+oD
y2WNyyIoG4WRF1oUqZ6gXHLxWx6kPSFqOkXo8PE2qyh2iyMullw=
=uc/g
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
