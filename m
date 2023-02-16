Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C73086996CC
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 15:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjBPOMr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 09:12:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjBPOMp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 09:12:45 -0500
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F993CC1B;
        Thu, 16 Feb 2023 06:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=cuXMSg7c0/dhHSzpmhXo8EI9u+VIiLQv6P21V87h9YI=; b=kd/Q5CkGBa8qe+KCbYVF3yS7Dw
        OmoaPriWdJ1agr4YemX7eo4sqpgbiytofztr15seOeoW1Gu+k4a/iHzY33Ths5yq7DF61Fwt584Kd
        sgjQCneXcRcdE6g10aBO0bD7/1Qm6BKFAa2auVDIcgA8LO7vU+Fm9aANrTne2Jdn4NXjmRBmHogjC
        d5iALWAJ/Y/2+Q9yss/ZTZ9usKV4kexr0wDONuMNRz+tmUxW6aXceom7CgT7bDoMGZ8FkF+s2Y+No
        oQWlNF19NVOmMiUNJQ7tn8nmeaOrAYByh3cPOlt2yfuyhxtgbR8xuIsg2t6eUx5/SS51SFAKLoI/h
        vzdgeDtQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pSezx-0001RN-95; Thu, 16 Feb 2023 15:12:33 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b]
        by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pSezw-000Ex3-Rm; Thu, 16 Feb 2023 15:12:33 +0100
Message-ID: <c26a994e-a004-8706-eb82-ce89b6cbbeb0@metafoo.de>
Date:   Thu, 16 Feb 2023 06:12:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] i2c: cadence: Allow to specify the FIFO depth and
 maximum transfer length
Content-Language: en-US
To:     Michal Simek <michal.simek@amd.com>, Wolfram Sang <wsa@kernel.org>
Cc:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230205230208.58355-1-lars@metafoo.de>
 <813224a5-54c9-f6f1-4288-703a6388dab6@amd.com>
From:   Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <813224a5-54c9-f6f1-4288-703a6388dab6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26814/Thu Feb 16 09:40:04 2023)
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/6/23 00:02, Michal Simek wrote:
>
>
> On 2/6/23 00:02, Lars-Peter Clausen wrote:
>> The FIFO depth and maximum transfer length are Synthesis configuration
>> parameters of the Cadence I2C IP. Different SoCs will use different 
>> values
>> for these parameters.
>>
>> Currently the driver has the FIFO depth hardcoded to 16 and the maximum
>> transfer length to 255. Trying to use the driver with an IP instance 
>> that
>> uses smaller values for these will work for short transfers. But longer
>> transfers will fail.
>>
>> The maximum transfer length can easily be detected at runtime since the
>> unused MSBs of the transfer length register are hardwired to 0. Writing
>> 0xff and then reading back the value will give the maximum transfer 
>> length.
>
> I think that these are pretty much two patches in one.
> The first should target transfer length part and second fifo depth part.
Hm, I'm not sure it is worth separating this out. These two are very 
tightly related, but I can split it.
>
>>   /**
>>    * cdns_i2c_probe - Platform registration call
>>    * @pdev:    Handle to the platform device structure
>> @@ -1242,6 +1274,7 @@ static int cdns_i2c_probe(struct 
>> platform_device *pdev)
>>       struct cdns_i2c *id;
>>       int ret, irq;
>>       const struct of_device_id *match;
>> +    u32 val;
>>         id = devm_kzalloc(&pdev->dev, sizeof(*id), GFP_KERNEL);
>>       if (!id)
>> @@ -1317,6 +1350,12 @@ static int cdns_i2c_probe(struct 
>> platform_device *pdev)
>>   #endif
>>       id->ctrl_reg = CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | 
>> CDNS_I2C_CR_MS;
>>   +    val = CDNS_I2C_FIFO_DEPTH_DEFAULT;
>
> you can remove val completely.
> id->fifo_depth = CDNS_I2C_FIFO_DEPTH_DEFAULT;
But only if I make fifo_depth a u32.
> ...
>

