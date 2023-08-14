Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38CE177BCC8
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbjHNPPZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbjHNPPG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:15:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C831BE7
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 08:14:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CB72B6562D
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 15:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE040C433C8;
        Mon, 14 Aug 2023 15:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692026077;
        bh=PG6FtD1ip+pZiry2bEeVhermxO5kKOn73yucbpsIIp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aVDJxDqL7+401wcZju/POHlqg9F9YqVMYGW5xd+DUPLFFjkDUSWm8Bi/xD1l9fYdn
         NB2Dt3dy2dq6v0I3Qy2zszNUqovD0H5xuP5OcrG/PFpzpFzteCK91W11xc1tApeZMN
         yJaeyrBZs855MlSQ9NJz9EjQsKIrB/N5Ml8Xj/tNPQK6/0txdSsMVk+GdIpGC3ZLKG
         LRj8js/aCi1jldCTxN8sfNsb1YrBvRLwKJuJvR99vmCxsaMnaSFi3F7yh7KVu7wN31
         1U8aCP2m7SzxNPofg7eSTijvDvQ83ZXnUVXswS6ZNtLB8uBmh6o5qHL+uYkUqmtAxb
         k4UuK0TNa7caQ==
Date:   Mon, 14 Aug 2023 17:14:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     pierre-yves.mordret@foss.st.com, alain.volmat@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] i2c: stm32: fix the return value handle for
 platform_get_irq()
Message-ID: <ZNpE2g9682EmYPa3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, pierre-yves.mordret@foss.st.com,
        alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Ruan Jinjie <ruanjinjie@huawei.com>
References: <20230731112755.1943630-1-ruanjinjie@huawei.com>
 <169119887102.1781235.17733733758389845864.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9JuskXm4Fm5kE6Gm"
Content-Disposition: inline
In-Reply-To: <169119887102.1781235.17733733758389845864.b4-ty@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9JuskXm4Fm5kE6Gm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 05, 2023 at 03:29:12AM +0200, Andi Shyti wrote:
> Hi
>=20
> On Mon, 31 Jul 2023 19:27:55 +0800, Ruan Jinjie wrote:
> > There is no possible for platform_get_irq() to return 0,
> > and the return value of platform_get_irq() is more sensible
> > to show the error reason.
> >=20
> >=20

Applied to for-next (via Andi's branch), thanks!


--9JuskXm4Fm5kE6Gm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaRNoACgkQFA3kzBSg
KbZxPg//cstfDoCoeK3xgIuYxr57m0cxTCegkyg7J6+tO9hhH/P4ato9olYv3PnU
+lEPi5ajeqSVH66PUlh90WfJByukSOSFsavghRphoDd97G0FhPE6kEMwsNADJJt2
M8Bw/6IGhEgJNvP40ubaqiYHhijynPCO+NCZxAya8onaY0DXTBH7PztcL6IT3r+S
Z8Dek67bQ+WyDsroN1ci9LVD7Dr3maoqZOqnRHUJfa6jyglM/KcX0DWpSAMjhbJ2
WLWqClq/UPC6ASylVZnE96mRpj9kby0D+moJQ/SNHisv0GMYGajYSF9yMT48Dk7u
P4/9pusNYTEF8xVzyn57yFXCn19AvyCF95gBkB47uYyhw11FYoChCysUBqdo8P/m
y6fcoQi/Kd0sqC2WxKIeDUwKllhfozgf3uZILRZwlAVduuGFbDNEUBYC2TYy7xbX
N0GEUnW/AoQsDiiG5Shz/IzpURC4enEzo3xYJTyCfJ/AESHFSx0Fl0qxdQwShhYE
j06+QPHVDIDihV9fyDBwXjVgZlm8dEYocXNR4UCHcmvqo/gL6Gx3XAA6JbxiTEWJ
EbdV2ckFohH7s5/nPKHJ1NzC7Zl+7J78hBMM2mBgEXT8H37YJw7F+R0rGFebk3Il
7VcssKFMMHiEuZO5eqpV9Y60jku05aUn+uS8nT0iWzyyuAD8gf0=
=ySOT
-----END PGP SIGNATURE-----

--9JuskXm4Fm5kE6Gm--
