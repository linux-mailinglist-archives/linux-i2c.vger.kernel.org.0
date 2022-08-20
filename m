Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 923AA59ABCD
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Aug 2022 08:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243357AbiHTGi5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Aug 2022 02:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244085AbiHTGiz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 20 Aug 2022 02:38:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78362B617;
        Fri, 19 Aug 2022 23:38:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4426F60EB0;
        Sat, 20 Aug 2022 06:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12CBC433C1;
        Sat, 20 Aug 2022 06:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660977533;
        bh=yWQYGdavX3/YHEW1Xrz4qrpv1wPvBR2SyfskEFLbsBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SGDH/1f0bwhoeBcZaLnjpPDnZnaC+uy5KZZ3uA+GmIGowsTDptN3vEIce8YnuO27/
         h7ftfQNwen7pTs66SZIa+rkYgslqkSFZdXY22k0Dgh+I2x10gI7rC712Yu8gujLGhN
         r4+9CpTgWlnUu61mPapGrCfT2gHBTLMKxgDa66AAJeodAfVRVs3C6EwwricucxXoU/
         Zoy21mltp//Nc6TPMlSnvTwh+SYckwVkGgyHYggUyE69LxYRNDX9ck0kyXaElDh3Lp
         m+HbVtxsgT3OOe8ZaFqIgKvzKr8DaTJqDlqK6H6tfin4QD+q+GnwgmvIiwuzQwWo4K
         cFruW7cyvnciQ==
Date:   Sat, 20 Aug 2022 08:38:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ismt: Remove useless DMA-32 fallback configuration
Message-ID: <YwCBevK4Bt/cpOPZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org
References: <853d9f9d746864435abf93dfc822fccac5b04f37.1641731339.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+u4Lakz/ul3hd2rx"
Content-Disposition: inline
In-Reply-To: <853d9f9d746864435abf93dfc822fccac5b04f37.1641731339.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+u4Lakz/ul3hd2rx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 09, 2022 at 01:29:45PM +0100, Christophe JAILLET wrote:
> As stated in [1], dma_set_mask() with a 64-bit mask never fails if
> dev->dma_mask is non-NULL.
> So, if it fails, the 32 bits case will also fail for the same reason.
>=20
>=20
> Simplify code and remove some dead code accordingly.
>=20
> [1]: https://lkml.org/lkml/2021/6/7/398
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Sorry, this fell a bit through the cracks.

Applied to for-next now, thanks!


--+u4Lakz/ul3hd2rx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMAgXoACgkQFA3kzBSg
KbYzFQ//UddiOSDkM3eYwJ4nRDG7rE4JgMOWLGFMPd3/RhZuZ6Kqinu8HLPQVXmc
U0223ixlbgtKgfgfkMdsNv6O0AFk/saurWqP/DPhyNIIfbeL2PyUQGhTWQt51etl
sUKKZHP1XG6UsNv1hEsoApNtje/bJ4JSJA8pbt7BOHzZ7pe63m9o6pwct4kPyRvJ
rraA1/Us22BEd3rjo/athy4OcKMk4pB5KPRWnSmYAoLKavv8EEXTKE3mcxIhzqIl
xSnJXtwyPDnz2Uw0+tlkMZMqFmEymiDPOuR/S4EmeyidRSJPBxhkNjKDODQHsA3F
PytmMgwm4EqQTpNAqZEP2aoY7e604qL2FS1P2cmJOWJ61cUaLYccYvi9zlS+GPgm
spkvnoQbq0ARcqQnXxxgttbjKfE5vTmxfj0STI6wND2+yR9bZE3850VB1zsZYj8j
z2RGkg4evSZl0HdH1hR8JaLNteJJi/qBKXm9zLKo4Rspd2kIHaycvS1PymZuDddL
tCrEXzSw6w02HbW/tKWP57HcyI0MGmRPnQE9SHfoUqL1mtMHVfiI7IMvp6h5vk+x
faPQg2cORdtHoS2Rff3fGUENhvcNV9Rj93dm9eWS3w0Y12YZ6HzEnt+Ulgp0sJ6d
DPiW8Z/Rh72+veXNIlH9+InD1jkWNo5Ft6jWT1IbY2hcFM5oTvQ=
=HhsD
-----END PGP SIGNATURE-----

--+u4Lakz/ul3hd2rx--
