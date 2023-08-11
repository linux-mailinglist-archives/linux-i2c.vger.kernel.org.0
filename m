Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 808F4779144
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 16:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234451AbjHKODW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Aug 2023 10:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjHKODV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Aug 2023 10:03:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4A010E4;
        Fri, 11 Aug 2023 07:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691762601; x=1723298601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=chuDmXhuRIBigMPA+O8LTKTFpZibEk0jAwFwvZN2/L0=;
  b=Z8lUvcZW+9vWD1fO0IXI7UQI7G4gYn+CWHon5OGedAARNMFeCIMElAGf
   HX+DPWE5Z/ByqtqV1lgJvq1nF/tydeXY1GBNV+eQ/FzrwTrcfnxEfpGMg
   7UQSUz3SjBgtCCmTNDzzUVqaxFOlBQldPX3lbDc/DNy5B0zgYm3+HilKO
   YW5v4J+CmMZGFCWAdcZ6FrO0BAott+5vdrx+MnYDJzmmdjZ0naNP78HC1
   PE7Y0z5ssdI4GFiKjZ+kR7RAUDdnDw6yw0GcLW4iiSf2Uo1TifkCN4NLS
   F0eisnMtqmqulrKKj/dtXwu1BB8CY176yEHB94Qd1n8B0UpwzOJKMVjq8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438020741"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="438020741"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 07:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="767678691"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="767678691"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 11 Aug 2023 07:01:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qUShk-000IZ7-1S;
        Fri, 11 Aug 2023 17:01:28 +0300
Date:   Fri, 11 Aug 2023 17:01:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yann Sionneau <yann@sionneau.net>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jonathan Borne <jborne@kalray.eu>
Subject: Re: [PATCH 2/2] i2c: designware: abort the transfer if receiving
 byte count of 0
Message-ID: <ZNY/OL4ZKiTL3lF3@smile.fi.intel.com>
References: <20230811124624.12792-1-yann@sionneau.net>
 <20230811124624.12792-2-yann@sionneau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811124624.12792-2-yann@sionneau.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 11, 2023 at 02:46:24PM +0200, Yann Sionneau wrote:
> From: Yann Sionneau <ysionneau@kalray.eu>
> 
> Context:
> It's not clear whether Linux SMBus stack supports receiving 0
> as byte count for SMBus read data block.
> 
> Linux supports SMBus v2.0 spec, which says "The byte count may not be 0."
> Which does not seem very clear to me, as a non-native speaker.
> (Note that v3.0 of the spec says "The byte count may be 0.")
> 
> Some drivers explicitly return -EPROTO in case of byte count 0.
> 
> The issue:
> Regardless of whether Linux supports byte count of 0, if this happens
> the i2c-designware driver goes into an unrecoverable state holding
> SCL low if the IP is synthesized with the IC_EMPTYFIFO_HOLD_MASTER_EN
> parameter.
> 
> The fix proposed by this patch:
> Abort the transfer by sending a STOP condition on the bus.
> 
> Another approach would be to ignore the issue and let the driver
> timeout and disable the IP. The IP disabling is fixed by the previous
> patch in this patch series.
> The current patch just makes the recovery faster since Abort is sent
> directly without waiting for the timeout to happen. With this patch,
> disabling the IP is not necessary anymore.

...

> +				if ((tmp <= I2C_SMBUS_BLOCK_MAX) && (tmp != 0))

				if (tmp && tmp <= I2C_SMBUS_BLOCK_MAX)

> +					len = i2c_dw_recv_len(dev, tmp);
> +				else
> +					i2c_dw_abort(dev);

-- 
With Best Regards,
Andy Shevchenko


