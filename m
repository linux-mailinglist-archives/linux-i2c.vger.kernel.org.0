Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8133D7B2D41
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 09:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbjI2Hvv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 03:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbjI2Hvv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 03:51:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2CB1A7;
        Fri, 29 Sep 2023 00:51:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67638C433C9;
        Fri, 29 Sep 2023 07:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695973908;
        bh=iyIPI73TgggZFG6vSBaLbOmkRMMZ6arLpAx8an8tRTQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BdpwaCcdJvBumfQ3WeJkEtODzou/TDJNph1C0slLKec8ISoKLC312jrmBDstUtuLB
         246SylgFSd6SlTAg2WqtQ5IL77yglU1a5bIEVTTJLjG2Aj1V5zyUYcG6lX7qabJhfz
         7oJKZidPmkErVJT6b+YDumossOtwbAiE5gAa8JZs7KRIrfaOV3ZCbvL9oVofoEvIdi
         a8A2V6+XxeQwyb/SeGLQyiktz0sVMaP3sP3DnwN+eV22U1xcgHREEpD1Ic1fNlveky
         FcRZhq2xvu2UhZqdiGbeWSQJnNjhISS9s6SdydtAfWWYhubMrdr8EDSPvznP7iLGJw
         gDmks5yiWvlFQ==
Date:   Fri, 29 Sep 2023 09:51:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, kfting@nuvoton.com,
        broonie@kernel.org, linus.walleij@linaro.org, hdegoede@redhat.com,
        maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v19 2/4] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <ZRaCEI5EZuSx5/Lx@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        hdegoede@redhat.com, maz@kernel.org, brgl@bgdev.pl,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
        andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com,
        zhifeng.wang@intel.com
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <1694890416-14409-3-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YCx/WuvTs1tSucgW"
Content-Disposition: inline
In-Reply-To: <1694890416-14409-3-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YCx/WuvTs1tSucgW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +static u32 ljca_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C;

You could use this here to make the driver way more useful:

return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);

Except I2C_FUNC_SMBUS_QUICK, emulated SMBUS calls work out of the box.

For I2C_FUNC_SMBUS_QUICK, you need to test zero-length transfers indeed
('i2cdetect <busnum>' will use it and is a good testcase). Which would
be good anyway, because if it is not supporting zero-length, we need to
add an adapter->quirk flag as well.

We could add this incrementally, but it will be better to have this
correct right away. i2cdetect is a good and simple testcase.


--YCx/WuvTs1tSucgW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUWghAACgkQFA3kzBSg
KbY/ixAAowr8Fus+jYGKBQQGDqTL5HX4MCFiPibs8Uq0yRLrqiArAdwf0ERVpM4s
1mXpq4mA3W2cF8r1p5IrzbIsA1Zo31EmESC3KbqtPyNxvV5yOP6tqXsleODQ1fv3
eABFlCftQLjgvY6hYSaP7yjmSpQ9xiLhXUNl3CGH43kyKrJ7O4VXHR130NrDpC0q
YBbalXxrtY1M2zDBDjVznMF401w7KgGw345x93W0XztZG+queVmSKlzXK9ereUZ5
1jI9rW+2T94PwDEp/H7i2+ACbnIoPfIam/iSkwg+Myr7E7erpUBHy1kWRRbtOgVV
8Egk78ynig4pRSCplfVx4qQX9D8sC2m2NJrtY6dpWXE2K1Eka6HE+CcfDqbhoXT0
Ig4geaTomjVDdHR3/48uvu3ArEtM9OJi0EPnmXefhvoEKwmVaBEoTt96HIXYL7YN
28FYmrlZQFK7W7CK9AegOgQZp15Ghi45syaA8zsA6Qea8p4LEUK7bV+6QCfllwlI
BQpPVnqd7uqbshDGXFyhLMB/fQkDarM9nOy1Qs4D/Endva9deUz2Jo4V0vYxoDtJ
igjeYqG+ZEflIbEDa7PmeU6S+SarpC0aqcnOzaYB1T0Ohta8d88Gv5UkfYkmkjTW
uBTMWcZOfyaqqg7uLNENi0uXPSFWZzmWnieoB6c/cq9iB+j7a0A=
=+eIl
-----END PGP SIGNATURE-----

--YCx/WuvTs1tSucgW--
