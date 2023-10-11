Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1B1D7C595C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 18:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232609AbjJKQlt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 12:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbjJKQls (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 12:41:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8834291;
        Wed, 11 Oct 2023 09:41:47 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12BFC433C9;
        Wed, 11 Oct 2023 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697042507;
        bh=pp6h+Teww6WAGFU9BVf+1XuHU3fEDR07+S2e12wuiXI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bg7NOtUR+QdVpFPWbD/PanI4jiaGuI+4DJ7xihWEh6A7q3cB3jq/XXh5VTxWFPzRs
         9Rp2+rOLO/Pv9vRScTB77gtitd0kOwgfYsV7YbeoZDmFMHDicLzNyELz0bsDiJVu53
         AJyRxqsiWRSZG26xcMiOdRBkMR+PMiZSrOlWMBXQhhrR2LEg1ui2zGqVGLd4a5eahd
         KwyLJ0naFmjy3SjSBB+V+wgsv1tDUBmOg4QmMeK/h+qsHv6D2ZrdmsmGin/ZF0loMs
         ZBMD1cbOAQaCyvwUFv6Ic/S8Y4vsn5uy0zp8ms4FbJLSQ+et8Qr1DcFHDZux6FMVwr
         grxPmo5/8XhHQ==
Date:   Wed, 11 Oct 2023 18:41:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Peter Rosin <peda@axentia.se>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 3/3] i2c: mux: gpio: don't fiddle with GPIOLIB internals
Message-ID: <ZSbQSEpdIWUQiB5s@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20231011130204.52265-1-brgl@bgdev.pl>
 <20231011130204.52265-4-brgl@bgdev.pl>
 <b660e39e-24ad-c755-7962-aa56e8cdf4f7@axentia.se>
 <CAMRc=Mep2_u_JdGo_W1VsOR9ajscw49KA2gK7GN3K9j_rUEn_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2RmhSKGzY9QqH2Cc"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mep2_u_JdGo_W1VsOR9ajscw49KA2gK7GN3K9j_rUEn_Q@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2RmhSKGzY9QqH2Cc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bartosz,

> > > -/* FIXME: stop poking around inside gpiolib */
> > > -#include "../../gpio/gpiolib.h"
> > > +#include <linux/gpio/driver.h>

Hooray! \o/

> gpiod_to_gpio_device() will be used in at least 10 other places. I
> haven't identified any other potential user for
> gpio_device_to_device() yet but I haven't looked hard yet either.

Same here. Looked a little bit, found nothing.

Acked-by: Wolfram Sang <wsa@kernel.org>


--2RmhSKGzY9QqH2Cc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUm0EgACgkQFA3kzBSg
KbZbKw/9F0F2LTUIM4gQCeHMesmhkwWoXuUWFU15QPyGy8qOmP5GgkOQCu4Mw6IT
G4f84snezHVfiuSb0GOYlLnNeLrgdO944Q2m/dZiIAt53WfBs9yX2c/1Fu1Ca+Ik
cOno3Jzk+pv0A82H65ObxpgYMch8TUOsjy9YmKzchzwCt4McZkyGxK3inQrKWJmB
oPghllldo0MiT1/24I1kBSh2mThBrIBVlX6rS6os3ObJVpsVSZkm1Eu8BO2SuPkD
CsatEZ1xjNycr0zcoyXdat90wnsGOtNEtF3L8ChDy20oNrXQqcraM9KaoDKase12
joGg1jKdB1VPrx8ITyQGvp9brPDoRUfXgcor2aCRthqNABLYtRsLWHNH6/XWC/zH
iZ22vSg9r5IsZr7GZNxMpQWyXccBxAcqgCN0H5hquvalg+avvKCN6RPQC1KJ1hK+
Op4MlYt8nSQj6ymiiblOCS521p2o4uC6+/RBCkIBdlq3Pi4n/8PCR+5spbdupFQ0
NjcZ7+k0EXWWjMgHX2fCDCOYzhT+KYRXNWFyoCHgVGquL+sIGsuhcmBg9m5/0Ri/
o34c/Qq6MrDO3UQbvow8c80/4eTYxt3V5HKltrPmnYyNGt8Ft5L23hFHMSWA3sVd
aSlJOwdqQs2wGn18/B0W4Xtync902ueeDXuAkr8ZcOhlpsUYW1E=
=fwMz
-----END PGP SIGNATURE-----

--2RmhSKGzY9QqH2Cc--
