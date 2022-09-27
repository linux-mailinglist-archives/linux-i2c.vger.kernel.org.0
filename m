Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 388C85ECD16
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 21:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbiI0Tnl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 15:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbiI0Tnk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 15:43:40 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1449A18D0C0
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 12:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=b/zeestvZxwNyRxnnu4aAtfR6VVh
        FrX4MozegxShA4Q=; b=28gc/lvU+JwfpSYvbDfsIsNevpvYoGmmO0CrBnENGojQ
        HMzRyWsD5XCZWm53MJ0HhZKE/a2r0VjFE8sVEmXPgcXwDx0tjNKwDxHEILXVhbND
        pXitVlcx5HT7P5eXiPFj4niCPNlNbbD2tQFCJC2oDAMRooFeth1n9GQpW5kGHF8=
Received: (qmail 3696017 invoked from network); 27 Sep 2022 21:43:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2022 21:43:37 +0200
X-UD-Smtp-Session: l3s3148p1@1/g23K3pi4kucrEr
Date:   Tue, 27 Sep 2022 21:43:36 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v6 3/5] i2c: i2c-mlxbf: add multi slave functionality
Message-ID: <YzNSaNq/ODRNPVjH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
References: <20220926194507.24786-1-asmaa@nvidia.com>
 <20220926194507.24786-4-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g+oJmWIg4ItnIiE+"
Content-Disposition: inline
In-Reply-To: <20220926194507.24786-4-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--g+oJmWIg4ItnIiE+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 03:45:05PM -0400, Asmaa Mnebhi wrote:
> Support the multi slave functionality which enables the BlueField
> to be registered at up to 16 i2c slave addresses.
>=20
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

Applied to for-next, thanks! BTW, the proper prefix for $subject is
"i2c: mlxbf: "


--g+oJmWIg4ItnIiE+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMzUmgACgkQFA3kzBSg
KbbDog//ejeX6Xd0yHJ+sHCmUvVA7TiwQVm0++m6llsj0L5Nnkqp4AMbxmfXAvSb
Bfoo9iJK4KvKSz3LYKSAOO+hfoHTFGdF8rc8vyEiuPhRpTzeKnaa0Zn7QbcGdW41
Zzg9hBs3ej7t50SrG/UXVqUPc/9OQES/miMJwvztLM8UQAJq8QX+CJ9DHWzOfZme
ilkzkAnLdJKMLAKWKcxuvQAJp/Qg2qvdTLGH6+0ESmN9Df8huWPnq9T0xIlED80E
jwSc7Sqj1xVcjOymRxUyA30XM0mw9eRgWfW1TF5PAQ551ABhdMkpmCE8F2Y4EiZq
P8dtHX2VdVolH3j5idO9DaLIkvVVM+rynfmTRoX0VSnu/L1HdLiNgwAnqs1bBCgA
S2kI/cXWF2Ttprq1JpTcNq/oxKDGVvUSiPVi+QARmEiWQT3PvVhcsSNO22hEjXm4
xpRzpySBqaoTU2tnVaLNP+HALv1umuXY5ZCnoymTzEg09I8y3kLJ4dlXtzZjLpgd
MUSqU0lwJGZUvLamZ98aQ29ug1/lDnWH0HqTa5QrY58/cnxp3rMhDDH38S+u8lDg
y0jBgb+PgDIEwDbbhllWGJ9GFqS/5LjG/dmxIu5o/y77rOAgQ6Y9UM6cs5sXatEU
QhTvwt0SU2UFD9OXUKLwlv4TI1vEmVCXQ4R1XEOPuv8zE4+pS24=
=NUqI
-----END PGP SIGNATURE-----

--g+oJmWIg4ItnIiE+--
