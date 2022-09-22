Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C28095E658D
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 16:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiIVOaB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 10:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbiIVO36 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 10:29:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA944E860
        for <linux-i2c@vger.kernel.org>; Thu, 22 Sep 2022 07:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663856997;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HxUZD2Yl2mBpvSCeHuLxWU5WRH+vQvCPB+MlfCo1+9o=;
        b=Z2cdjgjPZ1Mfg8vLKOZomAHiYA9xazQRbG8PxhDSAnMprSPaNMeX5n4dYi3AIK6L5Lm9J9
        Uba7qdpCqlIzMgT68VjoSlMoYbC98lxgRxXvPCgdFjg5eWrOtiOiAD4tze2AoLh6pwV3Qe
        DUS8HQAm9dBpggBc1aIkXKOfPXD9u8I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-49-kCN06eiMO4GrJ6hDAhHGvg-1; Thu, 22 Sep 2022 10:29:56 -0400
X-MC-Unique: kCN06eiMO4GrJ6hDAhHGvg-1
Received: by mail-ed1-f72.google.com with SMTP id c6-20020a05640227c600b004521382116dso6913619ede.22
        for <linux-i2c@vger.kernel.org>; Thu, 22 Sep 2022 07:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HxUZD2Yl2mBpvSCeHuLxWU5WRH+vQvCPB+MlfCo1+9o=;
        b=P8DwPx3k4kj7w+qtpwbKLzjfIpGRx/mmhVb1j6Lzs2rE1rAKg2BvwW+TrJvy+tuWjG
         T5A11715mFe07ETYL4exI0qEgGlN8Fe5YSI1MOak+cQab7Q4lpDy4+tELeVR/NACs6F3
         wW77BVF7rdBVJr1lcC6SIZZfvoehOOKGVMIeXZHOuFT71yeIBP1J6q7mInCXZx5+Mi80
         DR1km7RwPn2MyCf05HhNrgMo2C5b/nNM+l7f1NouJ3XYonGFfB9yackM+9J/gdqcMDBh
         XrcQyWtE90R6XSM2AUdb2YXZtbkvUtfAmbqPtxM9U+u/SchJfkApoFQnJHeC0NimUyXQ
         wnwg==
X-Gm-Message-State: ACrzQf0uroWIadInW6zG4JYSy1pq+vJDbch9yuUTE48BnikmYAsHD/bm
        FsPsvmZNRcTo7PV6tpmICnhSHt+4KugAGR3lzkucqe3w4xT5ByxP+g2UBjPr4MM3Qhys9pnoI9f
        04mk/JupMcNcAEl0ucPjE
X-Received: by 2002:a05:6402:b85:b0:44e:dad7:3e24 with SMTP id cf5-20020a0564020b8500b0044edad73e24mr3735581edb.264.1663856995242;
        Thu, 22 Sep 2022 07:29:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4l8lECvy6PMwCYStm+cgZl11MwkmMGRaeAGqyGbBE309vaTKtONvLrrdPR8+tf4wDo2exwQw==
X-Received: by 2002:a05:6402:b85:b0:44e:dad7:3e24 with SMTP id cf5-20020a0564020b8500b0044edad73e24mr3735559edb.264.1663856995055;
        Thu, 22 Sep 2022 07:29:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id o6-20020a170906768600b007386a8b90c9sm2788398ejm.13.2022.09.22.07.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 07:29:54 -0700 (PDT)
Message-ID: <33d5cc27-474b-fdec-a6b0-84ac16f7d386@redhat.com>
Date:   Thu, 22 Sep 2022 16:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
Content-Language: en-US
To:     Borislav Petkov <bp@suse.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20220916131854.687371-1-jsd@semihalf.com>
 <20220916131854.687371-2-jsd@semihalf.com>
 <eafc7bb5-a406-132b-4b7d-167917cdab05@amd.com>
 <CAOtMz3Pgh+cERiXVetDZJrQa9C0kUUbZ9dRRhdghgm5Or8kwhg@mail.gmail.com>
 <YytwNvSyhq380YNT@zn.tnic> <60a52348-7d50-1056-a596-e154f87c99d2@amd.com>
 <Yyt5LSxSz+6QeWF1@zn.tnic> <YywvmueFj/ibyZdf@smile.fi.intel.com>
 <YywwEvkZK1R9mJfE@smile.fi.intel.com>
 <c0c8bdce-26a0-ad3f-749b-7585d947608b@redhat.com> <YyxrdpUyc+kp48kX@zn.tnic>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YyxrdpUyc+kp48kX@zn.tnic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 9/22/22 16:04, Borislav Petkov wrote:
> On Thu, Sep 22, 2022 at 03:48:07PM +0200, Hans de Goede wrote:
>> Right, thank you for Cc-ing me. At least on X86 there are several platforms
>> (and 100-s of device models) which use a PMIC connected to the i2c-designware
>> controller and this PMIC gets poked directly from ACPI _S0 and _S3
>> (power on/off) methods. So the I2C bus driver needs to *bind* to the controller
>> as soon as we find its description in ACPI, otherwise we get a whole bunch
>> of failed ACPI OpRegion access errors as well as various actual really issues.
> 
> Thanks for explaining - I couldn't find the reason why it has to be a
> subsys_initcall.
> 
>> So please keep this as a subsys initcall.
> 
> Which means, init_amd_nbs() would have to be sorted to run before
> dw_i2c_init_driver()...

Yes if possible. One solution might be to make it a arch_initcall_sync()
which AFAIK runs after regular arch_initcall()-s but before subsys_initcall()-s.

Regards,

Hans


