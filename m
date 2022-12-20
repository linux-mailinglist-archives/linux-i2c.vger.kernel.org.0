Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C06B165273E
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 20:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiLTTni (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 14:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiLTTng (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 14:43:36 -0500
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C21B7D;
        Tue, 20 Dec 2022 11:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1671565416; x=1703101416;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=/mIRa8jHzJduU5TMRrT7WRcpFd3yBrIO5fnl6pZ8rZk=;
  b=W9GT+0Uh1wtS/GrP7XVdBXUw2/DroYMEs7LDEDo9TM7BpSd1hCkoKpZi
   fCc8Z1uL9cvflJtFackxZsS0bQPdYQhfyIxsCPb+3e+oc+zOmfG32VMOV
   jsmvYe4MrEUCr9lpXC1k3TcNwJSDGXpjPo3z8K3mH786deudYtfJGtPUV
   I=;
X-IronPort-AV: E=Sophos;i="5.96,259,1665446400"; 
   d="scan'208";a="163519401"
Subject: Re: [PATCH v4 1/1] i2c: designware: use casting of u64 in clock
 multiplication to avoid overflow
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2a-m6i4x-44b6fc51.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 19:43:33 +0000
Received: from EX13MTAUWA002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-pdx-2a-m6i4x-44b6fc51.us-west-2.amazon.com (Postfix) with ESMTPS id 4B7C6A35EA;
        Tue, 20 Dec 2022 19:43:32 +0000 (UTC)
Received: from EX19D021UWA002.ant.amazon.com (10.13.139.48) by
 EX13MTAUWA002.ant.amazon.com (10.43.160.12) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Tue, 20 Dec 2022 19:43:31 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX19D021UWA002.ant.amazon.com (10.13.139.48) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.20; Tue, 20 Dec 2022 19:43:31 +0000
Received: from [192.168.1.158] (10.1.213.27) by mail-relay.amazon.com
 (10.43.160.118) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Tue, 20 Dec 2022 19:43:26 +0000
Message-ID: <42585223-2d92-5a9e-3707-d5e70fe6937b@amazon.com>
Date:   Tue, 20 Dec 2022 21:43:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <wsa@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <linus.walleij@linaro.org>, <ben-linux@fluff.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dwmw@amazon.co.uk>, <benh@amazon.com>, <ronenk@amazon.com>,
        <talel@amazon.com>, <jonnyc@amazon.com>, <hanochu@amazon.com>,
        <farbere@amazon.com>, <itamark@amazon.com>,
        Lareine Khawaly <lareine@amazon.com>
References: <20221220164806.77576-1-hhhawa@amazon.com>
 <Y6Hs1xwB45K3Ufb8@smile.fi.intel.com>
 <cc16a489-f711-0c54-8576-ef7974b3cb79@amazon.com>
 <Y6ILydYEWzJdzwBJ@smile.fi.intel.com> <Y6IMhZsbOk/J9xZB@smile.fi.intel.com>
From:   "Hawa, Hanna" <hhhawa@amazon.com>
In-Reply-To: <Y6IMhZsbOk/J9xZB@smile.fi.intel.com>
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



On 12/20/2022 9:27 PM, Andy Shevchenko wrote:
> Thinking more on this, I would probably replace the order of arguments to make
> it ' + offset - N' in each case. Since plus will be on the previous line and
> become first it will be easier to parse the arithmetical expression.

Do you want this change in the same patch? i don't think it's related 
here.. I can push separated change

Thanks,
Hanna
