Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65C52546761
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 15:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345932AbiFJNbY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 09:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343950AbiFJNbY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 09:31:24 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C864822848B;
        Fri, 10 Jun 2022 06:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654867882; x=1686403882;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+sipVNO53rbC/tmwAHMBsRjzosEnmg6fcQiYVVUappM=;
  b=Rz5tyJexhHOMlIJkJLef2WpiqLI00jnKG+3u362wFbei2MsH2xg+EiJ4
   eAAhSKKIh9Py7ZN+saeIRHRYjsxt1eMS0oYzDRI+ZF2bjaJklC6cZyNny
   nGbXZvNgP7H61JzXAPhMpavz4woCCqw3w0dzWPcU7tcqEPBnWGRKJVfL0
   ZpwluRLk1hObVNtBPx9dUcIhmBCDGElZ+rQbMQ8rop4ZkUCzVR6+yXycR
   Q7DLf3L+W0TeBnStnD3ht1A1K+eqbHBPtqCDFdUfLiJuCtDiablcQ172/
   vX1HkIz1nfaMdCqAAA4VjA2uY2x6jJlDl2//4HjaR/Nnxvo5CtXhC9RyW
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266395316"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="266395316"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 06:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="616483978"
Received: from mylly.fi.intel.com (HELO [10.237.72.181]) ([10.237.72.181])
  by orsmga001.jf.intel.com with ESMTP; 10 Jun 2022 06:31:17 -0700
Message-ID: <c4b34414-cc12-0d0f-49a1-f73c9d17611e@linux.intel.com>
Date:   Fri, 10 Jun 2022 16:31:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH] i2c: designware: Use standard optional ref clock
 implementation
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220610074233.9748-1-Sergey.Semin@baikalelectronics.ru>
 <YqMovttAaGBw796k@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <YqMovttAaGBw796k@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/10/22 14:19, Andy Shevchenko wrote:
> On Fri, Jun 10, 2022 at 10:42:33AM +0300, Serge Semin wrote:
>> Even though the DW I2C controller reference clock source is requested by
>> the method devm_clk_get() with non-optional clock requirement the way the
>> clock handler is used afterwards has a pure optional clock semantic
>> (though in some circumstances we can get a warning about the clock missing
>> printed in the system console). There is no point in reimplementing that
>> functionality seeing the kernel clock framework already supports the
>> optional interface from scratch. Thus let's convert the platform driver to
>> using it.
>>
>> Note by providing this commit we get to fix two problems. The first one
>> was introduced in commit c62ebb3d5f0d ("i2c: designware: Add support for
>> an interface clock"). It causes not having the interface clock (pclk)
>> enabled/disabled in case if the reference clock isn't provided. The second
>> problem was first introduced in commit b33af11de236 ("i2c: designware: Do
>> not require clock when SSCN and FFCN are provided"). Since that
>> modification the deferred probe procedure has been unsupported in case if
>> the interface clock isn't ready.
> 
> Makes sense,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
