Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F33866C8FDA
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Mar 2023 18:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjCYRgd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Mar 2023 13:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjCYRgc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Mar 2023 13:36:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36423C677;
        Sat, 25 Mar 2023 10:36:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B63CB8077C;
        Sat, 25 Mar 2023 17:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEE3C433EF;
        Sat, 25 Mar 2023 17:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679765711;
        bh=pVCMfz9Whk8TRDT9N2ijtIAiUaWvnn4FaTJlJ5h3KFE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ncLFFKarpC2syU92y8wYt4AjreeLVsi6OJqaMMqIbQxgJDIMgdThvGzcDd7qdnV7x
         WGLeiMAVU7O/DV4Zvd6UIcnEPjbDhmeAItcHRJ7X6wqgsKzkMfg9VqR35OQLiU4N2A
         KVN9b73mLqmW6PHAxkiu3sfnFFFCNv0+MDQ8R+sc=
Date:   Sat, 25 Mar 2023 18:35:08 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Ye, Xiang" <xiang.ye@intel.com>
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
Message-ID: <ZB8wzPhwIDxuoHlH@kroah.com>
References: <20230325154711.2419569-1-xiang.ye@intel.com>
 <20230325154711.2419569-2-xiang.ye@intel.com>
 <ZB8fOTpD/uuexaV1@kroah.com>
 <ZB8u3wWTQhg4PvQe@ye-NUC7i7DNHE>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZB8u3wWTQhg4PvQe@ye-NUC7i7DNHE>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Mar 26, 2023 at 01:26:55AM +0800, Ye, Xiang wrote:
> Hi Greg,
> 
> Thanks for the review.
> On Sat, Mar 25, 2023 at 05:20:09PM +0100, Greg Kroah-Hartman wrote:
> > On Sat, Mar 25, 2023 at 11:47:06PM +0800, Ye Xiang wrote:
> > > This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> > > device named "La Jolla Cove Adapter" (LJCA).
> > > 
> > > The communication between the various LJCA module drivers and the
> > > hardware will be muxed/demuxed by this driver. Three modules (
> > > I2C, GPIO, and SPI) are supported currently.
> > > 
> > > Each sub-module of LJCA device is identified by type field within
> > > the LJCA message header.
> > > 
> > > The minimum code in ASL that covers this board is
> > 
> > As this requires ACPI, why are you not saying so in your Kconfig entry?
> I would add a `depends on ACPI` item on the Kconfig entry so that the
> CONFI_ACPI macro can be removed from usb-ljca, because our use case with
> LJCA currently needs the ACPI binding.

That would make more sense.

thanks,

greg k-h
