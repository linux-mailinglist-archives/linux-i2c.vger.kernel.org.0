Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5D052716A
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 15:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbiENNxh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 09:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232766AbiENNxf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 09:53:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63865338B4
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 06:53:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F113760EA8
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 13:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4D1C340EE;
        Sat, 14 May 2022 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652536413;
        bh=Nq/MaRCQ3W+pxPAGCxi49eW/fTRMnJF9JKv2BcM03r4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cXjyX1MgQpPyKhn1jAPg1Sb/7Vjtoy4bEusPIq0B/Mj+8jMhMVd9Ul3opSv/q87kY
         23nvTfaZKxVne8zs7ePrIPShjuyTdYyazEdLE+GiyeG1W5FFUvPsPxEtkiD+xfhAcC
         Sowpd2RHjSzm8lZHzTMc1WhMiIrxyBxDo8t9aRJDvzGtDFPQ9CHooZ3a6fJoTpCcz0
         Fge+dJeoMOycBiCIoz/Idwaca9oCi7Dv7UXKqEHdJW2VUp/eU9rVhf7q6kJ0cuI6eN
         bQfz3nywm2ZS0DvJk4oZG0z7PT1PwdmOLVFLtjchA/r2yiDtPZThsep5EiA7BBqYky
         JnL47QKTcB2mQ==
Date:   Sat, 14 May 2022 15:53:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        david kerns <david.t.kerns@gmail.com>
Subject: Re: [PATCH v2 2/2] i2c-tools: Implement and document option -h
Message-ID: <Yn+0WWlhYnyKth0U@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        david kerns <david.t.kerns@gmail.com>
References: <20220509110326.53e4b669@endymion.delvare>
 <20220509110844.7a8078cb@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A94XZtNEXkuMb5TK"
Content-Disposition: inline
In-Reply-To: <20220509110844.7a8078cb@endymion.delvare>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--A94XZtNEXkuMb5TK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 11:08:44AM +0200, Jean Delvare wrote:
> Add an option -h to display the help of the tools. This is a common
> practice so users may expect it to work.
>=20
> Based on a preliminary patch from David Kerns.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--A94XZtNEXkuMb5TK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ/tFkACgkQFA3kzBSg
KbafVw/+KUcr/1XR7ARbCBkJj0ArZdrsLteS/WM7RagSgtzNgBe4Eh22wcmyP3/J
foh0nOs72ENGxOZq0a7WSBZu6iiUo2JfsI8ycbsibhnjPI3BNDMbDgyjnIAu1Hn0
2yb3ojnv5AJfcYTagpYrpT4KHYqaiNd/CoG8P9WZ1r+HEdtNj0Od/9qZNVwnF/BP
/S3inso6nuHb2PQ5zzge9mpYpAaOO42BxLscCzLNR14Q395kllOxPtfcqFIDldMx
szaIoVRIBkasuKVABMm2eSaoCgQkxoUmmvcFiFj01fSBiMkKAW3MaDgfE2JDpCK9
bDM4ZCS7wK2v6OQ5MN4NSEzXcHAw+B2ZMnfpn2ZBZh/Ep/eTdt1QsnTclZETvz2R
APJJ/UEbUQOe4ii3um2QfWIIgVfNh6P+nxbs5yCovP/sX3MrPry5GRcFlizZVaLB
iK/8q42U1RWR2blPj7MxUJApyBS8Yy5SGBRJRN1mca0khSj7x0fcdkOxGPruMths
gssu3OOHr+AMMASfFbm2a4MWiQ+6urW7ZnZRgK71RACSlwTsum4ifw1yBRwM4LvM
+B+d9kIyw7nLwWSyvZ8UVWj539HaCMMnh5LKMGYxZ6wXrAiKKK2Wrw0sMlTQhuM0
2gyo/YE7RSMpw2OqIo/u6Il3bLZNY3Ij2QGh1UGijoIu8V/vzzo=
=usgT
-----END PGP SIGNATURE-----

--A94XZtNEXkuMb5TK--
