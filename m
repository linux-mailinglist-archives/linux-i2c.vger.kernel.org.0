Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21441652528
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 18:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233478AbiLTRI7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 12:08:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbiLTRI6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 12:08:58 -0500
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9491E1DD;
        Tue, 20 Dec 2022 09:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671556138; x=1703092138;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=mxa6zITlxF9dq39hVAGeMGvCQ/PI4M/wWx/w3lZBh8M=;
  b=UH4kOU/tQGWn0ERQBIjm93PfI4ZWGsmBGU70k5viIRLhKNiHzvGdutTw
   Oe6hcKsoOQeyMYtBO6uT2YJn6/953T62gh17tlHT0ckzVnc7w7+fwcM7o
   Zs6sWfgHrHyr3oSUIMkbgx27YzOOeaXbA3lXF7UZSv8j1RC4z3J5X4oGP
   A=;
X-IronPort-AV: E=Sophos;i="5.96,259,1665446400"; 
   d="scan'208";a="163462441"
Subject: Re: [PATCH v3 1/1] i2c: Set pinctrl recovery info to device pinctrl
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2b-m6i4x-32fb4f1a.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 17:08:55 +0000
Received: from EX13MTAUWA002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2b-m6i4x-32fb4f1a.us-west-2.amazon.com (Postfix) with ESMTPS id F006EC36D2;
        Tue, 20 Dec 2022 17:08:52 +0000 (UTC)
Received: from EX19D021UWA001.ant.amazon.com (10.13.139.24) by
 EX13MTAUWA002.ant.amazon.com (10.43.160.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Tue, 20 Dec 2022 17:08:52 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX19D021UWA001.ant.amazon.com (10.13.139.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Tue, 20 Dec 2022 17:08:51 +0000
Received: from [192.168.1.158] (10.1.213.27) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Tue, 20 Dec 2022 17:08:45 +0000
Message-ID: <8c352449-9f99-b712-ba7e-c63edb7bf2d5@amazon.com>
Date:   Tue, 20 Dec 2022 19:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@kernel.org>, <linus.walleij@linaro.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <dwmw@amazon.co.uk>,
        <benh@amazon.com>, <ronenk@amazon.com>, <talel@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <farbere@amazon.com>,
        <itamark@amazon.com>
References: <20221219193228.35078-1-hhhawa@amazon.com>
 <Y6GVIOQ59m29P4w1@smile.fi.intel.com>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
In-Reply-To: <Y6GVIOQ59m29P4w1@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-13.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/20/2022 12:57 PM, Andy Shevchenko wrote:
> As I said, you may use Elvis here as well.
> 
>          bri->pinctrl = bri->pinctrl ?: dev_pinctrl(...);
>          p = bri->pinctrl;

Will handle in the next patchset. thanks.

Thanks,
Hanna
