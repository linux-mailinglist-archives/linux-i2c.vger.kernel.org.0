Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E94AA6B8D80
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 09:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbjCNIhj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 04:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjCNIhg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 04:37:36 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D3D7302A;
        Tue, 14 Mar 2023 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678783034; x=1710319034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7W0I/PhY7JPekbwd4aR0lUx73mBpPX/p3TSCW0u/h7I=;
  b=AP9LDq+E+Yu/RtcLsW2KVe17FDB95yPHBb+XJxk1doSnbPoyYeBjUAmD
   gWKLo2ZwWdDoeO4UoseuFiT3qtRtTYtPjQPmM33NEHghXzpOFxtE3piJa
   HREJV2Wb7iBITWBBz49nJY0GBRHRMJx6T8vYYfzEA+1PxrJaeie1hi9+3
   Lk5ZaiLriMYWHgj49ck7mDH2AcCpyPP4+vseH4pWnrOXyW4gZV/msMxEb
   PgSKKt5dqAGRgBx/hWC/qQSGA4RBzCuIdXAKbydnUmIS+DCxpdg8rjlZ8
   C4U8IfVeDRXPyr/4iUr7ip8xssTX7OHEzGw2CQej5NP3th/EzXy+y9wny
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399954398"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="399954398"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 01:37:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="822283207"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="822283207"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 14 Mar 2023 01:36:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 14 Mar 2023 10:36:57 +0200
Date:   Tue, 14 Mar 2023 10:36:57 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Ye, Xiang" <xiang.ye@intel.com>
Cc:     Lee Jones <lee@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, andriy.shevchenko@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Message-ID: <ZBAyKQwnQ8fxHRuU@kuha.fi.intel.com>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
 <20230312190435.3568212-2-xiang.ye@intel.com>
 <20230313170341.GV9667@google.com>
 <ZBAqTqZEDz/vAwVC@ye-NUC7i7DNHE>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBAqTqZEDz/vAwVC@ye-NUC7i7DNHE>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Xiang,

On Tue, Mar 14, 2023 at 04:03:26PM +0800, Ye, Xiang wrote:
> > Please don't use the MFD API outside of drivers/mfd.
> > 
> > If you wish to use the API, please do.
> > 
> > Strip out (only) the MFD parts and move them into drivers/mfd.
> I have no idea about how to split MFD parts out from this driver
> currently. The MFD part just have mfd cells filling and the call
> mfd_add_hotplug_devices to register mfd devices. How to module them
> as an independent driver?
> Would you give some hints or recommendations?
> 
> And I am a little comfused about where this USB device driver should
> be put to (drivers/mfd or drivers/usb).
> 
> As far as I know, where a driver should be put is based on what
> it provides. This driver just do some urb package transfer to provides
> multi-functions, such as GPIO function, I2C function, SPI function.
> so it should be under drivers/mfd folder. Please correct me, if
> something is wrong. Thanks

You don't really seem to get any benefit from MFD. Perhaps it would be
more appropriate and clear if you just registered auxiliary devices in
this driver. Check drivers/base/auxiliary.c.

thanks,

-- 
heikki
