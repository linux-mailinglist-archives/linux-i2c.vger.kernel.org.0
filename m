Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCEE6424D3
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 09:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbiLEIkT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 03:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbiLEIkS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 03:40:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC1ADF43;
        Mon,  5 Dec 2022 00:40:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 678FA60FC8;
        Mon,  5 Dec 2022 08:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4693EC433D6;
        Mon,  5 Dec 2022 08:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670229616;
        bh=FnGsUFy5sYWAfmF2yzspb8rioGnomy2eD9q3k4siupc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LxlvvCoQn9Yw37WvFvN6nEpWCOyjzPSt/NiWGp0+Ux90+dSHb2BpdHfZ2Tatlnp0Q
         EZElfk2w9ovBwKfKV8kk1o0l+QZrVZhL3BZch4zvplwqXO/ms3Dn4/BBO0/IESs2xj
         uxquQ56riHfX4JK+cwXoR81ByQcJmvIKxVD2POgsTDMsRRNeay8/rwalRshZH2QiZs
         uwp6tp/3bkChisigYT0R6zw7dCzWdV9YaNmqYjAwvsNCCDeWSjbdAnDLoP5BTgoGGK
         VkBPVOciHg3sKnKCLw/Pgi19BW8LKJ7Fl2boQYKfaeHseccSkqDDtVSjrYm63ki/B3
         f0mqVyjSZt3KA==
Date:   Mon, 5 Dec 2022 09:40:13 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: loongson: add bus driver for the loongson
 i2c controller
Message-ID: <Y42ubaVQclaTA7Eh@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yinbo Zhu <zhuyinbo@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221128130025.23184-1-zhuyinbo@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ae0viO7PKLMg849Y"
Content-Disposition: inline
In-Reply-To: <20221128130025.23184-1-zhuyinbo@loongson.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ae0viO7PKLMg849Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2022 at 09:00:24PM +0800, Yinbo Zhu wrote:
> This bus driver supports the Loongson i2c hardware controller in the
> Loongson platforms and supports to use DTS and ACPI framework to
> register i2c adapter device resources.
>=20
> The Loongson i2c controller supports operating frequencty is 50MHZ
> and supports the maximum transmission rate is 400kbps.
>=20
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>

There are currently two people submitting a driver for this hardware.
This is the other driver:

https://lore.kernel.org/all/f6cc2dbe5cd190031ab4f772d1cf250934288546.166977=
7792.git.zhoubinbin@loongson.cn/

Can you guys please decide which one is "better" or combine the two to
make a better one?

Thanks,

   Wolfram


--ae0viO7PKLMg849Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONrm0ACgkQFA3kzBSg
KbYizxAAsxQb5yyGCMIeSopmZK+v8I/skPq/XvnFG61ON5mkTQ5cDyRu1bKpt+qz
3Ym0xhdmrStCJLXqGN2SeNoWhV/Kw0tcgxH/bz7Fg2AZWMUuhqFUQTynOPJpC99b
Uwvj4pxlsxOJubjzGY2HfbX+WibtjkE4GWRRUHLcZtuDcA9FN3m1vssGhu5mLU5i
5rSw22CiYi+Bnu5Ra4Pq4AgvJoVUINGaEgoA5jnrbkPkP+qEzUh/dxJaK6SdqCmh
DETgGL+IfzZnVcaka3wR00Aoz5JVTUXnm19QMOq+veuLCcaoFMI3rUk61xAVyulg
np9gM5Ud1bClA1sN/imZmFrh/fdRUE9ZK8MPny0vj6kYi/rLzTzQs4gwGBbswE8V
+AXTTJzMYvZs5u2o4eWCHC2JoWYkmWUO84dPpi/LL5gSCKgEvk3CYbZfUT5b0+jo
gB+2TXwBUUW6AEESsdrkHO4GveODbXfeoQBEx6jotCrydWet7mfvRaz/DKWmS00m
7nhdxkqrzLiAeDq/p3UNgy4fqDm3NlnnUwJUslj2ZHfLL4GNz7AvKAfjIyVJqBWM
MpwFBoqypHxBBucpPgPVJ43dxY+55OZ89T3/FhVfgNqi0RSW3BJR1QDa761abgbO
zmsih5T6iov6gXcTcLw4G7h9e19y91Jspa4bw9ev255ad3oxxag=
=gBwl
-----END PGP SIGNATURE-----

--ae0viO7PKLMg849Y--
