Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F11646AB952
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 10:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjCFJJL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Mar 2023 04:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjCFJJK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Mar 2023 04:09:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE7E1985;
        Mon,  6 Mar 2023 01:09:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 389DA606A0;
        Mon,  6 Mar 2023 09:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B99EC433D2;
        Mon,  6 Mar 2023 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678093748;
        bh=4CQ+7V5IKk6e8eq1xtI0aIOQ48igDukd8H1orLjLpLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TrY/K48EzxywXdcyXJ3sQoP5+IC0Jon20pOHTcyoX7Ug7vKsFhfdJskbHVORuyhFx
         95K408pF2i8Y6ftRDyX06uK2noRGVADF5bq5DA3Ry8C10kSZg+6tYlAqiVX40YREjx
         NhloeI/v45hZRjvubeLzdFMphaLqDkFK0KDEEt4oS1/bpCDF4RuJMB5JBEO340y4in
         /0hhFHjN1XW2wR4F+RooHJMUujn8aWqmCV8D7KZRY23Z0fuhMs42bM9vz6NghwG2oi
         mxpSLAqb3s8Bmdg7j3Pba5+nABF7FjM3yhZ1mO6rnuTg1JHQC8B8ixGod3GZvZZqrY
         ku49lsMZh7WjQ==
Date:   Mon, 6 Mar 2023 09:09:01 +0000
From:   Lee Jones <lee@kernel.org>
To:     "Ye, Xiang" <xiang.ye@intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH 1/5] mfd: Add support for Intel LJCA device
Message-ID: <20230306090901.GC9667@google.com>
References: <20230219183059.1029525-1-xiang.ye@intel.com>
 <20230219183059.1029525-2-xiang.ye@intel.com>
 <20230305103456.GF2574592@google.com>
 <ZAVWMp2LyxY7w6N0@ye-NUC7i7DNHE>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZAVWMp2LyxY7w6N0@ye-NUC7i7DNHE>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 06 Mar 2023, Ye, Xiang wrote:

> Hi Lee,
> 
> Thanks for the review.
> On Sun, Mar 05, 2023 at 10:34:56AM +0000, Lee Jones wrote:
> > On Mon, 20 Feb 2023, Ye Xiang wrote:
> > 
> > > This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> > > device named "La Jolla Cove Adapter" (LJCA).
> > 
> > The "USB part" should live in drivers/usb.
> What about putting ljca.c to drivers/usb/misc?

Sounds reasonable to to me at first glance.
 
However, that will ultimately be up to the USB maintainers.

-- 
Lee Jones [李琼斯]
