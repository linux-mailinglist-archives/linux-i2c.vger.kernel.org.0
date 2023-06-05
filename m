Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55AD97221E5
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 11:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjFEJSI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 05:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjFEJRp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 05:17:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4232E6F;
        Mon,  5 Jun 2023 02:17:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA71761224;
        Mon,  5 Jun 2023 09:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C92C433D2;
        Mon,  5 Jun 2023 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685956649;
        bh=HFuN7ZHrRSEdo3gTrnQf15xc/5r9QIJNaX3GZWmzyQ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=se7ad2hC619nvHSa+FzvkNpAw96OUyOqpjNh2EFzyV0umvzrHysZzzc4i3pteng2k
         6Ing/iKOyJJp3roOqAxP6h9QDek7ThY7P3k3exvZMQiOCI1i+LmCf4Zzmw/m8skM9z
         baLYY2V0rOoJfE6S5AdDBafY5a3JeQ2p2/VXFM1vNxBjxCgzQzmskJLQOM/eW9tqD7
         lCjTmtfxYwEZ5g/2qZMbjPuhU3rMzoOm6LYIGmmHNEzuLkTLGpimcY0FU67aZNsOyu
         x6LDmav2qmE8LXwMFJJc+qeGLTJ8aoPAH6u551IfoH5tqSyXU6ykkNwJVaIo/m+i9k
         /FVIf9mBVZCGQ==
Date:   Mon, 5 Jun 2023 11:17:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        William Zhang <william.zhang@broadcom.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Tyrone Ting <kfting@nuvoton.com>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH RESEND v2 1/3] i2c: rzv2m: Drop extra space
Message-ID: <ZH2oJRLFVrxDMsb7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        William Zhang <william.zhang@broadcom.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Tyrone Ting <kfting@nuvoton.com>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>
References: <20230526135738.348294-1-biju.das.jz@bp.renesas.com>
 <20230526135738.348294-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LI77/prlI2TATS1z"
Content-Disposition: inline
In-Reply-To: <20230526135738.348294-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LI77/prlI2TATS1z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 02:57:36PM +0100, Biju Das wrote:
> Drop extra space from the I2C_RZV2M config help description.
>=20
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--LI77/prlI2TATS1z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9qCAACgkQFA3kzBSg
KbaMvBAAsYv8o5bKZR+Z0rew/1xWBmLzw8Ff6Jv4bfc/MiQPiQpOc5bVpT/NKuLK
9d7gfD3hfYc85LmQZX9dYgEbKuNXI922Xg14cBeFv/tqejLCMRt8PH44ERSe2fm5
XYrWXU3Rj1rO83fdlnIgqt74iO1+bZFDFGO8tgyYCL8pfdUhfsgUHft4EP1dTWEP
xl/gV3E3L1ZFJJPzkwnJBIY5wKefC+Me7+k97/lrdlk/nIU1ndHTs8px4BWbIBk4
PfHgGXCnvfgAc9iPgKzQ/5BW18SmY5e4uxrg94rbMBtlv3+KQCY6ll+EE78xwcfh
LrlYeJRKy2p3+xKKiS0kkGi+LvUFiJDx8limDlvy3Puf69mhEgUrYw2ZrMhokicm
82QBTvsnDI5MQ2mc4Wrjj5Fgnou/f3KtY1z1QBPMZauJ8n6wkrCJj2g2+bUYK2L8
5E+zdQU8wCyzCBR31AEGmNobIY+PXBSWwNANCv4qjSYM50Z/y7ONqm+Y7oFn/xuO
rR4IOXSUn/hDp27AogI4NrAqLlCErtanc4uA5cAelSM3xD9ZnRtNJewhgCqNXdC2
ZQeAhtLA58vE+ZnyRY4A6AQDoD9XTphRJ/SfL7WIFNubnvc5dk+vBbYNs05pRG1E
fN1Zl4792CG4B6X3RvM1vcLL4LHQbeJLD6RVl/CYBlKOJQyLLP4=
=ToqI
-----END PGP SIGNATURE-----

--LI77/prlI2TATS1z--
