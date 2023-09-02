Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8505E790911
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 20:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjIBSOf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 14:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjIBSOe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 14:14:34 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA65CE0;
        Sat,  2 Sep 2023 11:14:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C9163CE25BC;
        Sat,  2 Sep 2023 18:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800FDC433C8;
        Sat,  2 Sep 2023 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693678467;
        bh=NjDSde3+ZlwJWMKvvdI+LCEk2p4YeVNbEdOgXC0cyuE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LRvi/289NBl6Hc3gTh7d9Y/FB523WMCjEfq+ZItCcgbRuxOA29Lv00kN6j83/yLaF
         MUePw++s9hzkT8KyIOE2z3hifc5mH2KI8lTF2l+OmBOwc7fjwMrkSxlpSnzjdgqomX
         TywTb1FYsz0I/MVJ9TEYtdksHQKYDzABtusE24hZlyiy90LWElnSZM6mQb+hGy38rN
         JmEzE0jlGdRYRGj4Pu7zrp8jrUs8w2cIksvTorIvGxTz+5Nhj2pvdypMD0c4+lac48
         yflakzXzuQVIoBWrFi29SYcSCZCS8wqc8DlzTKFKx6IGGVjJAWoxBgnMr1pJIYCs37
         zyESHyMP1q/yg==
Date:   Sat, 2 Sep 2023 20:14:23 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     Andi Shyti <andi.shyti@linux.intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
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
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: Re: [PATCH v12 4/4] gpio: update Intel LJCA USB GPIO driver
Message-ID: <20230902181423.an2fqjyzsndlbafn@zenone.zhora.eu>
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
 <1693546577-17824-5-git-send-email-wentong.wu@intel.com>
 <ZPIA2mMtNRakNqqd@ashyti-mobl2.lan>
 <DM6PR11MB431665283C408587AA793D748DEBA@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB431665283C408587AA793D748DEBA@DM6PR11MB4316.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wentong,

> > On Fri, Sep 01, 2023 at 01:36:17PM +0800, Wentong Wu wrote:
> > > This driver communicate with LJCA GPIO module with specific protocol
> > > through interfaces exported by LJCA USB driver.
> > > Update the driver according to LJCA USB driver's changes.
> > >
> > > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > 
> > I am not understanding this patch... Looks like a collection of random to
> > relevant changes you did in gpio-ljca.c.
> 
> This patch is following the changes of usb-ljca, from platform_device to
> auxiliary_device, and ljca_transfer API's change. And others are mainly
> coding style's change. 

then please divide this into smaller commits. Cosmetic changes
should be in separate patches, and functional changes in
different commits. They should not be mixed together.

> > I'm not able to review this, can you please split it in minor changes?
> > 
> > Meanwhile the previous patches should be able to work without this one, right?
> 
> I don't think it can work without usb-ljca

I am actually asking about the reverse. Are we confident that
patches 1, 2, and 3 function correctly without this one? I didn't
notice any dependencies.

If that's the case, I would suggest removing this patch from the
series, merging patches 1, 2, and 3, and then addressing this
patch separately. It can be properly divided and expanded into a
more comprehensive series.

Andi
