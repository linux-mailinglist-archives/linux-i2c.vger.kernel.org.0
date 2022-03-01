Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B45454C8E96
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 16:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235473AbiCAPIO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 10:08:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235493AbiCAPIN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 10:08:13 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C3331373;
        Tue,  1 Mar 2022 07:07:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B40DC6159A;
        Tue,  1 Mar 2022 15:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2205C340EE;
        Tue,  1 Mar 2022 15:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646147251;
        bh=/uqkVqzGDPnOCszKkkBc95M192406rUvbfmB6kxrbWY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M5YjfoC6TLaaeax5hxZNu0F+TPy7xMXJ6R+x2hzt0JmRtQ+JQPm+GiJKOMr8iFWkQ
         txbOI5iAMiELeZ9T2zYrtLJrrYgYQPk3hI4cIiXQ8xGpfkGja+F3ReSmug1GZPO4yZ
         yENxtS+GUv14vaFlje+w1XjK+H3tYXadWAMv1C0AjLhjrV9/AflfqhJgN5Y1E+XXF5
         g6W1LXIXk5WGfN9LNhYEsixnLreRf0/KfHb/nKtOMuypoKorqHjsMXgy63P3xzprHW
         RYPz3axIFivPv58vzSYeUT7Yip9B/VGtUcEspkAQeSV1aUqIsZxz1Gszl8xN2WS0zV
         h69UEJR5ZeP3w==
Date:   Tue, 1 Mar 2022 16:07:28 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] i2c: riic: Simplify reset handling
Message-ID: <Yh42sI6Qow7e3vkw@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220209232232.18461-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MuGD1GOWyX/swq5Y"
Content-Disposition: inline
In-Reply-To: <20220209232232.18461-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MuGD1GOWyX/swq5Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 11:22:32PM +0000, Lad Prabhakar wrote:
> Read reset phandle as optional instead of exclusive so that all the DT's
> passing the reset phandle can be used to assert/deassert the reset line.
> With this change we don't have to differentiate the RZ/G2L SoC.
>=20
> With the above changes we no longer need the "renesas,riic-r9a07g044"
> compatible string, so drop it from riic_i2c_dt_ids[]. No changes are
> required to the r9a07g044.dtsi as we already have "renesas,riic-rz" as a
> fallback compatible string.
>=20
> While at it, check the return code of reset_control_deassert() as it might
> fail and also add a devres action to assert the reset line.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied to for-next, thanks!


--MuGD1GOWyX/swq5Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeNq8ACgkQFA3kzBSg
Kba8KQ//bLZ9AmPwsFHhGKLisPmXWtx4fSvEuwTrw0p4Heh0GwA8X2RxJmnXHjNR
0JXxQu3QdIcEBdg/U4zRJtcwZBrkuRozTfqp2rFRgwOZgchEH/DJBc332QAr6V5Y
XcMRa7feLzW0LekOjorOoXyHQvA4mzRilwy5pB0hAOwjxhpcGhNgy0taI7W1Ayy5
QmvhxEhuEX4XAPHMAtXbUyfrMpjLskSKrBUbZ/4hn6uvYxXaBswsMXfkB2mFpr/e
H5bU1llyaLTk+9TlX8q75mvaYwO5UDufebXH7VeOXZkdUV0GMEprvrZVNyyok/iQ
nOfEW90rRawDbebavmEaVblU1mBWxOduDZdO/4QxbeTQHpmisyBphXJt7E6EDV9I
chPnptjWtYhaehV1Zlw7l7WhgqnOFwzTNaNa7fyamNGBwKXIQI64TaI/dd5tw15Z
nf8KMu2qWFDApZcvWnb5O+LTMqFCnt+JtYXt0rQTFfX+nyTXLByFZVG0QWwdv8QX
jPvglxq4SJxS/qyblXUZDVqfZ4UEc35yg6lgSYNaFqTJTP+0iqqyRfQLFG4VpA1w
ffgzXZHX8kz5NTrqgGYjemJd0SDBNTba33mBBlcY21kReOH4UB9Fn/pXnRjhfiXQ
s4TUWCLJqDtcUBpt+T/+E6f/qNfDYbmc58Q23J3Vu+fQqzzXlos=
=D1zN
-----END PGP SIGNATURE-----

--MuGD1GOWyX/swq5Y--
