Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B83654928
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Dec 2022 00:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbiLVXJI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Dec 2022 18:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiLVXJH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Dec 2022 18:09:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F3313F
        for <linux-i2c@vger.kernel.org>; Thu, 22 Dec 2022 15:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671750504;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
        b=L8GaAvOV8o0m2nW5TMCwxLIzCa3PcTmf0PQuvAfduVOgQOKW8tcwEVN72a1UFvlzb0OM7r
        wsO7byQc8rGOuEe/wBtvbAtMF6iiMjEjazFmm7TDp1ErtpHKYFg5vfroeP/fYfJhcf3gsR
        mwbVQ9k+yj/sxx92MVeB0q+yL2a9kMg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-RttKh0fqMEmtNvSEzf6I7w-1; Thu, 22 Dec 2022 18:08:23 -0500
X-MC-Unique: RttKh0fqMEmtNvSEzf6I7w-1
Received: by mail-wm1-f71.google.com with SMTP id m38-20020a05600c3b2600b003d1fc5f1f80so2932956wms.1
        for <linux-i2c@vger.kernel.org>; Thu, 22 Dec 2022 15:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
        b=NuiBkaGRm5eFgRqGW3Dy1nMInoYGx6KMDikcC/82QWJKCg1I8gLZoQaniRdtK4PWh5
         eAfuYRIZq286lOQLd0nCcLKhAPk6XwH3Pr5v5at1XAVIKvrEZicH1e83hHwXVgBcrn3R
         arTLRiz6WQBGQHxA+aQVrW+aFIHr4u32WiiL9kdwVGS2fEAg9RczovAjm42+raMGxfx0
         AWGGRJ79XwXELacn33KSlvubgzfGdqZPUsqwMRg9V9eHENR5bvsN0rmmQRXctLRQv3/t
         dUCqGSlUON628212h6BtiYdV91hrmeAL4GuI9lj6r4e29gC0/AXYcBVRjaKnKc0HwDYN
         I5Kw==
X-Gm-Message-State: AFqh2kp5mhmTzYCbrI38Bd2fru4MLVDK4xSQYorSHQz5BgXQ1I8qhjd0
        0p+pthVKGXzzfqhigB0AHjp9Eu7ANRuBmqT4quvxWSWOOzTizWSt10DCF9cg06y9+KDNwsireBX
        AHyOUwew0ty4oUa+glvdh
X-Received: by 2002:a05:6000:606:b0:242:d4f:96c with SMTP id bn6-20020a056000060600b002420d4f096cmr4724622wrb.0.1671750502167;
        Thu, 22 Dec 2022 15:08:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuknSgJRZCSxxH1E5lQjmtZbtMbpRpjoATeV9vbjoxND4THAv6SX6/TCVdUUAJsiNgpR0XUYQ==
X-Received: by 2002:a05:6000:606:b0:242:d4f:96c with SMTP id bn6-20020a056000060600b002420d4f096cmr4724609wrb.0.1671750501992;
        Thu, 22 Dec 2022 15:08:21 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id e2-20020adfe7c2000000b0024245e543absm1579433wrn.88.2022.12.22.15.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 15:08:21 -0800 (PST)
Message-ID: <25b2136f-09e2-74e8-4e63-a3ad1fa13ed9@redhat.com>
Date:   Fri, 23 Dec 2022 00:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 041/606] drm/i2c/tda998x: Convert to i2c's .probe_new()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-42-uwe@kleine-koenig.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-42-uwe@kleine-koenig.org>
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

