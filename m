Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90E76616E74
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 21:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbiKBUTo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 16:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbiKBUTj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 16:19:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E682BDB;
        Wed,  2 Nov 2022 13:19:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0318CB82471;
        Wed,  2 Nov 2022 20:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05D0C433D6;
        Wed,  2 Nov 2022 20:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667420374;
        bh=UJBeGGaDkdPrb1N7Ca1Co7WF/+RDV33dOm4NiGaSn34=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gwt9T9xfnUcfx6exhcOtWB1OyKwvb9b5zOSIXim6Om+bkOP+t8SF111U12xJMR6uh
         mA90H0inSNYKnaWi9WGhMKb5h1jQCI1/ZsS5AKMZpP6qCpqHAwYndmOsHFF/zqeFlu
         L5BBm1h6frEsSiDupUn5IzyiyUHvz9zypRGoJomB+9DKlRxs3X2TxIOA34WrkJlMVr
         cBS+CFh9MXYAmzftzLq61WRY3wzORWftEvWfVz8D+y6f3trDYb8jUPsHOXA+zXq2gk
         IaCAwaW+vcMhk6TJ7mTF9gA9tTTt9aKPuxorHHGagqHETkUPyRRT88RBMSAYdNAX4Y
         C4i82qwaSm31Q==
Date:   Wed, 2 Nov 2022 21:19:31 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Icenowy Zheng <uwu@icenowy.me>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/9] dt-bindings: i2c: mv64xxx: Add F1C100s compatible
 string
Message-ID: <Y2LQ0+6jUukyi1s8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Icenowy Zheng <uwu@icenowy.me>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org
References: <20221101141658.3631342-1-andre.przywara@arm.com>
 <20221101141658.3631342-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i0H5vbWRv9yuAq9n"
Content-Disposition: inline
In-Reply-To: <20221101141658.3631342-4-andre.przywara@arm.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i0H5vbWRv9yuAq9n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2022 at 02:16:52PM +0000, Andre Przywara wrote:
> The I2C controller IP used in the Allwinner F1C100s series of SoCs is
> compatible with the ones used in the other Allwinner SoCs.
>=20
> Add an F1C100s specific compatible string to the list of existing names.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied to for-next, thanks!


--i0H5vbWRv9yuAq9n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNi0NMACgkQFA3kzBSg
KbYFuxAAhjjL4YIu6c6coZwrKc9AvFW0vKI5JpTEoSttV2QhDsV1mA32qmgX6neR
2dJY+e2MLYl+U1etlJmHAMzQcQvScWXMuI5O+K8jfOY9Wj76vOaMBt3IWKneoAi4
nU0caGoNyn00cb9aXrh6CWiEwEUabul1VU682RfDC8MQmF5Nmy3f7sR7S53PjWEX
mzp+PqbMlQH+i5w9W0IQj9MP5tLgNAamoPIS3DDPBrZeIFtHW5g788+FSSasntuZ
LNAl5pVkojeh1ZXrqS37JZls7TupV/nQUV7j7MMTU87e6Z4vyO/giMNT3Y/I69aS
7hKawJ4WivL5eK9b4xosBT/9CS9rSkGgIQ1gtUy6gDJJgO2bMb28Jd/ubEv5g4Wg
v6icX3AttMwa34bVzL/gcI6TsvdSTKxzdDdjjpvOoE21jwaY2812UdBjIZNIapv+
Lp+aMKTUwkNJ51GfBYVArYNQvrKf2gwHoXJNveFaez5iFYUu2l7M/XFeNSaOFelt
pUcRJ9GrUwm5QaGHQjenM3yZnkF2rCOqIF7Kp/aRxd79rj159NL/VOFwLyFxbyWF
S5DzX2SU5d2Tuy5eJ3reOP6AaF5Y3kIGS8WFwpnMLxwAqNOyT7X79y8MWCOXtbDh
Wh/fhkGpa9DQkjkWcL501IDswU8Q84IxJ3oqaLu1tKQ3k1sGLhM=
=n/xP
-----END PGP SIGNATURE-----

--i0H5vbWRv9yuAq9n--
