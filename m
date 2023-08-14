Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C184E77B9E8
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbjHNNYz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 09:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbjHNNY0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:24:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A08312D;
        Mon, 14 Aug 2023 06:24:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9BCEB651A7;
        Mon, 14 Aug 2023 13:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E34C433C8;
        Mon, 14 Aug 2023 13:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692019465;
        bh=xDsBbZUty7U2Sot+dr0Kjlb6tifPa2UGZKF1gCvlKlY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GLFRavb57kioBbI80SaDqSiFfLid8pLeRnADfIexZAVUy3btfYdgAZbEgVrk6UF1V
         4oIuQhHyWtw2w3NZwY3wW6VouJqt4I87cqyIFbjNBRtvFhp8gKR1E7FrYOn0Jk71Lc
         t+fr8r0YfGfVNf3NeOZ3njiRSE+/xMPPjtjiRiqINpKJin96WU+TwN7CYxnYCn4GdH
         XFRwBibbEy/Ui8P4YXgMN51tgtvTac4ock8Pq+7dvCFpkiVnxSE1xcxZFgY+mKWSHL
         tBtXS70S0ZP+QsHcoGNQqgTBaRKuT1i6V6tyX0oqbC6NzWBwCktjq65GQ2flO1q346
         BXaZZzQAaPvbg==
Date:   Mon, 14 Aug 2023 15:24:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     carlos.song@nxp.com
Cc:     andi.shyti@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        xiaoning.wang@nxp.com, haibo.chen@nxp.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] i2c: imx-lpi2c: return -EINVAL when i2c peripheral
 clk doesn't work
Message-ID: <ZNorBff6bK0xIEJC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, carlos.song@nxp.com,
        andi.shyti@kernel.org, aisheng.dong@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        xiaoning.wang@nxp.com, haibo.chen@nxp.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230726092238.3424116-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="U5kREtmhN3WZibhq"
Content-Disposition: inline
In-Reply-To: <20230726092238.3424116-1-carlos.song@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--U5kREtmhN3WZibhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 05:22:38PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
>=20
> On MX8X platforms, the default clock rate is 0 if without explicit
> clock setting in dts nodes. I2c can't work when i2c peripheral clk
> rate is 0.
>=20
> Add a i2c peripheral clk rate check before configuring the clock
> register. When i2c peripheral clk rate is 0 and directly return
> -EINVAL.
>=20
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

Applied to for-current, thanks!


--U5kREtmhN3WZibhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaKwUACgkQFA3kzBSg
KbZ+gQ/9ERQwHso4k3Fs2EMYQ8jnWYVLUbaMe6erNehzBkFlEoH3XA04I9Dk+0/H
tM1vJvmFBMDiO2ZmvfSVBeCiQRGuc5PG5QWifb847I7Aqtmq1SpH/cRgj7Exzc8y
HKSu3ybxH1NlPEH2Yq0JnPPHed5UE8oXtwB52rYBlwcRido6IrtDQJcWYPwegeG6
QpbsXzCt62MOva1azcmtW2O3HNdYVYRbSe2H7wXdsAByV2qJtYrs6dwHwip2+8+r
6vBlkThpo+4hi82sD3lYk/LwQ5NJJAWDny96HCZNt75bcbcwvLBxcH10eORxoKGT
4cpOeGgM+1E3qx7CKsjhliu1RP0nLRrgMwRjSm/aP3cN5MJeX6/HI/2RJXp4lQNj
Auxv8qa4C6sDdBmMkv0odYZXSSKmVG55Cpj3m4t4P+9gbQXIasyePyQDq4hB60Bb
AzKDQZ4UcZZImTwBMykPyM/TNvrP1/oTfkUr2OHEhjF8cDnvnUStX3n9RlDskN6p
DZrYhMvieLXXeNM4PAV1iYsFOyFHnO3ujuIrp/SQUJExQcDIIZ3kvCD9ssLELmCz
58QpNz1XxX+ykYqBebjJxMos8PMSYDLdLD2nD2iDGlb95wWWSnYSqgke/ExvcSZN
uzHBV8JrkE5cp+UOSsYDnWV8912AaCD1o+L3wJYty/U2MDrsFV0=
=IamS
-----END PGP SIGNATURE-----

--U5kREtmhN3WZibhq--
