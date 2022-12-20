Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0687265203A
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 13:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbiLTMMq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 07:12:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbiLTMMq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 07:12:46 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73614186F2;
        Tue, 20 Dec 2022 04:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671538365; x=1703074365;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GuZvFIRgW9OS8SVvw573XhDylbbxUFFwrptvMmY2OJM=;
  b=FN/336ufmNwzbZ06UEyF6v+rHFx87+WgQvw6sEJYsQm2lNqiOE5xrlhe
   q6V4Mr8ZM41rz69NLndndCoawVodDwm38E5Q42qRdrF5VktMgULraNhbl
   S46hjhIZWk4LV38k6y1A/O6L4tnPcbGIftZxuxDABlel5RLcri9q/nkGU
   dIcrATDGJtUcJq4vNd4i1oiNmS0eqFno4Cut7LcxXRxwE3RbjKoOmb6+g
   6V7c1rluknMADmbXrEHv724eVEDmPe+v1cFU7GpmVOSwhjlh0mivxg+pb
   m25uXfyKfYE8y5i4T//Btv6YKnyABDPzZ2EyMth4HJcMDzadGyN6PrmD3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="320776858"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="320776858"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 04:12:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="825205052"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="825205052"
Received: from mylly.fi.intel.com (HELO [10.237.72.68]) ([10.237.72.68])
  by orsmga005.jf.intel.com with ESMTP; 20 Dec 2022 04:12:40 -0800
Message-ID: <7c758024-a0fe-f435-810d-9e27a96215b1@linux.intel.com>
Date:   Tue, 20 Dec 2022 14:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH 1/1] i2c: designware: fix i2c_dw_clk_rate() return size to
 be u32
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hanna Hawa <hhhawa@amazon.com>
Cc:     wsa@kernel.org, Suravee.Suthikulpanit@amd.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
        talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
        farbere@amazon.com, itamark@amazon.com
References: <20221219172345.14272-1-hhhawa@amazon.com>
 <Y6GS/QaEmxJSe4kS@smile.fi.intel.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Y6GS/QaEmxJSe4kS@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/20/22 12:48, Andy Shevchenko wrote:
> On Mon, Dec 19, 2022 at 05:23:45PM +0000, Hanna Hawa wrote:
>> Make i2c_dw_clk_rate() to return u32 instead of unsigned long, as the
>> function return the value of get_clk_rate_khz() which returns u32.
> 
> Makes sense.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
