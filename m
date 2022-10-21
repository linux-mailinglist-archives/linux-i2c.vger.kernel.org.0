Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC3F607045
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 08:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiJUGov (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 02:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiJUGou (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 02:44:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05AC357ED;
        Thu, 20 Oct 2022 23:44:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3C6E861B39;
        Fri, 21 Oct 2022 06:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC4FC433D7;
        Fri, 21 Oct 2022 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666334687;
        bh=dg+igT/kH5vNLile/55ugMghQ6bHOl5tdBoCQSBXYac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AGeMyJeg87UlxSe5k2XIw2g27XDq3ZEoGhJylOgn/Pc+deCE0ymZDPF3pyhTXbf62
         BkfHG3/Jo3vHInZD0+8lFJ/J32KahCu6OAm/wJgPFxd9F/HemwazCjH13UA8hJ60mM
         b7/YE//cHLp3hSWuNDGNIrsZr73GEPOrbsw5jMJf/PXtSzJrG6IggCpuVSgIjAuv7T
         mkRnUX2cWBckGEDpW/KQuEh4jbsZI+7HVNHZJlkU6jCmsTyk4td814k6t0S+O3WWSh
         8xaaW5CBclarLFx8oWJMBlgIHD63a03DVy9s1ojqs8YIrBNztmRJ02YHmW3QFs0F8Q
         AkwK4fKzudFJw==
Date:   Fri, 21 Oct 2022 08:44:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Adam Borowski <kilobyte@angband.pl>
Cc:     linux-kernel@lists.debian.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
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
Message-ID: <Y1I/3KPxSI1voRHh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Adam Borowski <kilobyte@angband.pl>, linux-kernel@lists.debian.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
        Bingbu Cao <bingbu.cao@intel.com>, Dan Scally <djrscally@gmail.com>,
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
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Brent Lu <brent.lu@intel.com>
References: <20221020221749.33746-1-kilobyte@angband.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ASNnxeSggHlth0r3"
Content-Disposition: inline
In-Reply-To: <20221020221749.33746-1-kilobyte@angband.pl>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ASNnxeSggHlth0r3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I've been doing randconfig build tests for quite a while, here's a pile of
> fixes.  I'm not sure what's the best way to submit these: do you folks
> prefer a series like this, or a number of individual submissions?

You sent the one for i2c-mlxbf seperately, which I applied now.


--ASNnxeSggHlth0r3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNSP9wACgkQFA3kzBSg
KbbjSg//Qpjk7lLoKdOzvsdmL0Mq2o5hT22qP9eF8TiQ3pE1B3B9C9AsdWQ7FjOB
ClXU5SlQmHPj//fgEfmr9Vj2bKBssiA4QkjiF/fcjthcBqG2j3tLeQPRmFr6qcd7
a873ogKipCuWcb7wHngTM9a7820xTtzm6AUCGCfWQHKiXjdCWsSdBoSEyHDocLiz
CVpTOsOeH+pC5Sa1WwXdONrrOMoA1Cttpxu8Y/ZCLzyqQ4M+WL5j17g/jMihywZ3
hg4uduAbJ9Oq2gWXAi8JvnNLPYE5RdYjk3d0j4jFxyxSD8DeIOjp1tw/UT6VSoWK
n+ygnkytK+33BTuEoIKKEfl3O5XTYtERfroHf3trO+xaIMKqa06p3+qPM5+2Rnqx
cZ9cfqYqw+vCs/zkbtzWArA81N4O/QBDhNe4ktHyFkChCAN8dJSf0Yx5QM1oY50f
Vkj0kWe6nA34LURe2MazhrLSQP7ht/8WkC1l1efH+2gHOdNBmxsr3fqOvYznCziB
BWT40k8BRRdByRFICeSeS001FW+AUlbpE8q637iYCR8sGyqxJmCCb541W35o2gdT
5ciiIlzkqA3NudtWem09SR8UuBv9wXaiLx8qQXd72b/Na86U8dT3Bc8DKthJFWn6
59ubRiZuumctWs6sE7kZ9aPXpPpci4isfJAhNOCtgJ7+pC+g65E=
=s3Uy
-----END PGP SIGNATURE-----

--ASNnxeSggHlth0r3--
