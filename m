Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 359E86C8FF4
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Mar 2023 19:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbjCYSFP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Mar 2023 14:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjCYSFO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Mar 2023 14:05:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0034ED7;
        Sat, 25 Mar 2023 11:05:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 46C3860C8A;
        Sat, 25 Mar 2023 18:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18ACFC433EF;
        Sat, 25 Mar 2023 18:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679767512;
        bh=EUEMPG4HsnS98aIG2nDota+4DpEQsu6IHnvJbfKJkPI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rRM+MBIjUHLi7NEzm6zKeTP+S7YESanh1T2RLfFDzGY8RFxJnVnECeZ6+RUb8Wk1N
         rD5uwmZ719UeudISPh1Xa8iFQKKb5xkZEBCSH83ARJ0/RDhJnK0fsftc9aOrKHNyE1
         +DmdZZKp6yr4PdNgz5Xig55xZTfN4ILn/8S2In+VfSCBlFZ8p0xkjY4y7ZUd8iGO6t
         4oLDnQSw5gnjMBEDzCdMy1ajc6vIwvqF+8nyCXXm/ex2cA/5PmuR5QDkB7JnL2yKJR
         jphOFGYCrLT01nTrcLZz+D4w3VYEjKOtOWVm9G1JHfFh2ySJtpi3BSRZkyP4W6jsKD
         81bktHDWEfvRg==
Date:   Sat, 25 Mar 2023 18:05:09 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Ye, Xiang" <xiang.ye@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v7 1/6] usb: Add support for Intel LJCA device
Message-ID: <ZB831a6F4A7qufqs@sirena.org.uk>
References: <20230325154711.2419569-1-xiang.ye@intel.com>
 <20230325154711.2419569-2-xiang.ye@intel.com>
 <ZB8fOTpD/uuexaV1@kroah.com>
 <ZB8u3wWTQhg4PvQe@ye-NUC7i7DNHE>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="I1JUvLiN+7x9W5nz"
Content-Disposition: inline
In-Reply-To: <ZB8u3wWTQhg4PvQe@ye-NUC7i7DNHE>
X-Cookie: Single tasking: Just Say No.
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--I1JUvLiN+7x9W5nz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 26, 2023 at 01:26:55AM +0800, Ye, Xiang wrote:
> On Sat, Mar 25, 2023 at 05:20:09PM +0100, Greg Kroah-Hartman wrote:

> > As this requires ACPI, why are you not saying so in your Kconfig entry?

> I would add a `depends on ACPI` item on the Kconfig entry so that the
> CONFI_ACPI macro can be removed from usb-ljca, because our use case with

> LJCA currently needs the ACPI binding.

> > What good would this driver be without ACPI enabled?
> Before, I just tried to make it compatible with other platforms that
> don't support ACPI but want to use LJCA device. But, We don't have
> this use case until now.

If it builds without ACPI then making the dependency ACPI ||
COMPILE_TEST will help improve build coverage for people doing
treewide or subsystem work.

--I1JUvLiN+7x9W5nz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQfN9QACgkQJNaLcl1U
h9Czwwf6ArYM8v1lofvQGzA3fN/lMF0ReqYQ8ak9S50cX4SEtxJf6V6NRY1edhF2
s7B8J/EBXct79tSjmEwAns4JjXlmRHl6ol+k0uRwTV45xjQKnrFgl/Jo/qz54jHS
NICX0Z5a2X/ivC8hZFKHYhEGfd1WwH1TJK1VmJLXoWwaXYyAem2sOXDZjAVIX5v+
oxk7Mt+CuqvIHR+UvazsQrL6y8FPEYHZg4VYQa9vI/PIiPEEotBGVluOgJLdCPWh
0pRr2+qDRA72Qfi7ftOBjVh5v56xLGazodEVjkcF6GrzNVGoJkyb9KokSIcB2yJp
Jkp5hspCPznPJXsgr7TMFH70wkCYQg==
=Nq0E
-----END PGP SIGNATURE-----

--I1JUvLiN+7x9W5nz--
