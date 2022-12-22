Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE8D654910
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Dec 2022 00:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiLVXAR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Dec 2022 18:00:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiLVXAQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Dec 2022 18:00:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5C828709
        for <linux-i2c@vger.kernel.org>; Thu, 22 Dec 2022 14:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671749966;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
        b=NSulKjFv8Libqglfdbep6XF4/3P+yp7iESdwYW8hp5XSv6MkAh4c5EPsOTw0Hb1bHwQVjt
        AFyYYF3WKBVbHqyGSdZiq08vgIaGTT9uaIWuSnshM6D68DRf1rxHnbm7lyptLH0yYtzGAB
        xK0+DCzrLYpD3ZizTknZfHcRUtiCWWE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-473-gY-N4RvxOyOuMe--rvm-Rg-1; Thu, 22 Dec 2022 17:59:25 -0500
X-MC-Unique: gY-N4RvxOyOuMe--rvm-Rg-1
Received: by mail-wm1-f70.google.com with SMTP id r67-20020a1c4446000000b003d09b0fbf54so2919460wma.3
        for <linux-i2c@vger.kernel.org>; Thu, 22 Dec 2022 14:59:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
        b=DVZMXlbk2nM4A5XiS/c+6O9M7+dC0mcykK4FlSxZsm76NHzTNZGgMbOUJV4vCYU8tX
         U60FtGn6jzQy9N00n2f0FVwgyN/Q2BeCDfStk5d7zJVff/M4/nmWYYJSIKkoJgjFyhp/
         +Yi3xa9/89oBGIeKAiCMpdfp9vEm6f+EL2XUF1A0z9YOtWqV8FP06c7TG4YuKPcGHpM6
         /2TvUIpalb9UywjAXgGheyEIWnGlWkNgmn4d20EXJfVaTwbOX1Q1qOtihN94rxMkkcoI
         w5JbVfjErFoJTU26/ZWDqtpKhA5ORZ3Lle+bHZ3oopuY/j5oe+6JoeUTkDoiEgNpUW+k
         6CLg==
X-Gm-Message-State: AFqh2kqYG2gmLrLe207AxdqZQJDRDKh8tW1I+D1fhNvHYg1Ec2UA85JN
        PsmfAcedWj1d+MtBk9bkDoQa/Y1MTUo4l3F+gO2jZGSFbVPdugy21bEOYaM6YpLkakAf0mwz4cm
        RptbDyo75povvAZdu/w82
X-Received: by 2002:a05:600c:3482:b0:3d3:4f56:62e1 with SMTP id a2-20020a05600c348200b003d34f5662e1mr5299599wmq.27.1671749964092;
        Thu, 22 Dec 2022 14:59:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsF9bhqDxJgYpNS3h0h7UKxGFrWcXBtywt7wPqI0gGeUoCpT/c1pS/cwz/9gvjfUEjOVWDuOQ==
X-Received: by 2002:a05:600c:3482:b0:3d3:4f56:62e1 with SMTP id a2-20020a05600c348200b003d34f5662e1mr5299580wmq.27.1671749963929;
        Thu, 22 Dec 2022 14:59:23 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bh12-20020a05600c3d0c00b003cfa81e2eb4sm2396380wmb.38.2022.12.22.14.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 14:59:23 -0800 (PST)
Message-ID: <82c1db2f-293e-96e3-405e-b0a7ae5ffade@redhat.com>
Date:   Thu, 22 Dec 2022 23:59:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 043/606] drm/panel: raspberrypi-touchscreen: Convert to
 i2c's .probe_new()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-44-uwe@kleine-koenig.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-44-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/18/22 23:36, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

