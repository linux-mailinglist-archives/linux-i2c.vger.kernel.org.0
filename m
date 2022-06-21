Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2131E553443
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 16:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349421AbiFUOPE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jun 2022 10:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347175AbiFUOPD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jun 2022 10:15:03 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDF71FCE4;
        Tue, 21 Jun 2022 07:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655820901; x=1687356901;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yQU7j/rmwa8f5erc/dsRSXo1T9W6V1SU18bSoOqDnl4=;
  b=NoEmh2xi/qrFG4hI6T+0d4fUhnJ+GDvmzjaQjFJ3S1MAmgiVpMYB6bxf
   rhhIu/NEo6aX4Fi5rD6ztQlsULR9IglG2DV5qAZsn71QqaQbii3ngnVdx
   TeWOozBdVGmt44VD9hQ08ikkf/fOblC5kLaxwrS77vv9Wa3mMfgwqKh+k
   CsW6pwhrQpH5Bm/CaqM9t8zls2PNbSMVxxvXZyEjL5zjb2JP1zYGlnGs9
   qtWNMLOwWWmhSsy+UUVNnZBVX/En2jXOHgSQY0eSNWbSQoAzVT1tYGrOL
   nq+Z4tV1WEF8U7iB/9XNQJgTBOUjuv27LqahNAWhAB4reO1l6jbUUKrhU
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="281189354"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="281189354"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 07:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="643641458"
Received: from mylly.fi.intel.com (HELO [10.237.72.181]) ([10.237.72.181])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jun 2022 07:14:57 -0700
Message-ID: <116511f7-2d05-acf6-e421-a89797abb7a0@linux.intel.com>
Date:   Tue, 21 Jun 2022 17:14:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCHv6 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Content-Language: en-US
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220620230109.986298-1-dinguyen@kernel.org>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220620230109.986298-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/21/22 02:01, Dinh Nguyen wrote:
> The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
> thus cannot be recovered by the default method of by doing a GPIO access.
> Only a reset of the I2C IP block can a recovery be successful, so this
> change effectively resets the I2C controller, NOT any attached clients.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v6: Updated commit log to emphasize this change only resets the I2C
>      controller and not any attached clients.
> v5: removed strayed nextline
> v4: re-arrange code per Andy Shevchenko's recommendation
> v3: simplify the function
>      update commit message
> v2: remove change to MODEL_MASK
>      s/i2c_custom_scl_recovery/i2c_socfpga_scl_recovery
> ---
>   drivers/i2c/busses/i2c-designware-core.h    |  1 +
>   drivers/i2c/busses/i2c-designware-master.c  | 49 ++++++++++++++++++---
>   drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
>   3 files changed, 45 insertions(+), 6 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
