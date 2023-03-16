Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1446BD95D
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbjCPTgc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjCPTga (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:36:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4F2856BE
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 12:36:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 926E962100
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 19:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC94C433D2;
        Thu, 16 Mar 2023 19:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678995388;
        bh=jb2nzpatP7O5jIKb6JL0QWGvch9PFBPZozV5+PbWU2g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IWeb9mWETpl45M2YMdMNjenvVcI6zXSfbfWLPc1l7at+YySRspzAIywgnsdPtcShw
         NnZFII99HXO8f/uWxelG5WstEwlY7udBCnIsQGIvq6MRX0/19Al+EraKy8f84D5AHe
         +NlKP42RErlE+ceHPKaR0cjnMF2vS9h1CINZ7ezVIk4sSDPd+HupyoKGoehUZFog+x
         0GbTax54yMdYf5nC45RO4r7u6QHW+pFVt8JQByapn2MPyaAMFBrcz2K+SDpVjkalN6
         cOM3N03q4qURPQxf4my+l/nATtckrZRaDs++LUsKTbb7kT4eEoXiFIRNwJzbULCUhz
         gi7gM/sQ9IugA==
Date:   Thu, 16 Mar 2023 20:36:24 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] i2c: imx-lpi2c: check only for enabled interrupt
 flags
Message-ID: <ZBNvuBZYZSc0P9w9@shikoro>
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
 <20230130153247.445027-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nfFpViwYTWQzz58Q"
Content-Disposition: inline
In-Reply-To: <20230130153247.445027-2-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nfFpViwYTWQzz58Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 04:32:47PM +0100, Alexander Stein wrote:
> When reading from I2C, the Tx watermark is set to 0. Unfortunately the
> TDF (transmit data flag) is enabled when Tx FIFO entries is equal or less
> than watermark. So it is set in every case, hence the reset default of 1.
> This results in the MSR_RDF _and_ MSR_TDF flags to be set thus trying
> to send Tx data on a read message.
> Mask the IRQ status to filter for wanted flags only.
>=20
> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied to for-current, thanks!


--nfFpViwYTWQzz58Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTb7gACgkQFA3kzBSg
KbYQFA/9EpQdG+HGWv5f3ofh9Ibz7E+0GVXuqqqZy5KLxeHDcDEQLYHUwfIY08RO
niM35lxKezU6aBsLnPY44Ul+EU3iTitHy/IfzDUmxec6U3UoFiY9L1hCFYjvN/vc
qbmr4Jl48Xitn4UdSzdvXtfKbZBRwHLGCRLBYIGd1wQvQqGSILKLW1kF/i1oNleg
FQ4kDOx+Kci7RMG6PDQPnEkAss2/PUkL7PFUQMf3KZ2d9iR7kmS1RvlifNk2oHn8
YoimKa3d+moiSYiRPFB9uu+XL9BVBTDST8IXAiZIovX81mwSHfltK45Fw1pBDwEV
oRAegRVjGkzgbddQ5SCQEu5oHRhNGDft0LSA8JCkBKprwektHFt1tBLJ47amDULj
A4QmJTOJqEInxfpftb+CgLxoFKIlnjIqePc8vQL4zh+rgilXYgwjzhoCxnm0TfaG
tM6Zj5Ml9u+zBsIxquOYxe/dCSrIx2dC7UO9cHZeXfCv5j8YkMnh80JQeVpnL1z5
HKy9KVy93hNhzFjnPXs//TkpN6ptiJajV05f8aDINEuT0pSoGixTwxxs7F2zeM1/
sO1QA4MRAIKNGRZTlMHfZQSVvio0kLJe4pcbB+AsDgZ/QlJifaTDfveYsE+/iD0T
e3IUW7s+PActLFH4kLSUIijxetkxnzXzXgg5ydWwKeoiVvbIUHA=
=aABt
-----END PGP SIGNATURE-----

--nfFpViwYTWQzz58Q--
