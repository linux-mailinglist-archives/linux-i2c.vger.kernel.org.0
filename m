Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB3E6B1FF4
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 10:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjCIJ0g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 04:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjCIJ0e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 04:26:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C038DFB4A;
        Thu,  9 Mar 2023 01:26:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 09067B81EAE;
        Thu,  9 Mar 2023 09:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5AEC433D2;
        Thu,  9 Mar 2023 09:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678353990;
        bh=9b08XN45Lh+BMI8HPZZB/eyAjR+ruGRTYkmxSuHREVs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u+kIr0i6SFGucqoNW8Gik1AsvNuVPfARYoXDkaNxyobYpC9MRrS4CU+pj4RWReEjh
         MQU8h5iJjez0FeQ/AxbT42VpSrZJmosmE9IeqsMye4sQCG4pyM4oBRslU7T2JX1cE0
         7TJCwXD2UogE8y2mgbp+xkgCNRdgK/omKmAAFbuQ=
Date:   Thu, 9 Mar 2023 10:26:27 +0100
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
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
Message-ID: <ZAmmQ/yKYnOG7xOS@kroah.com>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <ZAmPjfH6rA0pbiUa@kroah.com>
 <ZAmimLMY49ktjagX@ye-NUC7i7DNHE>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAmimLMY49ktjagX@ye-NUC7i7DNHE>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 09, 2023 at 05:10:48PM +0800, Ye, Xiang wrote:
> Hi Greg,
> 
> Thanks for the review.
> On Thu, Mar 09, 2023 at 08:49:33AM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Mar 09, 2023 at 03:10:56PM +0800, Ye Xiang wrote:
> > > This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> > > device named "La Jolla Cove Adapter" (LJCA).
> > 
> > Then why is this called "mfd" in the subject line?
> Sorry, it's a mistake. I forget to change mfd to usb in the commit message
> because I just move the ljca.c from driver/mfd to drivers/usb/misc according
> to previous review comments[1]. And I will address this on v5.
> 
> [1] https://www.spinics.net/lists/kernel/msg4708451.html
> > 
> > >  include/linux/mfd/ljca.h  |  95 ++++
> > 
> > Why is this .h file in the mfd directory?
> It's a mistake as well. Will address it by moving include/linux/mfd/ljca.h
> to include/linux/usb/ljca.h.

Why do you need a .h file at all for such a tiny .c file?  If you don't
need it, don't have one please.

thanks,

greg k-h
