Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C556FEC1F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 09:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbjEKHBU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 03:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237355AbjEKHBR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 03:01:17 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62865FF2;
        Thu, 11 May 2023 00:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683788465; x=1715324465;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GznCalPirWq4BN6RzOuW7w8VJ+sS1Z00JtrJn0Ox0xU=;
  b=Mc/GObpqOsqOT5JimUXuftIilm84h2sfq6Iu7beBRbsx2YxIqzZoGEfx
   ZviUscp3Dk2diCrnLb+evEGnEnrPQzjy7JY1Kg8bMggdzUKwENkjNmgcz
   4aRdLedOzUrOBwMH5BPm0SRV+XhiQ+/umw0ITXmlZGHMbewaOtUKV5x0V
   rKUCwnYLSLE1EjRvIzR1GA7ceWIyfYwAS4JHrv0KE3NV/H9ecZpgUVSlw
   GKHdJj4HGc9JNYguMYU58gvuAcimJrIQgswUn6aAoPtk1cwu8tsJK+fYo
   Dbf6LqtSDg8bpgsBs+E5aSsUSuI8wNYZ/RRpUiTenJ5q3KbA9V64yuAAV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347884791"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="347884791"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 00:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="732459966"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="732459966"
Received: from unknown (HELO [10.237.72.143]) ([10.237.72.143])
  by orsmga001.jf.intel.com with ESMTP; 11 May 2023 00:01:03 -0700
Message-ID: <11d3a7e2-557f-4f4f-333a-f6cd1b8e6db8@linux.intel.com>
Date:   Thu, 11 May 2023 10:01:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH] i2c: fix crash with msgs is NULL points
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        wangyouwan <wangyouwan@126.com>
Cc:     andriy.shevchenko@linux.intel.com, jsd@semihalf.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230510084057.17313-1-wangyouwan@126.com>
 <20230510090241.GO66750@black.fi.intel.com>
 <1943ca04.6ce1.18804f327f0.Coremail.wangyouwan@126.com>
 <20230510092344.GP66750@black.fi.intel.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20230510092344.GP66750@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 5/10/23 12:23, Mika Westerberg wrote:
> 
> On Wed, May 10, 2023 at 05:17:04PM +0800, wangyouwan wrote:
>> After waking up from sleep, 100% of the time it occurred. I suspected
>> that there was a firmware issue with the machine I was debugging, but
>> other machines did not notice it. Therefore, I attempted to make a
>> modification here to avoid it
> 
> Okay then I suggest to investigate what causes the ->msgs to be NULL and
> fix that. When the transfer function is called we expect there to be
> something to be sent out so this should not happen.

Does you kernel include commit 301c8f5c32c8 ("i2c: designware: Fix 
handling of real but unexpected device interrupts")? Vanilla kernels 
after v6.1 have it and also linux-stable v5.15.75 and after.

I'm asking since issue sounds similar and wanted to clarify the kernel 
version you are using.
