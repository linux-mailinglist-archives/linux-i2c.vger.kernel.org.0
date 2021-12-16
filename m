Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23496477EB1
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 22:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhLPVXr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 16:23:47 -0500
Received: from www.zeus03.de ([194.117.254.33]:51290 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235310AbhLPVXr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 Dec 2021 16:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=xrmK5M69JIoWYuKK+6Rip2IpR+MK
        b8W/aHjjpwFJ7RM=; b=b6EDIicK1ENH9RqwH7bd02dHtWQeEPoRkzjI/LrQ5N49
        EDG7O2mblH7iZs2wtBsWlz3wX0phs7T1hHX0guifMQGnTdQyRJCJPwhm9drcDfqj
        AcbkAp/DbH3+B3RLKSPtQHof5Rh/vmwCxpt+sBqqAsuEIR2iJi/b0yDsZw+stg4=
Received: (qmail 3861039 invoked from network); 16 Dec 2021 22:23:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Dec 2021 22:23:45 +0100
X-UD-Smtp-Session: l3s3148p1@BgCYCUrTLKAgAQnoAGshAMNCcCooTOTk
Date:   Thu, 16 Dec 2021 22:23:45 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: rcar: update to new DMAENGINE API when
 terminating
Message-ID: <YbuuYVgSRJs1Bt6G@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20211208084543.20181-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WUSwl8BU44/M9nst"
Content-Disposition: inline
In-Reply-To: <20211208084543.20181-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WUSwl8BU44/M9nst
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 09:45:42AM +0100, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated. When converting the existing
> calls, it turned out that the termination in the interrupt handlers was
> superfluous and only a side effect of simply calling
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


--WUSwl8BU44/M9nst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7rmEACgkQFA3kzBSg
KbZcNg/+NA+qyQweIMfHDZYyyX5nhnNgjERC9IaT3bv9nyE+w2o6LHfBaZYpfeOi
YBqLWC1fBQjwTwK0mKc9XF6uOFjf7IymL7hlJdItilAenl2q4JOYwwyTV5r0Hj9l
j/piBP+RUaIPxP3YrPv4AfAfVeFf48kMIC7GnGjSHOLHduFEVAjRIjwroo9qPwia
CHclPBrepuCI70CzFBMuqjAtu8IVJl9/ek0Jjl3SbpbkgJpz2QoEad3foctvwVr1
tawcLQCxYFJlPtcUQgx0wG9w4HjDhutcE3KPGGHLWcI3gdr1kHc1kFNYVv4fjLNw
ctPPy9MMFglxE5M2wz+f0KMrI8bXmvAA8AmnFE35R2HrW7acHVdwnfHg+qq3Plw9
qZ6ySgsTBnMxmRgvcyZ2s13PZXd7cyPQCfnl2yGKhkUqP9oG7/C2/iL5OMcnr1RD
d+y6uPMqe7E9LO4FmjLe8CLlDRDgV6zMdZZAeaDvyUPfxqW3GXj8FzvDXokpjnnI
QkHB3vzDbSaLpaNCG/zQzOd6DVAbu7d7DzKnz+4OKXnj0FsOLidObi7QdvOvoXQK
Yzsz00gcKl8kJIg/Lbx41iQ735xrRWEpWi6VLv5sh1PjsK2nBNb7vu+aVU7e1SvW
0A7JEg64ZYGig7HuaF1PDtDXGniUX11JYGUf7EYk3muKeoAbzA4=
=MIl2
-----END PGP SIGNATURE-----

--WUSwl8BU44/M9nst--
