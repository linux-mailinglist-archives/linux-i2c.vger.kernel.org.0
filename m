Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6786A6D1F8A
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 13:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjCaL4D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 07:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbjCaL4C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 07:56:02 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDD81D2F5;
        Fri, 31 Mar 2023 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680263756; x=1711799756;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eiULrSJR3I4EWdtPzijN+FavCXWGuJ49goVHT1ldTxA=;
  b=FSVHaL7GIu7N0xponhWwpqaNqiQUGzr4Onac+Esj02LVlmpNBUBLnPbP
   1maWS7ntgvpepUqVsBJmV1D/aJqvMr36ISL2PaoxNEdTrvWDTeZASljzJ
   oXjtMXT9592k3jqpEiXdFaX2r/lwwUpMfJ1mxYCO+NUgWFJtzLMqh57LV
   PRm9dKx1exVyEARiln59ZQsaCHAN5/xUewmW/PnH0kYO7bhPZ0rPHf3ym
   lLWHTy6gPpcNgMOkYEba88x2tkLLLmEIIRY5vswlNe63t14IFBfMLVQhU
   FQOXT1u7tGep2YfX5DaSWZGE5E7p58anl7X9FLUaFsHYWQ+4zpiWdRoPO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="340158675"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="340158675"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 04:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="1014794967"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="1014794967"
Received: from unknown (HELO [10.237.72.51]) ([10.237.72.51])
  by fmsmga005.fm.intel.com with ESMTP; 31 Mar 2023 04:55:54 -0700
Message-ID: <b6d72005-5c5e-2716-1e6c-5d4e2ce3e60a@linux.intel.com>
Date:   Fri, 31 Mar 2023 14:55:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH v7 6/6] i2c: designware: Add doorbell support for
 Mendocino
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Felix Held <Felix.Held@amd.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230329220753.7741-1-mario.limonciello@amd.com>
 <20230329220753.7741-7-mario.limonciello@amd.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230329220753.7741-7-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/30/23 01:07, Mario Limonciello wrote:
> Mendocino and later platform don't use the platform feature mailbox for
> communication for I2C arbitration, they rely upon ringing a doorbell.
> 
> Detect the platform by the device ID of the root port and choose the
> appropriate method.
> 
> Link: https://lore.kernel.org/linux-i2c/20220916131854.687371-3-jsd@semihalf.com/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v6->v7:
>   * Add missing pci_dev_put()
>   * s/mendocino/doorbell/
> v5->v6:
>   * Handle Mendocino busy code like Cezanne
> v4->v5:
>   * Poll for busy
>   * Rename to mendocino
>   * Add explicit dependency on PCI
> v3->v4:
>   * Adjust to use PCI device ID and function pointers instead
> v2->v3:
>   * Use CPU ID rather than ACPI ID, this will be pushed to a later patch
> v1->v2:
>   * New patch
> ---
>   drivers/i2c/busses/Kconfig                 |  1 +
>   drivers/i2c/busses/i2c-designware-amdpsp.c | 26 +++++++++++++++++++++-
>   2 files changed, 26 insertions(+), 1 deletion(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
