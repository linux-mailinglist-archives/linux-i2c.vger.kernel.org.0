Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE685BBA87
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 23:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiIQVDG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 17:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIQVDE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 17:03:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C912BB09;
        Sat, 17 Sep 2022 14:03:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B7FB6B80DFC;
        Sat, 17 Sep 2022 21:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B6BC433D6;
        Sat, 17 Sep 2022 21:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663448581;
        bh=/ftKPlQFCcS5n3F2nF3njf1dvMmc9OtDLZBMX4Q7DjE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GjQwaFu+hsAsuZSwSiT2wfyUgsv3iv/QyrWX10uizVgCAexsZDwRW18ktV8NQBvjo
         Hw44av/dlWdkEkBLXISAv7BAh+V/JMW35CiGXcvI9aXu/nqQ/v5pUafoUtmHiKUYzh
         yZGWQPfG496y5/xP2FgSAj1s1ujsVWLwP9J0KVlEZrEnQGK62CJulhzF1jzBOwtyC4
         Ck2eE1TRNhc3BqKNRP8a/w1vhZF1X2ASuJQIslUFOvKQCpd4uaD2S5I5/7++jPsd2l
         ENCou/jBe94yGR4u9YLoA3bEYw4t4dhDMvBQaSDYADE56/M4sYfnnFr2wnMz0xWdLP
         Dv+U+bO/8cO4A==
Date:   Sat, 17 Sep 2022 23:02:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk@kernel.org, jarkko.nikula@linux.intel.com, robh@kernel.org,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
        rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v4 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Message-ID: <YyY2Aic+WIylNA02@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk@kernel.org, jarkko.nikula@linux.intel.com, robh@kernel.org,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
        rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
References: <20220907161143.897289-1-tharunkumar.pasumarthi@microchip.com>
 <YxjHgiqrGauhg1oS@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HvLyCNN6/FfT9NAp"
Content-Disposition: inline
In-Reply-To: <YxjHgiqrGauhg1oS@smile.fi.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HvLyCNN6/FfT9NAp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 07:32:02PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 07, 2022 at 09:41:43PM +0530, Tharun Kumar P wrote:
> > Microchip pci1xxxx is an unmanaged PCIe3.1a Switch for Consumer,
> > Industrial and Automotive applications. This switch has multiple
> > downstream ports. In one of the Switch's Downstream port, there
> > is a multifunction endpoint for peripherals which includes an I2C
> > host controller. The I2C function in the endpoint operates at 100KHz,
> > 400KHz and 1 MHz and has buffer depth of 128 bytes.
> > This patch provides the I2C controller driver for the I2C function
> > of the switch.
>=20
> There are still possible nit-picks, but it's good enough to be applied
> as is now.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks a lot! However,  no need to quote all the 1300+ lines for that
IMHO.


--HvLyCNN6/FfT9NAp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMmNgEACgkQFA3kzBSg
KbYzJxAAnvIf/2CGGk6vOeU7nzsiriYPVMp4bia4ytyRSdNyBWHV2IbeOsllwtEa
iKbJRORRtCz0IYibzCuWqoYiL0Nz2LX+1dG/hDsBE4kdC4CYri3IGbj6Z+TgUpuV
KWez2RW94h1LncSus+vGBhp/tJ6Yl9AJ73mZS6VkUf6CVRhKDBS+xCdUmougnKgT
QuNbjl/RC0tI6LronN5TuTnFAmZijSJyehLZBaY9uf55OBu6EzTzAT/nVh58iewm
pPwjf7myjh1A3bfDBWZBbcpku5TP1j/XsrofNC1mikMGIW6RmnFSGWX+oUq4/bDP
EgANSHgGB8Gz8rmg0x/m3lSP5VJK1CQirbWL/XGJV7/vrmMg770kvawv12E0DbLI
b4yBHRicw0GOrcVfHIyFuDFJifs65MjH4+SMlx/hMXtNcgL6CKezgBAOfTgHtWbG
BcxRfLWy6oX5Nq6RbPCe3pxvZcH0651O9SsGOtjlfDRaTfJ7Ul9sEVQROojn15Ep
kRwMl+ZDlAGfmJ+xZaauNeKLmMdsbmkKHbKse1rQ06MM1dX0h/4xjGl3sN4KnCvy
jXNMPMxcW3rFvkHPuPZkWpxGcoC4oDkjQNUsGsYdY+uQ3fCYClLUrfwQm+7qp+e7
cjcm8FajFKDB8NmPHY2L9wR6Q6pjIQgaYrGbGFP/7AudGM6f7LE=
=8x0N
-----END PGP SIGNATURE-----

--HvLyCNN6/FfT9NAp--
