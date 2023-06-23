Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69B5473B4E2
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 12:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbjFWKK4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 06:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjFWKKQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 06:10:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764C03A86
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 03:09:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F27E7619EF
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 10:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10568C611A6;
        Fri, 23 Jun 2023 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687514945;
        bh=f/5ZH/xeD9/uFUz6BPhAmZXXdOg9JS3mYOR9SusHM1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CfT8pnRbQq1d6o8dwOPw3VpiClNidYxAbdI+3GuBrQtq//SP2kKHPXsz9Tmkbdv1y
         GrR2uFPupRmCVf2p+bzB53QljK7bxllW/95lCcpfWf68Y36yGCBZHztzqDT4LjFnkN
         fhrYPhB1WaNyfwkz8XPALtiDafxomBqE1ijxevFVhXst1rnhdGt8PVTr2W9ycpCFXC
         VgMzunmv+z+bJW8SNhvV9AK3Hxa1eglFdkwwtARBrRtce9ssVbiZdq+0Diq4ujc2LL
         rRdN2PGyyKAm87t3FR2HFanpXjAijf2tx0m7Dc+kEZ+HmKD8+rYukmlJ0nmPnsXXU/
         r2NYZqjHyXsTw==
Date:   Fri, 23 Jun 2023 12:09:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 05/15] i2c: busses: hix5hd2: Use devm_clk_get_enabled()
Message-ID: <ZJVvPHgspOXXUr60@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-6-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rygZ1TEX1Avc9/js"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-6-andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rygZ1TEX1Avc9/js
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:56:52AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

Applied to for-next, thanks!


--rygZ1TEX1Avc9/js
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVbzwACgkQFA3kzBSg
KbbvHBAAgVu/Z0wEGBADj9zWpR3ELp5WupBMCngq4snxyIm2r1exBqzxXJHUJYiG
/KjZYC5PjC0LRKGTL8mVTCeTCEzAtRSXJWMlkEn0Q7ciuy62vWO79s1LyazCepQp
ix33CbqtHMYueJFX50Eb5SwlNsGBDJbbBM6GtjqvfLNBY95ez4H0Io3h6irbqDCI
lzEj5Vaykv+yfQ5ojH+/GOdyQCOJrC4cT1uho5AsG2hWWRLQAhVFWEk9EM04YXJH
DBjvkGLIIR3hc+9j4naXAOtWA2gSM6VxjTxrh5+oebzTyZpHbCpvhHs+ZHuhFlYO
ejo8y0RpaVGc4LR+UTypSlhS9JXSprnlDBUHr05Ye52va55RsynVfSI4y/eaYARk
cgR7VGOgoFEuwyFvqQMbkWFB0QqQnIz9AmoJhsARDXkzLCZeRWPUweWrAqJGIjaD
8eem0fXnIwDHFyy2/3ZsSprk2LpdqaXFvoaxy7mC402ao4eXnVOLNU+06nrhnZ3z
qEbVkAUlE4J+jcLp760cJ3ea0GNxx8M0RWhsQxGojUbxR7840zIG7DmExGDsRnks
gpb/u5eKE2ZMJMCdApuo2y5jIfQyUaRjxQZ4zdwirr1gwvGbo17uHmVAD99sdPu0
DSWWqzD9V9Wz8NJtZlS/Vf69pbYIb8OwkPXHZ3Mt8abf3aGaGis=
=GblK
-----END PGP SIGNATURE-----

--rygZ1TEX1Avc9/js--
