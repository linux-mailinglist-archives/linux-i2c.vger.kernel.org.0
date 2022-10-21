Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E78D60756F
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 12:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbiJUKwq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 06:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiJUKwp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 06:52:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E771885A6;
        Fri, 21 Oct 2022 03:52:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A1B0EB82B8F;
        Fri, 21 Oct 2022 10:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC6DC433D6;
        Fri, 21 Oct 2022 10:52:33 +0000 (UTC)
Date:   Fri, 21 Oct 2022 11:52:30 +0100
From:   Mark Brown <broonie@debian.org>
To:     Adam Borowski <kilobyte@angband.pl>
Cc:     linux-kernel@lists.debian.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Brent Lu <brent.lu@intel.com>
Subject: Re: [PATCH 0/6] a pile of randconfig fixes
Message-ID: <Y1J57jJ1+FTG7U9O@sirena.org.uk>
References: <20221020221749.33746-1-kilobyte@angband.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wWcrkmaG6Bl+vyW8"
Content-Disposition: inline
In-Reply-To: <20221020221749.33746-1-kilobyte@angband.pl>
X-Cookie: On the eighth day, God created FORTRAN.
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wWcrkmaG6Bl+vyW8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 21, 2022 at 12:17:49AM +0200, Adam Borowski wrote:

> I've been doing randconfig build tests for quite a while, here's a pile of
> fixes.  I'm not sure what's the best way to submit these: do you folks
> prefer a series like this, or a number of individual submissions?

Individual submissions would cut down on the noise from the enormous CC
list.  If you were going to send as a patch series it should be a single
message per patch as covered in sumbitting-patches.rst.

--wWcrkmaG6Bl+vyW8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNSee4ACgkQJNaLcl1U
h9BDwgf+IkbiCFyXzVrO3F8yBx883iUJM3R8A5LPsrxScBUzS3Nu7PgzWmko3Bfa
wm/rXizNrMQPDqUakrtR8duh+w/eL6Lz3YrZEQEaM2fd8+MayJt9tXB4o/qfcrBc
B3o7lbqL9Hp0yqRKKG8orcvyiJDpOh2Z+zLAYqy+LuFLuiv6kSKu8h7c2vm7DKCw
+wGkRN5blfrYPHGOoU/r6oqjT2qx6BFUsXpnILPw2XRtXlkYv37BLu4rRgZ7qc+D
Afo+DwE5y6d9t9ebOL0UjvgveEysSY3VksxCcjtWru+wN/bjPbET1VFJUrfbMyGf
y+JN6EsaYWeKmGsk5T5pZ5XczMBC+A==
=kG7z
-----END PGP SIGNATURE-----

--wWcrkmaG6Bl+vyW8--
