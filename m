Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17BAB4C2C69
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Feb 2022 14:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbiBXNCF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Feb 2022 08:02:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234627AbiBXNCE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Feb 2022 08:02:04 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B333E0A9;
        Thu, 24 Feb 2022 05:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645707693; x=1677243693;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5aznmc5N7mLUl584bkbTiNqi1v3rIz5jaM+TI+KfQd0=;
  b=mDtncJToo1gUt+6IziRfwMFWb8wRTmueAabf9qIPB+tDzwlZ6jGIVkuy
   UrYI4JN/zRHRFLd0bcMA48DM0Oi9JHYaqu/J6dPbgGj2QzzCakUMWWybG
   o15XR7UZBeEjQ7cuRJM4pu4sSKcijCNVnDr5y3+eZs+i0QxtoJuoltLw4
   CXMcLVhwzknmGbS6Yb0mdOFm6DMCmYyYOxYUo3Ct4soajeXT1qO8gOTkE
   tVIWW7wjNL56+d33lUfsOp4WbP1uzG6vQmZ1FerJNkLQU4WaNiHiivEWW
   AoAWP/28W6LQQLWfy/LijwUhBBl9IiWsb+Yos8/3+ElMW2DlcypsV0cJd
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="252421890"
X-IronPort-AV: E=Sophos;i="5.88,134,1635231600"; 
   d="scan'208";a="252421890"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 05:01:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,134,1635231600"; 
   d="scan'208";a="548737676"
Received: from mylly.fi.intel.com (HELO [10.237.72.156]) ([10.237.72.156])
  by orsmga008.jf.intel.com with ESMTP; 24 Feb 2022 05:01:28 -0800
Message-ID: <a56eac7a-fd97-b371-c426-524c71abeb1d@linux.intel.com>
Date:   Thu, 24 Feb 2022 15:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH -next] i2c: designware: Fix improper usage of readl
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        wsa@kernel.org, rrangel@chromium.org, upstream@semihalf.com,
        kernel test robot <lkp@intel.com>
References: <20220218133348.628962-1-jsd@semihalf.com>
 <YhZNu0pHKiK9Vf55@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <YhZNu0pHKiK9Vf55@smile.fi.intel.com>
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

On 2/23/22 17:07, Andy Shevchenko wrote:
> On Fri, Feb 18, 2022 at 02:33:48PM +0100, Jan Dabros wrote:
>> Kernel test robot reported incorrect type in argument 1 of readl(), but
>> more importantly it brought attention that MMIO accessor shouldn't be
>> used in this case, since req->hdr.status is part of a command-response
>> buffer in system memory.
>>
>> Since its value may be altered by PSP outside of the scope of current
>> thread (somehow similar to IRQ handler case), we need to use
>> READ_ONCE() to ensure compiler won't optimize this call.
>>
>> Fix also 'status' variable type to reflect that corresponding field in
>> command-response buffer is platform-independent u32.
> 
> Thanks for the fix, seems reasonable to me.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
