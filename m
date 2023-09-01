Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 717AC78FFBB
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 17:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbjIAPNI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 11:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350155AbjIAPNH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 11:13:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D9E170B;
        Fri,  1 Sep 2023 08:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693581172; x=1725117172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DAYoYTZ8GrE54cEGCh5cS86bQ/dbrK37xmfcKAPU99w=;
  b=mpJDWS4xPkUp7hYw7B3CFfjuFziGDT+NIKfi8Gkwd2yrTGT+fBa9FvtI
   c0LshpZzZEIP6nxMKMnNasyD4HfNNMmaKsspnAeWHentkmyCG5abhY6VW
   BKVOE0a/G9zDKSVOZkJH+a7fPkyk5ok+XgECaYsgru5LXC3zA2yRT78Mi
   Cqq9laALwybEQDHr5QaoERyWE1ERy3zSXL0T0RwBGOFZAz7o5u5rU9O0x
   LJRmkdvJZJfi/QZ6fsEbIezFD1fdFTsXTUfG16qMZFN+jdJhdeWbHq3KS
   Cjgc8+mjdx68PiaoDiLdXOEPJCQCIPiWma2rrfl+flmXh+MaEs9RFvamZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="378963643"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="378963643"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 08:12:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883216872"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="883216872"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.59.74])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 08:12:43 -0700
Date:   Fri, 1 Sep 2023 17:12:38 +0200
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
Subject: Re: [PATCH v12 3/4] spi: Add support for Intel LJCA USB SPI driver
Message-ID: <ZPH/Zkkt4lNsBom7@ashyti-mobl2.lan>
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
 <1693546577-17824-4-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1693546577-17824-4-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wentong,

On Fri, Sep 01, 2023 at 01:36:16PM +0800, Wentong Wu wrote:
> Implements the SPI function of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA SPI
> module with specific protocol through interfaces exported by LJCA USB
> driver.
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
