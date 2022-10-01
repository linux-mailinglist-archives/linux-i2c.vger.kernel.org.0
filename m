Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2EE5F2081
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 00:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbiJAW6s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Oct 2022 18:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJAW6r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Oct 2022 18:58:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF9448CA4;
        Sat,  1 Oct 2022 15:58:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A9B3C60C99;
        Sat,  1 Oct 2022 22:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4696AC433D6;
        Sat,  1 Oct 2022 22:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664665126;
        bh=o7YWqw/Mo5stvqpufeA/YNvIiHJPeAzXtXC3JXaz8b8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gOD0QnwX/xMoCUcxfrvmL6YILzAP/6/XD3Go3mA7xICjemK+yzV2O2rFYwbUOBiB2
         +8IGmNVxH9YZamRljGnTzbDaN53JBxIW7bVLTmH4gyb3+uLtOtZkEQZpHZik5jgiI4
         ojgYFgI6TNQ11yYjyv3E1nyDRkzR+tOIkfcK2mRD424r7FRcJTnYLpPFo6QGofwKbd
         qI12vjt6bIM6gXiidvTvXGOlYY7rfH38I+h+umzFONLbriItHRvkk2hBO+1v8DfUtN
         0rWi54HdGmW9O8deBoDHRNgweyU+X9B9U7d3ku6v0jgF9BF09r+hb//7lxZkV21mGa
         O64z9bs0Sp9lg==
Date:   Sun, 2 Oct 2022 00:58:41 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] i2c: acpi: Replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <YzjGIcHWJNUHbRBZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <YzId7dQGWxMyXHEU@work>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rPGdOe8VxySQZ8+L"
Content-Disposition: inline
In-Reply-To: <YzId7dQGWxMyXHEU@work>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rPGdOe8VxySQZ8+L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 04:47:25PM -0500, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
> helper macro.
>=20
> This helper allows for flexible-array members in unions.
>=20
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/218
> Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to for-next, thanks!


--rPGdOe8VxySQZ8+L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM4xiEACgkQFA3kzBSg
KbZashAAiD/oGa/2qSeG0J+X3EtTzNhGut9WafcSLTMZ5qKcTS0jqZlRrVDAGi+k
W+R1DVM0cGaX1NKn1dqz7+ebZoUOU0JcQzMyvydCr+Q6VDUpXNTpHY37D5w9Enyn
m00EPdF3HWWZyueJOzDBVNlJoOBflHpHbyW4hDH2bSu/urlwwKFPXY8kWd8CvJLF
fBoSi8aG6sWPoeq4LYvg1D6jc6ml2yIL4nfoGRwaFgFi+NBbrbMFYUe6W4txgjEU
iU+9pZ5BwWDtWxAWDTJaiwv73eECp+hhlb46Gj/PMaHN2Jo3c+byJEKJ/axULqjC
21zTOr3WW6TX1qRkPczIK2FzLf63s0wdVSopUEXe5ghSwda9MJlVlcSDnga4kYdA
aXblRQxs3BmKPFo5dq8xSIAM0m29QVvx8iv6PKJYln7NFiuVsi23KXoRMeUs56g6
x1LKxEVkEorla5zOyHKrq9+bAWbYGXh0TG1c+C+PasU9oHjzKhof3olVSJaEASLZ
mlAxybz+S6vkkiwdUoD6uQNzmA33UNhrtESpBJKKxZme3nHHU/Cb21DgMgqWiC+i
JTLASTIyMYB6DXF7MZdXzYa0MUAXPOMAR5oFUcU0MwOM56M2O/BsyC+0pptlvOFT
+WDLJCfQ/SNUaGcHRY/wSyKvoe6BAzqwV6RB1uqvmkaknLNFbGE=
=qZRv
-----END PGP SIGNATURE-----

--rPGdOe8VxySQZ8+L--
