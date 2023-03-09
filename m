Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 730BE6B224D
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 12:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbjCILJX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 06:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbjCILJG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 06:09:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CDB2B2B6;
        Thu,  9 Mar 2023 03:03:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F137CB81EE0;
        Thu,  9 Mar 2023 11:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04666C433D2;
        Thu,  9 Mar 2023 11:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678359795;
        bh=EEI8XC3T4lIY5E4deVjQSw8EXc+PAG8USv+h2O3sz98=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bO9bpO/2rjQwsHgJGAbkVgmw+4LVVYZnk+9J54TZkrmlPqyXGTn056hP3r4uB2sBO
         JvbQVezljC9eLOh1/k7g3UhAfSNcbIfEi+wcLK1e4q/L5+1Kbad/EJDStwKpAsWZpl
         fRhrzMIVQQ/vX/K3k+U6+T1KpyJv+7KwHyCo7oBPvpHLQRzssgZ+Myy4+QA5/Qht05
         rdFdzNn3EKecvAFxX4P/nz7ZKKURPfDYPTC7j87bouJ9zgK2KAeaYM3/gnDoNzKv0k
         VVFeNO6+i1iYaWikFuORA34f6g187p0+ZjvY8gzYcOsyP/a1+i4y2B8rJYbbqM144u
         MN+sF01RWnQJg==
Date:   Thu, 9 Mar 2023 11:03:06 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
Message-ID: <8e3c16a7-1155-419c-9bcb-cc3e3630fe5b@sirena.org.uk>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <dcb805e1-2b48-481d-8e72-1b515c9d43e6@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pg1YqT2fV9QTsCXN"
Content-Disposition: inline
In-Reply-To: <dcb805e1-2b48-481d-8e72-1b515c9d43e6@app.fastmail.com>
X-Cookie: I will never lie to you.
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pg1YqT2fV9QTsCXN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 09, 2023 at 08:56:05AM +0100, Arnd Bergmann wrote:
> On Thu, Mar 9, 2023, at 08:10, Ye Xiang wrote:

> >  drivers/usb/misc/Kconfig  |  13 +
> >  drivers/usb/misc/Makefile |   1 +
> >  drivers/usb/misc/ljca.c   | 969 ++++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/ljca.h  |  95 ++++

> Why is this in driver/usb/misc? It looks like a normal
> mfd driver to me, and it evenhas the header in include/linux/mfd/

It was a MFD in the original version, Lee asked for it to be moved to
USB: https://lore.kernel.org/r/20230305103456.GF2574592@google.com

--pg1YqT2fV9QTsCXN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQJvOkACgkQJNaLcl1U
h9DL1wf/a2dDu6Nvh1itaRXIIzM8bHS3I6CUAvjpZvHjkD70ApwQyIYkSYBLppC1
E9nAPixro9tiOzGC9SAUY/Isq+xNytrdnyTy+Q0MItK4YtaloeUUCJRMKEfnp8zR
1RK0E8IKRniyi/I2ouwnwirTZKlfdnVmnViLTj1AzYYVQGPs6A666kGafHSJA+zB
v5U44i11KgCOTEbFK7FGwcPNNY/zVhT+FozdM+1DASvgGRKpCeZUGb/IW1IzHy7f
VUm2yvO6TVYBD2j+fnKJSK2pyRJ/eI62QIYAnVXr0QHySliSKFXJozpJJaUjfUaH
2NVjRNnn8ngaAKKz6u+LaEkzgmRi2A==
=/1FC
-----END PGP SIGNATURE-----

--pg1YqT2fV9QTsCXN--
