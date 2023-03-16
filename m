Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E87E46BD958
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbjCPTgY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjCPTgW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:36:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DB65A926
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 12:36:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3BDE5B82338
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 19:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADF7C4339C;
        Thu, 16 Mar 2023 19:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678995378;
        bh=Gbg34C1e6ySpeBZcNxptQ01nIvJla2CCEzLTOQvpPrg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vKNUQcg4Qq9+gWBI2/pIAkaPWP6omGQCpk0A72qLrp8+lz2XrDdNgqHTsO+WaFHas
         DCA014iFxhEKKEgvdLsSBh0hIL7cbNEy5NjWvlVVPb4FvKSUTcPoFph79qNLAS0UcK
         smp5BY8ZYH3BJDrshrGJ5ICp7KasWc6Gdcucb5AOk1AwrVJgcPvcRMOfA94e5gfSbw
         vvBBfr0Vm1Xzve6WF2zSVKk8nevBye/ILgcdBI586if1yD5zm0WhBKyO7BMIOQHU60
         SQdQcbqOtfwYb1gI5wK/lp40nJYquM4pwnc+fQqlCjk2+Fagc6sOwAMyj1zUS3RsL+
         TdGF8TjVxi/2Q==
Date:   Thu, 16 Mar 2023 20:36:15 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] i2c: imx-lpi2c: clean rx/tx buffers upon new message
Message-ID: <ZBNvr19oT1MzYkT5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230130153247.445027-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XBG9+mEWNPrO30WL"
Content-Disposition: inline
In-Reply-To: <20230130153247.445027-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XBG9+mEWNPrO30WL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 04:32:46PM +0100, Alexander Stein wrote:
> When start sending a new message clear the Rx & Tx buffer pointers in
> order to avoid using stale pointers.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied to for-current, thanks!


--XBG9+mEWNPrO30WL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTb6sACgkQFA3kzBSg
KbaNOA/9EqS7ZItfx9mZrAYdvKuC/cV6HXP/fYMpSGXCBA5+G0idsQ7cbHHOPCpN
XsXFUm4WxMyfrh4F1SxZahNrxMShVzN6ueM+c7bZH3Es1cQ4cvJfYn+MMmxvEC3X
BH3jYhpfBOs8PVLkkUtWkqvS2000d3jfrl0eKQR5Ie4yqhNZCtz2SKXz8+RYvcqx
KBDLE0s9ihnIxk8ahWvHDv6l8dp6/TDL7L6i+JiVoalY+NxXEgDR+S3aMVRCn0kp
qjNKSJ2+oWmyu7EyWQvwn+Pf5L3muleBdm2/U+E1btRwwrj0bFT4vf8IJ/R13nmc
qaHK6nbqArvOQz93/+wbLYTkwBB9bSSjB7uM5D8IeKMSo+DHQeQ81I/Bs/8LQ9PY
CQzqPkIzNZ4j7eYqN/PQNytSn0uaNzx0+4iDrVJSurDG4IGwY+fW5/LS6S6UC9B3
qyg074Wy5qcoxtU1VRR/iSZ52BcSvaitoYkY25ZPr3NgqiPi8kzhovD2ZR7ZN64L
J3y0SqKtJYteoau73/GaXMWm0Si7thUdpvRscbyqf+VjtPPSk/Og3drQfk4mJIA4
tehj4zaExY8VgV68lktdSBV1laNt0HBi/0wB1q7K9iYpHVsl43hHU3hwcRBIJ6/3
47JBZvZ8HO2nwd1qCJNCgHDgNYt7uWyiJg+n9r3tk07fR34y2Mw=
=cXz/
-----END PGP SIGNATURE-----

--XBG9+mEWNPrO30WL--
