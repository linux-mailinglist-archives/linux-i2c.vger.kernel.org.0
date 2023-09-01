Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D134178FFCF
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 17:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350181AbjIAPTK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 11:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232634AbjIAPTH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 11:19:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF59E65;
        Fri,  1 Sep 2023 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693581544; x=1725117544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bVJnvfmSHtW0c89b0k6r1M1NsQxoGs4Q0Pyfh+Gc9FI=;
  b=IaUFhVi6U0sDMSjvddpXQoRxYbizr7MpgSPvKn3ZDU6+62KEwiJz9ecW
   cZO6vfNAxOQ8LOuuXBvrPMHrK2exH99Im63I1s8TY944CzkRpzg/O+HUD
   0ieL9OSQ08umD6uMLLL22xhu+pHy/PmaIdIgW07bj8JzVf7ZUEPjE3BHV
   rNN6+mN2XCszp7H1IGXtzh28RauEetQistTDNwqHsE2E4AOaclCqNgwFX
   iXmKW3/QmN3Q2kOtZ7LMM85co3o2Qe2yNT2k5r7t/owwYvaw8GqIQtIul
   Ntfidm8Rdl9bKCONQqgtU+ZMI0a0Nsqo2amwxhqEQN9/2kICxYbw3JBmY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="376171071"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="376171071"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 08:19:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739964130"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="739964130"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.59.74])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 08:18:55 -0700
Date:   Fri, 1 Sep 2023 17:18:50 +0200
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
Subject: Re: [PATCH v12 4/4] gpio: update Intel LJCA USB GPIO driver
Message-ID: <ZPIA2mMtNRakNqqd@ashyti-mobl2.lan>
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
 <1693546577-17824-5-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1693546577-17824-5-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wentong,

On Fri, Sep 01, 2023 at 01:36:17PM +0800, Wentong Wu wrote:
> This driver communicate with LJCA GPIO module with specific
> protocol through interfaces exported by LJCA USB driver.
> Update the driver according to LJCA USB driver's changes.
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I am not understanding this patch... Looks like a collection of
random to relevant changes you did in gpio-ljca.c.

I'm not able to review this, can you please split it in minor
changes?

Meanwhile the previous patches should be able to work without
this one, right?

Andi
