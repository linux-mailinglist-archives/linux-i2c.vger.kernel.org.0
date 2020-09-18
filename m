Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7892707E5
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Sep 2020 23:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgIRVNo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Sep 2020 17:13:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:60100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgIRVNo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Sep 2020 17:13:44 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8197620773;
        Fri, 18 Sep 2020 21:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600463624;
        bh=lJEoJiKb+a1XP0tPhq92KH2rBuS5HXXEbZAD3e1rGrI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U072NaANahVKQEmGwebUdmaSqBZ66YNMyMwq0vnaLZGbXhpy0lIc+Tvbp6bj7FNeo
         TJ12N8UxYDAuk3tRHbAmaskkrTuClo87fMSO7X49qE7I2Pk5OBvMlYfU2dZqUv5hqs
         rjexnOp75lufY2HWWNvosEZheQA//jtjmxKPQXfE=
Date:   Fri, 18 Sep 2020 23:13:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mxs: use MXS_DMA_CTRL_WAIT4END instead of
 DMA_CTRL_ACK
Message-ID: <20200918211340.GG52206@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200911150139.13690-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lQSB8Tqijvu1+4Ba"
Content-Disposition: inline
In-Reply-To: <20200911150139.13690-1-matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lQSB8Tqijvu1+4Ba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2020 at 05:01:39PM +0200, Matthias Schiffer wrote:
> The driver-specific usage of the DMA_CTRL_ACK flag was replaced with a
> custom flag in commit ceeeb99cd821 ("dmaengine: mxs: rename custom flag"),
> but i2c-mxs was not updated to use the new flag, completely breaking I2C
> transactions using DMA.
>=20
> Fixes: ceeeb99cd821 ("dmaengine: mxs: rename custom flag")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Applied to for-current, thanks!


--lQSB8Tqijvu1+4Ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9lIwQACgkQFA3kzBSg
KbZ7Hg/5AceyOo2aZs4KCc0X7bKW0jsp/FCiQso+pUUdZqsFlfFftc2VXDxJ6jl6
BoGfvzvEWO0RkOwspm0hi27rpYOhjMwyl4DVM/uJvmS6kUfE1U1pALuiUJ5KVvb+
Ho8Xq7AV6Tbc/Ujtc3QdxQk0nCNIfbDHMaN4SbC39Mr54YiZsfeTa8jLws6ggFSI
Kez+DBYnwrVvEwE7VrJMmetCZdPKXyi61rvtwgpVU4gEzlGYkdciZRR+3mP7PlWm
KRUD5w1R/Lb55hrXf5jVoTB38yY6u2vDsRTkTkrOXuoOKdlHJF85dVmqfOiXtoDt
X90A+ntSP72161iHn9ImkAV/a0OObuDVLqrAoRt+sYsDcQcNgqi3I1BvOGWtYVlq
At/D/6qPf2/1wBovpJ5Zp5uQPm4+4VyOLxrYeByKJw3sQwlojg90r6Ck+Whr9IRp
GWcfQ+al9p2JrqQQMHspwNIJjVSTRovqNi2XIfJM0DvBdre0IsG6WJOCgIthjfKu
z0b41DQqRtM2eL/STnJt24z6VgWYR/HI1huUUhRroV6eZiFGRZegbGfmBPo1zf8M
EugbckJqQ/Ywn8253KlH5EW3d1lPqgoi5ZYGdrLrpHjqA9tZ4XOMYvJ6z2IfrULa
z6JnL4SMIic0E6i1o3La1Z4i4t8Pc92fDb2psrUEziQaWsiy3H8=
=uKjB
-----END PGP SIGNATURE-----

--lQSB8Tqijvu1+4Ba--
