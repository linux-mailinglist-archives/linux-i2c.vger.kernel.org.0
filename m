Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A50E8663DA0
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jan 2023 11:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbjAJKMQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Jan 2023 05:12:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbjAJKMJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Jan 2023 05:12:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0286C759
        for <linux-i2c@vger.kernel.org>; Tue, 10 Jan 2023 02:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673345484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ksSvI6tffvqfkT2KgiYhPjAggw+4IOeouLwXWNniZWo=;
        b=eQYtw3yBpfBBxhI8zkWTp5BgVovu3wa2UXt4c5b59pk9yVDfB8qTSWqZdYOKdHFlG5WvsC
        aRrniuS3VSCjeKg9b58+nfI0h/O4qfd0c/Tx4ocHAIrIkRJhIjSKl7qJIhl/hdIY1JrkXv
        hFfEmdUnGk+mUn0TQgSXlZVPLqgbukk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-467Z3i5lMmq8bzSyu6Hs4A-1; Tue, 10 Jan 2023 05:11:23 -0500
X-MC-Unique: 467Z3i5lMmq8bzSyu6Hs4A-1
Received: by mail-wm1-f70.google.com with SMTP id f20-20020a7bc8d4000000b003d1cda5bd6fso2369368wml.9
        for <linux-i2c@vger.kernel.org>; Tue, 10 Jan 2023 02:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksSvI6tffvqfkT2KgiYhPjAggw+4IOeouLwXWNniZWo=;
        b=3yH3Tz7wSfc2tVL5Ae4sS8iqXDEaTNHxFId2WzRgeVGmyMAsO0Kx+q0Jq3bf8+YwSA
         51iA/jqAoQQO8cJoaz2YjTw+P+QMyHfnPEf2APpAmtNkZvz4M+gPYttRnh8zv9LVsG9A
         jvnTY+Wwkyg3/E7NL518spBko9lKGdQGbAjRtYxwaBMezKIv5TXoR4sGWTDSDfvNXexV
         F5t1uXG3lLbcGCtcjO6mE71aTX3WbTFnOq4/OnFDL2npXLCfaUOOroHsx4OMfKZEBYt6
         06VbgAlDAXBHXisOPMhfZRINKm06R1W+M4PppGiwzgLlW2uWFx6bt/vujK0RaLLwweFe
         oQ1w==
X-Gm-Message-State: AFqh2kpwqAmrphGczsW+YMuR1Z5J2ViywEhjLBSFM7M1vws1Qb66BOGI
        B2XNP07/Df9hdplMg9SCLapLVc4MsE4BQk7LgfBrRBUlUMhpnPiBfnkVciqs/y5Z6rlJxojGmmM
        ZdJ2qlENzTzJQdGYNqfDX
X-Received: by 2002:a05:600c:1e18:b0:3d2:5e4e:701 with SMTP id ay24-20020a05600c1e1800b003d25e4e0701mr48749913wmb.31.1673345482603;
        Tue, 10 Jan 2023 02:11:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtwdRe0FzupWB3fiAxpuXEJ0H5IbmAGHCSf95dKcrh3YBxCSYr7tLCXwN6KMl3SEALYVsCSjw==
X-Received: by 2002:a05:600c:1e18:b0:3d2:5e4e:701 with SMTP id ay24-20020a05600c1e1800b003d25e4e0701mr48749904wmb.31.1673345482430;
        Tue, 10 Jan 2023 02:11:22 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z25-20020a1c4c19000000b003d1e1f421bfsm18584114wmf.10.2023.01.10.02.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:11:22 -0800 (PST)
Message-ID: <d2315ac5-2129-feed-d7c5-8dec5c5da4e2@redhat.com>
Date:   Tue, 10 Jan 2023 11:11:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 040/606] drm/i2c/tda9950: Convert to i2c's .probe_new()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-41-uwe@kleine-koenig.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-41-uwe@kleine-koenig.org>
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
> --
I've pushed this to drm-misc (dri-misc-next) now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

