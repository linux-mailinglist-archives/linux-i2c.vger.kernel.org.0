Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1149477EB4
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 22:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236916AbhLPVXv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 16:23:51 -0500
Received: from www.zeus03.de ([194.117.254.33]:51308 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236243AbhLPVXv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Dec 2021 16:23:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=i1BF9ZY4zSrk0Ybh6RllYNXuCels
        VczKSY/PVjeYXD4=; b=10NwK+ww8/mhQaDEKvYHJdEOOuYDMLCretfIvfNlxOSW
        kU2l/82DZq+Z6l22/EZGwUJVzFeFemXATFizwbJJOr7xONuWy824bhEENUU8Nd1n
        Is/eCfKugArHuSw4Ne3+3kcBrYW6hXeuDOSTg6NBwV2iNpOzRliwAuAw7kW5kvo=
Received: (qmail 3861112 invoked from network); 16 Dec 2021 22:23:50 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Dec 2021 22:23:50 +0100
X-UD-Smtp-Session: l3s3148p1@G0bZCUrTLqAgAQnoAGshAMNCcCooTOTk
Date:   Thu, 16 Dec 2021 22:23:49 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: sh_mobile: update to new DMAENGINE API when
 terminating
Message-ID: <YbuuZTZwjCQ04rIw@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20211208084543.20181-1-wsa+renesas@sang-engineering.com>
 <20211208084543.20181-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bHQYOl6mU3wTxe89"
Content-Disposition: inline
In-Reply-To: <20211208084543.20181-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bHQYOl6mU3wTxe89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 09:45:43AM +0100, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated. When converting the existing
> calls, it turned out that the termination in the DMA setup and callback
> were superfluous and only a side effect of simply calling
> rcar_i2c_cleanup_dma(). As either no DMA transfers have been submitted
> yet or the last one has successfully completed, there is nothing to
> terminate and we can leave it out. So, merge the DMA unmap and cleanup
> function to save some code. Then, add a flag if the new cleanup function
> needs to terminate DMA. This is only the case for the erorr handling in
> the main thread, so we can finally switch from dmaengine_terminate_all()
> to dmaengine_terminate_sync() here.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--bHQYOl6mU3wTxe89
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7rmUACgkQFA3kzBSg
KbZm/Q//RAXBuvrS9R5zUaHG397fX1gz7n6E6NdbQvbpcT4lf+s1lND+lxwvGD5G
lNisSJZIkwqLm7ylqYtraih/5U7iDoL96OIH0AdgCyl3t87NjC78mjs5PSk43SKT
XTtO0Ly7azdMneOhGezV7oC9nCyJmcawZq/1oVKvoeKD+JeJieSs3D1PR+H0U1y3
f02qENU4cZCNNQifmEFTf66mxaKNlQaBSBkY8Xaem8Rmh8qUabMKyigpXLaHZ1J2
Z1YfuhvpBvuM2lrDywRfn+BHF7ggqVc8TGPPkUl9iXDleHvdEoUSROejEncX1MFZ
oB6jGpBEEAIFVUeQjO/AjnQYQ6bF0YYBA+/+VN3U7i6/anoVtG7N31JZJIjSt6sO
RzBhm5VXeJ6nPttmwgJ0O9quZG6x6o9GPu9Qd65IWDyMwKt1JLpGspo3Zof2Rn7N
RijDlgFT/y2ADZR0PI6B++7Gp/yxSZab2gJ2fnDeFZluvOGvbIGYs6GX8nWD0moF
c1MWOilhtsDyhDZTixDaTMXW6QS9YMGyCuF2c8jAVs8RTOkgh4Nq9SCDSXvXrkK1
dclGSQLDhOcm+VEN4YZwDN2wDLPvbLohPYgCYgjCzXelqTQuFc5mYF5vfnbNvTjG
Q6qVCX5Jn1Csv1iGuioweN0GfRqeLEWBlR4tOiX820Lue24ZzXc=
=92vO
-----END PGP SIGNATURE-----

--bHQYOl6mU3wTxe89--
