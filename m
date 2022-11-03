Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B08486183E4
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Nov 2022 17:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbiKCQOC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Nov 2022 12:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbiKCQOB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Nov 2022 12:14:01 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D81E1C0;
        Thu,  3 Nov 2022 09:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=tdo3PoFWUzGf2zhyiSfmr4AcdFeNXBeJH5MJ1etixbU=; b=I+oWoydgq5bfBQSi/2S3SyITm2
        K5kvHHY7kjckNY6l6vqJOefMAS7k4SbnkPLIrNwXziQ4ykar0+NUQTfsKSGzSvlKpBO4BKCMa9XSb
        jZSLVZwqVQr2V9LacDyZJsYjlnyobSN8gah0rTcS7Drfa3uP8ucfiZ3uQfivY0J/HBaRdEQwOqYHh
        iYvaqxEjIoLgAxm0ephiy7p/3MkNWN/vn3rPHhIrf/MLpKtRJizjGVBnZ5+4o/vwDzKx1eEsIwO9x
        TVKbVeXH6v7fa60AMrPUGibKQ8ThkVlW+GgYmp5gqYtEd3FHmSV9TzSvRfH+pp/OveZl0YDajH66W
        RaES/0Cg==;
Received: from [2601:1c2:d80:3110::a2e7]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oqcqp-000cKF-61; Thu, 03 Nov 2022 16:13:55 +0000
Message-ID: <d9bbc0ab-2541-6490-d852-c7e73e1f45fb@infradead.org>
Date:   Thu, 3 Nov 2022 09:13:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: NULL pointer dereferences in hid-mcp2221
Content-Language: en-US
To:     Enrik Berkhan <Enrik.Berkhan@inka.de>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     =?UTF-8?Q?Sven_Z=c3=bchlsdorf?= <sven.zuehlsdorf@vigem.de>,
        Rishi Gupta <gupt21@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <79152feb-bcbc-9e3e-e776-13170ae4ef40@vigem.de>
 <caa425d9-e3a2-3764-6191-b308d94ac549@infradead.org>
 <20221103121645.jott66kltaz6bljq@mail.corp.redhat.com>
 <cc8a0aa304a15fbdf2f433f98c645b7e962450f1.camel@inka.de>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <cc8a0aa304a15fbdf2f433f98c645b7e962450f1.camel@inka.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 11/3/22 08:22, Enrik Berkhan wrote:
> On Thu, 2022-11-03 at 13:16 +0100, Benjamin Tissoires wrote:
>> On Nov 02 2022, Randy Dunlap wrote:
>>> Hi--
>>>
>>> [adding linux-input mailing list]
>>>
>>> On 10/25/22 00:39, Sven Zühlsdorf wrote:
>>>> Hi,
>>>>
>>>> I've run into two NULL pointer dereferences when loading the MCP2221 driver.
>>>> Initially I observed them running the kernel used by yocto kirkstone
>>>> (currently 5.15.68) but can reproduce them with a vanilla 6.1-rc1 as well.
>>>> All line numbers below are for hid-mcp2221.c, taken from 6.1-rc1.
>>>>
>>>> The first one was easy to identify, in mcp2221_probe line 874 `hdev->hidraw`
>>>> was NULL since I compiled the kernel without CONFIG_HIDRAW enabled. Should
>>>> CONFIG_HID_MCP2221 perhaps depend on or imply CONFIG_HIDRAW?
>>>
>>> Looks to me like it should. Hopefully the HID people can chime in here.
>>
>> I actually don't see why this driver (and hid-cp2112.c FWIW) should
>> depend on hidraw. To me, the reference to hidraw is just a nicer logging
>> message, but I have a hard time understanding how hidraw should be
>> involved in the driver, and if it were, how it could not break
>> everything.
>>
>> So IMO, we should probably change that line from the 2 drivers and
>> replace the hidraw part with the hid->id number which is unique.
> 
> Exactly. See also
> https://lore.kernel.org/linux-input/20220926202239.16379-2-Enrik.Berkhan@inka.de/

Great. Thanks.

-- 
~Randy
