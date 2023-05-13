Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E71701556
	for <lists+linux-i2c@lfdr.de>; Sat, 13 May 2023 10:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbjEMIv4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 May 2023 04:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjEMIv4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 May 2023 04:51:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3E449C0;
        Sat, 13 May 2023 01:51:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B081361C33;
        Sat, 13 May 2023 08:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B68C4339B;
        Sat, 13 May 2023 08:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1683967913;
        bh=IH5vicqvrPOYUBi1HJ5D3GZ4J4lLH8IlZCxqQG06Cgo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OtaOoZQfWI10UcINkOrUvS2E384DY5KyHtCiK/03pKKUnj8MNGO0sxlnlcYueb9pW
         gcPHxioaRXBmdWh/iIKC7RovIbtoS73jLPkr8I2SXBk14RCOGbITfKHHdzRB/o6tiz
         bW+8ebY+wGcS/1C33BGGlOXnpxHojp9vzcbzXmBk=
Date:   Sat, 13 May 2023 17:50:13 +0900
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v8 0/6] Add Intel LJCA device driver
Message-ID: <2023051318-anchovy-sincere-65e3@gregkh>
References: <20230511175844.185070-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511175844.185070-1-xiang.ye@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 12, 2023 at 01:58:38AM +0800, Ye Xiang wrote:
> Add driver for Intel La Jolla Cove Adapter (LJCA) device.
> This is a USB-GPIO, USB-I2C and USB-SPI device. We add 4
> drivers to support this device: a USB driver, a GPIO chip
> driver, a I2C controller driver and a SPI controller driver.

I am sorry, but you have not followed the required Intel-specific
requirements for submitting code like this.  Please work with the Linux
Intel developer group to resolve this issue and do it properly for your
next patch submission as I can not take this one for this obvious
reason.

thanks,

greg k-h
