Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBB963FBB7
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Dec 2022 00:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbiLAXMV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Dec 2022 18:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbiLAXLy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Dec 2022 18:11:54 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C792CC9342;
        Thu,  1 Dec 2022 15:11:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 63022621A3;
        Thu,  1 Dec 2022 23:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E2FC433D6;
        Thu,  1 Dec 2022 23:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669936280;
        bh=AfF/JU379RR4h/QNfLJk97BVEcJidBNpv60Dg4HStxY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LnHzexQRj3Vsp2q/xdwB5o+SICfADhG8Nnw4p2Tim2u8/bgwWTmNYTbEX32bK3ytT
         1gL6dABRBqKeV40+yS8rHeY2v9qVieqgXmYJJZtORl8gDX5cUbmot5Qt1LN/J2aUuO
         41Sn+v6qu+kmrcs3O8ZeNMK4FZ5mUmLY81jZC53FXv+zdsfc/DmSQIVwtkFwOjMkg3
         BiEUKk1NXlySs9SMuJ4aA1yftGKLYH/2XG5IwKdXK4mvE7+1HVsgzoOgW4Uk0TChPA
         D94BOk8j0CdJ3ajJ9SLEgklpKUH8yyd1B75pKLIgdk5RzdgidoBTG96mQFV4FuQfa8
         iZXaSvzE3f7Xg==
Date:   Fri, 2 Dec 2022 00:11:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Clark Wang <xiaoning.wang@nxp.com>, linux@rempel-privat.de,
        kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: add irqf_no_suspend flag
Message-ID: <Y4k0lVMueLEic75K@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Clark Wang <xiaoning.wang@nxp.com>, linux@rempel-privat.de,
        kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221116074431.513214-1-xiaoning.wang@nxp.com>
 <20221116090249.GB12278@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CRLqoNn9W0Z8WNcC"
Content-Disposition: inline
In-Reply-To: <20221116090249.GB12278@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CRLqoNn9W0Z8WNcC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2022 at 10:02:49AM +0100, Oleksij Rempel wrote:
> On Wed, Nov 16, 2022 at 03:44:31PM +0800, Clark Wang wrote:
> > The i2c irq is masked when user starts an i2c transfer process
> > during noirq suspend stage. As a result, i2c transfer fails.
> > To solve the problem, IRQF_NO_SUSPEND is added to i2c bus.
> >=20
> > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
>=20
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

Is this really happening? The driver already implements
master_xfer_atomic, so I'd suspect it gets called instead?


--CRLqoNn9W0Z8WNcC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOJNJUACgkQFA3kzBSg
Kbb/Ww/7BTGyanlfRVUN/404OpqaEADL7FYtBa2VzbrRmR98+l2Qb+4xxiZARQI9
UaylcY3A685lVwDzpQbvD5zHFPIDhGqrDcPvLSd/ZFVhCpeTkVmLB2aMpIjfe60K
fgZqo9FyNA4ogOwaRygqlBGuW41NM40lrt5TIeIoyYSaZ5/4+jwT7JGaIUbFmwwu
bPuAgUPfqzYZrSRgojP3aR+4NaXzDQGpvj7kjqR7c2u3UnDVbW/rMV4rgPQFBLCV
+0NYVMFShHszq4Ghl3AqvjrUFWC4ykoBHEaEEqkZy6Jrl3lo82TfO/AK5cqy2G2N
GUsJxaQ4in08wu4S+LjylRyqQKebv3KPpjyfVk4y5uLJT8gLnTR0k6e61bHvU1lS
3V2r2WU31SaG8yQIOk0zfMJUaII5emLpPRFw+OWWSsRkY9qeg0IjrWVIx3oq+w+h
DwKc5FUiHjtI0GyMGYDLSHT0Vc6Nr3pB83ytCJvDMAwB5CdFsG23MflzaIv92wBn
f0n/hFCWxCbUSS1ahzaRkzfL4gDpmz/mJSgbot2yH6skLrCvMAFp8uhiUsjvJfRK
wKXnz81vBa+mCZKBWw8ApWb4qJF8/JEOWWavLiLYthbWzhZqHxQktTqnn9RJtmwE
mbfcwKOifuytwbI9LacmpxrPwR0nkINCw8kyeaSworEzjcxCSoY=
=pjUR
-----END PGP SIGNATURE-----

--CRLqoNn9W0Z8WNcC--
