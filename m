Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3197AFAD8
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 08:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjI0GSZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 02:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjI0GSO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 02:18:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA681AB;
        Tue, 26 Sep 2023 23:18:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFF7C433C7;
        Wed, 27 Sep 2023 06:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695795488;
        bh=rLLFvcYuIx77qvOIA0NdmeKsrJeYTo4qSHyQzstJC20=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XY57OvzIShA3wIcpA+SeME04GXo9XApWlls6CI2e0DlXfWlz6EfAAVDDwLAbawMnB
         iBAgRqMZxYbUzMmeS3VIIr9KA11Z1kHtGvO6wlsz4RPhNsTWSn/HCG1qLvOKhWdpuP
         0Oh/fRHApqx2ftz6wxdsxalxoszqZbCVlnv8t+ZdWwZZNVE3zoZEJsj10/asUCX8fa
         k/ZtPGdBf/dFxar4BvIX6ZQBOuZAdIJouau+Nyb05PxJuICmK3mLVco/TGTqJaPdjn
         pLwOcm21CtBBVbyySqjs8bQWT4PLpzoktev3JIMa5l9QBarMbhHP3oc5nvE/08wuZM
         4cfCPqybeqDlQ==
Date:   Wed, 27 Sep 2023 08:18:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Jian Zhang <zhangjian.3032@bytedance.com>,
        Tommy Huang <tommy_huang@aspeedtech.com>,
        brendan.higgins@linux.dev, benh@kernel.crashing.org,
        andrew@aj.id.au, zhangjian3032@gmail.com, yulei.sh@bytedance.com,
        xiexinnan@bytedance.com,
        "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [External] Re: [PATCH] i2c: aspeed: Fix i2c bus hang in slave
 read
Message-ID: <ZRPJHQXLb0nPUjwF@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Jian Zhang <zhangjian.3032@bytedance.com>,
        Tommy Huang <tommy_huang@aspeedtech.com>, brendan.higgins@linux.dev,
        benh@kernel.crashing.org, andrew@aj.id.au, zhangjian3032@gmail.com,
        yulei.sh@bytedance.com, xiexinnan@bytedance.com,
        "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20230810072155.3726352-1-zhangjian.3032@bytedance.com>
 <CACPK8XfWKLS_4nBC+NCSw=21iQeaHzBXOROmz9T+S0qZHCBKeg@mail.gmail.com>
 <CA+J-oUtxiQBOT+VM3fbOUM8HL5TX-C4HqtbbT__b4_KsGAJy1w@mail.gmail.com>
 <CACPK8XeO404ok+B+k4U_bdFE3yYebzT-UNcTqcHStJfEnDh6jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T2xE4zoWqm00l66z"
Content-Disposition: inline
In-Reply-To: <CACPK8XeO404ok+B+k4U_bdFE3yYebzT-UNcTqcHStJfEnDh6jg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T2xE4zoWqm00l66z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joel!

> Unfortunately, despite no acks from the maintainers, this patch has
> now been merged and backported to stable.

To explain my reasoning: given the list of unreviewed patches for
aspeed[1], I thought that the driver maintainers were busy or similar.
This happens all the time, so it would be no surprise. Andi is the
driver-comaintainer meanwhile, so an ack from him counts for me as well.

[1] http://patchwork.ozlabs.org/project/linux-i2c/list/?series=&submitter=&state=&q=aspeed&archive=&delegate=

> We should complete the fix, or revert it asap.

Agreed. We can always revert if you guys need more time fixing the issue
properly.

Thanks,

   Wolfram


--T2xE4zoWqm00l66z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUTyRkACgkQFA3kzBSg
KbaRRQ/9ErOFFerb4EgS8SymBAI4TNQtrlHIgkJdwfnE02lEWFQGfo+BC2P2wisD
pax/duJiMFlxRNKkJllc1Q2scJkpcG/5wPyDG5SkWsPyauH813igLa7tyGIrezOp
e6oXRGeBGCqHRun2QQhMFmYvqArlWnolqfzqMepCtPvz7W1fVAecjUquHfVoLSO5
mOzDeKwZJAoDr3WA96Zewd/F7mj/QxMAjrLCBpVADoK3pR+OlcPiCnDmpSRkCI0D
LVYwWawekk0L0w2tWXdE4GMLRVEGjmoBIWz8Q86u7t54BbF3CMptVCFlAqae9lPI
Hkp9Zr/SEDyudnWAYEBQgsBvHt9K0/oPAcNZnFb1iiXtWF24OrQ79GoOx7bHWfdp
+sFggn0rL8sQw9EQrSecmbj2k/7pTsjVHIvR5yZaVcBHzlP1pfodRhMhtsIv6dao
bhD5a2F0Hv/WELJmhaj3pw3SGpBLAxzqy+qw1lcd5YfynfbWmNMegnIfUyxWzLvj
4qp61h6FWVk5wNbjHBPimsn6R/vKq6dSiLB0m5w3PKliwORBHXT0Q+YGE4oSpFSv
MaHh5iAwHNLpaWZ+xqXzishnOROA3sCkg/b1RPABaRsoMAmgfZcm03xljVIjF7Kk
1Ii7+lo743q7kck8b/LZ4IFm4DAC9kQTg+JauONvvezkuL1emRk=
=Cbyl
-----END PGP SIGNATURE-----

--T2xE4zoWqm00l66z--
