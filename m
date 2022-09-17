Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1255BB9D5
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 20:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbiIQSMg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 14:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiIQSMf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 14:12:35 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40642B63F
        for <linux-i2c@vger.kernel.org>; Sat, 17 Sep 2022 11:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ncGt1LTVtAiHuIA3Qj7pf2ExiiO2
        c78wC2THV2C0NAM=; b=WBoN9EBEAwdzAXtnIz3AthJ6BhbozrnW8Kykym4hG55N
        mtk1s5pYhutqb5Tn3//Yqa12hlS/YV1ck0zj9nwtQ8STOeMFzfgHmCqu/DP4ziAt
        g3B2LVwpibXMF82CJIV9TPu8zDox7MR6S6fNFctUisG5Wf6yYdKumr5FjrlSLTo=
Received: (qmail 3855586 invoked from network); 17 Sep 2022 20:12:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2022 20:12:33 +0200
X-UD-Smtp-Session: l3s3148p1@ircabOPogqy5aIoe
Date:   Sat, 17 Sep 2022 20:12:32 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v3 3/9] i2c-mlxbf.c: incorrect base address passed during
 io write
Message-ID: <YyYOEE/rDhEEMIhJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
References: <20220908173544.32615-1-asmaa@nvidia.com>
 <20220908173544.32615-4-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HvwZTOvVTqcFKdCt"
Content-Disposition: inline
In-Reply-To: <20220908173544.32615-4-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HvwZTOvVTqcFKdCt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2022 at 01:35:38PM -0400, Asmaa Mnebhi wrote:
> Correct the base address used during io write.
> This bug had no impact over the overall functionality of the read and wri=
te
> transactions. MLXBF_I2C_CAUSE_OR_CLEAR=3D0x18 so writing to (smbus->io + =
0x18)
> instead of (mst_cause->ioi + 0x18) actually writes to the sc_low_timeout
> register which just sets the timeout value before a read/write aborts.
>=20
> Fixes: b5b5b32081cd206b (i2c: mlxbf: I2C SMBus driver for Mellanox BlueFi=
eld SoC)
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Fixed the prefix in $subject and applied to for-current, thanks!


--HvwZTOvVTqcFKdCt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMmDhAACgkQFA3kzBSg
KbamrA/7BQ/Q2XauJNIys5qP2IZKlKyCbc1MAgB3nQOaSkFi1E/gpZnPvyIfmLoY
GhVy9Oicg50se+T09zAwqhr06X5ejBB5ZdP6LIy7Y4A1mbLdo9npILKltHDSHvi7
k56ggS8FeZQ5NHvQhGNO2SOYJPd7zgl6h6GmQFjWwRSkcRMZ9FnCJnRwej/3F7g5
Gl12AuIs40dRPvtg2CVZokQ4g8JXvYx5ofp8i+T6C8fPiR285OXonThpqC8vu5h2
1CjnZWPW1r8ceN/rv1b6du/mtcN35FtzdYYAiDNu8VVYe2roLvWDFY/qhF1amsIx
5709ddPFtqjog4lEdYQgxQeIXxR/AaoxZsRqR9FKj55uD9egTOc1flbgF3iymCKp
u8wkwzxuz92ixOMXI64bRP2DDJeeI9zcLGMGdPh0JEHVAngf553qJ0CK6f+S/Xiy
DE/bJ2fRK/SaGceeIasiduXLNRphME9gjJguNH52Q52eOGmo3iId0M3JmTSbu7Ew
RK0enJM0I0ZNSREgFatYuu1pskKRUYRk04K2k3xPrBBXnM4ihabANU/lSSmcijcU
M4KkvMUB6iP0qLRkQoDhvM2oUgnq2uPx0ecFhrEuGsckNiMUAwk8IgUvLg0q3msl
dMcFA+Acj70z1Q4J+aQ+XeDm3Z3DELMiP1HimThFZbHE8tc1oeU=
=oqK2
-----END PGP SIGNATURE-----

--HvwZTOvVTqcFKdCt--
