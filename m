Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7BD6BD9DD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 21:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjCPUIs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 16:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbjCPUIr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 16:08:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220FCAE136
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 13:08:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 291EF620A1
        for <linux-i2c@vger.kernel.org>; Thu, 16 Mar 2023 20:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F150C433D2;
        Thu, 16 Mar 2023 20:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678997314;
        bh=VuC7QTyHOzHSmwc5W73ZxB5gYSjNYlNz9qs0fCV02ns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dwg2rQHra0c+G6VQL8Ti2RA7aTa9Lgf05wayTuV4mgBqPRMQFqh4lDBn1gvY9vXiK
         dNWrWqZ/G7aAKnMWFyJm5ljPCsGV3mPwZ9KMpoflpOVe5jY4EMicY5Wsibojgo/K2X
         a87Yq7IureCO5yf/nRulqa+7wBrMS9/Uj9NdUmD9vHojxxOorpNo+y8SJVyzOC5Y4h
         kFaeS6bntsooHziUMpU1yta5cdbA4S79SjKQ1XyZcnoo7DLtnjGaGm5W+Xq5xbGl3B
         EgLdX0C27IC7dTOzb45jKU9hIQ0+PZy9nj/0t5hU5KdhQE0hfiYcjmvMZfre5BGo1w
         A9uY+/dcitIjg==
Date:   Thu, 16 Mar 2023 21:08:31 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: imx: Simplify using devm_clk_get_enabled()
Message-ID: <ZBN3P5L7hi6zQsIc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230313183349.2774002-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r/rysAqudIic71jj"
Content-Disposition: inline
In-Reply-To: <20230313183349.2774002-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--r/rysAqudIic71jj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 07:33:49PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> devm_clk_get_enabled() returns the clk already (prepared and) enabled
> and the automatically called cleanup cares for disabling (and
> unpreparing). So simplify .probe() and .remove() accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-next, thanks!


--r/rysAqudIic71jj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTdz8ACgkQFA3kzBSg
KbZHyRAAlV8P/zTbybE+Qm5D6I2uMP3fs0mcxX13AERb9CSqaWJS35O1humUPPZp
fwi7bQW42CCybjkwUTftQJZjTN9KPeG05c8NWdLSzoYSlbXMGIuDZAgkd9udL+yy
Er0dj4tboNt7Esywou0R6hGycPq4hKddtEzwzk/YjuGaex9snBjQS/NVtwXdvOM1
4cF78XefL4v92lV7KV1xlbHTVkkJjnjeOQimPhVki9S089Y54uGUCiSxSsrk3LBD
t7nzVemBxlaroiuD9GvSsI6wQh8DbULy9d6Fh6zCgc5GAMG13zz3JF6AQSxB0MZS
jdDu6GR5sPbDuzHIZi4U8RdUK+dLGMfpj1oAfd6DY/vOXzFLJUNQLfBOJPhW/rh0
8c1u0hdLvU/srEB6q2MkX2jiNQFlActh/ZJH+/PZcNk/+Y95GD8yshiATgZ2rIlo
Wpp4cbNNpZCtbU9iJjBjWDyfmfucui7ZX2sHBNLQbSla8uLV98bGK1irk9Xd8/hj
BpTedhgHk2F1iD7/jyWCldGr09gVxUC7blbzTm1Ryo6X9Rn3e8nFT3H8ajRjfSyt
XunsDUzw6YXiBUhkwXbbqtBYLpxwMPXhUycocwTVxXiiSdp+xIGiwJQRoV76riI/
h62quKfKa64l2Qq/esXViccxg8cS81D3m8DEBkcg30+6aMYeuZM=
=JpX3
-----END PGP SIGNATURE-----

--r/rysAqudIic71jj--
