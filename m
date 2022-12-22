Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82023654917
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Dec 2022 00:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbiLVXFM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Dec 2022 18:05:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiLVXFL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Dec 2022 18:05:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC11E26AE6
        for <linux-i2c@vger.kernel.org>; Thu, 22 Dec 2022 15:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671750264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
        b=WSqvKAVbI3uaJkb+t4+8xpP6kTbNoaOvkuvw/qxGOZH+FZEqyi9JnJDLZXWZExVJIhjlGe
        MT0b9eeJhehzmkOsCxslwH0ytP7eedhtHMtKGFajXUPw+LGUS4mMNqv49SBvsVk9nZx0bs
        TuTK+HNAg3YcAIq9bKeRu/Bt3fncly4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-7G855yuyPJ6vVhGQpfukdw-1; Thu, 22 Dec 2022 18:04:22 -0500
X-MC-Unique: 7G855yuyPJ6vVhGQpfukdw-1
Received: by mail-wm1-f70.google.com with SMTP id h126-20020a1c2184000000b003d96bdce12fso518066wmh.9
        for <linux-i2c@vger.kernel.org>; Thu, 22 Dec 2022 15:04:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
        b=PuMvKMjy6YXspOD5Dx0P0MQl1jWCd4g5MDmkLfY/AcZOGLHu0Y8piS3qz7hECN6ypb
         xzJnQCxGbK76MZR36ygW1wXlYn55gFr06TaeWtzwC/HhXPy+6qL6j1DuPtIy6oRuHyKt
         gIP62YeRDVGUdkkcNm6cz6hEjEZ1nLhGIV6kT0nYOTPl/awRURjCMZrrQ3BKGSpN0HN1
         6EJLGeFtECJpsQKoutOoutnjCh+ZoKsN4LuOQLrNfWAf/GaVQZa5AprVzpNLy+LjxINc
         IT/j4uL7f4mbHRc6zIMRXLIK1q3/wT81pi2PplNPJmR3XLgf7xxnGGGt5vjr3ujaQCgw
         MfrA==
X-Gm-Message-State: AFqh2kpQA+La/CotD7IAi/WtKIHQzxfTAuHNFrX1pJOpb3ApVliJTUXk
        esPuELb20ZfqRTq64vrkhifE8F+jd7yt+WawNC8DvX1chgMwqklqYx+RWlh5RW55TDp8uZceytc
        N9WKn/mzHfpI3t2owXKW6
X-Received: by 2002:a7b:c4c8:0:b0:3d3:5a4a:9101 with SMTP id g8-20020a7bc4c8000000b003d35a4a9101mr8400360wmk.23.1671750261779;
        Thu, 22 Dec 2022 15:04:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsRpCTqsnPlNZ+CYl+PJ8WJe4hBMc4zpUYGpFfR67OxQ/mL0PszQFuVVcvkMXe0Yey2+OQkhQ==
X-Received: by 2002:a7b:c4c8:0:b0:3d3:5a4a:9101 with SMTP id g8-20020a7bc4c8000000b003d35a4a9101mr8400338wmk.23.1671750261555;
        Thu, 22 Dec 2022 15:04:21 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n36-20020a05600c3ba400b003b49bd61b19sm7757852wms.15.2022.12.22.15.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 15:04:20 -0800 (PST)
Message-ID: <4407048b-0bcb-ad46-4267-079a9c5baa90@redhat.com>
Date:   Fri, 23 Dec 2022 00:04:18 +0100
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

