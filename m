Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1A3973B431
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 11:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbjFWJzk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 05:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbjFWJzi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 05:55:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA704210A
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 02:55:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4E973619F1
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 09:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC23C433CA;
        Fri, 23 Jun 2023 09:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687514134;
        bh=13UMXaGOOQBBHfIcDaPLAnu5jOKMmj8dvaMD5JAEwQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jjQ3ooa66vJPY7Dzu0O9FRvCmRoDBQ6uwMicPJdVv0ZBH/a3fEkzunfVIf8Ckpclr
         Jhty2Ji2u2kKDAQsN3XX0uyn9MOOM4p/N6MyAgCL5TQMsRKbHib9M914gi8UVJIt3i
         Um7fbwH5B5HOjII18xuyPrvCO5e6LcIJ0aNF+MEH3Tom3hdzxbiRmUylYX1q3nlSgg
         yBfBUELsGax24dEAXnL+0Z0FF4rWkvmYNrpTXPue1Gl3pyfi2d0Mlyf+eUPqcfo99l
         weHqbXIpyTRtTCKKEooPlwXJ5ekRICgj6J24Dhz80MwgYVz0S3qpq9X2HGp1+NI2+8
         7c7AL9pMchiKQ==
Date:   Fri, 23 Jun 2023 11:55:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>, Stefan Roese <sr@denx.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 08/15] i2c: busses: mt7621: Use devm_clk_get_enabled()
Message-ID: <ZJVsEp+cQZruztr0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>, Stefan Roese <sr@denx.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-9-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vsMthyeBjG+JNojo"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-9-andi.shyti@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vsMthyeBjG+JNojo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:56:55AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Stefan Roese <sr@denx.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied to for-next, thanks!


--vsMthyeBjG+JNojo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVbBIACgkQFA3kzBSg
KbaMIA/+PttyJZxutLnNAScqjhekDwMXPx5jFGuds3cLnteG+wZ4xDK8G3vbWJaA
VzpyjR4omY7jXVO5X+S0ao1PxVcCD6ZTgrcVQ+nWWArB2UzUaaD0e6Fdvz+cJKSw
KpGz4GcjmsLZ6LV5J3+Jga7OWKU4X0nKP1ZUeB3aMixZmNPJW+JFI7Rtnz8E35i9
uxjR1ZnYsF99UaUoP0Eat0INDq9ugjz3gcK8P6R5Qm4XTbxAwTvlz9eIFbOG1BYQ
aeGX7L2G5OmlMAZVzBzR8XwQRcHkph3baKS1QaU95KxFfHPR6jGHBzQ+VbyC3g0y
mZWk1VHUG9TIiv7jrUMRCmckEfMs64zhhgMZHZR4Go/KnKIUxNl5k4fbTIQf/vbz
vBTku8reSxGTNKjuCEJkeLzBZ1c1aRnN/DCdO5IMCCq9MZSW8/Q3QEdQ7rE/nf2O
M4j3IdFvjJ74mhngNh/9k2InZ+16lV6E6kizkWXuLy4Z71I+MVDQnq9vxZezpyb2
9LKsJwpPRSdRRNaYVPZYZ3OTsMTKEwpIlD49iT+QUx0F7n69yFxB4MxpMkwNvUoQ
23Tkvl2kfngZ26iDnBISIX4wcEBAZVYvq5nCNiIPhFpXDTwD+xy/3gMPOH0gArJa
CjuNAbRbciXEHPYhEZcdT9re9CPPHpBp05FVfQ/W6+MSaiNkHY8=
=Zy+h
-----END PGP SIGNATURE-----

--vsMthyeBjG+JNojo--
