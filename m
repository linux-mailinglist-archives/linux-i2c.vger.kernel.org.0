Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6F3614AC5
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 13:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiKAMdk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 08:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiKAMdh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 08:33:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1176E3F;
        Tue,  1 Nov 2022 05:33:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A52E0B81C89;
        Tue,  1 Nov 2022 12:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8BFC433D6;
        Tue,  1 Nov 2022 12:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667306013;
        bh=J9nZjVxzwAo9aLCOJoInbpWSUu/a9O4+CyYLzNrtHlI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d3zbb5jq50opDrLP8HUM/vf+fW8EcahO4Wmm8Q0qQBdES060ly0FFFBrMbqZKVNTN
         YL8cGTDxw642fL4S0896UXwOtEC8EP71HW2SY5dGF7dy7rYJ5C3rmYTKwPU1qgL06O
         p0xm1DAqg+o1RcLnxloeGA4EQL4VLkOoLBHm8HJn2H54NIShgxO2TDI1+GBdwsL+u1
         ZSHlBLLIgw8K0Gr8BfpJwSW/FShOkWKZCguwhNEzAvEF1GO6LuuWV/uRIWOXbEUy/L
         9FHE92ofZb1ucx03J0BVld2nNX4NBHepUkD1qInMQbN3Ol+V2EmRWeTDBjRecVt4BE
         KJwobaN8CiGdw==
Date:   Tue, 1 Nov 2022 13:33:29 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Raju Rangoju <Raju.Rangoju@amd.com>
Cc:     syniurge@gmail.com, shyam-sundar.s-k@amd.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        rajesh1.kumar@amd.com,
        Basavaraj Natikar <basavaraj.natikar@amd.com>
Subject: Re: [PATCH] i2c: amd-mp2: use msix/msi if the hardware supports
Message-ID: <Y2ESGbkgfEXsx9es@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Raju Rangoju <Raju.Rangoju@amd.com>, syniurge@gmail.com,
        shyam-sundar.s-k@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, rajesh1.kumar@amd.com,
        Basavaraj Natikar <basavaraj.natikar@amd.com>
References: <20221025181124.421628-1-Raju.Rangoju@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5fEbzoCs5nDslbUQ"
Content-Disposition: inline
In-Reply-To: <20221025181124.421628-1-Raju.Rangoju@amd.com>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5fEbzoCs5nDslbUQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2022 at 11:41:24PM +0530, Raju Rangoju wrote:
> Use msix or msi interrupts if the hardware supports it. Else, fallback to
> legacy interrupts.
>=20
> Fixes: 529766e0a011 ("i2c: Add drivers for the AMD PCIe MP2 I2C controlle=
r")
> Co-developed-by: Basavaraj Natikar <basavaraj.natikar@amd.com>
> Signed-off-by: Basavaraj Natikar <basavaraj.natikar@amd.com>
> Signed-off-by: Raju Rangoju <Raju.Rangoju@amd.com>

Applied to for-next, thanks!


--5fEbzoCs5nDslbUQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhEhkACgkQFA3kzBSg
KbYjEA/+KmaERvUdpZQrXLFENwuXt+r4F8GkoLqlcY3YJnkhEyGt2XBK6kCMF/Gj
SHvfsTVnWBRXNKjdRv60wr4PL/rk9iWeVbnYVORWitQkcJ9qek/yiGkVUe6/gp5t
F9QDz5C0YyAcZLx8TMYpggB4tkWF30P/g7zQ5sW8wRYC8RFe08rMsb3ktcHi24Ng
OaTTkXg8/zL2Sjh0AZr7oaYZqlWjdzPfEG0k2gnHXx0GRHGGAsYHowwi7yo1km9/
uDWTsP+Fd5JKmNP7ic3PdPspyLnMhj/J7YIt/6k/4/nn56tb4cnhT1g4LQMW1Ikf
wYKETdBXoXlMt70urzzghk4McvnAmVHft1ClAg3dJ/LREW9qupgO/6ZLZ1qxRrnw
9wy2HnFMhUEIKjpOmmzxcfIVYabNs1oabhN7JSnCw32Y84miXE7fhobiCk4W/37n
T4ybzvXOARR3eDqkbCge5I2Ol3k9HWNt8rXZfj0vjijpfDJuYU8z+U/k43ZQXqLb
sFaM0j3b5BRhhyGPkzTz0nXsnE7/FBTDQu3ZYb1eE7qc2LyKCulMaBUviM/5lGaY
YmB+ObglX1YnxH27cNcuAQK0VSXgurGaSFOsmPPgoL4mEtYnQ2YfY/9g0geCuvyR
foq5PV+UGiGfGVmk4gh8Ua8yZbO75IO2+Xj/nZHFR3Uh/+mUbxQ=
=5IWg
-----END PGP SIGNATURE-----

--5fEbzoCs5nDslbUQ--
