Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA5297259F6
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 11:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239202AbjFGJUH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 05:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240043AbjFGJTt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 05:19:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101F31BFF;
        Wed,  7 Jun 2023 02:19:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C56F633C0;
        Wed,  7 Jun 2023 09:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60268C433EF;
        Wed,  7 Jun 2023 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686129584;
        bh=S4G1nZ597PL3D/rZGGTjvxU5gDXhh6TulUbc/bRtc2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gE1ZU8mFHnl2QohSJSZ9/WEljVJZtRETEWe94dURg+MVRpm7wXy4DE7faz1JIZbNT
         OdpD9Uod71Boazwi4S/05LTsIC2VV1VlLb9XaG3eN22k+8eLzGP/1hCqvnPx+BkwHR
         jlppQr5hPTV0irNgw1uOG/jjQOYNkg5q2NJiCBaGW2wGkwn8t2xCl/qIo6z7bDFJxV
         0gskIhwa6S3DRMxMLm0HKOiUjUogyEdun6Yny/SoCLoS0FDo28txBoPQ+tSzqAyoUy
         iXvrW9YICb4CRhxkEkGygN1ejdFTsurH6KFui3u1i4dGUlTDKjlbGgBVU59O9XAgtm
         aFA09NonD8Akg==
Date:   Wed, 7 Jun 2023 11:19:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     carlos.song@nxp.com
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: directly return ISR when detect a NACK
Message-ID: <ZIBLrC6ExKWS1wt4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, carlos.song@nxp.com,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230524024002.1790405-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3TiYRWKQmlIT/5F7"
Content-Disposition: inline
In-Reply-To: <20230524024002.1790405-1-carlos.song@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3TiYRWKQmlIT/5F7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Carlos Song,

> Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> Signed-off-by: Gao Pan <pandy.gao@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

You sent quite some fixes for the lpi2c driver, thanks for that! Much
appreciated.

Current maintainer of this driver is Dong Aisheng. Since you are in the
same company, maybe you can notify him more directly than I can?

Happy hacking,

   Wolfram


--3TiYRWKQmlIT/5F7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSAS6wACgkQFA3kzBSg
KbaMpg/8CEBAxHUqowqAQNgCCwhIuRq51lr7mrKPp861JHqTaamEZglbw+l0PSSR
8qQPz4gJZ87hhOVm+vUzjCsmlQtWgSS3K9xAaaT9bmKdUyZLaS3Rt7yx29mMLucq
+twayeY9evgq1rUpuYYk8ef0SY3wF4Oy33G02HPQ5y4iRrijTjM/BI//gvsWqqRW
rTOWjf1vNbBiOvK6FeyMPN5mmCzndeZLl9CvO+nKakgNW1Pok+URB19/eC/2ZJBa
qh2pwc2x0sah+hoFwF/KtVt+5aMTcGQn+MFC8oD/HEjOHilFKe667kypfzyWQ25b
9eHbp3EOvhUjC+j01CssaiLmtPukawc8qrs9vJyZSSYmIaGuKQm1o8NW0+wBmvER
oV8PYyoCjW/E/1wh/NAi96bv7Wnx4YzRIHEI3o++BABKpyUSZPQ91OE4a3slj0sA
VqYdAXNAh16dBLFVx1Osw9Ak45KRK4XT5+PaAF1S1nDSKLpt8kl7wRaOyNqO80jH
odk4a9goc4VGH8klJk/6OR1y2tvXlQfzzivCNwJsnzbKE6b5EQDfUn1IrBrrH2aJ
DaiBbnxMfWYJBlIApizWCpfO9UfuqB7RNTaizP0ouIodndvKTUAZ1D4dMmRZ2aMx
PAMAxVpBqmZPLavQDNWr69hSuABfeyZTv86PciMTrwNBFeoOd0E=
=jmLD
-----END PGP SIGNATURE-----

--3TiYRWKQmlIT/5F7--
