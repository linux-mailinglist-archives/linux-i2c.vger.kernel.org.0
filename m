Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26DD77BDCD1
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Oct 2023 14:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346685AbjJIMuo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Oct 2023 08:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376601AbjJIMug (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Oct 2023 08:50:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3A348F;
        Mon,  9 Oct 2023 05:50:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925C4C433C9;
        Mon,  9 Oct 2023 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696855833;
        bh=am1r6BTG/XmXtORcHF6USty0gqCaUscj0/AmTY4W23A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OvK3rnOotvxVgvWV5m5YztYaMp2e1yGXx1dGKQ2ORtvR9KAO92CJJAkD6pZHwmRi/
         eg49JuXXQkuAl4Gwno+ECJVWLVVXnwNWX318d8s4p7XqIFR5NwIrNi+W5aBgwU99NP
         s7YF4eomr70lkkOCcSggSGbSh87R6WLg38KuoZgsGLufrY4rqavHZw0dt9xVOgqH6n
         K/fvGLhz21qqZO4K2/oel5ypPIfMRsmLgHiuvFasSVq9Rwjfg8SrpNHXsqmGTLY4eS
         nQImGOTjYxFWAK2kORMmef+Dyh3LLQUsON1l0JvHXdybTG/dKJlvW9dcWfESIV8EUq
         EyeTSQNh5Tqhg==
Date:   Mon, 9 Oct 2023 13:50:24 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, oneukum@suse.com, wsa@kernel.org,
        andi.shyti@linux.intel.com, bartosz.golaszewski@linaro.org,
        linus.walleij@linaro.org, hdegoede@redhat.com,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 3/4] spi: Add support for Intel LJCA USB SPI driver
Message-ID: <6084346e-48d7-4f70-b49a-46b5aeda2c9a@sirena.org.uk>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-4-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="et45qnm/EusVI4JP"
Content-Disposition: inline
In-Reply-To: <1696833205-16716-4-git-send-email-wentong.wu@intel.com>
X-Cookie: What is the sound of one hand clapping?
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--et45qnm/EusVI4JP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 09, 2023 at 02:33:24PM +0800, Wentong Wu wrote:
> Implements the SPI function of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA SPI
> module with specific protocol through interfaces exported by LJCA USB
> driver.

Reviewed-by: Mark Brown <broonie@kernel.org>

--et45qnm/EusVI4JP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUj9xAACgkQJNaLcl1U
h9AHpAf+Lcv/GJXaWMla2DduP+3qig0ZxjVPLwTRsDGNWY7btA80cDUxQBWMjvRC
hDzi621fgKj33PT6wws2CVq+GwZhhLAYrtSh6+0bpXWusY2TRIwLxnfo96cKN6tk
p5T8hdfRGYUyFZEAXtWBGd0+5aObdIWc/a+CtwzmXqpjY7+YHLnD4Fc+2HqTapyL
EZ2nhADF0KSaRkJ/VLtSSIj+Rr+DHPYVG2Zzsm4i3rALtrwL3DFoBK9ZDmhQ7/GN
Dhyf3HAcc6kGD/10SCbRtJVN3nzzTEm+1yVrPGQUT65BK0YsjzVIp0KS1s5mKb1s
iYidXdqI15muRrJUH6XSUjr21nkEgw==
=hHSh
-----END PGP SIGNATURE-----

--et45qnm/EusVI4JP--
