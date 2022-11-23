Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E277636302
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 16:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238450AbiKWPO2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 10:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238316AbiKWPO1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 10:14:27 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4670685EC9;
        Wed, 23 Nov 2022 07:14:26 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id m22so43412713eji.10;
        Wed, 23 Nov 2022 07:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgnV7dzGWIIK4HLAnWBaJEBL2mTLW/I0cvrJZ3aQwLQ=;
        b=YMJ/LWVHtvivchBTzQwnK1vjlMO+Yz1qi3F+5UiPUgfXYsHW97FLmplkkb1fg1J6+K
         goYB9EqDRSGMEVxvnaAeVTF9Lc9Gf4uLBWSxTIzEd4dGukliptoZ4n3exYdegKJZSLxS
         jqqRYMpOfvNhGznAoadCbX01da13AhoRzrTcCdNaWrn84IMP2tAXwxgcb2DgicvEWWfp
         i43A/VFojKzoOpulaS8VMliUQvFXuOXde7c6MUNzuEGgGRk68D/p2retyzW7n9p5jNzk
         Eo7b36EnX4jR3LhMZcShGFxfcBKk4/LQlmgUCRROq02DkIDupJ6I37wpVS8vwAn/gosV
         VeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgnV7dzGWIIK4HLAnWBaJEBL2mTLW/I0cvrJZ3aQwLQ=;
        b=LzuxTEdqA88PnYU4gqT00hsmfe67JhBfKZ8N7IREaY72Vtlxa1J4d2A5b4VmXQhz9z
         mXz+qWJYkUortzDNKIXvMyqn7zEnb5Sb6uxwfj/eUYH8tN16wgfvdpozZN0nsNmr/SCh
         rLC5YlCQfeGBdZrpVYRvDDG0dspymCOOKVoCex03xPm5YmNbC1ZWu4BuPPED6XTpFiKf
         LdTF54y88fC+9vSY/Y76BCyWRc/o6ivE4ARSbGre2tXEvoUStPa/ZHlQhpbOhaYXgKpz
         6YMKX5OR63pfLb7p+9vhHL940BZTMi0zW14BmRwDnTV2ZBtG5QAwDOsnqQ5CXeztWul/
         49DQ==
X-Gm-Message-State: ANoB5plzpdHvWBZeaU8nqPhHKmuMaKrgMbNlahjL3mNV2KIcYlMcVpPm
        LQhYbY1+OgPD3rtZ02FBKrk=
X-Google-Smtp-Source: AA0mqf4dYNQ+ZnGLQviZkjaXr5Ekk3BmqKbpbTm6Z2vYCMarSSYwjqBcLfCq2BgNFKCJrb/e5E7t4w==
X-Received: by 2002:a17:906:402:b0:7a6:fc0f:6fe6 with SMTP id d2-20020a170906040200b007a6fc0f6fe6mr23229240eja.694.1669216464581;
        Wed, 23 Nov 2022 07:14:24 -0800 (PST)
Received: from [10.20.0.7] ([37.120.217.162])
        by smtp.gmail.com with ESMTPSA id ky13-20020a170907778d00b0077a1dd3e7b7sm7251748ejc.102.2022.11.23.07.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 07:14:23 -0800 (PST)
Message-ID: <f96587d1-2610-8702-ba6a-bc15297eb2ab@gmail.com>
Date:   Wed, 23 Nov 2022 16:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Wolfram Sang <wsa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        Ming Lei <ming.lei@redhat.com>,
        Jilin Yuan <yuanjilin@cdjrlc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ira Weiny <ira.weiny@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <Y34zyzdbRUdyOSkA@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/23/22 15:52, Matthew Wilcox wrote:
> On Wed, Nov 23, 2022 at 02:59:00PM +0100, Maximilian Luz wrote:
>> On 11/23/22 14:34, Andy Shevchenko wrote:
>>> On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
>>>> On 11/23/22 13:25, Greg Kroah-Hartman wrote:
>>>>> The uevent() callback in struct device_type should not be modifying the
>>>>> device that is passed into it, so mark it as a const * and propagate the
>>>>> function signature changes out into all relevant subsystems that use
>>>>> this callback.
>>>
>>> [...]
>>>
>>>>> -static inline struct ssam_device *to_ssam_device(struct device *d)
>>>>> +static inline struct ssam_device *to_ssam_device(const struct device *d)
>>>>>     {
>>>>>     	return container_of(d, struct ssam_device, dev);
>>>>>     }
>>>>
>>>> I am slightly conflicted about this change as that now more or less
>>>> implicitly drops the const. So I'm wondering if it wouldn't be better to
>>>> either create a function specifically for const pointers or to just
>>>> open-code it in the instance above.
>>>>
>>>> I guess we could also convert this to a macro. Then at least there
>>>> wouldn't be an explicit and potentially misleading const-conversion
>>>> indicated in the function signature.
>>>
>>> This is an intermediate step as far as I know since moving container_of to
>>> recognize const is a bit noisy right now. I guess you can find a discussion
>>> on the topic between Greg and Sakari.
>>
>> Thanks! I assume you are referring to the following?
>>
>> 	https://lore.kernel.org/lkml/4218173bd72b4f1899d4c41a8e251f0d@AcuMS.aculab.com/T/
>>
>> As far as I can tell this is only a warning in documentation, not
>> compile time (which would probably be impossible?).
>>
>> As I've said I'd be fine with converting the function to a macro (and
>> preferably adding a similar warning like the one proposed in that
>> thread). The point that irks me up is just that, as proposed, the
>> function signature would now advertise a conversion that should never be
>> happening.
>>
>> Having two separate functions would create a compile-time guarantee, so
>> I'd prefer that, but I can understand if that might be considered too
>> noisy in code. Or if there is a push to make container_of() emit a
>> compile-time warning I'd also be perfectly happy with converting it to a
>> macro now as that'd alleviate the need for functions in the future.
> 
> Can't we do:
> 
> static inline const struct ssam_device *to_ssam_device(const struct device *d)
> {
> 	return container_of(d, const struct ssam_device, dev);
> }

There are at least a couple of places (device/driver-management and
device-removal related, I think) using this function and requiring
non-const access.

A bunch of other instances could be converted to const-access only, but
that would require a couple more function signature changes (I should
probably set up a patch for that regardless of this here as being a bit
more strict about this makes sense).

Regards,
Max
