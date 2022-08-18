Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26AFA598DF3
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 22:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344682AbiHRUZT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 16:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345949AbiHRUYq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 16:24:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C66D1;
        Thu, 18 Aug 2022 13:24:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D541614B4;
        Thu, 18 Aug 2022 20:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A721C433D6;
        Thu, 18 Aug 2022 20:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660854274;
        bh=5dR4wkiatRCfgkMUQU5NSzIj/Mx1ip8agLcE1372kPM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dor7C/hCDxzXgB2hlucSCOc8Iqqasj4tIGeMB/n/dsgCYqA0T/dhGwPOnhkPTggeq
         gW3pEG4na7dv6xsv4Et53AOXxNHLgJU8RSST1c4nfMtCaJ2ITrxPJj2qwKd2Q6AnWD
         figfpIekeqxhj9j0a1R5nBMqjDAJEydOUhQRQ26Pbq8cAKyu68HZXDoV4W/t4M+H4H
         1ZIA7cPxOVMwq9UXVtPvwId1lvrtjaW8/XkM6jvgM2iZyfGngVJqw4xJAiGMCrKRFL
         vB4or12e1kQtplmirknm7a+nXKdqlG0BohSySkdFk4MFt5PTrZpaJ12d6AeIHILLQ4
         +OGXpnw2GRIag==
Date:   Thu, 18 Aug 2022 22:24:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v1 4/7] i2c-mlxbf.c: incorrect base address passed during
 io write
Message-ID: <Yv6f+zR9qk5vLOmI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
References: <20220816225412.9095-1-asmaa@nvidia.com>
 <20220816225412.9095-5-asmaa@nvidia.com>
 <20220818162728.lnq5y7qzxbdsyexr@the-dreams.de>
 <CH2PR12MB38951132E24E6F1EDCCD18C6D76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
 <CH2PR12MB3895EBE43CB5B23F4E4ECA65D76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pkA68q3wrLjbubGl"
Content-Disposition: inline
In-Reply-To: <CH2PR12MB3895EBE43CB5B23F4E4ECA65D76D9@CH2PR12MB3895.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pkA68q3wrLjbubGl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Thanks for the heads up.

> didn't have any impact on the overall functionality of the read/write tra=
nsactions. Writing to smbus->io + 0x18 (aka  MLXBF_I2C_CAUSE_OR_CLEAR) corr=
esponds to sc_low_timeout register which sets the timeout value before a re=
ad/write transaction aborts.=20

I understand. Could we have the above sentences (or something similar)
in the commit message then?


--pkA68q3wrLjbubGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL+n/YACgkQFA3kzBSg
KbZZoxAAmmN+Jfm4OHY9T1j9ZCsGyQ4O/GLKWOgpsup5AY96oIzP7qV/g/JxpK5F
0hdEvypEuboYN7zyC5JMWWtEO8BMYmrzHhpVuxZdfvJW+gahvoZwDIKpvTXyUIta
8oDOm35gwY5LJrw6WpW0s+pFRHr/ekJj9JVMOJRwgKdHxcFCaOXlkLXCBbLNRI9+
+Yzz048Xy6bj9Py2DIeB653u/7yTq69xZPLnGSfGFMgECjDokouOKmWEt23sLkej
aDGM2KxbI+B0V/NPlLDqSptckU/sChk2HToHXaZqzMsin9bh979k70jwRVFa350B
oFBEia8FdNLziaPD/GKT1xrER8/JE61g0QriE5MxFJnX5VbCLROYBgtBrOl5Zfw0
n+/QqRL94hD7r7XV9XV4jm3zctBeox3E3uNU57TCGFUmOUn1DtBz2Maj13bPY25R
nsxO+/DDVpdqDICiyO+4RQUC6PTHX4DAw4U4b8DMTGJ1O0PPJiUWIK3g7+BzntKV
wFdxMtxWjHCEYvxC5BNZmnDOxR7HjGQ45KwhMQT493Q+SJxL4vbcbGM3BpjMKpTO
Wh0da5d5p7uTO/skzgBo1jLWL76lmvmTqr39/K6GBY6mHW5E9xY4AWsY3yynC8aV
P78hcUzWjMSYgOLpUkWVJM2fq1VGuMU5OkPYeZ63c996TdsQ5vg=
=YqlE
-----END PGP SIGNATURE-----

--pkA68q3wrLjbubGl--
