Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 789DC64D799
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Dec 2022 09:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiLOIPq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Dec 2022 03:15:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiLOIPo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Dec 2022 03:15:44 -0500
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF59D6545;
        Thu, 15 Dec 2022 00:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671092143; x=1702628143;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=rcVT5TDWjnPCTgSmZDy03yP0543LwHqVkjTifg/CBBk=;
  b=CyTy5dvmRBZWodRLxt9MjB5lkn50LrLoMx95wnI1giz91gZtW5P3GzfP
   /84ZJzSocXlFo7dWBjjDFGIq/anL4BB7wcpAvvhaWIK9uu1SVWKdETACB
   aPsJyJweIipbc5PxlPdgVf1jA5801Yyn8VofL8kJ0RQ/UEssKNLa6CTvh
   M=;
X-IronPort-AV: E=Sophos;i="5.96,246,1665446400"; 
   d="scan'208";a="161665575"
Subject: Re: [PATCH v2 1/1] i2c: designware: set pinctrl recovery information from
 device pinctrl
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2c-m6i4x-fa5fe5fb.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 08:15:40 +0000
Received: from EX13MTAUEE002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
        by email-inbound-relay-pdx-2c-m6i4x-fa5fe5fb.us-west-2.amazon.com (Postfix) with ESMTPS id 7FCEB416C7;
        Thu, 15 Dec 2022 08:15:39 +0000 (UTC)
Received: from EX19D008UEC002.ant.amazon.com (10.252.135.242) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Thu, 15 Dec 2022 08:15:38 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX19D008UEC002.ant.amazon.com (10.252.135.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20;
 Thu, 15 Dec 2022 08:15:38 +0000
Received: from [192.168.3.115] (10.1.213.5) by mail-relay.amazon.com
 (10.43.62.224) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Thu, 15 Dec 2022 08:15:35 +0000
Message-ID: <efa9171f-98ac-f518-e59e-f6c4d7d3d4e6@amazon.com>
Date:   Thu, 15 Dec 2022 10:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <jarkko.nikula@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <jsd@semihalf.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dwmw@amazon.co.uk>,
        <benh@amazon.com>, <ronenk@amazon.com>, <talel@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <farbere@amazon.com>,
        <itamark@amazon.com>
References: <20221214142725.23881-1-hhhawa@amazon.com>
 <Y5n1U1lYbcbJ5U1k@smile.fi.intel.com>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
In-Reply-To: <Y5n1U1lYbcbJ5U1k@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/14/2022 6:09 PM, Andy Shevchenko wrote:
> ...should be located here.
> 
> ...

Ack - will move them.

> 
>> +     if (dev->dev->pins && dev->dev->pins->p)
>> +             rinfo->pinctrl = dev->dev->pins->p;
> Hmm... I don't see how this field is being used.
> Can you elaborate?

This field is used in i2c_generic_scl_recovery(), if it's not NULL then 
the flow will set the state to GPIO before running the recovery mechanism.
         if (bri->pinctrl)
                 pinctrl_select_state(bri->pinctrl, bri->pins_gpio);

.
.

I saw that that the change failed in complication for SPARC 
architecture, as the pins field is wraparound with CONFIG_PINCTRL in 
device struct. I though on two options to solve the compilation error, 
first by adding wraparound of CONFIG_PINCTRL when accessing the pins 
field. And the second option is to add get function in pinctrl/devinfo.h 
file, which return the pins field, or NULL in case the PINCTRL is not 
defined. Which option you think we can go with?
