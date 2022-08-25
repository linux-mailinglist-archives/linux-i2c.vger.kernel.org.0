Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B30C5A1743
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 18:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237844AbiHYQyh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 12:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232030AbiHYQyg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 12:54:36 -0400
Received: from vsp02-out.oderland.com (vsp02-out.oderland.com [IPv6:2a02:28f0::27:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F6C6423
        for <linux-i2c@vger.kernel.org>; Thu, 25 Aug 2022 09:54:33 -0700 (PDT)
X-Scanned-Cookie: 267db6f8f9a97f6a9e31a6b4b0d50f1894f1cfd3
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
        by vsp-out.oderland.com (Halon) with ESMTPSA
        id 9665d466-2496-11ed-896b-b78c77300f9c;
        Thu, 25 Aug 2022 18:54:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=oderland.se
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qoIXEGBFvJ6AOtggeoNHNbgMSMJ23NQpSmFJXloDSHc=; b=ZwWN8+mo547kFjHwcoeIFlxIJh
        jIwzfvPMh5yniod6We2U92fKkMlI2+cUonumpT+CZ7ysM5KCBbOX5B8rI1btWXZJrF1Cwq/gE5tru
        8JC8VC+cpNV/frS6O0Sq9Du5PnMIdAiJNnHcj6MJ5YJayq6XWoC/W5MvdP1xXOw9NQY8ZjJPbkQ/E
        moxK8w6TRDYN5sxMss8q6Xaje2/bMbBmS+69+6rwCNX5SY9Nour+u3rklSH/6qi8iTVvgvNSES41Q
        D8cfSlroiw8oGXn3W/wCjsC1FNPwL8nSJp3FuP86ST19Ip/M2fMSYv/RagMqGtIrSeodLAV8QUbah
        DQDCMkHA==;
Received: from 160.193-180-18.r.oderland.com ([193.180.18.160]:34078 helo=[10.137.0.14])
        by office.oderland.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <josef@oderland.se>)
        id 1oRG7j-006mLp-ME;
        Thu, 25 Aug 2022 18:54:30 +0200
Message-ID: <aa5f706a-6759-0fce-054e-daccb544d2fd@oderland.se>
Date:   Thu, 25 Aug 2022 18:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH v3 1/1] i2c: scmi: Replace open coded
 device_get_match_data()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
References: <20220708120958.74034-1-andriy.shevchenkolinux!intel!com>
 <4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oderland.se>
 <YweRxiJl5zzufXUl@smile.fi.intel.com>
Content-Language: en-US
From:   Josef Johansson <josef@oderland.se>
In-Reply-To: <YweRxiJl5zzufXUl@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
x-oderland-domain-valid: yes
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/25/22 17:14, Andy Shevchenko wrote:
> On Tue, Aug 16, 2022 at 08:03:33AM +0200, Josef Johansson wrote:
>> On 7/8/22 14:09, Andy Shevchenko wrote:
>> I tried build Linux 6.0 and run under Xen 4.14.5. I got a kernel null pointer dereferenced while booting. Reverting this commit allowed the system to boot.
>>
>> Since I do not have any way of capturing the error except camera (it's a long message), here's my best try.
>>
>> BUG: kernel NULL pointer dereference, address: 0000000000000000
> I think I know what happens there. Can you test a hackpatch (below)
> with my patch _not being reverted_?
>
> diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
> index 79798fc7462a..3ed1758706b0 100644
> --- a/drivers/i2c/busses/i2c-scmi.c
> +++ b/drivers/i2c/busses/i2c-scmi.c
> @@ -426,6 +426,9 @@ static struct acpi_driver acpi_smbus_cmi_driver = {
>   		.add = acpi_smbus_cmi_add,
>   		.remove = acpi_smbus_cmi_remove,
>   	},
> +	.drv = {
> +		.acpi_match_table = acpi_smbus_cmi_ids,
> +	},
>   };
>   module_acpi_driver(acpi_smbus_cmi_driver);
>   
>
Hi,

I applied your patch and the system boots now. Good job :)

Regards
- Josef
