Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC3674DD8BF
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Mar 2022 12:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235616AbiCRLLI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Mar 2022 07:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234829AbiCRLLH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Mar 2022 07:11:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4667A129247
        for <linux-i2c@vger.kernel.org>; Fri, 18 Mar 2022 04:09:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C0E0CB81E99
        for <linux-i2c@vger.kernel.org>; Fri, 18 Mar 2022 11:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90687C340E8;
        Fri, 18 Mar 2022 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647601786;
        bh=SXnERjf7sMUEmSDOYADqk0NehLbz+bFri+b2as9Ucgc=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=LqEW2LGUWnpy0gIOVQNtrp1vB9raUEBE3dL18K3pYUsuMrFziJ36/rfWcTJmwH7pM
         C7WOUzLXJAeDx0aepr+CqylLr5ZPMw6EAkr2oT9EfooIYJ/sa/q8eq/HLnQPFTsM8r
         MqctyMaPVQg2qZyQLzXTs0hSvZVfXWJzHlShcBRwR8FMuF+z4QeV2ZOvQQ6VPmXVZI
         m8cF9iSYnmkU8AK8/vmx2KMczAfaVAGA5C/Dl903SHYyjJoZ94jfD9X7JTEaSY85NQ
         N+yYfh2u2PzxqUl7lxEz+jUiU/TKkyO1oxqgWLBZe+nu3rVwwl/2/RKPwCuh1PpcAm
         hnXCzZTelw1Gg==
Date:   Fri, 18 Mar 2022 12:09:42 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Boris Lysov <arzamas-16@mail.ee>, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
Subject: Re: [PATCH 0/2] i2c: mediatek: remove mt6577 support
Message-ID: <YjRodtoWRhlNUg14@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Boris Lysov <arzamas-16@mail.ee>, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
References: <20220120185853.24266-1-arzamas-16@mail.ee>
 <Yh45nDwqnLInrzzE@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iBARJ5cjDICW8t1U"
Content-Disposition: inline
In-Reply-To: <Yh45nDwqnLInrzzE@ninjato>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iBARJ5cjDICW8t1U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 04:19:56PM +0100, Wolfram Sang wrote:
> On Thu, Jan 20, 2022 at 09:58:51PM +0300, Boris Lysov wrote:
> > This small patch series removes mt6577 support from the i2c-mt65xx driv=
er and
> > devicectree binding documentation.
> >=20
> > The existing i2c-mt65xx driver relies on DMA since it was first introdu=
ced.
> > mt6577 does not support DMA [1] for I2C and SoC's Generic DMA engine ca=
nnot
> > be used for this purpose, too, which makes this particular driver incom=
patible
> > with mt6577 and other similar SoCs with same I2C IP.
>=20
> Qii Wang, what do you think about this series?

This series makes sense to me. If you do not disagree, Qii Wang, I will
apply it soon. All the best, everyone.

>=20
> >=20
> > [1] see references in
> > https://lists.infradead.org/pipermail/linux-mediatek/2021-October/03033=
3.html
> >=20
> > Boris Lysov (2):
> >   dt-bindings: i2c: i2c-mt65xx: remove compatibility with mt6577
> >   i2c: mediatek: remove compatibility with mt6577
> >=20
> >  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  9 +++---
> >  drivers/i2c/busses/i2c-mt65xx.c               | 28 +++++++++----------
> >  2 files changed, 18 insertions(+), 19 deletions(-)
> >=20
> > --=20
> > 2.20.1
> >=20



--iBARJ5cjDICW8t1U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI0aHUACgkQFA3kzBSg
KbZ60w/9HKOEiLJBPS53guHScO1S1QuOaD1AVgB1GXVELCJGJdPhAnOGyjayIlQD
S5s/yMcHZWZhs2WadOukW1y2YZDMLS5hrhqI5Q9G0vbwRCAsIbiugyxjPOVCZiSZ
PfrgpgTOig8Gnyrx1pWQjwcFRpIhXSVqLITssGFfP4HZjkv9bTaLnPyXqD8/GHN9
NAbi6fT7UAI/gGAnNUAAY+PHv3Ynq62UCRd3p0zM8cSEiJTKvcWIRkmKQqXXG73Z
JXPMsRt6WB2kM6ZPLl1G7gYXjTMPhOE8GyNskqV2SuqdRaxIC2TZqZypnFaKrVSr
wvgY8VG3pyTgCCpbkXq/E7aGxJtfuet4oylCmufdw9PtB9X82fEr0p6980JXWX0/
Z7xy1leutV+H1vwZeD3Rg2+xFV8osYvIx8L8Elh7AlPQ7UIOpD14YoXxA0kYzULR
H3L5zuCLAWE3CFn7X8xYlS/Boj8G6hlVA6e/WlhdzFA9yRbYoIHeEgMOO1P8Gclz
dTd6KhSMSUmyTVF2xlHn2kuMp5+pBQIKAt2xxuEHTuXRdos4sozSrqEmlSBKFi8H
hz2hbGYQqK+20fcSfJEEwKWhVyqVMGQXb+7EzNXRJCzHP53xL1uwKBpZI5aYrd4h
GWfrD4ydDKTKiJ+sm2X4RQvM/2deiZgnkb4h0Iir1FIj7IfbC64=
=PSx7
-----END PGP SIGNATURE-----

--iBARJ5cjDICW8t1U--
