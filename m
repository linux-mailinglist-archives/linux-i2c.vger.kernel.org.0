Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC431663DA8
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jan 2023 11:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbjAJKNo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Jan 2023 05:13:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbjAJKNk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Jan 2023 05:13:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97ED515F35
        for <linux-i2c@vger.kernel.org>; Tue, 10 Jan 2023 02:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673345572;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
        b=WBYSlS/G7jhnZ2pMwHBAikQCl1CtraYZrI9qPu814QhgOO3ekuOIoNCt6w0gY+xkqMdpuG
        ikbXqB5Fh5YosTUqIW4mDW+bquqhikD4yY5YYcaPb0Zcck1ZkFh0vBuuS4pu1icrGCkzPQ
        L1YOHDmH8w4BCCS1k1wQK7CwWHmJ3dY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-41N1j5UDPnetM2310d1UeA-1; Tue, 10 Jan 2023 05:12:51 -0500
X-MC-Unique: 41N1j5UDPnetM2310d1UeA-1
Received: by mail-wm1-f72.google.com with SMTP id m7-20020a05600c4f4700b003d971a5e770so6109404wmq.3
        for <linux-i2c@vger.kernel.org>; Tue, 10 Jan 2023 02:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uuquTFMqRJVfYTO7+J+3i6OURVu6jEbVGPSXjBZGYVA=;
        b=vW+SNEzVwZjlKNJA6wo0Tx5qho2RAVrE9B5KvSrcj8HTyy8IooixKkaRsHxEXLnIv1
         /QO5RdvLvQ2V0hyeZ6ue8LD7r9P6aE7x296aKJrYS3j2SFUc/7ekQlrIEr/HfLFwVHSW
         wn/aa9XhCre0wriSwS1+M+KLG+WcZWf5bCVTsFknv+o7njhdbLEa1RaUzFWd0WwX0GGT
         wBqcfyxKaLBxGHH5OOeQxvZUred0N3h4LUiEuO/X68igXTaR3yrOPwaxt+Yq9CuBUOPN
         QmnF9ZqH3S0Xci5ixQ9JswRiCxNnA94gYIHYQ0bRtSwmlxApbaCjFRXDGPhH8yF5/L24
         cfug==
X-Gm-Message-State: AFqh2kqZE+GiYf1Kq6kd3UMotQKAUuZKX+tXxN/J8HUpAfHgtMOLr4f5
        QddBDaOw1rvC6a20YWsn3kRY+7o29fVZGucFY23rwcW0ilHeQeZYYb/DDSx1cLa84/NFX9+rFXC
        6LD2CA6E/q+Tw8gf1NxvV
X-Received: by 2002:a05:6000:1c03:b0:2bb:ed0c:a0d8 with SMTP id ba3-20020a0560001c0300b002bbed0ca0d8mr5142088wrb.53.1673345570713;
        Tue, 10 Jan 2023 02:12:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu/5e/whfZNkNjxhGF3SHOyW9iABZBnx4Wufy63eX0Zml438v1A3SA4AofxRL6YDrsAARLP7g==
X-Received: by 2002:a05:6000:1c03:b0:2bb:ed0c:a0d8 with SMTP id ba3-20020a0560001c0300b002bbed0ca0d8mr5142067wrb.53.1673345570528;
        Tue, 10 Jan 2023 02:12:50 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d18-20020adfe852000000b002426d0a4048sm11083364wrn.49.2023.01.10.02.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:12:50 -0800 (PST)
Message-ID: <415593c5-e603-099f-98b0-7f6919474e73@redhat.com>
Date:   Tue, 10 Jan 2023 11:12:48 +0100
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

