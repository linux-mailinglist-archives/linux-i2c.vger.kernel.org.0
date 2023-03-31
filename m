Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD8E16D25EA
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Mar 2023 18:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbjCaQn5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Mar 2023 12:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbjCaQnf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Mar 2023 12:43:35 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7002320DA6;
        Fri, 31 Mar 2023 09:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=xg33sxZuQ2RDlsNvpuyqfRcABGyvjFqfHrPtwUhWZB8=; b=ap9VL4WkE69rdt5PzmNLx1JB/C
        wxWmbYnxZu41dNbvCmrDo3fGo7/CDkxGcyD9WaIPsKuwRjGLCv1lQSoDhlEoDIYo9gGv80WY+RGno
        2U53odDf5bNNnJ9OTipIcM4cjVi8BDKilacEdbm96ZUezo9J1qBFNikJvSHABicO4MfTZ0Zt3jmyu
        e5MR32omZ/2Iw8pW2MixsdYH9YmP/ZUUPxyXrVf//WhJRoutMVi3By+0+3Jz8JDVw3djOizbNS2FY
        wpY6epaitQpNBL+lB5JWyndKJGCRrPGLIUZyWM0Vm86nkpA6UUnT/F0hNDxEkhyT0C9AR/xTpXjcp
        5+lF8uWQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1piHpG-000H5h-Nh; Fri, 31 Mar 2023 18:42:06 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b]
        by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1piHpG-000Rew-Bc; Fri, 31 Mar 2023 18:42:06 +0200
Message-ID: <877b6d75-cd3d-14b4-5e7e-639fa1c8e2d5@metafoo.de>
Date:   Fri, 31 Mar 2023 09:42:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] i2c: cadence: Add reset controller support
To:     Michal Simek <michal.simek@amd.com>, Wolfram Sang <wsa@kernel.org>
Cc:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230330180448.269635-1-lars@metafoo.de>
 <20230330180448.269635-2-lars@metafoo.de>
 <1e929c0d-9a3c-1adb-b5de-e953f2cf3795@amd.com>
Content-Language: en-US
From:   Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <1e929c0d-9a3c-1adb-b5de-e953f2cf3795@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26861/Fri Mar 31 09:24:12 2023)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/30/23 23:49, Michal Simek wrote:
>
>
> On 3/30/23 20:04, Lars-Peter Clausen wrote:
>> The Cadence I2C controller has an external reset signal that needs to be
>> de-asserted before the I2C controller can be used.
>>
>> Add support to the driver to be able to take the peripheral out of reset
>> using the reset controller API. The reset is optional in the driver for
>> compatibility to systems where the reset managed by the bootloader.
>>
>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>> ---
>>   drivers/i2c/busses/i2c-cadence.c | 26 ++++++++++++++++++++++----
>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-cadence.c 
>> b/drivers/i2c/busses/i2c-cadence.c
>> index 8f61a633c42c..102774ab2497 100644
>> --- a/drivers/i2c/busses/i2c-cadence.c
>> +++ b/drivers/i2c/busses/i2c-cadence.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/of.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/pinctrl/consumer.h>
>> +#include <linux/reset.h>
>>     /* Register offsets for the I2C device. */
>>   #define CDNS_I2C_CR_OFFSET        0x00 /* Control Register, RW */
>> @@ -178,6 +179,7 @@ enum cdns_i2c_slave_state {
>>    * @bus_hold_flag:    Flag used in repeated start for clearing HOLD 
>> bit
>>    * @clk:        Pointer to struct clk
>>    * @clk_rate_change_nb:    Notifier block for clock rate changes
>> + * @reset:        Reset control for the device
>>    * @quirks:        flag for broken hold bit usage in r1p10
>>    * @ctrl_reg:        Cached value of the control register.
>>    * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR 
>> register
>> @@ -204,6 +206,7 @@ struct cdns_i2c {
>>       unsigned int bus_hold_flag;
>>       struct clk *clk;
>>       struct notifier_block clk_rate_change_nb;
>> +    struct reset_control *reset;
>>       u32 quirks;
>>       u32 ctrl_reg;
>>       struct i2c_bus_recovery_info rinfo;
>> @@ -1325,10 +1328,22 @@ static int cdns_i2c_probe(struct 
>> platform_device *pdev)
>>           return dev_err_probe(&pdev->dev, PTR_ERR(id->clk),
>>                        "input clock not found.\n");
>>   +    id->reset = devm_reset_control_get_optional_shared(&pdev->dev, 
>> NULL);
>> +    if (IS_ERR(id->reset))
>> +        return dev_err_probe(&pdev->dev, PTR_ERR(id->reset),
>> +                             "Failed to request reset.\n");
>
> incorrect alignment.
>
>> +
>>       ret = clk_prepare_enable(id->clk);
>>       if (ret)
>>           dev_err(&pdev->dev, "Unable to enable clock.\n");
>>   +    ret = reset_control_deassert(id->reset);
>> +    if (ret) {
>> +        dev_err_probe(&pdev->dev, ret,
>> +                      "Failed to de-assert reset.\n");
>
> incorrect alignment
Wrong tabstop, that's embarrassing. Will fix.


