Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62CE173B2B6
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 10:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjFWI1X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 04:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjFWI1W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 04:27:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1B2118;
        Fri, 23 Jun 2023 01:27:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CFCBB61985;
        Fri, 23 Jun 2023 08:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90171C433C0;
        Fri, 23 Jun 2023 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687508840;
        bh=XiH/19E1f171HZKQ6+6WsMpl77gXp8EuobKEyetCUro=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=bvcjRD+zcGyykIwNgKEIaoPjQ9+Nx70cCyVsgNainVK/SqQXmBiRZn+Z6FdPZnq+v
         MQxBfXcp8JnUyXR/Qc03x8rDowv1D3/pCiRo8guStBLfnOUWeTqKlFGlU/UHzi6oc3
         NxzeFqrynNNxmqRU5EFHezQ8+o8yXvUMPM7QzH0mr3rdtE8f/wGg8k8fjVtjx6f4ys
         Y8Hpx+a7R5SI9JJxiuQUkqeD080L2HSsDTVe1fX78gxWvHmudVmYsNLSKpK+aaePEz
         4u+BeHN1jqttZWk5K39y/qzwS8B/jsagSEpkegbj8ojKLRBjItitFqCpuXexbHvEr2
         KYt2WByOdPjYA==
Date:   Fri, 23 Jun 2023 10:27:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andrew Davis <afd@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: davinci: Use platform table macro over
 module_alias
Message-ID: <ZJVXZKKXHO/yBcQa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Andrew Davis <afd@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230515175042.495377-1-afd@ti.com>
 <ZIBOtodqqGCH7ztr@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qpIDU/Oy12GVk5RI"
Content-Disposition: inline
In-Reply-To: <ZIBOtodqqGCH7ztr@shikoro>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qpIDU/Oy12GVk5RI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2023 at 11:32:38AM +0200, Wolfram Sang wrote:
> Hi Andrew,
>=20
> On Mon, May 15, 2023 at 12:50:41PM -0500, Andrew Davis wrote:
> > Generates the same platform module alias. More standard usage.
> >=20
> > Signed-off-by: Andrew Davis <afd@ti.com>
>=20
> Could you kindly rebase this to my i2c/for-mergewindow branch? It seems
> it conflicts with the "callback returning void" conversion.

I did this now and applied to for-next, thanks!


--qpIDU/Oy12GVk5RI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVV2MACgkQFA3kzBSg
KbZkghAAgIv4TeP+MLBqF2dJvz694bNaRamlz+sILxcGnHsbLxDkgG3RINqIUinJ
onzcJ1sstC6tEdmTTXJJPsH6LekcAtYjlwRPUodBbDPTpWDJG5CXu28CvZv6Kkrv
lL21AbAQLhiGF2tQdvOwxcf2uHUhDn/BlP5W8GGgaalsgswqSdbkEJOwo48CsYup
EYMXI1VHFEfoHoaD9Bsfb/QP4fipZrn5k5NzZLOgAK+jFeZpLLf+JRkIbFUzF0nP
SzK/e3OSmgg+7TAUSdIZRy1I6pUVeykFcF+QDK14ZbQtZcC6G/t6dTk9M758JNd+
zw4pxMU8OTpNtbIO8u0ZmmZ2QtA4Djb+8HKZ64FfP5lKhgOpYdpMLBZdyhnsWIht
TDtVNqaxc5G7AYef2wGF9VeNryyHHIrHDz0ZFuDGhdr/rAt1zEvHnw4kc1WR96ZV
kBwvceWrqZKCkvQgMLf876Rxt2bJjxRT8lWnVia2x1smrfL7JTT0q3d2ndkFkRaM
niwokhRwWmx578l9XGjFiIQa987Ilx1Okm/giXSDTO+j1BfSSYtyAy8Gabi9aOOY
uAYnzYnRqUdMFV438P9eX91VqWsNjdCguizS/C/0S3qtupkFNROoI2BPUAgsUFH/
k27XqVjJIE8PAiiSnqXiCJVb5SWm5qxL/BHy9Xkw+LYEH7aPuyY=
=5r7/
-----END PGP SIGNATURE-----

--qpIDU/Oy12GVk5RI--
