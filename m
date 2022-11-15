Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754D962A370
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 21:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238039AbiKOUxE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 15:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbiKOUw6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 15:52:58 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD322A1B7;
        Tue, 15 Nov 2022 12:52:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 3AF5ECE1930;
        Tue, 15 Nov 2022 20:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8640C433C1;
        Tue, 15 Nov 2022 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668545574;
        bh=gtMPyEkqYSiyJe2RYdzhMkumSicvTGNTRY9z5emGfTk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T2k58gdPz0TNoqraxpTv+OL5+TuuxkSRMk2m7GVUYSFCa1YbI3Kx0FibpXvtI/+f+
         ZbPAplxikkhYRjfKHmNJCHCjJu3BQVDe5EEBKDvM8io3An4OdvkvG2z6SfIDS49I8C
         QmFYzItwSEqGHGlgNvCkjugyqAt+O28ltdtZOBBlthAm9ZF5zbiY+SJ4cyXHm7yg00
         8+N20O8Op7FWJm5BZDq/mZNcRSVQjmI5hogBAQmc7dnhexl76+ldGiKupnNLGVNcPD
         wDDxHSGi2Mh4roWMGx5toX229luaPJxY7Z+3Y84Gdwnas8zgvqX8DbtrCWs0i8m/LG
         P6lEUdifAK0RQ==
Date:   Tue, 15 Nov 2022 21:52:51 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, treding@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 07/13] i2c: nvidia-gpu: Add cypress,firmware-build as
 a well-known regex
Message-ID: <Y3P8I9TrFYFmfTHY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com, vkoul@kernel.org,
        p.zabel@pengutronix.de, balbi@kernel.org, mathias.nyman@intel.com,
        jckuo@nvidia.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        singhanc@nvidia.com, linux-i2c@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-8-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GcWtn7TlKaEtNCAY"
Content-Disposition: inline
In-Reply-To: <20221114124053.1873316-8-waynec@nvidia.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GcWtn7TlKaEtNCAY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 08:40:47PM +0800, Wayne Chang wrote:
> ccgx is refer to the cypress cypd4226 typec controller.
> add cypress,firmware-build as a well-known regex.
>=20
> 16-bit value is not sufficient for descriptiva names.
> Using string instead of u16 to make it more descriptive.
>=20
> Signed-off-by: Wayne Chang <waynec@nvidia.com>

I assume this series goes upstream as a whole via some tree. So, for the
I2C changes:

Acked-by: Wolfram Sang <wsa@kernel.org>


--GcWtn7TlKaEtNCAY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNz/CMACgkQFA3kzBSg
KbarLBAAioFwGEaBlz4SL9lEkJdRJkgaa9HxYO8RHVbGnlt1NW6bEOfp1ISWF71s
OjoMfvEJTCw0+rEGB7oyH0DC0j7R3Z0ofrTPoN69bWfmZSW4MRtJX1ZuKbQixzvJ
8SpCFir567TfEuejruTihsmLPhx/cX+kxxdFxxV3MyyyV/TeIxbEKxFIFTezXTJz
OB+xBF7+4lqf9IwJK/BlfQAi1BlSa+5wzZOGr9HlXhOvcJj9pFfbnEg0E26U83A6
uE1D6Tj6CfbiACYViOVoeeSDS8jQe5qvkd6QPLJ93ifJ476yUiqvqQq7vCRTEitB
wAnc4jJrap9m61f+Up0IbrN4KB+JW6qyXtcBQs8BoIoFVU0krkj56clZhX0oZXg+
mQYmMR7e+ZCcE7zraHPGKtaylkXBKvyvvClBofbhN4DD/mpFsuS7Wcxrb0roKe61
h1imRVZLdAB4LyS8h4MbOXdLvHQ+ctIH4bVX6akT13wER4cuTQT/cVLNupZU8wBa
THnrohQkVSOsDwDEumN9Wd3uncCstaeCLKd4S1phaOVvJh1L7cu5IbLUcU+LEPHM
D7BBLYF6J8AkU9stjB88NJlrUGjq7fuahIc8IhrWizacTvsDov7ml7vc0+0bu1HS
RdJxdVre7m/lS95qUM08G4JPdAjk514OvpZB4wIQOhk/ffmjtIg=
=0+Ea
-----END PGP SIGNATURE-----

--GcWtn7TlKaEtNCAY--
