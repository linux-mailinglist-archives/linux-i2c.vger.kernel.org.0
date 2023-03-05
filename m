Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2FD6AAF1A
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Mar 2023 11:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjCEKfK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Mar 2023 05:35:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjCEKfI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Mar 2023 05:35:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E439125A7;
        Sun,  5 Mar 2023 02:35:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EBE47B80A4C;
        Sun,  5 Mar 2023 10:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45133C433D2;
        Sun,  5 Mar 2023 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678012503;
        bh=kkAo0RWQbrnXSYn3lBtTlTDr7m0uhLYL3o/jC1gwPMI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SeXfxStGobQ1hLFDEsNKBdnTkJmIseIFIIVrEdrFb4/drzfNj8nddBwLQ9bDV2yFE
         qia0LIo6SgIRdwDFNartZ0/N7cCdGu/usWvGlmFM65qCl0tsHyDWMPhZVI/yD4qQOy
         oC//1TyrSaAxeJgNz1hZj7hrio52NJxWEWMUHuoc1BAssF260SZ7ul/i/bxOx3Im8v
         bgeBs2aVkaI60fPM5v1lhMRG3nnMzHy1t9QFRwbPzRUHuheuelH7naEUpPbmXoisQv
         gvxlLVpidNPMX383CY97/RDYIxPgcy3XhB3QR8yjdBiLw58ZnXlwagNRncTlULrq4A
         ymlcK7T7CWX0g==
Date:   Sun, 5 Mar 2023 10:34:56 +0000
From:   Lee Jones <lee@kernel.org>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, srinivas.pandruvada@intel.com,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH 1/5] mfd: Add support for Intel LJCA device
Message-ID: <20230305103456.GF2574592@google.com>
References: <20230219183059.1029525-1-xiang.ye@intel.com>
 <20230219183059.1029525-2-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230219183059.1029525-2-xiang.ye@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 20 Feb 2023, Ye Xiang wrote:

> This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> device named "La Jolla Cove Adapter" (LJCA).

The "USB part" should live in drivers/usb.

You can use MFD to register each of the components, but all of the USB
functionality needs moving somewhere else.
 
> The communication between the various LJCA module drivers and the
> hardware will be muxed/demuxed by this driver. The sub-module of
> LJCA can use ljca_transfer() to issue a transfer between host
> and hardware.
> 
> Each sub-module of LJCA device is identified by type field within
> the LJCA message header.
> 
> The minimum code in ASL that covers this board is
> Scope (\_SB.PCI0.DWC3.RHUB.HS01)
>     {
>         Device (GPIO)
>         {
>             Name (_ADR, Zero)
>             Name (_STA, 0x0F)
>         }
> 
>         Device (I2C)
>         {
>             Name (_ADR, One)
>             Name (_STA, 0x0F)
>         }
> 
>         Device (SPI)
>         {
>             Name (_ADR, 0x02)
>             Name (_STA, 0x0F)
>         }
>     }
> 
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> ---
>  drivers/mfd/Kconfig      |  13 +
>  drivers/mfd/Makefile     |   1 +
>  drivers/mfd/ljca.c       | 977 +++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/ljca.h |  95 ++++
>  4 files changed, 1086 insertions(+)
>  create mode 100644 drivers/mfd/ljca.c
>  create mode 100644 include/linux/mfd/ljca.h

-- 
Lee Jones [李琼斯]
