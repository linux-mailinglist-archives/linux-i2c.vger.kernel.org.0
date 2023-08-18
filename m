Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F176780D02
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 15:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377386AbjHRNwU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Aug 2023 09:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377449AbjHRNwC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Aug 2023 09:52:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713F1114;
        Fri, 18 Aug 2023 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692366721; x=1723902721;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PCENrtaPcOVgzt+0HSz4cxOUh2pO83Ef4o5U53ChBlg=;
  b=egwb/7a3hPdTOOM5g2O0ykrfr3pxD+TzAvwL9/ekDIPeFcpSCRKExknm
   D8u2w0TlhESpWL7JMP+b1aakQuKA9YjjD7d5n+mdCd6aCQNJuL3PkUKKE
   9riBWzXv7rZWWt6koLmjKQKcnGvF97U8hHwHz0U5PvVum9vFAgm4VQD0L
   Wdyp9292gO56elP+SoTwcANhnmxYu08RPS+iFUxajjrp5CcRVsJ4YWaBv
   jouqHkEBtq/9IxD9vpjjNeenp0DodsHFamuu4OO8goe/JFZrr/hfh3XbC
   BjLCDwTiUDg8/EInc7HPA/epkn5xSEP7z4quCnWXWRMV6l6YQo8gQG7U/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="437014471"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="437014471"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 06:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="735104661"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="735104661"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by orsmga002.jf.intel.com with ESMTP; 18 Aug 2023 06:51:58 -0700
Message-ID: <49384d62-7c5c-41d7-bbbd-b9aee5d1d0a3@linux.intel.com>
Date:   Fri, 18 Aug 2023 16:51:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: add support for pinctrl for recovery
Content-Language: en-US
To:     Yann Sionneau <yann@sionneau.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>
References: <20230816095015.23705-1-yann@sionneau.net>
 <97d62909-551b-4abd-a743-5be09e617665@linux.intel.com>
 <685b10d2-7627-eea8-69e4-454af039fa5d@sionneau.net>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <685b10d2-7627-eea8-69e4-454af039fa5d@sionneau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/17/23 17:27, Yann Sionneau wrote:
> Hi
> 
> Le 17/08/2023 à 10:07, Jarkko Nikula a écrit :
>> Hi
>>
>> On 8/16/23 12:50, Yann Sionneau wrote:
>>> From: Yann Sionneau <ysionneau@kalray.eu>
>>>
>>> Currently if the SoC needs pinctrl to switch the SCL and SDA
>>> from the I2C function to GPIO function, the recovery won't work.
>>>
>>> scl-gpio = <>;
>>> sda-gpio = <>;
>>>
>>> Are not enough for some SoCs to have a working recovery.
>>> Some need:
>>>
>>> scl-gpio = <>;
>>> sda-gpio = <>;
>>> pinctrl-names = "default", "recovery";
>>> pinctrl-0 = <&i2c_pins_hw>;
>>> pinctrl-1 = <&i2c_pins_gpio>;
>>>
>>> The driver was not filling rinfo->pinctrl with the device node
>>> pinctrl data which is needed by generic recovery code.
>>>
>>> Tested-by: Yann Sionneau <ysionneau@kalray.eu>
>>> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
>>
>> Tested-by from author is needless. Expectation is that author has 
>> tested the patch while not always true :-)
> Ok, I just wanted to emphasize the fact that I have the device and I 
> tested the change with the device. Ack!
>>
>>> @@ -905,6 +906,15 @@ static int i2c_dw_init_recovery_info(struct 
>>> dw_i2c_dev *dev)
>>>           return PTR_ERR(gpio);
>>>       rinfo->sda_gpiod = gpio;
>>>   +    rinfo->pinctrl = devm_pinctrl_get(dev->dev);
>>> +    if (IS_ERR(rinfo->pinctrl)) {
>>> +        if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
>>> +            return PTR_ERR(rinfo->pinctrl);
>>> +
>>> +        rinfo->pinctrl = NULL;
>>> +        dev_info(dev->dev, "can't get pinctrl, bus recovery might 
>>> not work\n");
>>
>> I think dev_dbg() suits better here or is it needed at all? End user 
>> may not be able to do anything when sees this in dmesg. I.e. more like 
>> development time dev_dbg() information.
> I agree dev_dbg() is a better idea.
>>
>> Does i2c-core-base.c: i2c_gpio_init_pinctrl_recovery() already do 
>> dev_info() print when pinctrl & GPIO are set properly making above 
>> also kind of needless?
> 
> Thanks for the review. In fact I had to use gdb to understand why the 
> recovery was not working. Because as you said, it only prints something 
> to say "everything looks ok!".
> 
> I kind of prefer when it prints when something goes wrong.
> 
> But I let you decide what you think is the best.
> 
Fair enough, dev_dbg() is justified when it makes developer's life 
easier :-)
