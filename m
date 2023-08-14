Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5C177B9A3
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjHNNUG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 09:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjHNNTh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:19:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D99E10DE
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 06:19:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F35563970
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 13:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80840C433C7;
        Mon, 14 Aug 2023 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692019163;
        bh=2VSdrUCWnIvWUrYNIUq3X/NlEI3vPVGfuuuAXCnYcRM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VbWxcwyR1mrrFew6dnKahJd6h3elVMU83/ZnIka9kvk33hQzzKpPPRuMeI9ezy5/v
         yba0jD9o2MpOHYkvgYYA5DAEZbCdZ2R29R0Pl8wtsgfJZfsTrLkfz9qas83oRHZ4jL
         97oD4jQFrZo3FpP/DbS8BBc7HD+7IZex9ZNJT8xkpLdCCuu8vWLBZi4J2FP0KvFnrc
         CYzBLCBLwMadkIXZdPNAdqOrXQq+E3VzSobTi0ZsWU6cCfHUMXeRqB93W9/iKob3PN
         FDRdmR8js3yqsYEnB4b7AacJURHfR7azZMnOOR6C6gIJtWU2+STuMgjxHx8IEzwptI
         z2JrF1yB3bA2g==
Date:   Mon, 14 Aug 2023 15:19:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Wolfram have computer problems
Message-ID: <ZNop1y6Ynov4x1Yl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-i2c@vger.kernel.org
References: <ZLgriSv3-v7Y6Px6@sleipner.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aV/WN0Lo/kk+BS//"
Content-Disposition: inline
In-Reply-To: <ZLgriSv3-v7Y6Px6@sleipner.dyn.berto.se>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aV/WN0Lo/kk+BS//
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Worse case he might be offline for 4 weeks.

This more or less happened, but I am back. Thanks Niklas for posting
this and tons of thanks to Andi who was reviewing a lot of patches.


--aV/WN0Lo/kk+BS//
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaKdcACgkQFA3kzBSg
KbaRdhAAmGDoPgtVJGPu8Yn6QiCKSnNLjwzL96RobqsUDwLl3w5Ya4K3CyZ19ZEq
auaLkVSAWV2hKhb5aPY3DL06K9w1Sfn5HZspc+3GQTn9cBWwNsW+Z5VQAhbNA3S/
FZqvwRLR6J8MVjG2eaI5WYF7GPe138S2I9AJJp5hYra8QF5AdYL5krbLN+by/i3E
f8BUR/UDz4KwAhy6/3NkJwrt3Ye5A7S3XbwFCtOBT1u2iZuq23MOr0tzAHjln8QI
sOpFUnH0y8bXh+lEibYaXmRanDI4Fo6nv3/Zok6K4KWNOOJZvnS2lTblae2rQ6Un
C7XImUNpOVfb2dGCUqNCw+ux74QVduqwLPU2drI4YBVJLyAbwg58XlNpNt4mw553
TPym/r25PTr7hMSUUQ18vQwHQFME7ke8+Ej1z6IaDYXwgXn9UVlhtyvRsizjqyJ2
EwAVODG7i56VsXCvR3T0ChYE3LIrAUldCvUXbtRZYzFZFqt2TD4DIjMHBnVfzfDj
BioprEoXsX0SIjHKm/KxgnNLgwXwBRu46w/z+ttdtOK3lthcqTOsmjhjVngUJ57K
dPrTkPVfN1pBuOi8qVcXLCWzT6X8PU7dZkCdOoC5Q3z7su21kVAzrZphvezHiE2S
8LwxcxULRARqLKJBJNLFq2cfa2/3IyWyMESXD2qFpuUsk7NfgMc=
=ufVN
-----END PGP SIGNATURE-----

--aV/WN0Lo/kk+BS//--
