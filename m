Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F53D51E542
	for <lists+linux-i2c@lfdr.de>; Sat,  7 May 2022 09:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239466AbiEGHko (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 May 2022 03:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235270AbiEGHko (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 May 2022 03:40:44 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B4D51E71
        for <linux-i2c@vger.kernel.org>; Sat,  7 May 2022 00:36:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9C443CE3895
        for <linux-i2c@vger.kernel.org>; Sat,  7 May 2022 07:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDABCC385A9;
        Sat,  7 May 2022 07:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651909014;
        bh=PyksUCvdTF7Gh3/3+KDrTJ7i+V/rnFuNnczAo4Rljv0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JG7ow76lS9PjAeluFePh6t1yp8/LSf99q7QPdoAUvLH/xLKr/mTCD21GxEZ6PXHh+
         21HOQPI9RylIcaMvqqaOojvPlRfX84381GBTST4gz1KKxADTrkEc713TxurnTWNE8Q
         L5+I5QnYimXXhT/rHL1sasdnoIb8lPA7XUAuWoBwa+GrQDgKrSkFrlpS3sKUN0oe+w
         6oPjAIdbWDp44vjbetqrZiKBQh5QVnI2uQFXMfSeHh0/OSOzm91PsmNvx2UX1FQOtF
         /UhHZEg2p7/6KChGANpD6QhvjVEvm/6v+MGHASWZSpKkTwQwsnW8lLfENUuqyegb+O
         kPUZV/zsoB94A==
Date:   Sat, 7 May 2022 09:36:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c-tools: Use getopt
Message-ID: <YnYhkHKGbMTewH11@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <20220506160652.61d61aa6@endymion.delvare>
 <YnU0fTi+Pa91sNyJ@shikoro>
 <20220506183413.703b39dc@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SGaBCGKxRFEKgzzM"
Content-Disposition: inline
In-Reply-To: <20220506183413.703b39dc@endymion.delvare>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SGaBCGKxRFEKgzzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jean,

> I did not want to step on your toes ;-) I'll look into applying the
> same changes to i2ctransfer if possible, no problem.

Thank you, much appreciated! My toes are far away tackling other
problems currently ;)

All the best,

   Wolfram


--SGaBCGKxRFEKgzzM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ2IYwACgkQFA3kzBSg
Kbb+Hg//XRkm7SxvIFqSvq7Eh308lLz8XrtUsSHGIrRX4uajcBf4VIA6AjUCXLwq
WaUMZ/Phgr6FdKFK44mKy/wkpW5zIKDxD6GBQw8n3GyR4eEHZBH3Mo8iX6VvEUBw
SXzB5+8dxruwJJZ4ZYhoyKWHzu3+YaCXaOj8ubiyAHLa2nPkb3IHZRHFoXWacITI
Wg69SBSJydpne92PMj+W2nZ9a/wJFRjZS9Gqxt4dDfXYaglkYsgtFq3PMed2NtWn
2t28en5E44BrZVTkxb4PmuioZV0kBfuc58uWJlLSiKcYJt1t+8VpsCBKjN/CynEt
aLcD34zootFyypPrqs38AzSKuEZrnS4W+BgXmYw3SQwRbEr9AH7kwxzeBlpxO+fI
8FsN8LW0UoevrY6HPMRjIXp4B8McvbNt569mzEG9e61zDQBLelQkLPuNJJAXg3WY
xtDY196DQ8hXdR0gTrB2YA9ehjFM2fKAlOEKSnRnC6GNsTbDzJ8cQkgPW+aenB6a
PTCF1juXmrdq2VlFg25+kzwDcKW/tv9br9/XZu4NoMV3yD2rrIItB9yCWyDmne+/
EiAMmQtMHYKT/wgrhwqhZQEPnqjTyrSlPt1IylcBKp4am/MA7fzMqfq5yy8rQ8iD
nP1Iv2Cab1MUcys83E6MPUw6qqEhCIdsVu2VWZARlIgm1X6b1oM=
=rY7I
-----END PGP SIGNATURE-----

--SGaBCGKxRFEKgzzM--
