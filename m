Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA41573B436
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 11:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbjFWJ45 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 05:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbjFWJ4z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 05:56:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931151A3
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 02:56:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2014F619DA
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 09:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7018C433C0;
        Fri, 23 Jun 2023 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687514213;
        bh=QuGEsAfsusa+CZHUnefxOR2p5qCENqexDGLiIaRT214=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WqP7UN+tdRCaD/NC7ot5r4hmcWAa07llpcKGvICV7VIr8w5NWD35aQf+y8yQ7vHE5
         bZjZW69FIPmj1NW1HzAtvq7MULs9zQqeQVJ+LMPu+wxqLp10+ZPtCllE9kWaM76cgy
         J7fPYptUS8ucXNtVLpBOv6OdKSHRrhppxUCxyZ8yUnJHop4hYGhrQhB6xISDqMFQwx
         9ZOJ/WMQbP6BqRECXD+8yfZIjz8PBeQtHWW8Lz3A+Cu6f6WsR9kzuF2NPcuzZ+e9OJ
         hH5EydlUGaz/zgsYW39+KO+Zi8stAWdpdEOwbi1DmqhjWL2WD1IfEpU5UVNTyd749N
         gEh4eM62C9YQA==
Date:   Fri, 23 Jun 2023 11:56:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH 10/15] i2c: busses: pasemi-platform: Use
 devm_clk_get_enabled()
Message-ID: <ZJVsYp1UM+ZpS2Lj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-11-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7iHLr/T5qdbU17cd"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-11-andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7iHLr/T5qdbU17cd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:56:57AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Sven Peter <sven@svenpeter.dev>
> Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Applied to for-next, thanks!


--7iHLr/T5qdbU17cd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVbGEACgkQFA3kzBSg
KbZvaA//WR1ot0kJggqnKRIBdMcEqlOLa49jl63whG1p+NNKBrsH6H4/GEfR4+qa
UDju2dQVPWn2s0dVp76iBbYZwMtei4AmS1yhTGX7lPHzsVSVrR6d5puyLntwYn1r
4K7ZY0sirI9b4CrH+MyUtAibdNElagnPPVxPWmDXT6WysRZZbJ1dmtaO/2EQxBic
CTVNW/8gDuR+uA+8kcLPG29PKtY32Fos6hT/vB3P4nNXLKX0GpL8QpJUcO5eyknZ
HbLf1S2HbYDjEn1dg+QJT50S2i26bYp2TXqJ7bxZWo/cobIDNjUD6S9p7wTkscV4
0eMMNYFv9+yrNuXS5GNgWZjWfl6rWiJ1L53Asjcdu3rpyEMOEUDVAZDUwPknOz/m
YLqUJz1ZQ9iVgq58s75iH8uMNgf/2JIlhOyFxFUUW19xdChii/f0QeJNDVJQnnlj
4brKl3ulYA8RU3PtjTwBuCO5N/YXkg4itIy6iFWXo5MqEqcwifkV8B1CIhI91Q3m
1zlqNnkPBLnF2oURKGIyj9KcsbNi49QVuuI9sQM3PJxEQBinlIqRPhdPJQe8A6fO
DGfcl/iR5AlE5fmEHvPGhTcGZZBlkSWgGpge3BFCmijfq2cMsWWs2WTgsJP+TnYF
Tt8b8hbvBNlH6pw5Rq+Epz38n8lfKr+qKaT3kqE4M2CuqkR7xkM=
=Ax+O
-----END PGP SIGNATURE-----

--7iHLr/T5qdbU17cd--
