Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C437855FA17
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 10:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbiF2IJM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 04:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbiF2IJK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 04:09:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A6B23BBC0
        for <linux-i2c@vger.kernel.org>; Wed, 29 Jun 2022 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656490147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=;
        b=fgsDzeyRjFEk2KeWSqmbecKyn25Vy9Yr9ksDNykkz9dbfibRQ1L2qZtCKWDjwTLV/Uk6rf
        5eskSYYjJuqE8dTfdzbVu/c8lHf9ZfI/MxhZTUQ/0PRnz/2WCOCjXmOWpkNEs2HTUBOUZc
        hcCoase9/NGzpmY7V6jwkU2icPl1iRM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-ea5OJsw8OJirgbr5eZ6_7Q-1; Wed, 29 Jun 2022 04:09:05 -0400
X-MC-Unique: ea5OJsw8OJirgbr5eZ6_7Q-1
Received: by mail-wm1-f69.google.com with SMTP id i184-20020a1c3bc1000000b003a026f48333so6278217wma.4
        for <linux-i2c@vger.kernel.org>; Wed, 29 Jun 2022 01:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=;
        b=g7K+DKea5QG0uiyYdKtDTYGS+Qf3mWx4WUII2BRV3qLep/hIojDsJ+BMdA1BquOEkg
         ZkV4Jq6PwTnAlQjGu+yhaPUoceKVCbOfTi9WzDSZGmp6Rk+Fd5RgYcL678xNkg6z+5+o
         hIN8CJvSmwkpdhU6w+olgC0FqTLLcph8RTaRC1LwdicNU5f6WH+mR11vP530kIPgiftu
         VV56o3mP++t9xxRvXbE6oj7wDVo4535u1ECYK1rdD6lfMAI9ZuYWQpLU/VuSJlkQYbxL
         k6yJYofIWGVZ5Q7jX2BxbdgrfZmhClN9ZsooLIRYUkNs62EDhAWBnsAmunXQQC76MgQ7
         dhdA==
X-Gm-Message-State: AJIora+/CsAlPzAgg5gTu05fkywVVmfBb+wxZQCR+vaVttageCNb0EQ3
        eMS4/2tHvaI0e5CI9jfA25N/3NE+BNPzVewGnyIoJSTL/SaW1VZgcVUKTSOb1j2G3bN6pA69B47
        +k6QNCUQc3YPLlEW5Mnjx
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9d5 with SMTP id a6-20020a05600c224600b003a04d14e9d5mr2201669wmm.70.1656490144655;
        Wed, 29 Jun 2022 01:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usFW/96xeCeX9gWa5EcwEsowhB540yEb4Gaanj9433iMcJH3n1uDXhdEWzSLPQicn1TmuJ9w==
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9d5 with SMTP id a6-20020a05600c224600b003a04d14e9d5mr2201616wmm.70.1656490144372;
        Wed, 29 Jun 2022 01:09:04 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p2-20020a05600c358200b003942a244f47sm2507134wmq.32.2022.06.29.01.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 01:09:03 -0700 (PDT)
Message-ID: <a5a3e2ca-030a-4838-296e-50dbb6d87330@redhat.com>
Date:   Wed, 29 Jun 2022 10:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Content-Language: en-US
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "acpi4asus-user@lists.sourceforge.net" 
        <acpi4asus-user@lists.sourceforge.net>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "openipmi-developer@lists.sourceforge.net" 
        <openipmi-developer@lists.sourceforge.net>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
 <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
 <5517f329-b6ba-efbd-ccab-3d5caa658b80@csgroup.eu>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <5517f329-b6ba-efbd-ccab-3d5caa658b80@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/29/22 09:55, Christophe Leroy wrote:
> 
> 
> Le 29/06/2022 à 09:23, Uwe Kleine-König a écrit :
>> Hello,
>>
>> [I dropped nearly all individuals from the Cc: list because various
>> bounces reported to be unhappy about the long (logical) line.]
> 
> Good idea, even patchwork made a mess of it, see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220628140313.74984-7-u.kleine-koenig@pengutronix.de/
> 

FYI, for patches like these what I usually use is:

./scripts/get_maintainer.pl --nogit-fallback --no-m --no-r

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

