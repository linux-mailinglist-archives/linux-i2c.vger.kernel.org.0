Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4E27891A6
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Aug 2023 00:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjHYWRq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 18:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbjHYWRp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 18:17:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D246C26B0;
        Fri, 25 Aug 2023 15:17:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7105861C18;
        Fri, 25 Aug 2023 22:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50065C433C7;
        Fri, 25 Aug 2023 22:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693001858;
        bh=5wEZ5+WfZTeITiieGOEm/Q/+VkMcT0g/7Bj4HC/ckYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o9pRJqadyLSa3vMvjnXrFX6Jh7JG3T4Mq+9L25/IpT3jNbAEXTsVF6QLNE3GkGlhM
         O/JHv38ldszn6Psoyp1Xywm7FTDmEGnOUjiI6In2VBq+nVpHZKki4UIj8iLJ8iN/CZ
         vdn397irGrUVBQsPet1DPHwGeztSQ44bkOQmOaqZa7SRST272atJcTeyE9tJF6MzdF
         UT5mQ2wBhnEywyv7fVcM/oi9K1ToyXFG6A3Be4F+ly6IxQweI0qD7M1mKHS6YdimUm
         m9mVuUcQGJlqxiQ9kwnGSoQOUHjS9uKm8CHKy7xJlVCt/4Bw3uz5AdhtO4j09ZFBjO
         Uhpdyg8I001Aw==
Date:   Sat, 26 Aug 2023 00:17:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: pxa: fix clang -Wvoid-pointer-to-enum-cast warning
Message-ID: <ZOkofUzv6t9lXyN+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Justin Stitt <justinstitt@google.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230816-void-drivers-i2c-busses-i2c-pxa-v1-1-931634b931ec@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ukkw/O5ByhuWtfMf"
Content-Disposition: inline
In-Reply-To: <20230816-void-drivers-i2c-busses-i2c-pxa-v1-1-931634b931ec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ukkw/O5ByhuWtfMf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Note: I think something like this may be more readable:
> | 	*i2c_types =3D (enum pxa_i2c_types)(uintptr_t)of_id->data;
>=20
> Thoughts on this approach against the one present in this patch?

On the one hand, I think this is more explicit and, thus, more readable.
On the other hand, we still have the loss of precision, between the
first and the second cast. Which gives it a bit of a "let's hide it
somewhat so the compiler will be happy" feeling?


--ukkw/O5ByhuWtfMf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTpKHkACgkQFA3kzBSg
KbacVBAAg+N9jsa8f4e8wE1hq7+1tE7qvQY8yS3OV5Y7Dazv1ZMn15SI14rFd8MK
OwHb/VHDzQVCb60doqviBDM6shh9DXenrzk+kN89WbJEWDcpq5Ne3NDwo2+i/D5Z
GoK1znRWf9EUSxqr6Uf5ueoLy/IVBqNtF380UCMZiMYBO4hx0RvhwjoJ3vIl8Ucu
lPaV28mmsNjDPYIclE9LHLt005Fo8yT6Yr15/YaspGG+bdoTBhH6+DkSpfLNdvM2
YK5cGhVol8b2Tqs9IjiIGR/nNGi0eGaiSw135RkklsbmAJ491itmX2KU4afxNo8r
be5fkSMIkHUDnfrkEv91hZ6pD9PqL3gkxrqsvHwJMrCWIUrxQnKp7dtY10CTozDr
7cqrtrKt92cllY5R7TN/seBSzODjnvXU2yQR1NDRJIlyxIruhPmQe2XU7qm9QphV
JKwUs5Y8tV2J3UPtwbuzBXn/Mdv4WkrKcl17ufyT5KXePlLnhoWWje2so3HfjD9b
0J+26PZjpaWPif8jz9S7R+/aCbICJDGT8m855uLhu0E97y0RpGRF2jItk/WAW1/e
8iJbz/m2+c/dHuCsCU2TQh3ibMz/7h3DijAs21tUnBhwbm8L8ySu9dp7nDpvCSBY
bV5nJQURKg4ih0nFuCkaY720KaPEf958iIP+1+M3Uf1sZ0E1TDw=
=pXsd
-----END PGP SIGNATURE-----

--ukkw/O5ByhuWtfMf--
