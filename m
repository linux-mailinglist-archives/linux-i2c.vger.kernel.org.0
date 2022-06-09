Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10EED544617
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 10:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241977AbiFIIjD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 04:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242046AbiFIIic (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 04:38:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4530CC5;
        Thu,  9 Jun 2022 01:38:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EFF2CB82C58;
        Thu,  9 Jun 2022 08:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D254DC34114;
        Thu,  9 Jun 2022 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654763909;
        bh=rqdfJh6xPKhl8T+EneX0C8sQ9ZT1h27ePNG036/Imb0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rn8tuogvppo6Sr42DVEuylyvO5K/d5ffaKvWL5+6xzgrjfovejum42P7zcpQQz3FR
         qE5B00wIiNiesDik4Kv4wVqEpKrfKBK2TfqDqkZ2mOagyB8pawxpVXVKJsCygv96Cn
         CC0G33ljHJj41SRY7vvYVqebJjap7+HMyur2V8jh8pE9jAmBUH5JtYR3K+bhZMUl/T
         bIKQCT3oi5mTKDSS3zfnt0Y0sG8mJ14cgUjxhntiN8ZBXEUDmr2Y7S6CUJkt2Ko1JP
         rbP+n55omhXWeNn+pOWpR7o/uLuex9O+kunkxoP02UbGEc8wklLfWkOEb3l0quOJCo
         rfbnPjkQTZ1nw==
Date:   Thu, 9 Jun 2022 10:38:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] i2c: npcm7xx: barco-p50-gpio: Add check for
 platform_driver_register
Message-ID: <YqGxgAHzV7CvtD2c@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220609081409.3582764-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PpyMwTpO/hHIKfHN"
Content-Disposition: inline
In-Reply-To: <20220609081409.3582764-1-jiasheng@iscas.ac.cn>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PpyMwTpO/hHIKfHN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Sorry, that's my fault.
> The title should be "i2c: npcm7xx: Add check for platform_driver_register".
> Need I submit a v2 to change the patch?

Not needed, I already fixed it.


--PpyMwTpO/hHIKfHN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhsX0ACgkQFA3kzBSg
KbZNzBAAtKYEtrKIxNiPg7VFv4K3pDVav17+5g9+noHxUKtfb5O8MTOSwfKWHhis
let+U5P3BTw89Sm+uMb6rKig2uTnjgblwWY+mhnkWVEZqfmiVQqExQKHN9tN9RK2
AdEIm2KrGZQMlDpiiBIT/uo8fltbP3+vfcDz6FhuHNEoYq/nv5oluIlFmz2PtQop
JQDvpF20Xv49PhqDaAO7Lma+mVZpaq/q8WUlqVaIGFEoIaZWQ2HlY+3/d4DxB0Ty
sNapLXz2SLca05mnbKVAeqTuHTx5bI1Emsh2z4AiwoZAEVE96hSch+BRd6+OIsE7
G38VibJk9drZVp/kBWyz/VQUS7ovCPbeKpsAlGOLPvGhZ3ZTOYBoJ7lkx8oY7hwu
bIRyMcD07AFhrJEMrqjy7reycaQgYVTg0K65URDF5pBD28oA3zgqdQQpoNGVtCg2
Q48k1ZySJ1cSxC3UI6tbHWT35k5H/putGMuOSf0hVkcX1tNgZmfq3BgGgFQIP+P/
8WvaYnQWePjrZAdcJvooIaRaTq52x2UhjHbR+lvJDdvY86FZULap6SMH1RYs/ixL
TrdOJXM150ByyiKfE/ASZ8gNmjEF18cuOUQGqqBVTAmPG38LwHIzYihM+iYpHNT6
0CMY6je5CGFE/dj0J7mBNdY2OmEknYAgx+Nt4xeVYycaEYkClvg=
=ZuEt
-----END PGP SIGNATURE-----

--PpyMwTpO/hHIKfHN--
