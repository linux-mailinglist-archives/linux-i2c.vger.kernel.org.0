Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81E557D1ED4
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Oct 2023 19:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbjJUR6X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Oct 2023 13:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231981AbjJUR6W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Oct 2023 13:58:22 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA11D7A
        for <linux-i2c@vger.kernel.org>; Sat, 21 Oct 2023 10:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=1tph
        RT4/fr6VXmFmt73f2t/eEw2/hid0bq+Uk88Fnc0=; b=T01xIk/LpseplDjUziNG
        OiJnc67xrhwoXXqnOMtdMAYKIkirBLh5hIVYPPaQtRHWIWVuJI+BhVY5f2yxUAbU
        t8tBTvVQ/S5cnGmxRcmDoEoTa4ri5NpX8g2SedCUQndPwUo2cQK6ZQUI9VgqrLM8
        2zqv4EO/z75WIcNRNgbTzcYwB8TaJQoHcMplObC92ee4CNsYp0pgU3h1Mmgo1aiY
        CMRQ9f7AqteFjRlJjuZfsivZOdB6c7gVueECb/7poxHDuH8ow30qCGtwPQgeSe3D
        Wla7upnqYqXReHI9nQMGw8uigzDtsbCEDCwzoR9KbKMfGNSk1Pp1ltsyeXkZaiP3
        kg==
Received: (qmail 1472854 invoked from network); 21 Oct 2023 19:58:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Oct 2023 19:58:09 +0200
X-UD-Smtp-Session: l3s3148p1@UZJNuz0IEpkgAQnoAGobAPDYRw1R6KxZ
Date:   Sat, 21 Oct 2023 19:58:08 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Peter Rosin <peda@axentia.se>, Stephen Warren <swarren@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        stable@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 3/3] i2c: muxes: i2c-mux-gpmux: Use
 of_get_i2c_adapter_by_node()
Message-ID: <ZTQRMG+IGMyM/PIf@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Peter Rosin <peda@axentia.se>, Stephen Warren <swarren@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        stable@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20231020153017.759926-1-herve.codina@bootlin.com>
 <20231020153017.759926-4-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bKdObAA9+5DRRzFe"
Content-Disposition: inline
In-Reply-To: <20231020153017.759926-4-herve.codina@bootlin.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bKdObAA9+5DRRzFe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 05:30:13PM +0200, Herve Codina wrote:
> i2c-mux-gpmux uses the pair of_find_i2c_adapter_by_node() /
> i2c_put_adapter(). These pair alone is not correct to properly lock the
> I2C parent adapter.
>=20
> Indeed, i2c_put_adapter() decrements the module refcount while
> of_find_i2c_adapter_by_node() does not increment it. This leads to an
> underflow of the parent module refcount.
>=20
> Use the dedicated function, of_get_i2c_adapter_by_node(), to handle
> correctly the module refcount.
>=20
> Fixes: ac8498f0ce53 ("i2c: i2c-mux-gpmux: new driver")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Cc: stable@vger.kernel.org
> Acked-by: Peter Rosin <peda@axentia.se>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Applied to for-current, thanks!


--bKdObAA9+5DRRzFe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU0ETAACgkQFA3kzBSg
KbYotw/9H5yLe18QGWIzB99u5ZQtqYrFPqfJ97aASuvaLBJH5D2I2oMEu5VfOe3r
n5uW6mKilgM/g1Dw0jzfNXP+rzrc1beu7KeYK7WIhtmvdet7WYd+KzJYfM/Pxy/e
6izTwfCNW4p2A0xjb+T4kN0/GYnUIvG9SfbJsSpB6jlLplZ2uoTOqMMIfr0kx1bi
nkfXvaJv2KwhaNRZq9WSDekHLYPPEQNvXnOgvDKWPz7EP45IpBAodw9GAXa8Eq4c
sCn6e/0vbuCNp8r/iMGpMFZMgZVaiQe0R0tTt4bHatmzMjUe7kCJytJnu6GYt2kj
0QKX/1ubGVhkjfr0/1xxjCVNJrzFD71EX2BcR60v7N51xErhcSkMyy6kiL1JiYCt
R3HOa3MhUbcwrsFgXjkx3z1/VRHTVONijY62ayORKdo9ovdQ10+dfLNrQ3TYw4X2
KyJCPbaoSsvUyZEnLt2oMPNZZ7+L5ePsz+nNc+agcW1D0UJen53dU+7zr2TYRf3g
0TsVoA89J0z/282ycr4bKc4Mlszb3+bEOxuHmQ3VqbvjMKA5oj1zBgoMwEhjb3GK
t5M+11mb0wnpIDL0+1pY6humwzYUAdTYiAIHfiAsI3evHhww9XCJrOYpP0MChO3e
B1Wp+f1tpTqh3A/w+gmmpeCvtWoC3THouTVcHAW4KxujrbBRo3w=
=YdAO
-----END PGP SIGNATURE-----

--bKdObAA9+5DRRzFe--
