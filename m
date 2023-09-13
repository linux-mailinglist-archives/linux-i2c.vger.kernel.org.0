Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979EB79E271
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 10:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237278AbjIMIop (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 04:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbjIMIoo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 04:44:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A03196;
        Wed, 13 Sep 2023 01:44:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535D0C433C7;
        Wed, 13 Sep 2023 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694594679;
        bh=aJJCLiUbkRCcRoJVLk1mhA8Q0ZY2oyaqKQncAtNAau0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i7mFiz9CXvbIaRr8YXBVjNOKtRC/SSu+994BC4w8VRNxaD8Tx3U9I6XGtc9CVpNwL
         +y8xFvi7vvZt5zL5J0H8Z8heI3aYLkg+hoHMW+UL91zz/9LSSrsgTO25Vo8i2dqFNh
         06MU2wRf721XAx3Lp87LDDk6Erp15rbLTFApSjyXtdUH/Ilo1xf+tCq+ORzM+bZSjb
         kTLHWpaxol+p+uV3AhtHRCnGhuxgUIQu/WFDcbWS0mJgVg1vFz15a1xaG2rnmreJ+K
         adXC+ZHqcqTnsuH5JGSwLQyu7UpVHWqWux15pBGVadarZ6Bj3WUA6hlZp+cXSvJKRd
         iZtZpSLhV+4Eg==
Date:   Wed, 13 Sep 2023 10:44:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v12 2/4] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <ZQF2c/bKmU9/BDAx@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
 <1693546577-17824-3-git-send-email-wentong.wu@intel.com>
 <20230902181954.xgdth4flatyn6cip@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="R76JO3gO6y2NCsKB"
Content-Disposition: inline
In-Reply-To: <20230902181954.xgdth4flatyn6cip@zenone.zhora.eu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--R76JO3gO6y2NCsKB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> your comment here has been addressed. This commit depends on
> the first patch how do we get this in?

Wentong Wu confirmed my assumption that the auxiliary bus hides away the
dependencies. So, we can simply merge it into for-mergewindow AFAIU.


--R76JO3gO6y2NCsKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUBdm0ACgkQFA3kzBSg
Kbb01A/7BSCPiQ1ty+iGwuJKxyvlGe6KZFXj+qWmtf0xHpBcuKqSeW0w3iwDOfB/
1Vq3vM1PBjuuA7/q6eRFz6cdY2yodC2bbXm+dQ6VXPUSpzhl6wvRi6Wlc4jnRMfB
PazfkUGFSOxzcoTKXh5Wm2jJYIH4W45s/Wp0S+nv1q3PpcsI/MdSIc9im2AZjr4C
sMaonxkW7FQGqM0mse/z/LWFW8gjNNHIBoST8X58ecUkJGThfpqUXWBCYLdF7ljL
7xUWgdejms8g3KOR33Ldxj3my1+TBJ849KifZTaXHNnJ391W59DRBQmH6oMqdd4S
JPef3Ei5hjF4yvrqfrBAEScRy6qoPMr4UkBk1a+Ac+oOa7OvNPnP1JW1uOboLIUK
bQIAEBl9PYdsvcmGrCNUNNAeaZgG8YGVNV8pP85kO8XrGYHXBKkBLWeTTVj7Go0w
msBCAOoH8nvuxkjEB2x9UFOYH6HY249HsPj8bqMC7hZNFPfA3/3A3/4NOawISbpU
pHrsL+2YsjlJ4/s5GCWtQpFga3kUoTA+QkwUlOTU9YPcdQwRPUUyDnZhKvr2SQhq
KLccjV7y/hkLoCKn8nhH9K/z/gMxg2QCNO7PU5/S3qcqExSvFYtsx9QkXFVMbBeP
a2h7yhsb4TS4Wz1TIFEbotshtpKIoJgOiNKcUdW+mBwdLLLcTe0=
=Lzn5
-----END PGP SIGNATURE-----

--R76JO3gO6y2NCsKB--
