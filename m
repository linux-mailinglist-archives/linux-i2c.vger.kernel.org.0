Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15B0277BC5D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjHNPFn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232558AbjHNPF0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:05:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239EDE6A;
        Mon, 14 Aug 2023 08:05:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B727F611FE;
        Mon, 14 Aug 2023 15:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA324C433C8;
        Mon, 14 Aug 2023 15:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692025525;
        bh=4p3z9h6V5+vZPZBXXP6SecTUBOk6jE8UP8wSMjIbjXg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bTdyAgCI6GA7kv+piDLHBOi/CNISNFWEyAk0wvmVFbkJ8OQLGGTtymT0ly5Lzg0EQ
         l5RxrQtejWK9MbeswBJuFSruueo6p2iqo9Mx/IamnpgLqtro49at1gMoUlIOtx6c5U
         v7FIdzCrsFSbofDCY2UDjD2uGMIdquCdwMXUKJQ20y5tDUsl+m+PJRmwZp05vDMfU1
         PcJ7gDG/GJTq+gzbFUN1wJ/C4Rnbw9OMDJuyCXThpyX5MUt3LatIJnJ79qXf74Pby2
         AgKp/NCNV4Tb8M3YRXcmTb69+Av+ciA6s0OjrqwAt93mXtSuHJLBy9InNwk2iFrIIB
         60zb5uSgsKpHA==
Date:   Mon, 14 Aug 2023 17:05:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] i2c: s3c2410: Remove redundant dev_err()
Message-ID: <ZNpCsZzVF8WchW+P@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, krzysztof.kozlowski@linaro.org,
        alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, Ruan Jinjie <ruanjinjie@huawei.com>
References: <20230726174226.2480552-1-ruanjinjie@huawei.com>
 <169100562768.1919254.7407243487471763166.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MvsnLAYldP8ONpVl"
Content-Disposition: inline
In-Reply-To: <169100562768.1919254.7407243487471763166.b4-ty@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MvsnLAYldP8ONpVl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 10:10:35PM +0200, Andi Shyti wrote:
> Hi
>=20
> On Wed, 26 Jul 2023 17:42:26 +0000, Ruan Jinjie wrote:
> > There is no need to call the dev_err() function directly to print a cus=
tom
> > message when handling an error from platform_get_irq() function as
> > it is going to display an appropriate error message in case of a failur=
e.
> >=20
> >=20

Applied to for-next (via Andi's branch), thanks!


--MvsnLAYldP8ONpVl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaQrEACgkQFA3kzBSg
Kbaguw/9H0RINXI13sHlLZfgr/kcMN5W2way+cKnaTzxAkLo/n1FDJ7SwrnoRvMb
aaq5mzB0nFQvhTPSi9r4fgbBlebYyz/F55LYlTbsenem4R/b2+D2prugrE8GypAq
TL74CFn889w7HnmpbN+/f6OW21XRXZ3rXiJ/xVKeJLCeStj87a4mZeWn03uqaX66
5/vI/rqlOZTnwmWlE+cDdz3rGIKzB7a/0sZiOJT9a485xMhJazD06GL1xgqJ/mif
hSEEyum2994uKtaXrf15oRLJm0th9u0hoxrGwgKdKJEmotkmEy3SvkH13m2W5kK7
MsXdZXRlwV6JZtZxmXsFw0VgAEcKONpr5HyVA8Dm1Izhae6vlZYEs0f+2G6Jl5Ua
xbjyWOIebXfR7h4mHT5F0fRmri/HbV+GBjAmLpBbcyFhYPrTf1kFEKs7ckd9h/A7
iWOJ6x4nw/m1tnvbe5rb0QVrhSlhFEmYqZGmLeLnfnqSz6EXI7O516cyfpohd/n8
wfIkhRBbqM2HnvtibJiyApNj/x28ygE7hcs1xhUQBEL8RxT+imqgTh6pGt+gku44
kdWlt1hoY80w3m/IhKN/ruCzDrTriNQj9z5X8KpYdIHzgHgcZ66EsVC0i7GMRBWF
8PrA9iFY7feY0L+W+62Hrzobbneabxfu+eNV3UULLsSEkktQcm4=
=WiNN
-----END PGP SIGNATURE-----

--MvsnLAYldP8ONpVl--
