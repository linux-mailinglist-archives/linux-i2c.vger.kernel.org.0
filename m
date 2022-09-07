Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FFF5AFEA4
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 10:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiIGIM6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 04:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiIGIM5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 04:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB07A9C37
        for <linux-i2c@vger.kernel.org>; Wed,  7 Sep 2022 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662538372;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G7JSisCjfZkuxA0PRfAg5vFvEX0TLAd+IEtq8gNC3kc=;
        b=V/8BHPSNINTKaZlHcBc5xLh1zrMS1xW0ibF8dhlZVyqGkzK2OAWEQTRtE8ufvmmmJlInRu
        HIG3TxYF9BR4EZqW13mBC3DUkNBtN5xIym7w5dBt6XCIuoZd/7UNBViVOnyulQWIQdrl24
        dwWsLTo2VVDwtF09SYEabHJVroMddUE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-211-RtVIPdfhPOeRM7IaoS9mnA-1; Wed, 07 Sep 2022 04:12:51 -0400
X-MC-Unique: RtVIPdfhPOeRM7IaoS9mnA-1
Received: by mail-ej1-f69.google.com with SMTP id ho13-20020a1709070e8d00b00730a655e173so4547172ejc.8
        for <linux-i2c@vger.kernel.org>; Wed, 07 Sep 2022 01:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=G7JSisCjfZkuxA0PRfAg5vFvEX0TLAd+IEtq8gNC3kc=;
        b=MOtBvQ8AsmrMeLfwHkGWIbdDAmb1i7Zjby8SRdqmKbs6X3mVNaz+6AQJYoiFIqTxLf
         RL1O5sli1Tx+4zWQ+s1i+svgYCNUFh0MXB7tZeIEerOj25JA8sdZH6xALaC7W74ldAxK
         ym8lSC6IquVTio42KRL/IznpxPVOVk50K2jkkXQ/OgTaDV2+4o9ChZk6G5ePOeETF6tL
         zckQMdrQ6E1o+pWRMSWTwKCjw7vxZfmugVrceqCdkVEnha5/s8jRm2tIyfvLUIru260Z
         k7z6xp2mS2fS2Cd1QyVzZ5M+eNXlmtLeLeQh572626ivDRYSTjraTCJA7sUL1xMJOUS4
         Hhzg==
X-Gm-Message-State: ACgBeo2UF1PldBGK119Bs0fInO8ChV6GtHk45Zn8jx44ku/OdeR1+Pey
        p0p86M3CXbYP0s4aG7PHyw4uXP5zBLbvx5AaDFNiegbU7kPbinHp6rX31tuyl68gRbUlGZuWhcV
        Wv+xrXrg2K0zzD97UKgpc
X-Received: by 2002:a17:907:86a9:b0:741:79ed:63c5 with SMTP id qa41-20020a17090786a900b0074179ed63c5mr1540650ejc.672.1662538369562;
        Wed, 07 Sep 2022 01:12:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6E7X+C9AseYow/fk8IncNlnPrHRbuIQLWSexVQ0dpu7EwNQeTbL7l1XmIgxgTUySZsotEezQ==
X-Received: by 2002:a17:907:86a9:b0:741:79ed:63c5 with SMTP id qa41-20020a17090786a900b0074179ed63c5mr1540637ejc.672.1662538369275;
        Wed, 07 Sep 2022 01:12:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id m2-20020a170906848200b007707ab1139csm1071181ejx.75.2022.09.07.01.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 01:12:48 -0700 (PDT)
Message-ID: <98559c23-cc22-3b85-2102-0cc760240804@redhat.com>
Date:   Wed, 7 Sep 2022 10:12:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/8] i2c: acpi: Use ACPI GPIO wake capability bit to set
 wake_irq
Content-Language: en-US
To:     Raul Rangel <rrangel@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20220830231541.1135813-1-rrangel@chromium.org>
 <20220830171332.4.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
 <YxftNQrRx3fwsobk@google.com>
 <CAHQZ30DPmn1hN+xfck7CgOGLcze0jtHxxWnq7yVVL0Q_DzG6UQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHQZ30DPmn1hN+xfck7CgOGLcze0jtHxxWnq7yVVL0Q_DzG6UQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 9/7/22 04:00, Raul Rangel wrote:
> On Tue, Sep 6, 2022 at 7:00 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> On Tue, Aug 30, 2022 at 05:15:37PM -0600, Raul E Rangel wrote:
>>> Device tree already has a mechanism to pass the wake_irq. It does this
>>> by looking for the wakeup-source property and setting the
>>> I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses at the
>>> ACPI GpioInt wake flag to determine if the interrupt can be used to wake
>>> the system. Previously the i2c drivers had to make assumptions and
>>> blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
>>> If there is a device with an Active Low interrupt and the device gets
>>> powered off while suspending, the interrupt line will go low since it's
>>> no longer powered and wake the system. For this reason we should respect
>>> the board designers wishes and honor the wake bit defined on the
>>> GpioInt.
>>>
>>> This change does not cover the ACPI Interrupt or IRQ resources.
>>>
>>> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
>>> ---
>>>
>>>  drivers/i2c/i2c-core-acpi.c |  8 ++++++--
>>>  drivers/i2c/i2c-core-base.c | 17 +++++++++++------
>>>  drivers/i2c/i2c-core.h      |  4 ++--
>>>  3 files changed, 19 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
>>> index c762a879c4cc6b..cfe82a6ba3ef28 100644
>>> --- a/drivers/i2c/i2c-core-acpi.c
>>> +++ b/drivers/i2c/i2c-core-acpi.c
>>> @@ -182,12 +182,13 @@ static int i2c_acpi_add_resource(struct acpi_resource *ares, void *data)
>>>  /**
>>>   * i2c_acpi_get_irq - get device IRQ number from ACPI
>>>   * @client: Pointer to the I2C client device
>>> + * @wake_capable: Set to 1 if the IRQ is wake capable
>>>   *
>>>   * Find the IRQ number used by a specific client device.
>>>   *
>>>   * Return: The IRQ number or an error code.
>>>   */
>>> -int i2c_acpi_get_irq(struct i2c_client *client)
>>> +int i2c_acpi_get_irq(struct i2c_client *client, int *wake_capable)
>>>  {
>>>       struct acpi_device *adev = ACPI_COMPANION(&client->dev);
>>>       struct list_head resource_list;
>>> @@ -196,6 +197,9 @@ int i2c_acpi_get_irq(struct i2c_client *client)
>>>
>>>       INIT_LIST_HEAD(&resource_list);
>>>
>>> +     if (wake_capable)
>>> +             *wake_capable = 0;
>>> +
>>>       ret = acpi_dev_get_resources(adev, &resource_list,
>>>                                    i2c_acpi_add_resource, &irq);
>>
> 
> 
>> You also need to handle "Interrupt(..., ...AndWake)" case here. I would
>> look into maybe defining
>>
>> #define IORESOURCE_IRQ_WAKECAPABLE      (1<<6)
>>
>> in include/linux/ioport.h and plumbing it through from ACPI layer.
>>
>> Thanks.
> 
> AFAIK the Intel (Not 100% certain) and AMD IO-APIC's can't actually
> wake a system from suspend/suspend-to-idle.

That may be true for S3 suspend (it sounds about right) there
certainly is no way to "arm for wakeup" on the APIC, but with
s2idle all IRQs which are not explicitly disabled by the OS
still function normally so there any IRQ can be a wakeup
source (AFAIK).

And even with S3 suspend I think some IRQs can act as wakeup,
but that is configured by the BIOS then and not something which
linux can enable/disable. E.g IIRC the parent IRQ of the GPIO
controllers on x86 is an APIC IRQ ...

Regards,

Hans

