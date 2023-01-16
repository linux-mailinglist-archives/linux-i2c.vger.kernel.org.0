Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33C2F66CDA7
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 18:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235028AbjAPRiB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 12:38:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235030AbjAPRhb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 12:37:31 -0500
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2AD4994C
        for <linux-i2c@vger.kernel.org>; Mon, 16 Jan 2023 09:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=w1LUSCVWZ7Syw8u6ThTn2S4HX4oh/KBC7LmySmtfZBs=; b=Pt6HE/8a3K9tADKFcne9enQp8C
        7A+NwiewtuVlb+Zab8ACTQiPx7HuVpuQrE7H7dfKrVsyy9CF9onefAf3yUxmELxoupY5YUcfGigka
        /rKpQoPrpV6gC5HPpBLE82bMA8K1o/4qUYqFfM0VpWQrTTVuDx+l5OcbjwGnVCEIwHOxFQnkVS0Fu
        AbjRy64W3EMxJlpZh2sqSDi5rCdhiok0XRtBZsaQMMx7p8w0VkqHamuW6n/zDbE/ROwOq60aEtCxk
        zkcEKQXy0PNu189BdXsAcDga6YEOHUoGCsPvmgRV33l3DP8xU/oZr/ICT3UQZwZf9kXYNdo9vHPtH
        KY2RmwEg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pHT3t-0000P7-Hz; Mon, 16 Jan 2023 18:14:21 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b]
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pHT3t-000RHP-6s; Mon, 16 Jan 2023 18:14:21 +0100
Message-ID: <7fc8ed1d-c28d-1c0b-bce7-de75872f4ea2@metafoo.de>
Date:   Mon, 16 Jan 2023 09:14:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 5/5] i2c: cadence: Remove unnecessary register reads
Content-Language: en-US
To:     Michal Simek <michal.simek@amd.com>, Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-6-lars@metafoo.de>
 <1086bd44-fc57-8a68-a418-1154828729b2@amd.com>
From:   Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <1086bd44-fc57-8a68-a418-1154828729b2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26783/Mon Jan 16 09:28:30 2023)
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/16/23 06:58, Michal Simek wrote:
>
>
> On 1/7/23 22:18, Lars-Peter Clausen wrote:
>>
>> In the `cdns_i2c_mrecv()` function the CTRL register of the Cadence I2C
>> controller is written and read back multiple times. The register 
>> value does
>> not change on its own. So it is possible to remember the just written 
>> value
>> instead of reading it back from the hardware.
>>
>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>> ---
>>   drivers/i2c/busses/i2c-cadence.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-cadence.c 
>> b/drivers/i2c/busses/i2c-cadence.c
>> index bec50bfe7aad..93c6d0822468 100644
>> --- a/drivers/i2c/busses/i2c-cadence.c
>> +++ b/drivers/i2c/busses/i2c-cadence.c
>> @@ -613,7 +613,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>>
>>          /* Determine hold_clear based on number of bytes to receive 
>> and hold flag */
>>          if (!id->bus_hold_flag && id->recv_count <= 
>> CDNS_I2C_FIFO_DEPTH) {
>> -               if (cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & 
>> CDNS_I2C_CR_HOLD) {
>> +               if (ctrl_reg & CDNS_I2C_CR_HOLD) {
>>                          hold_clear = true;
>>                          if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT)
>>                                  irq_save = true;
>> @@ -624,7 +624,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>>          addr &= CDNS_I2C_ADDR_MASK;
>>
>>          if (hold_clear) {
>> -               ctrl_reg = cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & 
>> ~CDNS_I2C_CR_HOLD;
>> +               ctrl_reg &= ~CDNS_I2C_CR_HOLD;
>>                  /*
>>                   * In case of Xilinx Zynq SOC, clear the HOLD bit 
>> before transfer size
>>                   * register reaches '0'. This is an IP bug which 
>> causes transfer size
>> -- 
>> 2.30.2
>>
>
> Logically this is fine but that additional read on CR register ensures 
> that IP receive previous writes. The code itself is related to bug on 
> Zynq SoC and that two additional readbacks can actually do something.
>
> I think this should be properly tested on zynq to ensure that it 
> doesn't break anything.
>
> Shubhrajyoti: Can you please make sure that it is tested on Zynq?
Maybe it is better to drop the patch then if it is used to enforce 
ordering in the hardware. But I guess we should add a comment to explain 
this.
