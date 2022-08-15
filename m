Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE81592E0A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Aug 2022 13:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232726AbiHOLR6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Aug 2022 07:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232692AbiHOLR5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Aug 2022 07:17:57 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE9E1403F;
        Mon, 15 Aug 2022 04:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660562276; x=1692098276;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9SeGoF8CrAaSsSonasAaaRr+fhPrMZO38waNoGudT4E=;
  b=d8IMqQLd4qDWdSqXMF5mVJqPIBjbmWlI15GazPM4ke4alQltL/Wt8CDS
   2fiGOeNxrP20YFJI3O9WEKzYQnTmuZEsR0dHVle0GJ70kHzLWcwOhvHVe
   66lT9ML31FFYL0tK0MEtJY8YCLF7fxjmdW4IFNQGcmfWURpQ+GWv+M2cx
   B3LXZh3A00/HIodw8xNHEyH4HjpFSTmompOCjvIi1+3TpjaLLX4PbJ8f1
   B2fqxbYhn7g9z++qdTAW11muFdI/xfdmZAmY3CEkFvBOtxJRBiwFlgAvR
   M1GYfRu74fDZD2F0YA8fQKcxyvo0xK7c9PWAHZBbQODod2/Kxbn17Wlvn
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="291936040"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="291936040"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2022 04:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="582845183"
Received: from mylly.fi.intel.com (HELO [10.237.72.177]) ([10.237.72.177])
  by orsmga006.jf.intel.com with ESMTP; 15 Aug 2022 04:17:53 -0700
Message-ID: <a6e5b123-91da-b32d-be40-d88a82e4374e@linux.intel.com>
Date:   Mon, 15 Aug 2022 14:17:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.1.1
Subject: Re: [PATCH v2] i2c: designware: Introduce semaphore reservation timer
 to AMDPSP driver
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com
Cc:     mika.westerberg@linux.intel.com, rrangel@chromium.org,
        mw@semihalf.com, upstream@semihalf.com
References: <20220812071526.414285-1-jsd@semihalf.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20220812071526.414285-1-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/12/22 10:15, Jan Dabros wrote:
> In order to optimize performance, limit amount of back and forth
> transactions between x86 and PSP. This is done by introduction of
> semaphore reservation period - that is window in which x86 isn't
> releasing the bus immediately after each I2C transaction.
> 
> In order to protect PSP from being starved while waiting for
> arbitration, after a programmed time bus is automatically released by a
> deferred function.
> 
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> ---
>   drivers/i2c/busses/i2c-designware-amdpsp.c | 68 +++++++++++++++++-----
>   1 file changed, 53 insertions(+), 15 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
