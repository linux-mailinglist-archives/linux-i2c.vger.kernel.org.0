Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7EA7D1EF5
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Oct 2023 20:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbjJUSfj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Oct 2023 14:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJUSfi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Oct 2023 14:35:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71325E4
        for <linux-i2c@vger.kernel.org>; Sat, 21 Oct 2023 11:35:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1BFC433C8;
        Sat, 21 Oct 2023 18:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697913337;
        bh=vWkmMJUBkOdAXxxJqz9D4jbWEtbWqkn4ahAipN6qGh0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hpK0m9DPclwxj2DHhG7ZYF7pc13noYoNFtKS0Q0kU8KGmJjzZAHH5wVBKDXmfmgH6
         oaraq7HUEE7J6FrtqXf7CqSB3AnZvublnhudoIeH93gSRfJkZR5z77lBmhOyKceuSo
         CXnCRplvAd34V8pecHpi7zGwMnX/t6mXeJHTNKbpJs1PWZJ7Dus2V0pHdfQNJD6inO
         e6odhEHzmeM0GExG1k9G27Cow1d2gAVBbC0SlSweTgH/jieZ1yWKJaRZTaLd8Xfejn
         jeFWRE6Zlx9NN2sGuifM3+v6JjrYlgj92yB/EOivIGwwEZfcriEdYGD2BmCYR4jVA+
         Vs/e90YXRptCA==
Date:   Sat, 21 Oct 2023 20:35:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 03/15] i2c: busses: at91-core: Use devm_clk_get_enabled()
Message-ID: <ZTQZ9RIA1k/JMIRf@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-4-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mXjafT3fhj8vvVBH"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-4-andi.shyti@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mXjafT3fhj8vvVBH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:56:50AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>

Applied to for-next, thanks!


--mXjafT3fhj8vvVBH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU0GfUACgkQFA3kzBSg
KbYKbw//d/O5S5KYVaqqEcThu5xqoVtwr0jlce+yQmKs1tvp4JcGbUEKCjX15/5r
b6R8kUFuWygrAoFq+cEwtUn63U6VFJ2RDtqt382pQSvX/i2BKcUeatRpX1xm2GRK
HUgdFU6Dylj5FvftJj8/Oi13ojTIN1FABmQcYzgNwQmtSZUg08BkR5ghJ0Td1W/V
FdMTvCDiKgrFGtpVaPweEP7T6vgYkGdRHwh5pqjLLcQJD5tWP6qDEoK5lkBwGt9S
S1yxPMabAoIPesCOaCAJUCl3gktUVC7pekk0p/MFhcMFLpjdGVOTo3LWshaaIUuw
9qSGN6XRNaNnnVEJVGYXzVVl0QN1XDLELbCAoBZQhYOBfsGcAt8BIo0QlaMh8v0O
0mYe+YifSok3DHggQO6hLgGdcWm7PqSzuHWUoT5wMmCYiUYSfR+DMnnK9lg89dLO
G5JDyS8e4Yx7Ik1dYhwxYqz6NiyZDJV7WZKeZHCdSs3m5Cbq4maIP80VeXi4RkeJ
YWUYueMmtsxyfbUs7tFDhcM9cZNN+IR8KeOXSAC6EJkJM1xmdgmwRSv4YPZD7WNx
LSbqRAR1KaAgAQFr4f7A4rdukQuLoFYCWdSjv1VDZPGHnWToDikRZELdZPIQKRME
chOtiqnwaTNpsNEfIUNzHXhw3K1jvL0dUVfg10Xe3Z0yu3/fAFI=
=aTgI
-----END PGP SIGNATURE-----

--mXjafT3fhj8vvVBH--
