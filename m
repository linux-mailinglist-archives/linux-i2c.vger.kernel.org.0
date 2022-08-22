Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F15859CB59
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 00:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235467AbiHVWQ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 18:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiHVWQ0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 18:16:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3CA1402EF
        for <linux-i2c@vger.kernel.org>; Mon, 22 Aug 2022 15:16:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 86AA0B81979
        for <linux-i2c@vger.kernel.org>; Mon, 22 Aug 2022 22:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634E1C433D6;
        Mon, 22 Aug 2022 22:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661206582;
        bh=XG3M4llPXILlZEhpupd4aci+OcEY1T0NFojYg7nLabQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EpaJOuEraUkmXhXEzdlkJpVlTMFkUGLVvOJDQoWYDU8WQ3s+X6SQpjc+j3C6W1QYM
         5t5LVmhx95ldXY/6Q71vEGpeOCXEeWfv6hc3uFB/NiTO1LjcXRcbVh+OkgkVT4gXHP
         tx915RkvIZ9HZnnccXBXAFWdrqiiSmcHsy9CaAD/joyIKshwPfeNCdGSYsYnVCpXvz
         Dqeo4UqTTVrokDHcWe0OZo5qyf9CUMVJYae1dL/WP8BKmJoC6b/BTID9eh/HOt5RdW
         lpdQyCFYhJW2IItdT/oTbuWoKUdLXfpqEf85smE6QY4ooYA5I/fdsK2WQhR4o/rNq2
         DvoeC714lgVYw==
Date:   Tue, 23 Aug 2022 00:16:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2] i2c: muxes: Drop obsolete dependency on COMPILE_TEST
Message-ID: <YwQAMvRRnJ88G3vb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>
References: <20220804134545.141f464a@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="P4IflRfR3LqDfglk"
Content-Disposition: inline
In-Reply-To: <20220804134545.141f464a@endymion.delvare>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--P4IflRfR3LqDfglk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 04, 2022 at 01:45:45PM +0200, Jean Delvare wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
>=20
> It is actually better to always build such drivers with OF enabled,
> so that the test builds are closer to how each driver will actually be
> built on its intended target. Building them without OF may not test
> much as the compiler will optimize out potentially large parts of the
> code. In the worst case, this could even pop false positive warnings.
> Dropping COMPILE_TEST here improves the quality of our testing and
> avoids wasting time on non-existent issues.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Peter Rosin <peda@axentia.se>

Applied to for-next, thanks!


--P4IflRfR3LqDfglk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMEADIACgkQFA3kzBSg
KbYrtg/9F3euUkZC+O85UEHeOlDzYfmwwjg/f7joaqfU5ZvzsHdoQCmXkODEYD7u
Mhj4tSCMyZId/Nft0Swp9+QTGuLFbIj59RWxguvlKFYrsKlWkjC0j69BKYjtMWGY
Tfi31hY+txg7Or2f7RoT1LGC+1rcD5Y1j835nQFCUImSjskKt8+rXo2w7OJrVWDT
yJ+vdW4MgQ5f+1ov2polh3nGiGlLPpxpoIsQcikCZ7ECGz9rou/UqUelTEOtglIV
mwsbIy2xLh27V226B6HF5135dfoG2E31xaX2gTXynG0HJLnu44p/n0fr/Ubdv4cv
QXRSZcBiT7R7D8MTuxuK7YN8uynERvOXljOara6csKDBTr6U2UTdVBVt/bpLTiHB
YG3OmMLv9cShwlhz2y6dxyWcp9hL8CliiAwG4fTS7mllQbzHFi7xio8F89rZ6Hf6
utGMbKYj5eCJHdDgQED5vAnmfX+/XYJmS+frSiLHX4xAnDBBT7hkXCXd3UYciDN7
8V8cm2ULkXxTcv9hnKVMC7oqsyoD4mgLEYba1LYDKp/3xXLIlL9L5T4S5jgZP9+u
J3ls1U6m1GEz3IRic8mrLduS3FY4hQ0E5pau5Z1J3GHPKvvuB9JcE7X1BEgWDD4W
dz45RqcNa4DWaKuYP+fZewxa8EfhIslY0huHQmcgSt716IHXE4c=
=lc5t
-----END PGP SIGNATURE-----

--P4IflRfR3LqDfglk--
