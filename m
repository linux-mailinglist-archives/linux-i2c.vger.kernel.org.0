Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 091ED663DA6
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jan 2023 11:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbjAJKNi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Jan 2023 05:13:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbjAJKNS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Jan 2023 05:13:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0DA517F3
        for <linux-i2c@vger.kernel.org>; Tue, 10 Jan 2023 02:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673345543;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
        b=UQwXfZ/mX88wm2yl6n5GS8c0bBB+rLg30V7JW2SoH8d/+SMZhBuepdxJtOI5GI8Zyx9uwC
        jIFFeTBc3X3/Hzhg4D5/wjhx+rLOQ/ayWrpN8mZjXrHDDA8IJWRTOoBym+u4S/psSXN25b
        s3ckGUYEF+7w8e8J+l7Fl60yFMWeLZQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-juKXkZv4O3eWzOlXcgqLsQ-1; Tue, 10 Jan 2023 05:12:22 -0500
X-MC-Unique: juKXkZv4O3eWzOlXcgqLsQ-1
Received: by mail-wm1-f72.google.com with SMTP id i7-20020a05600c354700b003d62131fe46so8791577wmq.5
        for <linux-i2c@vger.kernel.org>; Tue, 10 Jan 2023 02:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
        b=EHwxsVzRFIdRXqz9VAEjjpCUQ/19EtM6FoYOcDHCajaAD83ZbljyJJW4Wn/cReuyRG
         uIVD3fplrXWZ72wUYYR9HDeJtGRbFEmEVOxODHzCSGK6DConsbvjHbQSknV8Ig+7pXQ5
         FPQaIn8YtjK1KDWUVKD77lGDdT8DIm59yJAnmXzJKU52rR+7jd+UtiVGZWxOO1djUmME
         K9zyQj3KccgYuj19XiySqBbTpJgDl0vzToh/Pytb7BZw/gg6Pr5ec05uez7zi6aO7d2M
         JUOYfSlsw950s9w6U+SmUAMF3RD+9e95Ub4K4Y2tbHrUuEnCRj/sxP4idSTJFc27FYnM
         vIiw==
X-Gm-Message-State: AFqh2kr9PyIEC/XE5Mc1EplxeZL0C9AL1gRoSwrDfdfHcTdUe0BfLtUj
        iDYd/Hxkh8jxTJoBx5/dN5u14H5IES8Nn7wemiBOBOV560FrvuBCNW1damyHoS1bvZer2C6A5FP
        wA2W/kFaOb0KYC1ILGQlu
X-Received: by 2002:a5d:5c07:0:b0:242:3353:26f5 with SMTP id cc7-20020a5d5c07000000b00242335326f5mr44058186wrb.9.1673345541774;
        Tue, 10 Jan 2023 02:12:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvCNfc6Oe2/roXEpUqXOAP/C2Xt3ROEXZRzWcQHof0gVutmncRgr0y83BsdzLD84z2dckLiZA==
X-Received: by 2002:a5d:5c07:0:b0:242:3353:26f5 with SMTP id cc7-20020a5d5c07000000b00242335326f5mr44058173wrb.9.1673345541594;
        Tue, 10 Jan 2023 02:12:21 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m5-20020adfdc45000000b002428c4fb16asm10996013wrj.10.2023.01.10.02.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:12:20 -0800 (PST)
Message-ID: <793334fc-50c5-033e-c3b5-966c550fc94e@redhat.com>
Date:   Tue, 10 Jan 2023 11:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 042/606] drm/panel: olimex-lcd-olinuxino: Convert to i2c's
 .probe_new()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Sam Ravnborg <sam@ravnborg.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-43-uwe@kleine-koenig.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-43-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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

