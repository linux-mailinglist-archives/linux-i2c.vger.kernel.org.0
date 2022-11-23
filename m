Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292A0636105
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 15:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238404AbiKWOD7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 09:03:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238402AbiKWODl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 09:03:41 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FAC7658;
        Wed, 23 Nov 2022 05:59:06 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id f18so42997141ejz.5;
        Wed, 23 Nov 2022 05:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AJ96Qo939E/LqBCZfcidWQRpLbhFZIXN8NEAiTpAhxk=;
        b=iZRqD+AZI8YXmWPNNo+Fwqqrxkdxxp8sdDhXpzQpS+Z7O6ViZRfqwWBRa1+q6Fn++z
         AayBKunxqdaXyMJwtJZy3prCnDCGQ0bf8s3sNL8v8cU+NRhqFpeFsIofjTg60S/cPv71
         H+sPHuj9u82mvhCqWAi/DQC3hw1wr9h8SadxlGtO1i2opKK+8L4eXSIBcFr67zvlz0zl
         CppQAaJx+cMEavlnguot+la0zcqSDuv3T+S6/PQUa7xI6LA3gJLCSh2MX8CVHkwmdm4o
         1ueE/AeHSGD8djbrX3VA431+kO+OYoaPdqwS1MoX0XoMPIRKU2d/L5Kyjwtu65MvGCmS
         m0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJ96Qo939E/LqBCZfcidWQRpLbhFZIXN8NEAiTpAhxk=;
        b=N/g480wtD8DkRSvzjFK0982z5jF2d5bt6Z1mRY2gUT8oWuFBrWpXcTDoTGEPC1oVjY
         HmgB7FZUep8UNto1dQarttCT5e3x/XLxsACdFjekiqBJLgQa5Aw7Tk6tO3E9FkGwA5ON
         ALcL2RLr1kNdIuXQyYgriWXLBCa6cFr4zmC/W5v5grjhxxpy2VeztCJkn6jUdMJzHS2M
         ZBMuVcPqSbispu9NW8zw5xFgVDF+YIR2cpycjrTInTGEAI0B7U4HWbOtVSiJRU84vp43
         fy8C2FRHALL5moTG7La08EDJ5ioCnI51rHhzn5kVAn5ZhAEcciSfpraZ5ee5a63WXSVG
         v5Cg==
X-Gm-Message-State: ANoB5pnP/M70V7HMqNOn81cSXBk/Q/kxqbX6LGjBSOfq10OY/urW1f+G
        X13+ETVLkpWNCdJ4HXMB4YA=
X-Google-Smtp-Source: AA0mqf4zngmNYriYQQf6WQDa/SSuXsv/0hsexE8WPkPKL+mwy2wneQC+ycXRX8UErwxgAKGb3ytkyA==
X-Received: by 2002:a17:906:c30c:b0:7ba:1f48:ccec with SMTP id s12-20020a170906c30c00b007ba1f48ccecmr1909635ejz.105.1669211944571;
        Wed, 23 Nov 2022 05:59:04 -0800 (PST)
Received: from [10.20.0.7] ([37.120.217.162])
        by smtp.gmail.com with ESMTPSA id d12-20020a056402078c00b0045b3853c4b7sm7741854edy.51.2022.11.23.05.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:59:04 -0800 (PST)
Message-ID: <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
Date:   Wed, 23 Nov 2022 14:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
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
From:   Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
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

On 11/23/22 14:34, Andy Shevchenko wrote:
> On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
>> On 11/23/22 13:25, Greg Kroah-Hartman wrote:
>>> The uevent() callback in struct device_type should not be modifying the
>>> device that is passed into it, so mark it as a const * and propagate the
>>> function signature changes out into all relevant subsystems that use
>>> this callback.
> 
> [...]
> 
>>> -static inline struct ssam_device *to_ssam_device(struct device *d)
>>> +static inline struct ssam_device *to_ssam_device(const struct device *d)
>>>    {
>>>    	return container_of(d, struct ssam_device, dev);
>>>    }
>>
>> I am slightly conflicted about this change as that now more or less
>> implicitly drops the const. So I'm wondering if it wouldn't be better to
>> either create a function specifically for const pointers or to just
>> open-code it in the instance above.
>>
>> I guess we could also convert this to a macro. Then at least there
>> wouldn't be an explicit and potentially misleading const-conversion
>> indicated in the function signature.
> 
> This is an intermediate step as far as I know since moving container_of to
> recognize const is a bit noisy right now. I guess you can find a discussion
> on the topic between Greg and Sakari.

Thanks! I assume you are referring to the following?

	https://lore.kernel.org/lkml/4218173bd72b4f1899d4c41a8e251f0d@AcuMS.aculab.com/T/

As far as I can tell this is only a warning in documentation, not
compile time (which would probably be impossible?).

As I've said I'd be fine with converting the function to a macro (and
preferably adding a similar warning like the one proposed in that
thread). The point that irks me up is just that, as proposed, the
function signature would now advertise a conversion that should never be
happening.

Having two separate functions would create a compile-time guarantee, so
I'd prefer that, but I can understand if that might be considered too
noisy in code. Or if there is a push to make container_of() emit a
compile-time warning I'd also be perfectly happy with converting it to a
macro now as that'd alleviate the need for functions in the future.

Regards,
Max

