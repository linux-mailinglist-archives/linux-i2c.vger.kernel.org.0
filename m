Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4B3452FAA6
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 12:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235863AbiEUKY3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 06:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbiEUKY0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 06:24:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C0E53B58;
        Sat, 21 May 2022 03:24:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A1EA6B81B22;
        Sat, 21 May 2022 10:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937A4C385A9;
        Sat, 21 May 2022 10:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653128660;
        bh=aQ66ppQ61E71sBFPrUxFfvV2qUpYZYEcuTJAKUG3/QU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AY+09pKT65P2pPSdS3VAfGddTMbpF/wFn9/KqlXrneEKNqbFZRY44lI5pUmqmleY5
         UYgKcKRWWgorhTduIw0Ol3Tey50HhqiJUm9HL71TkFgMORRbjwgjDd2d1JJobHGl5w
         9nXOzj4KWnDEKldhqtBBgF6X+fFaZ2PruRuwkRoH1gg6AgNv//w1f2Iay8ftg8TLdc
         gsijrQdMiZnoM34Y+I80MSYd3FiXQE/8ht7+heIARr1wOJXMt27EUmQh17ayCCRF7B
         zUWZAeZS7JXjSSpIQw4/z18rP0tEpFcDEVBbseWiC5Am0eV645QLdRSFoWRPP/LLrr
         5h9/fj/k+w0gA==
Date:   Sat, 21 May 2022 12:24:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Alifer Moraes <alifer.m@variscite.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        eran.m@variscite.com, festevam@gmail.com, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux@rempel-privat.de, pierluigi.p@variscite.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org,
        gaopan <b54642@freescale.com>,
        Fugang Duan <B38611@freescale.com>,
        Vipul Kumar <vipul_kumar@mentor.com>
Subject: Re: (EXT) [PATCH] i2c: imx: add irqf_no_suspend
Message-ID: <Yoi90G5cphagcxpp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Alifer Moraes <alifer.m@variscite.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        eran.m@variscite.com, festevam@gmail.com, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux@rempel-privat.de, pierluigi.p@variscite.com,
        s.hauer@pengutronix.de, shawnguo@kernel.org,
        gaopan <b54642@freescale.com>, Fugang Duan <B38611@freescale.com>,
        Vipul Kumar <vipul_kumar@mentor.com>
References: <20220307143630.28697-1-alifer.m@variscite.com>
 <3676803.kQq0lBPeGt@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bW5lVs4zqF9WjfiD"
Content-Disposition: inline
In-Reply-To: <3676803.kQq0lBPeGt@steina-w>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bW5lVs4zqF9WjfiD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi everyone,

> > The i2c irq is masked when pcie starts a i2c transfer process
> > during noirq suspend stage. As a result, i2c transfer fails.
> > To solve the problem, IRQF_NO_SUSPEND is added to i2c bus.
> >=20
> > Signed-off-by: Gao Pan <b54642@freescale.com>
> > Signed-off-by: Fugang Duan <B38611@freescale.com>
> > Signed-off-by: Vipul Kumar <vipul_kumar@mentor.com>

The SoB from Alifer Moraes is missing, too.

> > goto rpm_disable;
> >=20
> >  	/* Request IRQ */
> > -	ret =3D request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
> > +	ret =3D request_threaded_irq(irq, i2c_imx_isr, NULL,
> > +				   IRQF_SHARED | IRQF_NO_SUSPEND,
> >  				   pdev->name, i2c_imx);
> >  	if (ret) {
> >  		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
>=20
>=20
> I stumbled across Documentation/power/suspend-and-interrupts.rst which st=
ates:
> > For this reason, using IRQF_NO_SUSPEND and IRQF_SHARED at the
> > same time should be avoided.
> Given this IMHO at least a comment should be inserted why this is fine. I=
 dont=20
> have a full picture about the situation, but to me it seems there is a=20
> reference missing, or why/how does some PCIe start some I2C transfer when=
 the
> controller is suspended already? Do I miss something?

Thank you for this comment, Alexander. I second you, this needs
explanation.

Happy hacking,

   Wolfram


--bW5lVs4zqF9WjfiD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIvcwACgkQFA3kzBSg
KbYBVw//eUEuyxhP5NHyCEWeN7/A9Rbd45Wch8anz2ZxTHwrQ/d5jocPR0ZZjb7H
pGhesAIMaw+LH88Bhw49U8TpbjKNRUwB8J9uaREwtI8X7rlmx8iHLqMadis83HPM
RZblDYVbe+69+EAKHfKu3WrzMWhGc+tO+hinRPaxCY26h1isuQPaELPBfTyuqiJ5
NHYfDhVV/qZtMYZI8xfEf8UAN/wGYaVL4Zhputw/XL5ZjCAuczavsInFdwzkzRyX
JlRb+VXvJAqI5CAz6AYGuaWlMO7hZB81fpGm4+5B6UVPQA6jWl9e9s/L7sVZ1Zjs
cJYjL3BD3/j0XQArEoMhySZAfs2KNeoXHWnc0zVas1lHHh4HwbEWLFRrK/sv5Wkz
KkR1mMiLjlFsmxHwFIh+eWN0KDM8pTWCYEaiiCuYaQfeQH6RTE9Ju1l/+tb03mu7
dPOK6S9Vl+nJ6qYGAS/HDj9nq6GQIX1i3T/bkYvLYE1/lK81AJt/7TuQdV7ulmwF
jQHd5hpFjh8Bx25oyaK3kqQeCV6PUVtqdxoNCPffqH9BJwRWPdy275ucpZR9+7p9
ysOhQQ+HDc3kXAVgpWE1AJgj95w/O7WVSpf7D5zwfpjiRyHaNp8qTB1IbcSC6Ty4
frxbSqyQa4wbGBJfcsiuAe8linmZkmoZfCa3+Sh0vggMmpBM9Pg=
=CxIu
-----END PGP SIGNATURE-----

--bW5lVs4zqF9WjfiD--
