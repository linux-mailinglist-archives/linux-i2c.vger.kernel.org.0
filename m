Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95A834B2BF8
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 18:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352261AbiBKRnv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 12:43:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352262AbiBKRnv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 12:43:51 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64802CE9;
        Fri, 11 Feb 2022 09:43:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 002AE61D10;
        Fri, 11 Feb 2022 17:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D35C340ED;
        Fri, 11 Feb 2022 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644601429;
        bh=+r5dR6FoYE4eBBMRRJ+FloJfeJFmytBcXCQALrf0328=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kj1kRV4asRSVNwTd3lTnSHgY/cux3ZfhYdiI9F5zoTgHGgJZx+yyAEa/QYkA3lII8
         IciDkQX6lr1zbMCvzoRjZiMPH4USztllIs8iH+iaeoYw1UmkVW2oGt7GBQ/AVNWRqd
         XanD/7xciAxF3rewmZRBOlos9atxwo+vkg8Fmf8VGbhjbW/Ky9R2W6heMmKzEkHI5D
         DEMnSu9PLZhOQNVwCGXOXLv9KV/8jQyPQnrwW33CEcXGKr+WVADUXq/LoJFKTUJZjE
         ByL2xzo7bsEDgC34PCZuBpEohUkw7OVaSeZ294p0OtvsCanEcoNVE6x/ijgDFksvUk
         73eKJ/XA4nARQ==
Date:   Fri, 11 Feb 2022 18:43:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/9] i2c: qcom-cci: don't delete an unregistered adapter
Message-ID: <YgagUVXvjF7/CmWl@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UtpmLKJsZoFZgcE/"
Content-Disposition: inline
In-Reply-To: <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UtpmLKJsZoFZgcE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 06:47:00PM +0200, Vladimir Zapolskiy wrote:
> If i2c_add_adapter() fails to add an I2C adapter found on QCOM CCI
> controller, on error path i2c_del_adapter() is still called.
>=20
> Fortunately there is a sanity check in the I2C core, so the only
> visible implication is a printed debug level message:
>=20
>     i2c-core: attempting to delete unregistered adapter [Qualcomm-CCI]
>=20
> Nevertheless it would be reasonable to correct the probe error path.
>=20
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Applied to for-current, thanks!


--UtpmLKJsZoFZgcE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGoFEACgkQFA3kzBSg
KbYbng/+OTOISUKGx1b9GK5hNb3GXHnHUeeVtmRxnEvCGn+mHlCsi5tyuIZGMFUx
waUEFZlAh7KLA9tADjOURLOSLMA82LkTHivEH6cmpOUD1TfAFcW39KMYl6ekSeI5
1w6AJDFmiwxxSR/izNUMO2Cuc8pbRXC6+1cEvpHavaiqQBQllDGTV8tinpUy63xB
kcu57zmy4bKQfKtYy/UJvzHpxaigXwGUwJPcKL35+jsGxeD+dkoOg4jxzAkDld7Q
3AlZxq5mbZuqGnDQ91wImp6Ehz2UYt2UYeEIwcj5O9UVkRCyQCRT+VnIqrTxoSQG
ZORKXWGIlecLIEciLX1lLMe/8wPPWOhk9IVTlPwQwj69+OnDr4R05MfPFJ9DwVyn
0SzgZq0W0J798cx2NBiTl3FVq+54heorFKnNXBAKgCOtknhIuCFw+a3McEtzfM6S
QEYfHn+yhzqNlzO+ZwsnkWgTDJ38PAJ3G+2r0s7ld7zur1jBW7vtsNquXc1gUdo9
ed9vpFFiLMP0R6FpTxAeauZRWQXC0Z9fRhSPMUfWsi7+5YmujG8tuoUo1uLkStdk
qVbx5Ma6bFG1IvBUDwIOUrIBP8/HqNzOL8Z8m+GP4jbpVY/C+c/aC6vesxuRKb7p
kR9YzLDZpQ/EvKxp5stjuFWDP8DRxp+fyYI8ZSwvVjvybEc0ijU=
=wMzi
-----END PGP SIGNATURE-----

--UtpmLKJsZoFZgcE/--
