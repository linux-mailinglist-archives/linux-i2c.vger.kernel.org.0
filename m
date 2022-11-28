Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF1063A8EB
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 14:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbiK1NH2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 08:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiK1NH1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 08:07:27 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D3C16585
        for <linux-i2c@vger.kernel.org>; Mon, 28 Nov 2022 05:07:26 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ozdr2-0000BP-Iw; Mon, 28 Nov 2022 14:07:24 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ozdr1-0001Dk-TR; Mon, 28 Nov 2022 14:07:23 +0100
Date:   Mon, 28 Nov 2022 14:07:23 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Michael Riesch <michael.riesch@wolfvision.net>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: cadence: make bus recovery optional
Message-ID: <20221128130723.GA4576@pengutronix.de>
References: <20221023215121.221316-1-m.grzeschik@pengutronix.de>
 <20221114155700.GA18924@pengutronix.de>
 <ec30bbb7-88f4-f24c-c080-d195d91c2b95@wolfvision.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <ec30bbb7-88f4-f24c-c080-d195d91c2b95@wolfvision.net>
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


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Mon, Nov 28, 2022 at 12:58:20PM +0100, Michael Riesch wrote:
>On 11/14/22 16:57, Michael Grzeschik wrote:
>> On Sun, Oct 23, 2022 at 11:51:21PM +0200, Michael Grzeschik wrote:
>>> There is no need for the i2c driver to have functional bus recovery to
>>> probe successfully. We patch this by only adding bus_recovery_info only
>>> if we get usable pinctrl data.
>>
>> Gentle Ping!
>
>Thanks for your efforts. I believe this issue is adressed in a more
>recent patch [0], which seems to be on its way to mainline.
>
>Best regards,
>Michael
>
>
>[0]
>https://lore.kernel.org/lkml/20221128105158.1536551-1-carsten.haitzler@fos=
s.arm.com/

I like mine better. :) I think I have to comment on that. But why did I
not see that one?

However, thanks for the pointer!

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmOEsokACgkQC+njFXoe
LGSSLg/5AR1mEAJs4xiyle0zJCc8yKTTZzeZ9bjPF/FMAul4/TEdHX7ufYTcoCQK
xMc9SFDHnewxiyRwsfJIUuQcmwQt6OQHeIvg99pz8v9P8IIJdwt5Djhi9v2bZit/
h2FfXn6Axm9PKlhimxIf+oodmnlS6V40/UsGmgJoVlz4Xq5aVc0MzxVzgIr9o6Lp
inZHDur6Jy6LOp8EJ3V5iPjM29jmnAfdocuo1zY5hZT9uHf0+RiM/cu67KuoB11E
Xevx6GXjEcZn0c5EoNxdma89YxE7RNHm0mbdtAMfSLNoaKw6717H6tfLWuM1ITtO
xuvk28d1RBnZJdIxj0Kezl+1CEUqHE3tUpm/D60H0aRlSsewBijlvoLItSvX2SyF
k7GkMZDmnPns9IXUWrPdH/YZYCV5X+kvkawZJBkeOMbbHG+3zchjD4s9ifQ85Ul8
lWl6S0BiyDeHxxgASy7svSBHQOi4mTA2u+n4ByJpF/U/acZEzFgY6mjfIsNtKl2p
O+6QyaxL7aK8UvPekZe0OMjPA0uV8qB7f6MPD3cPqlgLoZQpsYmFISEd9wxWtbAi
26UKIlpDKNtXRBiR2v9H7iEx0MRBL7icq3XWfE0jK1MsIT2DOFEP7A/xW73ttqN1
A8mzDy+904DxbyYMLHLEVWqa38N4ExWjO3l909xm9/nzHHrXW1k=
=UBLt
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
