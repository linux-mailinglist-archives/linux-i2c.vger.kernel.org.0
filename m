Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5DBC7A3537
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Sep 2023 12:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235782AbjIQKnJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Sep 2023 06:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjIQKmh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Sep 2023 06:42:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61920FA;
        Sun, 17 Sep 2023 03:42:32 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3296DC433C8;
        Sun, 17 Sep 2023 10:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694947352;
        bh=uSfg3tER6+j89axfxvuCcnowTaPBQHQ2GJjcyGYRnkA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IXk8MWP8NSwV8W1RA0pAxzE5jt3FFUT6pZSAfJdmJ8naj/ptEj63YJ/JbgSGEklU6
         pVUtYck8vQukBf9Y4pqXYYFIEfA9oOb7/XQIoSrTTCniEoXKRYPR9+zzzQEu0/iAd7
         vgwaDP2b2YvQC8qHHcTV37GdaDotSpi014kpUET4=
Date:   Sun, 17 Sep 2023 12:42:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, hdegoede@redhat.com, maz@kernel.org,
        brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
Message-ID: <2023091704-nape-coconut-af6c@gregkh>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 17, 2023 at 02:53:32AM +0800, Wentong Wu wrote:
> Add driver for Intel La Jolla Cove Adapter (LJCA) device. This
> IO-expander adds additional functions to the host system such
> as GPIO, I2C and SPI with USB host interface. We add 4 drivers
> to support this device: a USB driver, a GPIO chip driver, a I2C
> controller driver and a SPI controller driver.
> 
> ---
> v19:
>  - add v17's change which v18 doesn't apply

I don't understand this changelog line at all, what do you mean?

> v18:
>  - rebase patch set on top of Linus' master branch (57d88e8a5974644039fbc47806bac7bb12025636)

Why?  What required this?

As Marc says, you are sending this way too often.  I'm going to move
this to the bottom of my pile and get to it in a week or so as with the
constant resends, there are way more changes that were sent before yours
that need to be reviewed.

thanks,

greg k-h
