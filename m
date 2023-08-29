Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4836778BF6F
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Aug 2023 09:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbjH2Hnj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Aug 2023 03:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbjH2Hna (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Aug 2023 03:43:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6709A139;
        Tue, 29 Aug 2023 00:43:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0524A63C36;
        Tue, 29 Aug 2023 07:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B01C433C9;
        Tue, 29 Aug 2023 07:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693295006;
        bh=s8MNwVsNOgH66U7s4NjZvYCTL5Nxs7ECZ3KG9h92r4g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ciTvHp2pS9NV8185npCHcL4wqFA0+pY0ZF96naORa+nPcWKJvAXXt76BCe1fcW+NQ
         JADkaDd6hRFlfE58+VBWuQslj7Ix3ozNt20893/1EbwqjdoCkrLSq0biyggz8OpivI
         mtS+rGwc/FI9xDvJIg/sEXKBaLHZzd1mR38iy477pEBxCS6JZBmL80ALmHWHBsh/ms
         YayTA+Y20LmUr30ror6IMwhVbqRyUuEKNHyplNC7zdTJS9lSm46bzAQHJqRN/j9CJS
         cawVd/zv+zm1tJuNtA0DvyQJOQU2QXL76BqPRMM+v+IKBdO653RrKMpcduegomJFiF
         Dq4CbsMBPziVg==
Date:   Tue, 29 Aug 2023 09:43:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: Re: [PATCH v10 2/4] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <ZO2hm7rQonLyljud@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Wu, Wentong" <wentong.wu@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
References: <1693091643-20867-1-git-send-email-wentong.wu@intel.com>
 <1693091643-20867-3-git-send-email-wentong.wu@intel.com>
 <ZOz0bgJUZuAcUBWf@ninjato>
 <DM6PR11MB4316FC089596F44FB02314B18DE7A@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EUdPpm9z3og+Dz95"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4316FC089596F44FB02314B18DE7A@DM6PR11MB4316.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EUdPpm9z3og+Dz95
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Actually it's about the method 3 of instantiate I2C devices described in
> https://www.kernel.org/doc/Documentation/i2c/instantiating-devices
> and it's not preferred wherever possible. And below are the definitions
> about i2c adapter class, we only have I2C_CLASS_HWMON class tested,
> so just put it here.

Yeah, as I mentioned before, it may make sense for a USB based device. I
just wanted to make sure you did it intentionally. Keep it.


--EUdPpm9z3og+Dz95
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTtoZcACgkQFA3kzBSg
Kba+TQ//Vhun0B/rSraRakVvbSlgBws8I9UZ3y5wYsGshJ7Y0tQVkr2vyKZvQHWq
8xWbDoAbxkV2g4/jJG6zmSMV6FR6Vs88HgOGN9fGVFbON2uoieJhR+u/4pe1BmZK
jhpQulgLqQCeJGGmb4zk927roooFp3GRIenuG8JXZC4YoSNrZk7hpuWvp8h9yhdb
M/2ZsXRp8kL/29eQk4y5WWtsiFZ7BQNbLfVbOILzGUM0Tw9jetC0v/gtrFt5+INQ
4zUWlcIgCdxYrRtmUIgrXvWNNf5ymqmDk1M7oWtV51VqcKDBNQUoc+gXZzxYzgbt
eW4euo8ai5n09ch73mHZ9OPIH3zh44nTLEKBOHLGGNwbr4HkSuGJMIIjadgW5E7/
K0J3g7tS1K8/LylKYHFXLvtKU5IHJyc6NwOC67Fe1C39mYDlM2bmXmgEZ3aTwgJk
kkdoRbNSTxzfOdm3qYbn0ZfY/4ZZSHgCkN5cqes9qELLsm/aYoVJllntgAZh+DFq
4XVkMUyWk0pGCEKFJeLwDQGHeOS3l3WYtVX8AbDwOlxMXIWLJi1EJ+biwCRxqyh7
nxh/SKb4hMkoJMPLKYaLjDK2BzzCBD8TfqVgMeG6qDskyogIyyNhZLhBBPwXM5RE
27WHvLV9EThFbu9oe53KvXlSBAWrdeXMpKh3cC+2gBtmevsc3AQ=
=rPmf
-----END PGP SIGNATURE-----

--EUdPpm9z3og+Dz95--
