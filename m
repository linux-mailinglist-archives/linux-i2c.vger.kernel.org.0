Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67F787B64CD
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Oct 2023 10:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239535AbjJCI6J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Oct 2023 04:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239537AbjJCI6J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Oct 2023 04:58:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5EB5AF;
        Tue,  3 Oct 2023 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696323484; x=1727859484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dLKfzWcsf70/Y3M11dv8yZFYzYdOU1fQSbZAMIbOyV8=;
  b=OuvXAuNKOdhvhOlITC6nQBXykoXnSMNvii/xn96FwpEbg1MRmFXfdLOE
   lmGxGuqcLBbgvc0qGHfx5/a0a/bBcgfgObVCoNjr9FxapaFzvUhB7btWa
   vZxeeltGGn5uocfs8soGie8Qr7Gts4E49zAMEpW6B1GEYGS+SfP7JBcdJ
   dudB1zbju7RzN+1oe4MZn8glyRNczD5zmgVFzX9gHWitkZoNNuViINN/A
   DVT4J7rVu5O6nwQC1u3rADDHKhLFMVl1yX7NWtvaGLgoOJ3CrcjLLn0oC
   dYWJr4n1X7MTUJCzlYF1Ii2L1FTVA6qIe5METOdltRc28qro5carzAVCx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="363094905"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="363094905"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 01:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="700631613"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="700631613"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 01:58:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qnbE6-00000002RHo-2Hqw;
        Tue, 03 Oct 2023 11:57:58 +0300
Date:   Tue, 3 Oct 2023 11:57:58 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
Subject: Re: [PATCH v1] i2c: designware: Disable TX_EMPTY irq while waiting
 for block length byte
Message-ID: <ZRvXlqCcEuwR7YzM@smile.fi.intel.com>
References: <20230929035356.6435-1-tamnguyenchi@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929035356.6435-1-tamnguyenchi@os.amperecomputing.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 29, 2023 at 10:53:56AM +0700, Tam Nguyen wrote:
> During SMBus block data read process, we have seen high interrupt rate
> because of TX_EMPTY irq status while waiting for block length byte (the
> first data byte after the address phase). The interrupt handler does not
> do anything because the internal state is kept as STATUS_WRITE_IN_PROGRESS.
> Hence, we should disable TX_EMPTY irq until I2C DW receives first data

IRQ
DesignWare

> byte from I2C device, then re-enable it.
> 
> It takes 0.789 ms for host to receive data length from slave.
> Without the patch, i2c_dw_isr is called 99 times by TX_EMPTY interrupt.

i2c_dw_isr()

> And it is none after applying the patch.

> Cc: stable@vger.kernel.org
> Signed-off-by: Chuong Tran <chuong@os.amperecomputing.com>

Who is this guy? Do you need Co-developed-by tag?

> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>

Other than that, agree with Serge's points.

-- 
With Best Regards,
Andy Shevchenko


