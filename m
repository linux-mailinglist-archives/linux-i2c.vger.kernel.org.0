Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9F5673B9F4
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 16:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjFWOWZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 10:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjFWOWY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 10:22:24 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA5FBC
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687530143; x=1719066143;
  h=message-id:date:mime-version:subject:to:references:cc:
   from:in-reply-to:content-transfer-encoding;
  bh=bAcRDbkfZyQ7JIvRWjcJOEpeSVfFqOoOPCK1UXrT+b4=;
  b=bj2AYWpXZJQ7ttQ8ET+nEEaatGXDSiHzBSHaRjTHE9xKKYdK6giTvFRA
   FyKf0atyG0qJXcNBFveWTAny+NFCcNu5vjAr+syfh2H94szWEzGPhu32n
   J+XwaTO6sfO1TfneZ9LIQ6DFpyHRFXrpxIlxsD/nzXWlLcs9FV0FTsEGY
   DCBGFkR54n2VnrES5VgzIu47EmrTSGUHncMbBIoE/xFVA8NEZ6VuKcVS7
   jcIX5yrA+CfEQSfjlwXNJHlDm2DGfD9WdrSsnvkUyaAovhxbD9jK690EV
   v0shqZnDEvFcreJkEsMaf+nyfhiACA9twDcZ5l0HxFANXaYWy4OqtN5XN
   A==;
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="231819617"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 07:22:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 07:22:20 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 23 Jun 2023 07:22:19 -0700
Message-ID: <2e6c26c8-d463-8e3f-90a9-89db30847795@microchip.com>
Date:   Fri, 23 Jun 2023 16:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 03/15] i2c: busses: at91-core: Use devm_clk_get_enabled()
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        "Linux I2C" <linux-i2c@vger.kernel.org>,
        Durai Manickam <Durai.ManickamKR@microchip.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-4-andi.shyti@kernel.org> <ZJVyspPOps73+BaO@shikoro>
CC:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <ZJVyspPOps73+BaO@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram,

On 23/06/2023 at 12:23, Wolfram Sang wrote:
> 
> On Mon, Jun 12, 2023 at 12:56:50AM +0200, Andi Shyti wrote:
>> Replace the pair of functions, devm_clk_get() and
>> clk_prepare_enable(), with a single function
>> devm_clk_get_enabled().
>>
>> Signed-off-by: Andi Shyti<andi.shyti@kernel.org>
>> Cc: Codrin Ciubotariu<codrin.ciubotariu@microchip.com>
>> Cc: Nicolas Ferre<nicolas.ferre@microchip.com>
>> Cc: Alexandre Belloni<alexandre.belloni@bootlin.com>
>> Cc: Claudiu Beznea<claudiu.beznea@microchip.com>
> Nicolas, did you find a new maintainer for this driver?

You can contact Durai in "to" of this email. I can have a look if needed 
as well. Thanks for the heads-up!

Best regards,
  Nicolas

-- 
Nicolas Ferre

