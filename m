Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFF04C8ED4
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 16:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbiCAPUo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 10:20:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiCAPUn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 10:20:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB853980E
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 07:20:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 632E6B81986
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 15:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CC0C340F2;
        Tue,  1 Mar 2022 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646147999;
        bh=6WdPYlRRYto5saZQjAt1aU5OIon76Psy0U/rtvu70N4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CUN8wPn0R5ePSFVEDi7CXzu+mFoVutS8zL840uGDozHncQ3f9NJVnWdB3V2ZCW96Q
         zOhBrBT+3q7v8FNuVS1vxNpJCIhReo3sXEnGi5vlYtVkjoqO4BZURHwYiaMUkpHDND
         m5+L1YjejTUkeWC22opPIbAh9kEUHeR3rI7Jn7LMGvtrFe8EQAaxOKJvvWWfxzSuBs
         /6qkEg8HGxRKTdNbi1f6X1xDKJ/guWC8M/POOsgL0u6adeBdlZBfv+q5NcDEBmhHEz
         swbZ93vgZex9QCapkMFETOPBBXoNPp3bQvWTjX5ApzAC1zS0EeHQZQs4R5tCZT5Zmi
         T6226jrkbqYig==
Date:   Tue, 1 Mar 2022 16:19:56 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Boris Lysov <arzamas-16@mail.ee>
Cc:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
Subject: Re: [PATCH 0/2] i2c: mediatek: remove mt6577 support
Message-ID: <Yh45nDwqnLInrzzE@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Boris Lysov <arzamas-16@mail.ee>, linux-i2c@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, qii.wang@mediatek.com
References: <20220120185853.24266-1-arzamas-16@mail.ee>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ipGfr5olEQRqqROr"
Content-Disposition: inline
In-Reply-To: <20220120185853.24266-1-arzamas-16@mail.ee>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ipGfr5olEQRqqROr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 20, 2022 at 09:58:51PM +0300, Boris Lysov wrote:
> This small patch series removes mt6577 support from the i2c-mt65xx driver=
 and
> devicectree binding documentation.
>=20
> The existing i2c-mt65xx driver relies on DMA since it was first introduce=
d.
> mt6577 does not support DMA [1] for I2C and SoC's Generic DMA engine cann=
ot
> be used for this purpose, too, which makes this particular driver incompa=
tible
> with mt6577 and other similar SoCs with same I2C IP.

Qii Wang, what do you think about this series?

>=20
> [1] see references in
> https://lists.infradead.org/pipermail/linux-mediatek/2021-October/030333.=
html
>=20
> Boris Lysov (2):
>   dt-bindings: i2c: i2c-mt65xx: remove compatibility with mt6577
>   i2c: mediatek: remove compatibility with mt6577
>=20
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  9 +++---
>  drivers/i2c/busses/i2c-mt65xx.c               | 28 +++++++++----------
>  2 files changed, 18 insertions(+), 19 deletions(-)
>=20
> --=20
> 2.20.1
>=20

--ipGfr5olEQRqqROr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeOZsACgkQFA3kzBSg
KbYnbA//RaP6PPZwNSxx0W0QIDttAVjKfk8/PHBn1Dhjn+AoD1y8UTnw7R9wlxDd
dyyaT32xrfpRfMkgrZNTcl9+S0qcAVCpjsAvVZ5ZHw/3MEdlCdLjEos/zcOHrEoi
6Y8T4m0DbPYlgmIlQ/3KBTswT5IPkWxSzx5yIlC1/QrVS360xqE6e+6GNZDnbc+X
v/CmTZcHcpqiEcOiZRbXw/REV7FQWzK/LiA5DqKxRBBeem0XJhLO1lJXxx5ja+Z4
rKnZL0b9iCkag3WhJ9lT2j6EGAVr/zT011VR4h3IM5sA4TyhfMKULuv3V6W50Ybx
ITlnhf4C19v2MRiFyo+rOCUwZyToRR7PD/W9duK4Mwntx38c3IwJFOTo59ukUlQe
6RgA6VkRy5JbII7Mpzdk1cAuhxmlaUkWuL9CgHpkJ7UnX1VR1kY+aq9sR8QlrXHQ
JRYfmxLdrDP75Bjg1X3Ny5UcHcHyGcI6a45y+qXufm64k6ikl55kPVoZxYwPpLsF
q4cebFNoM+lXf2xT0LL+q1wLMABtQajMETit9Y809QmTg2oqSOFy8TRaGB3z2qS+
g3oa6jVRdodKrWDheJL1GvPNAQ5xItlUSilrQziPSpzX98EG2+bFSz5HBwem6EnW
5NqkNBjjSYRp/OoS/Mx7bVf7t8nENiw5UKmqNE7jOqf8MzzYw9E=
=05Mr
-----END PGP SIGNATURE-----

--ipGfr5olEQRqqROr--
