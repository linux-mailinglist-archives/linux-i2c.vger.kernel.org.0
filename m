Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1C65F2084
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 00:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiJAW7n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Oct 2022 18:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiJAW7m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Oct 2022 18:59:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC64DB7
        for <linux-i2c@vger.kernel.org>; Sat,  1 Oct 2022 15:59:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BF7B60C85
        for <linux-i2c@vger.kernel.org>; Sat,  1 Oct 2022 22:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE3EC433D7;
        Sat,  1 Oct 2022 22:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664665177;
        bh=GgSrD4scIGK8ME+nZChoiivyWO2UFdfLXr4YN16Ga6c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gMgZfbl6FQMgBhanjVevlSJ4rAVSrl5JREqGm0kEodCbW2f/eTprUKFOogv3S8c2+
         KFxzb/bZCSVWUif8sLblI0AV38sxXZw8+joNip7rEk+PQKUgwVXJHBmvrdHFpFWCz0
         rdUVArd48Io1IYYH/nWVlB4Yt3AKrL94ryGKLxxM9gKdgW+3H4dp+uAxXClHIm0Rn+
         zc5Ls06n/jRqdfT1ESLLk+5ink3p7vgTtx6fiWRwaSOVJXnVkXZJ0lirzX6mEVAfZA
         epQIH6+qSAM+/Rvp4J1xQNrsy2cUm+B0HcT7bsMzqZIl5AYcT9nfW9c6fzfuyZf+mQ
         b68wzix4NLQhw==
Date:   Sun, 2 Oct 2022 00:59:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        UNGLinuxDriver@microchip.com
Subject: Re: [PATCH] i2c: pci1xxxx: prevent signed integer overflow
Message-ID: <YzjGVHhaRxK08yYC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        UNGLinuxDriver@microchip.com
References: <20220928201214.8544-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Nyt4l6bKwxBfFUIK"
Content-Disposition: inline
In-Reply-To: <20220928201214.8544-1-wsa@kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Nyt4l6bKwxBfFUIK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2022 at 10:12:14PM +0200, Wolfram Sang wrote:
> Some constants need 'UL' markings, otherwise they are shifted into the
> sign bit.
>=20
> Fixes: 361693697249 ("i2c: microchip: pci1xxxx: Add driver for I2C host c=
ontroller in multifunction endpoint of pci1xxxx switch")
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-next, thanks!


--Nyt4l6bKwxBfFUIK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM4xlQACgkQFA3kzBSg
KbbvYg//eg0wrHuLKqtaOXfCeSvb2yltOxvG1D+oM0kprGTAbsWkNVRXEklp23r3
IQn9/hR9PzRA1XH7Je67P+Yb1aPVtK3IcHMaSOyBZAXE4nd8FfTOmQzlwjrVZnVX
vEIAVCag/bH60JDkszpexW7Zmy5DHRrPQfw9f+EGCe3GvdrGPIDl38R4CwPHfLBE
EZoCMq0qaFtLPGyS/6rg1gt9AzprZekngfd1oOfCHJyv/LZb3vhRpdGT+KIy6vuX
97SymNd66UCv5ClPcZMWdrbLnyGKo29T+7gvuxnNbQ2LCZISBYLnDmjJ1Gb9Y/M2
xpvayPMqIXEBnS1CplqOBHjGU4hPHWHx67dFpOBrDsCs+DkAT8yWBSB3e/VpyLbm
laFqOXXPYWKeY98zRCsspjrfT39iX81SdSLpB1XoFNbazKZqFtZ7G1ABpniG4Mrb
UwPU3pvmB3Xcw/BPg4GCQj0oQ6XKoG3F7+KumJ6KllVshzHGEmh3qfH6jTSOLj+u
WXZm7KKRQ7/wYs/Ck2Ltb4aMt/rIdLkHW8HTEIzCrCK0j3xBEUH2qDmjXWlJGKHf
x4pgw3zZ8MYxLNf63x315IyqFAuF7c52+0wee3SojMyFctBnREqMW7hbQYhbsm0u
RYCJGGxU3iRBBY2fBmeQ+4sI6GeRQhhlwMgw7R72Z6n3Lx0JYfY=
=mokz
-----END PGP SIGNATURE-----

--Nyt4l6bKwxBfFUIK--
