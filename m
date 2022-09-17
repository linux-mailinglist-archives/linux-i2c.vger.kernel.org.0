Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10D7B5BB9D8
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 20:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiIQSOk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 14:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiIQSOk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 14:14:40 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA52101E3
        for <linux-i2c@vger.kernel.org>; Sat, 17 Sep 2022 11:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=qGtCA6GrIp7QNC+UXHzEAxuLRFr7
        YzHkiSkScSTx7d4=; b=02Egre4/ULmKg2wqIhZjFL4A3U4sCT7/5Zr5tO9WP0kw
        t/ixP2ywMpXLMdV7wTbUltiUxG4wpwbRtvezklS/MwXjCR4K2FKn8m4xRQmu1Dfk
        OhOLX2H+B5aR1cSutAjW8RmQAwOMe2CYK5yg6Fn3AMVuXpywUVY2tNFVVxmmnMI=
Received: (qmail 3856192 invoked from network); 17 Sep 2022 20:14:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2022 20:14:37 +0200
X-UD-Smtp-Session: l3s3148p1@7yZ6c+Pojq+5aIoe
Date:   Sat, 17 Sep 2022 20:14:35 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v3 4/9] i2c-mlxbf: prevent stack overflow in
 mlxbf_i2c_smbus_start_transaction()
Message-ID: <YyYOi5EoKSUKLt5l@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
References: <20220908173544.32615-1-asmaa@nvidia.com>
 <20220908173544.32615-5-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HbfR/25l1tz8oMFa"
Content-Disposition: inline
In-Reply-To: <20220908173544.32615-5-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HbfR/25l1tz8oMFa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2022 at 01:35:39PM -0400, Asmaa Mnebhi wrote:
> memcpy() is called in a loop while 'operation->length' upper bound
> is not checked and 'data_idx' also increments.
>=20
> Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueF=
ield SoC")
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Fixed the prefix in $subject and applied to for-current, thanks!


--HbfR/25l1tz8oMFa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMmDosACgkQFA3kzBSg
KbZUcw//c5l2tzVxzZPey6OksmRVrBrnicCTM5L8GZBZznmd6/A9cM2uTkHhjA/t
+HjaHSK0BJ1CXK7UeWbVGBzMMtdF4QR0IfmEgfZzQk6gwMUfJCqVHvyPyGnUuhVz
z1xAatZlmQLnsarIIvHyMTyXA6Auyt/I7b5Ruj2mzSykeCzWyA86b8aplHXXQhdn
rE23Mm2HwQMrIo6+3Kn+792eBceXyY5MFRmpdXgVJe0A7TdaJXGu8Rh8zh0zdlMg
drzvwmQVDWbW1wQRPBLbVLzPjsMayNCNHzfN0A8SDxF5eOkdS8S9FmpsswAIDCmJ
YbT0UKoDIec4Yh4txrTjqbRhlnypQy/1lJq1blwdogowZBvngzYA8Vz3IMSIPKXs
qDh+iRHOohGZeR9yADOgmUFd+ZPiKK29n02SFSyOXCwOt9aoXZpN/CUhtrBHH+u/
oRR96STlCrj7fslgg84BUCzn8FW83BCzibStsxprYPN8inOc3ve1x7keHRTBo+7+
1pDNf/IN6KMSElvlhzwQeYYDIwy4g01EEOFjm3dSv24YQGvGsS6DsQKuYybg24bm
l7OYn9bdUM9YMlEVTnBIRDXVnFg5ZFotxHo4xc48POb1KEPpBhLdRnFs/2TIypcD
b/5aVvQmpdg4R+yk8o2vvVnlZrm/qtTwlk1wTfQ7gUWFObrMPB0=
=2yYg
-----END PGP SIGNATURE-----

--HbfR/25l1tz8oMFa--
