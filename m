Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB486629D3
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 16:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjAIPYt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 10:24:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235202AbjAIPYh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 10:24:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB0115833
        for <linux-i2c@vger.kernel.org>; Mon,  9 Jan 2023 07:24:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5827E61198
        for <linux-i2c@vger.kernel.org>; Mon,  9 Jan 2023 15:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C409C433F1;
        Mon,  9 Jan 2023 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673277875;
        bh=VWoSPPlJsnqvqfU3ItJyOAFYJ4xzrLdo3fBPZE/dgjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oBLwX0SxibvaGlNIRFyxyzzihu9JaRjivnPc/Y1y6jXOdX0I0dKSCQZrQlBjDC5/O
         LuwZMw+ITTUJohhtuR1wK4fDFgtpEmOG4Dxne413j6NOUn/TQtuQSRN7iKS7Kxuuuq
         F5kNRNOSuGVo0P4NMGblwRTm0BzmbgT1hx1sO0djlWM/9adXoYBv0v3IiEyMTayFm0
         pdAOGSKrffIuoPlKWXzkv1Qjogyon+yGc/t/K4Ixqw/EENoG9vb+WsVK288q4vQTlE
         ++LlkEuzRxwT9cMB20UuMkos6AM0jK79VDWrVUCBftBclcJqAfrcVVo3iNYP277yfY
         7vICTbKPMIybA==
Date:   Mon, 9 Jan 2023 16:24:32 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        linux-i2c@vger.kernel.org, Rajesh1.Kumar@amd.com,
        Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH] i2c: designware-pci: Add new PCI IDs for AMD NAVI GPU
Message-ID: <Y7wxsAvL+u8ZXSXd@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        linux-i2c@vger.kernel.org, Rajesh1.Kumar@amd.com,
        Sanath S <Sanath.S@amd.com>
References: <20230102170955.1750734-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lMcT9EQg0b139g1p"
Content-Disposition: inline
In-Reply-To: <20230102170955.1750734-1-Basavaraj.Natikar@amd.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lMcT9EQg0b139g1p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 02, 2023 at 10:39:55PM +0530, Basavaraj Natikar wrote:
> Add additional supported PCI IDs for latest AMD NAVI GPU card which
> has an integrated Type-C controller and designware I2C with PCI
> interface.
>=20
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> Tested-by: Sanath S <Sanath.S@amd.com>

Applied to for-current, thanks!


--lMcT9EQg0b139g1p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO8MbAACgkQFA3kzBSg
KbbCnw/8CG7AsTfBMcj1mTNNKbXLDAB07LZfjnyWpCn/OsqqtBB9jr66Y07HIEkE
V9MeCbMiHDoMfio0oxRJWWSdRBB+K3cadW3HcHs3bFboRNTEoEFmmXUu9cS6aG8L
sxkpOFdpkf64KTwheMbSpoUCNcZ1DiQQY/oFFfMk5lwY6xl0B6/vxFgj6JekWX9r
YGA/f5BWHy8LkHjqsFzAr9n+Mv1SOvlUGc/S1ignBtM/lQEu36eIw6tiSyUYN+D0
YSBZ9EcUSVMSin2KywC2hjrrEYt82k2G3blr4HNAAL7XVBAHzO1ut72Fxo1we4CG
H7oxegjE8h6RgU3Jo3gb1xz2yL40KsFAXu+kXDdIU2NhtohBl/6+42nw0osU1k1Y
7RkLavQs+Pu5cFWCy9nBwoYR8119WRdmSnkDz0vgNJscMnZF+ydCvK8/Ao4beaXX
sFaS9yPAWHEM3lb06L+WX7ujEgP5FpcIrDL3teMxtrMQ2eD0/55IKv1jNketkyGV
wqa4atRKKbMOkw8tsL0BZbH9gI2UZV/SwsbCq4ut72oR7CXCUlM0yBDRtB6uUVIy
EQya2zpFA8LINudHheGrxbTsCMLr3M7kVy4LHjkoI6Y18XR6hYsVW2/DrFqTxb7w
BE3jBIC2C8ULyN40euT6zypHgyudKKmK9Dp4CJwvq1q9E0rZraA=
=6Ryl
-----END PGP SIGNATURE-----

--lMcT9EQg0b139g1p--
