Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8C2761F23D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 12:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbiKGL4A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 06:56:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbiKGL4A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 06:56:00 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28FA1A81B
        for <linux-i2c@vger.kernel.org>; Mon,  7 Nov 2022 03:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667822159; x=1699358159;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ACE7QHjE32flWmjdwNqzv0aQUcJClCBnwfrprPvPakA=;
  b=jx0ta3++It4LL+h1bpzVP0KDbCliPImYpT+oVnJ70cuwsfJprViEeSAc
   l02XIJPsYVDLInkjFf/jqHVE7iyrOuv6/GY5HfmEzbYbLmCIIT3AjNfc7
   TSxxK4qy6PjpRLnjD/qsaLluMbe7wva/9QwAJbYEjIZ5KlEa2hCT+3Euh
   j3fqy3jdDamy5fkxoMQ/k+KdJAwUjSWfkivVOaWRYiQAQg9qWgjY2QE6g
   U5iO8ZVVKIggFP1iiLRa1Yz7FeOjRxYCX9XN5rDoQveo52Ztd2HI9bcFJ
   QOZh2+tLuqyVcGsBqVUoHjqNCkPhQg46NHWbCCEClS2n1suJUrGesMmpT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="308015049"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="308015049"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 03:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="965124851"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="965124851"
Received: from mylly.fi.intel.com (HELO [10.237.72.55]) ([10.237.72.55])
  by fmsmga005.fm.intel.com with ESMTP; 07 Nov 2022 03:55:57 -0800
Message-ID: <e0873944-ba28-cba6-b53d-6a267d8c7ae0@linux.intel.com>
Date:   Mon, 7 Nov 2022 13:55:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [PATCH v2 00/12] i2c: designware: Slave fixes and generic
 cleanups
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>
References: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
 <Y2J+kHMjYjZJP+KR@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Y2J+kHMjYjZJP+KR@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/2/22 16:28, Andy Shevchenko wrote:
> On Wed, Nov 02, 2022 at 03:11:13PM +0200, Jarkko Nikula wrote:
>> Hi
>>
>> Version 2 of the patchset I sent last week:
>> https://www.spinics.net/lists/linux-i2c/msg58933.html
>>
>> Changes address the comments Andy made and is rebased on top of current
>> i2c/for-next.
>>
>> Luis Oliveira is not Cc'ed since I forgot his address is no longer working.
> 
> All look good to me,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
I'll add that to 3rd version where I have fixed the typo in the patch 
9/12 and updated 12/12.

Jarkko
