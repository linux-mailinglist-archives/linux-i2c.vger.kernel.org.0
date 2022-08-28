Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0FE5A3E66
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Aug 2022 17:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiH1PqC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Aug 2022 11:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiH1PqB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Aug 2022 11:46:01 -0400
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B1122B23;
        Sun, 28 Aug 2022 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1661701557; x=1693237557;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=fk2L9Oz7afPMEfjxu/VrtbrPcUwpkveelWUxw8cAevM=;
  b=AruQ3O6GIC0FQgsZ+e8do/R0bm89Gb+PVDA97Rrm6nCY3uDK0DWiHGnF
   BuOXk37VxajaZAQaazRjmKMc0I8aczK8iH0hcygiiQmGpQ5Kn83DI8T+p
   DYuYAc/fU3yQhFqKHj3pPrbWmLxzafwm0LMaTDyOUWU2YQxycekiAEeol
   M=;
X-IronPort-AV: E=Sophos;i="5.93,270,1654560000"; 
   d="scan'208";a="238246321"
Subject: Re: [PATCH v2 1/2] dt-bindings: at24: add new optional power-supply property
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1d-8bf71a74.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2022 15:45:46 +0000
Received: from EX13MTAUEE001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1d-8bf71a74.us-east-1.amazon.com (Postfix) with ESMTPS id 71597C1465;
        Sun, 28 Aug 2022 15:45:44 +0000 (UTC)
Received: from EX13D08UEE004.ant.amazon.com (10.43.62.182) by
 EX13MTAUEE001.ant.amazon.com (10.43.62.226) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Sun, 28 Aug 2022 15:45:43 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D08UEE004.ant.amazon.com (10.43.62.182) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Sun, 28 Aug 2022 15:45:43 +0000
Received: from [192.168.93.8] (10.85.143.173) by mail-relay.amazon.com
 (10.43.161.249) with Microsoft SMTP Server id 15.0.1497.38 via Frontend
 Transport; Sun, 28 Aug 2022 15:45:37 +0000
Message-ID: <9e8a39d0-6267-cbac-da29-00e41871e14b@amazon.com>
Date:   Sun, 28 Aug 2022 18:45:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To:     Rob Herring <robh@kernel.org>
CC:     <brgl@bgdev.pl>, <mark.rutland@arm.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <talel@amazon.com>, <hhhawa@amazon.com>, <jonnyc@amazon.com>,
        <hanochu@amazon.com>, <ronenk@amazon.com>, <itamark@amazon.com>,
        <shellykz@amazon.com>, <shorer@amazon.com>, <amitlavi@amazon.com>,
        <almogbs@amazon.com>, <dkl@amazon.com>, <dwmw@amazon.co.uk>,
        "Farber, Eliav" <farbere@amazon.com>
References: <20220822105830.22790-1-farbere@amazon.com>
 <20220822105830.22790-2-farbere@amazon.com>
 <20220822214623.GA907654-robh@kernel.org>
Content-Language: en-US
From:   "Farber, Eliav" <farbere@amazon.com>
In-Reply-To: <20220822214623.GA907654-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/23/2022 12:46 AM, Rob Herring wrote:
>>  Documentation/devicetree/bindings/eeprom/at24.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>
> This file doesn't exist any more. Use the latest -rc1 kernel unless
> there is a reason you need a different (even later) base.
I applied the change on top of v6.0-rc1

--
Thanks, Eliav
