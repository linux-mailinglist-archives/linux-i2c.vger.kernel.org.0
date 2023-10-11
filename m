Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E89477C506D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 12:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbjJKKoE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 06:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346537AbjJKKoC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 06:44:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74B4D7;
        Wed, 11 Oct 2023 03:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697021041; x=1728557041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ipz21Xlmw/ON1nT/ixvE46/fPEfN4IYwwn+6e3cr5Ps=;
  b=XqW0yOyyNirvqT3nVk6d0jYwMIe8vJErPdVW7kAkzr0pgoF2unQ4VImT
   UvQGL0JrO7xUWX5Ro+iTJQJa4dCgMDLp6o3743NFyiaGLZ1p9rvS6sGbj
   0kgZ7o1iBkfRDGB4HpoouQGHnudO5oHTGl180QqeeJ1b5MglImUPV5Tqw
   Izzeig8Nbmwb1aN/QPtig92ir20UEEKOQp2Alb47drhLPlnG4V0OVb0LK
   FROmI9Fbeciik/0DFYs7fxmpXk0aYFUQimosTsr3ptz4StKcKPk6kCPTX
   3B51h1ZbOGpduVQGaocu5RLc9p+o0K1hio5uH++iBnBEXjaUZuxXTfHSG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387476637"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="387476637"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 03:44:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703686099"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="703686099"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 03:43:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qqWgy-00000004b4y-3tkE;
        Wed, 11 Oct 2023 13:43:52 +0300
Date:   Wed, 11 Oct 2023 13:43:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        oneukum@suse.com, wsa@kernel.org, andi.shyti@linux.intel.com,
        broonie@kernel.org, bartosz.golaszewski@linaro.org,
        linus.walleij@linaro.org, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
Message-ID: <ZSZ8aMAyncKvmLga@smile.fi.intel.com>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
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

On Wed, Oct 11, 2023 at 12:37:51PM +0200, Hans de Goede wrote:
> On 10/11/23 12:21, Andy Shevchenko wrote:
> > On Mon, Oct 09, 2023 at 02:33:22PM +0800, Wentong Wu wrote:

...

> TL;DR: there is nothing to worry about here, but the commit message
> should be updated to reflect reality.

I have just sent the similar worry, but thanks that you have checked
the code and we don't need to worry too much.

-- 
With Best Regards,
Andy Shevchenko


