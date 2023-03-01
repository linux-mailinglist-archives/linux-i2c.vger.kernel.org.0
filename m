Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8749A6A758A
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Mar 2023 21:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjCAUpJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Mar 2023 15:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjCAUpI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Mar 2023 15:45:08 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53E12F7B0;
        Wed,  1 Mar 2023 12:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677703507; x=1709239507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LjtrVXB/viGf/EUhuoDkDAFTiBWGzZxjEx8qi57evnA=;
  b=OLMboEEzwHzNuwqkUA0QpOGwirYOXNVvnViLlnMX8gJlYc8MgalmwBC8
   eZ6EOXqKbr30xDISne5DaXfoXT1zcppyifRoPlHlqaH1Nb8Sr0nSCdgim
   y3DJ5vfMpZJO9M/6eEBNjvV8C5eJSvkghznv8mLqCopJ8ZX9T7LlkMxXv
   G3nRKVCi+y+pOKODy8qAHHdfK930HGmMXN16sTVwoDZIL1ej+dW7A40eP
   5Z4qh5gvwoQuj/0Zk7MKZieZkwUa6mjAxA6X/LCfRKkUDUtxM1XMm1imY
   2PUH6dNv/ayKreMeaGNhF9fqdmW9D+6AA/QGk35v7y3JgRMsJOcAl73JS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="336808223"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="336808223"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 12:45:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="784505924"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="784505924"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 12:45:02 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E242111FAD0;
        Wed,  1 Mar 2023 22:44:59 +0200 (EET)
Date:   Wed, 1 Mar 2023 22:44:59 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, srinivas.pandruvada@intel.com,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v3 0/5] Add Intel LJCA device driver
Message-ID: <Y/+5S5TlViDsSymF@kekkonen.localdomain>
References: <20230228065618.2686550-1-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228065618.2686550-1-xiang.ye@intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Xiang,

On Tue, Feb 28, 2023 at 02:56:13PM +0800, Ye Xiang wrote:
> Add driver for Intel La Jolla Cove Adapter (LJCA) device.
> This is a USB-GPIO, USB-I2C and USB-SPI device. We add 4
> drivers to support this device: a USB driver, a GPIO chip
> driver, a I2C controller driver and a SPI controller driver.

I've given my Reviewed-by: for this set once, please keep it unless there
are significant changes in the patches.

-- 
Regards,

Sakari Ailus
