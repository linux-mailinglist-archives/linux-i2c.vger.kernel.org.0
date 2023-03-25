Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F81A6C8F6B
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Mar 2023 17:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbjCYQUP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Mar 2023 12:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjCYQUO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Mar 2023 12:20:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8353EF97F;
        Sat, 25 Mar 2023 09:20:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E307E60C82;
        Sat, 25 Mar 2023 16:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA234C433EF;
        Sat, 25 Mar 2023 16:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679761212;
        bh=RgI9q5WzQBkRWeNGghQLt89IvUaWcS8RWnyJkhSvJi4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LL4+uqFV4y7Qqie7uM1+j08QWkZCzZye5kNta06r3PzK/adhocna4hPcbdNfuGfGj
         //Wss/eotWxBgVN5M18iRCjemSQLOuB437D0+101miMlzB3jVgwOIIHdU3//YDHuKv
         Re/GmLEP2qaxnDFjybDC+a1gxPqydrWJDCv8U0Jk=
Date:   Sat, 25 Mar 2023 17:20:09 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v7 1/6] usb: Add support for Intel LJCA device
Message-ID: <ZB8fOTpD/uuexaV1@kroah.com>
References: <20230325154711.2419569-1-xiang.ye@intel.com>
 <20230325154711.2419569-2-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230325154711.2419569-2-xiang.ye@intel.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Mar 25, 2023 at 11:47:06PM +0800, Ye Xiang wrote:
> This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> device named "La Jolla Cove Adapter" (LJCA).
> 
> The communication between the various LJCA module drivers and the
> hardware will be muxed/demuxed by this driver. Three modules (
> I2C, GPIO, and SPI) are supported currently.
> 
> Each sub-module of LJCA device is identified by type field within
> the LJCA message header.
> 
> The minimum code in ASL that covers this board is

As this requires ACPI, why are you not saying so in your Kconfig entry?
What good would this driver be without ACPI enabled?

thanks,

greg k-h
