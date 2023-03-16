Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860526BD961
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjCPThS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbjCPThQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:37:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A62E252A
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 12:37:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6A474B82290
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 19:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AEFBC4339E;
        Thu, 16 Mar 2023 19:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678995426;
        bh=FRNPjAVTtxtUEENQQVtXOp2CoUVkg5XWIQ0BJl1TGfc=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=FWgNpTSSFEnK7lrsojten43mzHmQUfbTE7tiJmAs0YL0TXsBhGUKQQO+c1zklVqIH
         Adxgl4OPfR+moGibuJhk9f4JoqLtGOkylG8cETi4ICTmj1WNoPvLuwYdXAICK5Sn4g
         AGdkqD5Kwk0IB+tJLThm96f4VJh+FB2GT6s7NdUgHXua5MZ71fGwyMN9ZSq7/fgjWz
         FDkVFf/iIuB0ouAJ4oNWS55AuoQBXe70LGt7kVxUtTEsEXyQAlC0LWxUteWnGQyXau
         0iqwtFOVff/twX074VwB143p6LTLtHj6dvYgH1lZhABd3fhayWDKK3MROODsjLmGBz
         P5JR5CBbFvaxg==
Date:   Thu, 16 Mar 2023 20:37:02 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] i2c: imx-lpi2c: clean rx/tx buffers upon new message
Message-ID: <ZBNv3uhSfZ3+y7bu@shikoro>
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
 <ZApNcov1X+hV5a1s@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xEHDO1aAOUA75fML"
Content-Disposition: inline
In-Reply-To: <ZApNcov1X+hV5a1s@shikoro>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xEHDO1aAOUA75fML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 10:19:46PM +0100, Wolfram Sang wrote:
> On Mon, Jan 30, 2023 at 04:32:46PM +0100, Alexander Stein wrote:
> > When start sending a new message clear the Rx & Tx buffer pointers in
> > order to avoid using stale pointers.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Dong Aisheng, what do you think of these patches?

Dong Aisheng, are you still with us?


--xEHDO1aAOUA75fML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTb94ACgkQFA3kzBSg
KbY73BAAl0RzdLk+UHkkpAQrcCFyrK8V0JbVrLRkL/7o9+u+nEzV0gLkYUQfkIhq
TWzGBZe8IIu/PiCo8+1mWam3oOLJVCYm1PzqiN3TeLDVtLW/Rl2Ktup5npsg1B3z
qwQ8bP485XSlYWOs8MFiW+lQq2nRUTTnas5O5XQ3cs+5vR8Dn0YlA159f+62KnIP
hPbJMf0np0pQMYpDxcV654/Xj1rCgKbN6sYPnIB+SO3a+a1Fh5UNqXdcn1JpmQrY
lfHnRhUSYh6ccjd9p+4X1/Wo0WcQqhkvyy5TJ3QtDyv+RY+m9AO/CIAJuRzE5aen
umv7U2nmXY7+QBtOMRiOL60j1KzUaxnDinQNTNF0Ptx5yKWQUrd8Z22obBuCQ/LE
62i7RhjlgdF55Mgx5jNdxogViXW3kPODtle6mJCrbTFT+/e8+EELXrRRbzHHdc8a
LZcvHZi/PJLqkYFJMmgxqZyflMDPnLAprfCA0SWf8JgCnS2rZrehx6Bbhi2v7JR4
UhG2Mk3x7HsDdOI7ot5ELxSfHWiTZB+AGbmx8wMWZKg3UiFoDrx+YI38MmPy0r8s
23UTtBQtR86N56PhAgGhf3SwTT9qolm5G59UHDAS9HP8nrz9LZcoPkkole1eyLlQ
MI2ysQ5S1b3k8k1A5TQFUQ9nFGOQFt54/n0vQm5MxN6zHC2CUUc=
=j/sI
-----END PGP SIGNATURE-----

--xEHDO1aAOUA75fML--
