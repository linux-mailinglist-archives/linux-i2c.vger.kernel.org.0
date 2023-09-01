Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C45B78FFA4
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 17:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbjIAPFA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 11:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243098AbjIAPFA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 11:05:00 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D9D10D2;
        Fri,  1 Sep 2023 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693580696; x=1725116696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4CyzzoubUESIDkAYvz+WoP396Qy3+MhZcGKRw8iCwoQ=;
  b=CKaOmpH3NVBF0nwT1vKLfktyFPu+ldH922NLbX2FEp8ZlSg0PO7LzXdc
   o8OOORJaMV8qFgtcH+O+tO0qsDp+k3Kr3tE/FlEf7sVh6U+aouUh0I+Qp
   cxHfrvmP4/UstZQs3VKPFLK1USrc1ISFa3Upwo4dhML2h6cZEF7CSgFRt
   n6y3bZ1ETov42cJjjBMPk6255zImh4yOS34GHjjeB1xX5FmE7gMZMVhiW
   GFOAyn+LR/4/ogotZlUmEarF5PnVaNSzdYo2p8c6sVtes1TChvOoZpp72
   IYPHTgElQJE7Akkx2szkzdvpGVxjB6zYx/04kmXHAxhvpwMgbYg1D5PCH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="376167646"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="376167646"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 08:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739960122"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="739960122"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.59.74])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 08:04:39 -0700
Date:   Fri, 1 Sep 2023 17:04:36 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v12 1/4] usb: Add support for Intel LJCA device
Message-ID: <ZPH9hLjQ9GrmfvXh@ashyti-mobl2.lan>
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
 <1693546577-17824-2-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1693546577-17824-2-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wentong,

On Fri, Sep 01, 2023 at 01:36:14PM +0800, Wentong Wu wrote:
> Implements the USB part of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA).
> 
> The communication between the various LJCA module drivers and the
> hardware will be muxed/demuxed by this driver. Three modules (
> I2C, GPIO, and SPI) are supported currently.
> 
> Each sub-module of LJCA device is identified by type field within
> the LJCA message header.
> 
> The sub-modules of LJCA can use ljca_transfer() to issue a transfer
> between host and hardware. And ljca_register_event_cb is exported
> to LJCA sub-module drivers for hardware event subscription.
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
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

looks good:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
