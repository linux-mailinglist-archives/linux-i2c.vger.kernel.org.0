Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B694D021A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Mar 2022 15:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236021AbiCGOyc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 09:54:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243506AbiCGOy1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 09:54:27 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C6173C4A4
        for <linux-i2c@vger.kernel.org>; Mon,  7 Mar 2022 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646664783; x=1678200783;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bdIZxCTe0BtDR0D07QKX09oLymfeitUb5U6ZyQ+4x3Y=;
  b=nLPLuQjLI/O/fhSjZVY23Hx3Inyn3vWhPzxJMKHVr2d42XbouPYBbNpg
   KYrbYYZTQM+NkuDWXohpRMN4aMigfv1xFXh5FnksPO7OD813D9JWscFTX
   8wuJyfv8HVhsiqkNkIbt0TniKTulyxsLyKObxiiFvE/XvLuMqCtdLaVcw
   s/Ha9nrUqiVFoZf3YNxasNof0SZM6JeBDzIjVBquzCR+H7GbCg7NvuJPB
   in6Cd526BvZw98IeefN3a9eKN/ZE/NeTLz8gTLwP99Cy3vyT8n/k3tx0L
   eVtYyZbAbyL6RWHShR7vBC3VwpL0Lk5KAWBVtetkeUFXV8dJkPaYVOvXk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="254345699"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; 
   d="scan'208";a="254345699"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 06:53:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; 
   d="scan'208";a="512705639"
Received: from mylly.fi.intel.com (HELO [10.237.72.156]) ([10.237.72.156])
  by orsmga006.jf.intel.com with ESMTP; 07 Mar 2022 06:53:02 -0800
Message-ID: <cb60cf26-75b7-f6f0-b31e-c7c93cdaf297@linux.intel.com>
Date:   Mon, 7 Mar 2022 16:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH] i2c: i801: Drop two outdated comments
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>
References: <20220303174256.61067165@endymion.delvare>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220303174256.61067165@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/3/22 18:42, Jean Delvare wrote:
> * Timeouts are reported even in interrupt mode since commit
>    b3b8df97723d ("i2c: i801: Use wait_event_timeout to wait for
>    interrupts") so drop the comment which claims this only happens in
>    polled mode.
> * xact does not include the PEC bit, as the driver does not support
>    software PEC.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> ---
> Please correct me if I'm wrong.
> 
>   drivers/i2c/busses/i2c-i801.c |    5 -----
>   1 file changed, 5 deletions(-)
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
