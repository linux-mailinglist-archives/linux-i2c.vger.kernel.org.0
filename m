Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE6DF5A3E6D
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Aug 2022 17:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiH1PsE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Aug 2022 11:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiH1PsC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Aug 2022 11:48:02 -0400
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D6031359;
        Sun, 28 Aug 2022 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1661701683; x=1693237683;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=nqgVR00aUYDLWTP3wm5UWnkn9F78DI5RteK2ryVTELc=;
  b=FnbXL6DJEnJOPsSWCtYlQQHpukTMuF4C8nDnKgk0DI8hBkfJoettOqmz
   F5iMejGQMcrsVdnWmOsJHE4Uht4wnksOYB+32fTf/MRvcHq51b1ogpYn4
   +jSvzlIGhnjTyT83eRMEG4XR9mIk+WQVZpHXc10qSrz+sT7IbMEK7kPiE
   I=;
X-IronPort-AV: E=Sophos;i="5.93,270,1654560000"; 
   d="scan'208";a="124170858"
Subject: Re: [PATCH v2 2/2] eeprom: at24: add support for power-supply control
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-b09d0114.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2022 15:47:46 +0000
Received: from EX13MTAUEE002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1a-b09d0114.us-east-1.amazon.com (Postfix) with ESMTPS id A3871810BC;
        Sun, 28 Aug 2022 15:47:43 +0000 (UTC)
Received: from EX13D08UEE002.ant.amazon.com (10.43.62.92) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Sun, 28 Aug 2022 15:47:43 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D08UEE002.ant.amazon.com (10.43.62.92) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Sun, 28 Aug 2022 15:47:42 +0000
Received: from [192.168.93.8] (10.85.143.173) by mail-relay.amazon.com
 (10.43.161.249) with Microsoft SMTP Server id 15.0.1497.38 via Frontend
 Transport; Sun, 28 Aug 2022 15:47:36 +0000
Message-ID: <82d89984-d7fb-479c-3a71-be668d408652@amazon.com>
Date:   Sun, 28 Aug 2022 18:47:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <talel@amazon.com>, <hhhawa@amazon.com>, <jonnyc@amazon.com>,
        <hanochu@amazon.com>, <ronenk@amazon.com>, <itamark@amazon.com>,
        <shellykz@amazon.com>, <shorer@amazon.com>, <amitlavi@amazon.com>,
        <almogbs@amazon.com>, <dkl@amazon.com>, <dwmw@amazon.co.uk>,
        "Farber, Eliav" <farbere@amazon.com>
References: <20220822105830.22790-1-farbere@amazon.com>
 <20220822105830.22790-3-farbere@amazon.com>
 <CAMRc=Metu8+zdf101-NVRtbeu-tZiKhPJBiEjYLEsf51d4tj4Q@mail.gmail.com>
From:   "Farber, Eliav" <farbere@amazon.com>
In-Reply-To: <CAMRc=Metu8+zdf101-NVRtbeu-tZiKhPJBiEjYLEsf51d4tj4Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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

On 8/28/2022 5:28 PM, Bartosz Golaszewski wrote:
> On Mon, Aug 22, 2022 at 12:58 PM Eliav Farber <farbere@amazon.com> wrote:
>>
>> Add an optional gpio regulator to support a power-supply control.
>> If a gpio power-supply regulator is supplied in the device tree, the
>> gpio is enabled during probe, and disabled on remove.
>>
>> Signed-off-by: Eliav Farber <farbere@amazon.com>
>
> This doesn't apply on top of v6.0-rc1.
I applied the change on top of v6.0-rc1.
Will be part of v3 I will send soon.

--
Thanks, Eliav
