Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E42D5F21E3
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 10:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiJBIKS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Oct 2022 04:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiJBIKP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Oct 2022 04:10:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322AF26ADE
        for <linux-i2c@vger.kernel.org>; Sun,  2 Oct 2022 01:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664698212;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oMlcvX2/A0O+zg5EuALUNbmxlJ1/iWj6K/LwEPDTTS4=;
        b=FGl6pkGQcGH3Y4XWP4FBtrFE3Mp82N2y7miLlPgSlFW0PjfNE+9FldYjmjuRzfqB53e9fO
        BI+75bqFjcdMHk2NzUzTe3tXFDL37YnQPutTFAItBVI46pK8hmhat3ilZFKICn3w/hGaG3
        sCuNRJCOLgB2esOJz529GN+aS2EpFss=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-325-F5oeY7XxO025oIkn4AAAQw-1; Sun, 02 Oct 2022 04:10:11 -0400
X-MC-Unique: F5oeY7XxO025oIkn4AAAQw-1
Received: by mail-ed1-f70.google.com with SMTP id dz21-20020a0564021d5500b0045217702048so6637311edb.5
        for <linux-i2c@vger.kernel.org>; Sun, 02 Oct 2022 01:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=oMlcvX2/A0O+zg5EuALUNbmxlJ1/iWj6K/LwEPDTTS4=;
        b=frALr7CpirTKB+8k9vujrHiZdO5297fhbw10IIAHKMK4ch8QGw7nIJl8w8vp9cjB4b
         d+/sutxgIXtZYmMmjK/JSRK6GL3hVFiBrhFd0IRAUwdaLLg+yIdwF1AW6Wk0bKac1sOP
         /7g3v4njEMComclMej5jwQSLm9peVckJciaxXLuDQN4hkxwzDHiNW1yHzr5V8smY3DIu
         ci5malCdLXL1QXjCgGwOLpcsnVYs1uVngbMgvFcD99reKVJM5j/KGSszDJutlRizAGOz
         VUB2RrndWlLyoXb4hBa0NHEj11eV2pRfPZh6plq9kMZYJjWoGZYEeF4mVWmfXTW/1AF2
         NBzg==
X-Gm-Message-State: ACrzQf0jqwjCjMale9RxIZ+7ggu+wZxOFXOuoRn/p0erz1nct61uoTMI
        HyPTvw0PSQGk9TcaEA12ak6LruzKXVt6+BBFWqQG3F158xctspt9fro44TIB/9uA0V/cYsJ94c4
        A4ch5QMMmr8uc7CSYp3fh
X-Received: by 2002:a17:906:8442:b0:77c:6b3d:bec2 with SMTP id e2-20020a170906844200b0077c6b3dbec2mr11632745ejy.224.1664698209677;
        Sun, 02 Oct 2022 01:10:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4M28inQ9RrMapseebL+yuWnAQUerNjawWOYfMJxsyYp3xCGMhsvO+EV4UOY6216bjmSjv3YQ==
X-Received: by 2002:a17:906:8442:b0:77c:6b3d:bec2 with SMTP id e2-20020a170906844200b0077c6b3dbec2mr11632738ejy.224.1664698209515;
        Sun, 02 Oct 2022 01:10:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 6-20020a170906318600b0078116c361d9sm3777659ejy.10.2022.10.02.01.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 01:10:08 -0700 (PDT)
Message-ID: <15c6e18f-16d8-685a-5dac-c35b39c9b51e@redhat.com>
Date:   Sun, 2 Oct 2022 10:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] i2c: designware: Fix handling of real but unexpected
 device interrupts
Content-Language: en-US, nl
To:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Samuel Clark <slc2015@gmail.com>, stable@vger.kernel.org
References: <20220927135644.1656369-1-jarkko.nikula@linux.intel.com>
 <YzMKHf+aNKiGVkyn@smile.fi.intel.com>
 <31477388-b57b-5383-9c6a-18905c28253e@linux.intel.com>
 <5b8a4060-b800-6701-e0c9-cc8dfa0e6b67@redhat.com> <YzjB2WSQfL7i4Teo@shikoro>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YzjB2WSQfL7i4Teo@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 10/2/22 00:40, Wolfram Sang wrote:
> 
>> I will let you know if I hit any issues, if you don't hear anything from
>> me then you can assume I have not hit any issues :)
> 
> Ehrm, how long should I wait before applying the patch?

Just go for it, I don't expect any problems.

Also I'm doing some work on a Bay Trail device with a shared PMIC bus
today. So if there are any obvious problems then I should hit them today.

Regards,

Hans

