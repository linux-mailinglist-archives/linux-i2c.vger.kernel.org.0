Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD517C4FFB
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 12:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbjJKKVb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 06:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbjJKKV3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 06:21:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D616794;
        Wed, 11 Oct 2023 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697019688; x=1728555688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/cYWT/4fm7jXsKnDZ4BU0yY6cJwahfXPWVnGMGjbcsM=;
  b=VIeWU83bLvIUuBBVheASpygqGR67OfO2po2QRufat1UAd7c771nPnieN
   qke+mncSsVYK2FsIruJRW+jU6K+XLX6bd7Zndjjg15/5+YWvJyJL/axyv
   TDovcmIDnajM4mJC3s8Yq+C8kOaNr4eChcBEGbrh38srpMuVamyvn8wrQ
   5+SUKrUW7toVZHTzGzIAucFQT3Id9Y+y3SsHVJHaK/h/2Y2t1t950ISAP
   ltHUsxBHyZhDNvTR8+lpJD6XUUoZDorRVxGf5QAhqGUL5zzlXwvKlzKjM
   osi32NGu6DUWogmTLWZ4uAjnXvCKBdxUE0sn0Sk3SRm/5hgGiab5I5AMJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="415673273"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="415673273"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 03:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897579128"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="897579128"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 03:19:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qqWLB-00000004an8-1jYb;
        Wed, 11 Oct 2023 13:21:21 +0300
Date:   Wed, 11 Oct 2023 13:21:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, oneukum@suse.com, wsa@kernel.org,
        andi.shyti@linux.intel.com, broonie@kernel.org,
        bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        hdegoede@redhat.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
Message-ID: <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 09, 2023 at 02:33:22PM +0800, Wentong Wu wrote:
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

This commit message is not true anymore, or misleading at bare minimum.
The ACPI specification is crystal clear about usage _ADR and _HID, i.e.
they must NOT be used together for the same device node. So, can you
clarify how the DSDT is organized and update the commit message and
it may require (quite likely) to redesign the architecture of this
driver. Sorry I missed this from previous rounds as I was busy by
something else.

Greg, please do not promote this to the next before above will be clarified.

P.S> Using _ADR and _HID together is an immediate NAK from me.

-- 
With Best Regards,
Andy Shevchenko


