Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7931F64EC49
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 14:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiLPNuo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 08:50:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiLPNun (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 08:50:43 -0500
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C0C1B1C9;
        Fri, 16 Dec 2022 05:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671198637; x=1702734637;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=5l/yabekGsdFuR25QSgr9DRZbCIH3PHeIXqw+gVuang=;
  b=h7GXj5zLXQHTEzTqAHPPjb4Bv9EvawdyinYUNXB13VnbagIg04uRt4nA
   ECjfZ2tZAG0kSPAyWacw885MbyBUuJDbtOPsXo0xcm0jRAS05nXSY+Pau
   xszCX1GaUot+BUm+ciV9reZQ5AvE7VxTv2+OOqv9DK/MXeqHtT78EEdfP
   w=;
X-IronPort-AV: E=Sophos;i="5.96,249,1665446400"; 
   d="scan'208";a="162190110"
Subject: Re: [PATCH v2 1/1] i2c: designware: set pinctrl recovery information from
 device pinctrl
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-m6i4x-b5bd57cf.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 13:50:33 +0000
Received: from EX13MTAUWB002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1a-m6i4x-b5bd57cf.us-east-1.amazon.com (Postfix) with ESMTPS id 189E542B90;
        Fri, 16 Dec 2022 13:50:30 +0000 (UTC)
Received: from EX19D013UWB003.ant.amazon.com (10.13.138.111) by
 EX13MTAUWB002.ant.amazon.com (10.43.161.202) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Fri, 16 Dec 2022 13:50:26 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX19D013UWB003.ant.amazon.com (10.13.138.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20;
 Fri, 16 Dec 2022 13:50:26 +0000
Received: from [10.94.130.120] (10.94.130.120) by mail-relay.amazon.com
 (10.43.161.249) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Fri, 16 Dec 2022 13:50:20 +0000
Message-ID: <1408bbef-10e3-f76b-b66d-b95e84748e18@amazon.com>
Date:   Fri, 16 Dec 2022 15:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <jarkko.nikula@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <jsd@semihalf.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dwmw@amazon.co.uk>,
        <benh@amazon.com>, <ronenk@amazon.com>, <talel@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <farbere@amazon.com>,
        <itamark@amazon.com>
References: <20221214142725.23881-1-hhhawa@amazon.com>
 <Y5n1U1lYbcbJ5U1k@smile.fi.intel.com>
 <efa9171f-98ac-f518-e59e-f6c4d7d3d4e6@amazon.com>
 <Y5r2pZhe17dVBMme@smile.fi.intel.com>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
In-Reply-To: <Y5r2pZhe17dVBMme@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/15/2022 12:27 PM, Andy Shevchenko wrote:
> OK, but why that function doesn't use the dev->pins->p if it's defined?
> (As a fallback when rinfo->pinctrl is NULL. >

The solution will look like the below diff (get_device_pinctrl() is new 
function that i've added that return the dev->pins->p)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7539b0740351..469344d4ee43 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -34,6 +34,7 @@
  #include <linux/of.h>
  #include <linux/of_irq.h>
  #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/devinfo.h>
  #include <linux/pm_domain.h>
  #include <linux/pm_runtime.h>
  #include <linux/pm_wakeirq.h>
@@ -282,7 +283,11 @@ static void i2c_gpio_init_pinctrl_recovery(struct 
i2c_adapter *adap)
  {
         struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
         struct device *dev = &adap->dev;
-       struct pinctrl *p = bri->pinctrl;
+       struct pinctrl *p;
+
+       if (!bri->pinctrl)
+               bri->pinctrl = get_device_pinctrl(dev->parent);
+       p = bri->pinctrl;

> Wolfram?
> 
> Hanna, it seems you missed I²C maintainer to Cc...

I based my CC/TO on get_maintainer.pl script. Will make sure that 
Wolfram on CC next time.
