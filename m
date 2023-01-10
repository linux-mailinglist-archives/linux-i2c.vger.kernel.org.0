Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAC5663D98
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jan 2023 11:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjAJKLm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Jan 2023 05:11:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbjAJKLi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Jan 2023 05:11:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9849950073
        for <linux-i2c@vger.kernel.org>; Tue, 10 Jan 2023 02:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673345448;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
        b=bCTZqKTeKufyiuoAs8PSVn7ty7amrPX2wLPDoBfoolGs3+ZfqFxofbl9HBxI7wUAy2ErjJ
        BTPCZ8cwtFCmVfsUvwVsXp+ulILnLC8M9FebV7W6pVmXi//zk39FaDCGoJCfKRV1fBOJ0e
        gLmm11uldlDvTbKZ+9k946EZvjVtr74=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-gXhI4eeFN2GoqM586t1WVQ-1; Tue, 10 Jan 2023 05:10:47 -0500
X-MC-Unique: gXhI4eeFN2GoqM586t1WVQ-1
Received: by mail-wr1-f70.google.com with SMTP id t2-20020adfa2c2000000b002bbdae91832so1349496wra.21
        for <linux-i2c@vger.kernel.org>; Tue, 10 Jan 2023 02:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
        b=cy1Z1wiia8aXjclJabpsmes1F95Nqs1JSKoSQA2DNH5RqnW9QKccPnwjqBpx7WtEH4
         iiMgR6emFUCYSgK8+6pxqGhjftbSQB9LRip4hF62FCoj24V0NFUxKXBxLkSm8id2j9yU
         GdJV59mSYk8wDl5DvYt8H1t+RYspj/t1C5jprHwERvN3UzF9dJoO/Go9YWVFVr/GsXPw
         VXdS6983hmRwy/utIH6DI1zm/8AR2IcZrLMG5e99bKt/XcD5oEOuQxihnYD+UEwp1Vvm
         Rn4gyPYUNnoyWfXSvOTERZI+FYDr8DngtLJV7YyLh1pRCOScy/+L7dPFal6DEfexIirU
         TD4g==
X-Gm-Message-State: AFqh2kpUroiGMHUZeMp3uqi+n1ZqSc4g9mJtarp6n8DCoidnT8RtVyvM
        xNuBczB4DtZ09KyThNPOuWlHvLVcPpjATaSPMbAof5UWK6K4WjS6tQBSWCXTmYuWeVLBEikycbZ
        iPuG7A+aUm78o7lMCuN/q
X-Received: by 2002:a05:600c:44d4:b0:3cf:7925:7a3 with SMTP id f20-20020a05600c44d400b003cf792507a3mr48001532wmo.24.1673345446640;
        Tue, 10 Jan 2023 02:10:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtCaGy649oJyyMLaGDn2H4O3O+B/V9Ndk46ypRQlhZdduR+FByER9txa5+XPtVk9k1GBxK2xw==
X-Received: by 2002:a05:600c:44d4:b0:3cf:7925:7a3 with SMTP id f20-20020a05600c44d400b003cf792507a3mr48001519wmo.24.1673345446478;
        Tue, 10 Jan 2023 02:10:46 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f11-20020a05600c4e8b00b003d04e4ed873sm21349198wmq.22.2023.01.10.02.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:10:46 -0800 (PST)
Message-ID: <b5ad4a5a-50ed-4bdb-024c-e2ac76c79edd@redhat.com>
Date:   Tue, 10 Jan 2023 11:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 039/606] drm/i2c/sil164: Convert to i2c's .probe_new()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-40-uwe@kleine-koenig.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-40-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

I've pushed this to drm-misc (dri-misc-next) now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

