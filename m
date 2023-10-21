Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 293B87D1ED1
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Oct 2023 19:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbjJUR6J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Oct 2023 13:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbjJUR6G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Oct 2023 13:58:06 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B88D51
        for <linux-i2c@vger.kernel.org>; Sat, 21 Oct 2023 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=hXsZ
        RP/a3gnp3dVJ7R1TeAIfyr8d8pWyuOqF53C7DNg=; b=KxwTvBb4LjdKalojAuWJ
        x+uFHJax7EuoJdu3GQbH7tOt77ECMvpT28pMD4oBIs6UVfH0+eFYMbcK4WNUF4yZ
        rIbT4oJ/XKd1WpFKfJ8OWpPm5BjKXQUhZTaB6XiDfIgobAtqnW/tylW0c2j8rPy8
        lPlcWAWy4ngrLr6aS+h6I7yHIElPh+eo/1lBt82tuF+V/FDdXokVoptPikyDGlGF
        uJCyy9f32shBdlD5KNzfHFyHpe9VVS3V0yv6W8p61jBELPFofDTvtCCSLH8TPb63
        TrUVGr2qSMScukyPzAm0rucSoJvZqqBdsmox1+UTlS9foRAR/KWGrQDUoKW9FF6G
        KA==
Received: (qmail 1472773 invoked from network); 21 Oct 2023 19:57:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Oct 2023 19:57:53 +0200
X-UD-Smtp-Session: l3s3148p1@011nuj0IqMkgAQnoAGobAPDYRw1R6KxZ
Date:   Sat, 21 Oct 2023 19:57:53 +0200
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
Subject: Re: [PATCH v3 2/3] i2c: muxes: i2c-demux-pinctrl: Use
 of_get_i2c_adapter_by_node()
Message-ID: <ZTQRISF8hecbGydl@ninjato>
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
 <20231020153017.759926-3-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8dcyqXc9Mv1THXa4"
Content-Disposition: inline
In-Reply-To: <20231020153017.759926-3-herve.codina@bootlin.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8dcyqXc9Mv1THXa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 05:30:12PM +0200, Herve Codina wrote:
> i2c-demux-pinctrl uses the pair of_find_i2c_adapter_by_node() /
> i2c_put_adapter(). These pair alone is not correct to properly lock the
> I2C parent adapter.
>=20
> Indeed, i2c_put_adapter() decrements the module refcount while
> of_find_i2c_adapter_by_node() does not increment it. This leads to an
> underflow of the parent module refcount.
>=20
> Use the	dedicated function, of_get_i2c_adapter_by_node(), to handle
> correctly the module refcount.
>=20
> Fixes: 50a5ba876908 ("i2c: mux: demux-pinctrl: add driver")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Cc: stable@vger.kernel.org
> Acked-by: Peter Rosin <peda@axentia.se>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Applied to for-current, thanks!


--8dcyqXc9Mv1THXa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU0ESEACgkQFA3kzBSg
KbYvzA//WO35C41c5gv7XQED/1iuVpp/Q+nbB3Un6IbBaftLvVwTMQA1VWWP/vks
M/98EKFT8hRLvunOcT9y4P1559gm9CVxzuRllvhUMLKBmnZFgaS/W+czUf6zbR2g
mk/nr0jGzyB+B+htJE3dh31Jd5MNc16/zAf/rSet58x/rSEsEC6WNFA9I8E6Qn2M
zCHMKva2kI5H/PYfqNZa8eZbX1YzPO3zUonex5JvP9tSmYwLt+zGsMeEJovb0uqZ
l3pORrwsF0cxw6sRVNno8596C9WZEEuz4X6EmK9hCUSDmQVV0w9gcUuQc/pH7oyN
Vpci9L0S3nHlgNtFOEl0lmDZnWOH7KA13vdmfnPBOkJMRUyU/EHbPHGmZShdh7rm
Mn4iSV71SyYQfffNZIXwGDIVBXr8EwvtJdd+frvGNlBQe/vQYQd8BUWzeZ8xtSYc
v0YbIJ0wqd4OZ/mk4SkDrfWArSxeWvZ+kqyOeB4Na9+X0D3G6tkF4pxTSRNU+wsG
ggDaX9erIM0rmHeh+O0VTf4JhR+XUwZ3481BnVQ81KBbH1r2n0woJ5i2vD3R3wKO
4mz0yKOXwNaJY8YPO5wBLaOzr2P6FgzAI7Kzs8COvPxpbBWswSRgp27GVbcJwMjT
qnWz/bof/P8/BrBvUW5iMWwm3CdOqiksTcmia3ojvrwRb+7QFNk=
=KxuJ
-----END PGP SIGNATURE-----

--8dcyqXc9Mv1THXa4--
