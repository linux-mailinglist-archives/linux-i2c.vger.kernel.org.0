Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03E5598838
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 18:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343955AbiHRQBN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 12:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343793AbiHRQBK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 12:01:10 -0400
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A04B69F0;
        Thu, 18 Aug 2022 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1660838467; x=1692374467;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=8Zte+SHPEi9IiSQRFShm4rQo5XvZh/gTFcz3Y36+GZo=;
  b=Rpht6uihESJfXG0mLgiC6992BylB0NIDH+7KftVXhT/O7dlNjhNuxpRY
   vxIR+ZfQgvWTL5duvCSI0V2GPccgsIHv+DaN3MjjesypnoWP5P1eOin5M
   8zi99tK3F2OTp4DPZcK5g24GnGtWGosO227DpDGeb/PLL0J/vEEJs7Glz
   Q=;
X-IronPort-AV: E=Sophos;i="5.93,247,1654560000"; 
   d="scan'208";a="120680565"
Subject: Re: [PATCH 1/2] dt-bindings: at24: new optional property - enable-gpios
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-iad-1e-0bfdb89e.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 15:59:13 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1e-0bfdb89e.us-east-1.amazon.com (Postfix) with ESMTPS id C9260E347C;
        Thu, 18 Aug 2022 15:59:10 +0000 (UTC)
Received: from EX19D013UWB001.ant.amazon.com (10.13.138.52) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Thu, 18 Aug 2022 15:59:09 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX19D013UWB001.ant.amazon.com (10.13.138.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.12;
 Thu, 18 Aug 2022 15:59:09 +0000
Received: from [192.168.92.216] (10.85.143.172) by mail-relay.amazon.com
 (10.43.161.249) with Microsoft SMTP Server id 15.0.1497.38 via Frontend
 Transport; Thu, 18 Aug 2022 15:59:04 +0000
Message-ID: <1d289cbb-58d9-613a-fc45-ef21c48a79b7@amazon.com>
Date:   Thu, 18 Aug 2022 18:59:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
CC:     <brgl@bgdev.pl>, <mark.rutland@arm.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <talel@amazon.com>, <hhhawa@amazon.com>, <jonnyc@amazon.com>,
        <hanochu@amazon.com>, <ronenk@amazon.com>, <itamark@amazon.com>,
        <shellykz@amazon.com>, <shorer@amazon.com>, <amitlavi@amazon.com>,
        <almogbs@amazon.com>, <dwmw@amazon.co.uk>
References: <20220816130002.41450-1-farbere@amazon.com>
 <20220816130002.41450-2-farbere@amazon.com>
 <20220818014839.GD921960-robh@kernel.org>
From:   "Farber, Eliav" <farbere@amazon.com>
In-Reply-To: <20220818014839.GD921960-robh@kernel.org>
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

On 8/18/2022 4:48 AM, Rob Herring wrote:
> If this is a power supply control, use a gpio regulator.

It is indeed a power supply control.
I'll push a new series that uses a gpio regulator.

--
Thanks, Eliav

