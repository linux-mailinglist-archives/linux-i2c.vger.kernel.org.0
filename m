Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7A05ECEEB
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 22:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiI0UrW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 16:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbiI0UrB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 16:47:01 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B176E10250F
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 13:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=OpqkZN95oH3MrlojBpHhaETtqPgp
        K4EmJsLdOh2dBiE=; b=SLEMv0VWXRUGqbjpXiPqkjUvspik77n+BS2MuDtgJO3k
        kBz/1609LLiTzWnVfy9i5O7wINnIRA6N9Y5LqgVwwbmap7363h0EmeRUTWkEmIly
        fYI7IJeAOnRPNBGfRsaPlEXILsdywj5Fa9yIXIb8ZlSm/HgWriTY5msi7izvROM=
Received: (qmail 3716021 invoked from network); 27 Sep 2022 22:46:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2022 22:46:58 +0200
X-UD-Smtp-Session: l3s3148p1@HbnQvq7pzvYucrEr
Date:   Tue, 27 Sep 2022 22:46:58 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v7 2/2] i2c: mlxbf: remove device tree support
Message-ID: <YzNhQmwN6q4cLJyj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
References: <20220927203924.22644-1-asmaa@nvidia.com>
 <20220927203924.22644-3-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3LhKM8uIy4TjGMMv"
Content-Disposition: inline
In-Reply-To: <20220927203924.22644-3-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3LhKM8uIy4TjGMMv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2022 at 04:39:24PM -0400, Asmaa Mnebhi wrote:
> BlueField customers have to use the the BlueField firmware with
> UEFI ACPI tables so there is no need to have device tree
> support in the i2c-mlxbf.c driver. Remove the device tree
> binding documentation as well.
>=20
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>

Applied to for-next, thanks!


--3LhKM8uIy4TjGMMv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMzYUIACgkQFA3kzBSg
KbYAwxAAijG5stUKYSeZ6R105jV6Br5otmQhhEFnWoFC7PxuN5LL1cVhWOZw/kTN
KJkajYA8Ngftrxu1b5VPsXgjWGEkh5useg8f/7sEnG8CDXnQ65AUD+A7xhiVGEFd
u3J1nBQQbpgYgKYUSPKQqWJE9v76hzJUzPf7zLUeh3+RTpSV8mkJXHAO0I0PX6YO
ulaU7/cxffnFBHmfWmGZ66gX+ZseWJS3lgUyEWlOGjVWaaZPRqH7qE4+Wwxk6GLG
3LMjdx7MVbDzmWjdzKL53itGzwUIuKQi2ep1UiN1Wf1MxQzoVHUEd5AsrrbLNVDy
LBFOEiZSiX37y/86Qy8lHeqWRFLLvQDGGMatyBDLVtvL8TuYwxgP/9vYeh1daO0V
7ggnh4thgUZWa4yqSro7rMo6CRoBggrYxtMfqTgPy/I2e4v67W4mTHVp524fyx5X
mz5yVeJd37em7kV2v4IqRUDig2mpYeHaflJn7xID9CIyHRdgYoo3ljlTMeLv7YU2
OnlXNqMSLYGkwlUUfG93xaHJjiZgltrqGKu/ENAP1ABW8SkuIJt4nBE8EICh5sVb
dktpl2Fyn+O+9ud1wKeuIRybEHyRvD2Wj9IN5hZZFODq4QOKe/e7yHS4hKejT8iB
hORTz67QEKH4ThpQM4Dd/HzNASobu6IVFpcK0sRBrgGs1VR6BDQ=
=62og
-----END PGP SIGNATURE-----

--3LhKM8uIy4TjGMMv--
