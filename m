Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B81FB63A966
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 14:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbiK1NYR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 08:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbiK1NYQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 08:24:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E05063CE
        for <linux-i2c@vger.kernel.org>; Mon, 28 Nov 2022 05:24:13 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oze7I-0002aB-8g; Mon, 28 Nov 2022 14:24:12 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oze7G-00022K-HE; Mon, 28 Nov 2022 14:24:10 +0100
Date:   Mon, 28 Nov 2022 14:24:10 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Michael Riesch <michael.riesch@wolfvision.net>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: cadence: make bus recovery optional
Message-ID: <20221128132410.GJ18924@pengutronix.de>
References: <20221023215121.221316-1-m.grzeschik@pengutronix.de>
 <20221114155700.GA18924@pengutronix.de>
 <ec30bbb7-88f4-f24c-c080-d195d91c2b95@wolfvision.net>
 <20221128130723.GA4576@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GlnCQLZWzqLRJED8"
Content-Disposition: inline
In-Reply-To: <20221128130723.GA4576@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GlnCQLZWzqLRJED8
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2022 at 02:07:23PM +0100, Michael Grzeschik wrote:
>On Mon, Nov 28, 2022 at 12:58:20PM +0100, Michael Riesch wrote:
>>On 11/14/22 16:57, Michael Grzeschik wrote:
>>>On Sun, Oct 23, 2022 at 11:51:21PM +0200, Michael Grzeschik wrote:
>>>>There is no need for the i2c driver to have functional bus recovery to
>>>>probe successfully. We patch this by only adding bus_recovery_info only
>>>>if we get usable pinctrl data.
>>>
>>>Gentle Ping!
>>
>>Thanks for your efforts. I believe this issue is adressed in a more
>>recent patch [0], which seems to be on its way to mainline.
>>
>>Best regards,
>>Michael
>>
>>
>>[0]
>>https://lore.kernel.org/lkml/20221128105158.1536551-1-carsten.haitzler@fo=
ss.arm.com/
>
>I like mine better. :) I think I have to comment on that. But why did I
>not see that one?

Ignore my comment. After reviewing again I can say their patch is fine.
Hopefully it get's mainline soon.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--GlnCQLZWzqLRJED8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmOEtngACgkQC+njFXoe
LGRs1Q//RqFV+IYVvhDgzn2/XEOpuCeJlBfssq8UifbwK5PTNSp5Xb+gkWTmSUGW
U1ISmTbpbnGnofrp2DK5V/i7DkZqRM8i9+GL23Kqa6rUA+lsSSM+gHGoI2zXsc+g
UK51q15QoyV0FBmsgwuttuExzhp431bKuGZniZHNlpIsQhVhXTbbu/Qdzf9r7+JO
GwlJc48mdxrrkti0DWr6FTKzP54NelUfEF8lwiV2YSVRP+GvWydLX4aKlio2ArhU
AmRtmz8U1ZEaJIqPQuZsrCWs7oOGjZ9bHe81oAP+h4HauH8mwdiIKZJNa5xiY1yZ
9LuFiWdLZu66j38C4RKb2itNUrS/d4Zd/jiIdTR3X6O1vXPFLwr1s8QjKcfVzFMc
nqGSkq0U1a7T7w+W8uXwbHFawlSP/MBFzguv06yXHKAPWNAKE+PBMA0g/a8oilKy
+qC2v7kozQB86FOYPZXqUInvphItK6PXpoH9bCbEXCslpfGTpiqSSOxRfUcAxRjo
08CJyUP9NgNrK7f5nxOneoRZGy/Xj1sj/+r7fOowuunAny1081Ghqy7fKVThTZmb
lmcAKf0YmTKHA0//kNxtNL0h3qcTYRuDJ+nYlV7fszkQlaeq7utnj4DT9s257tW4
6IszS5sQaPheTIRameRV8bI0dtMcF1wOl5ih+AWBHenwWsTiMm8=
=cAaR
-----END PGP SIGNATURE-----

--GlnCQLZWzqLRJED8--
