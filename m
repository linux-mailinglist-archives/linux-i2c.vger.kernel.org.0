Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03623E928B
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 15:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbhHKNZI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 09:25:08 -0400
Received: from www.zeus03.de ([194.117.254.33]:36604 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231769AbhHKNZG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 09:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=CYsd51CWfhrDrFvcXo0fNge0rkky
        RguhFqu5r8E8ouk=; b=Gdm4rFE2D4i6PbaPJkzZaWMGFYS4rauF+ezr5u7VQUzE
        fSpbnotfGoYv0jwqWJD1otYLpp12olIl/t73Pd1ejjreexdCDt+4ck/rNe8zCdZd
        LroFytiGbrp/HLFan0DbI9Y32J+LNY8m20504nwwJyBLAq4RXik7MpH1aX9G6jI=
Received: (qmail 2664639 invoked from network); 11 Aug 2021 15:24:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2021 15:24:41 +0200
X-UD-Smtp-Session: l3s3148p1@q3NuikjJ9p0gARa4RTP4AfHKOCm/nqrR
Date:   Wed, 11 Aug 2021 15:24:40 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] i2c: qup: : use proper DMAENGINE API for termination
Message-ID: <YRPPmBafupmDcav+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
 <20210623095942.3325-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bNy8AuF3KmQsmVsu"
Content-Disposition: inline
In-Reply-To: <20210623095942.3325-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bNy8AuF3KmQsmVsu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 11:59:38AM +0200, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--bNy8AuF3KmQsmVsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmETz5gACgkQFA3kzBSg
KbYKOg//eXDqFoBIKZHdiPR+ODetzC3k/Sj68H7Bwk4mb+1WT6Oj9phM0g5LO8/j
IkQPlEWVxPPrkWYYi1p+N4tTjzBiLAotfC3gMRWmUJkzXXPGOJ3pI/BelhL8cBgl
EnjJtVoRUmwX59CI8eJAGe3f1KQ1vwP/oWQ1zLQZ3cyTi31LIFbOaGUadJJCJtak
xO6U2FEWG83SSvk0CAWYJiOYwtwapNxgnxWmRMlr9kbl3+MJEnSkPV3Iyd0t44Gx
J3BCSCzSpQtd6H66bvP+4V92/eUHTQtcL1k79kzIQvuD4x6ieNmEmcueTeFruAo0
XI2Cs5iXzZ+5opQFnV//NfIohyVa67ZiCgUd2Xftonb613ovn1PRi+yPiJf5vMo2
vQLVgmuyRm5O+jLx8vnUTpn9fALpcoH2GA3fA4v6C3ennC2LmqbFKUmMMacxh31p
dFwwbd0UC8sIh/Ia7tl/dbRzO2Y8R/mkh/8bLJFTK50mNOt0n0MdnX0ssDFx0kal
ZgqtPqNHvhfJPCCL93lKj8ttZpzKnGQ9x2RALnrmwV4L1XtKgp4yVNGj+gSV4K6b
opRUoX/A7aKT0ZwTxCPj/chvHOvqbbdtaSLmv1p/zbNA8uQ0MQMTAti4OKjebgRc
3fGzzh3Ot02wrc4hlIvyhmJz74YRCuIv5V7fqPEJdouHfX/XLZw=
=JEnT
-----END PGP SIGNATURE-----

--bNy8AuF3KmQsmVsu--
