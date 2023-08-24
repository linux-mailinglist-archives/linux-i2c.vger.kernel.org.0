Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5155D786CA9
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 12:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjHXKS1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 06:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240830AbjHXKSM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 06:18:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2E2198D
        for <linux-i2c@vger.kernel.org>; Thu, 24 Aug 2023 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692872287; x=1724408287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bN1PjX/KUXFdKSC5gRaTr4eCrP5DFz8k5vimtpzhEo8=;
  b=BgrQlICZ/mMQL25NyNT5yXEWuXudeyyTxoYyMqYvlhWP0L0pq0j8c/Jn
   de8VD1RISKqVIX3NXC1Ey8pshz2HBgGgFU8JPBpqIcVjUOjngzQ8M2fOI
   ouUUJAIiPy6zj7ytHQoOhxM9iC7AHWszmhLMc4TlZcZGWxsDih4LzAQrr
   0FHqd9sR8OMlUXxO2L84FD/xN/fv0BPPCyKldMO8avhjfUSZ3ShG0xZGj
   1Dp7EEfgvXHbjrVbMzOhz5rj3UayaVgWzy15oBdWxEK0J9FPy8/pM+IZW
   66BqMEcl3YO/xlmoKpZpdxarxNldfeLv9oahRGV0R+KneHxNmWIlV/mjk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378155277"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="378155277"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 03:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="686815740"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="686815740"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.182.156])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 03:18:04 -0700
Date:   Thu, 24 Aug 2023 12:18:00 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        linux-i2c@vger.kernel.org, zhifeng.wang@intel.com
Subject: Re: [PATCH v10] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <ZOcuWN8wHf2xNvLC@ashyti-mobl2.lan>
References: <1692796047-9614-1-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1692796047-9614-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wentong,

On Wed, Aug 23, 2023 at 09:07:27PM +0800, Wentong Wu wrote:
> Implements the I2C function of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA I2C
> module with specific protocol through interfaces exported by LJCA
> USB driver.
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

I confirm my review here... patch looks good, but I need to know
what happened to the other patches.

Thanks,
Andi
