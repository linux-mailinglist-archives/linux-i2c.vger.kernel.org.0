Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F762654924
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Dec 2022 00:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiLVXHw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Dec 2022 18:07:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbiLVXHv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Dec 2022 18:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75D71DE
        for <linux-i2c@vger.kernel.org>; Thu, 22 Dec 2022 15:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671750426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
        b=CXHFBgcf+iJyVJjDB5eWVbrZH4zXAnMQjUtKj90cm31q2kmdvI0f2x1POVG+3WOJgs8TJ3
        iAXZNkrmidEHEly4SYGwKDas/gj3gmZ8akapLX1CPU8GyCIo7pT6m0Cl9pyciXNGQF1vtd
        heTFyh0x4KkuynNvjxMSVE8YEU3bEX0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-XMZiZ3S8OXCuDg_bHnU4IQ-1; Thu, 22 Dec 2022 18:07:04 -0500
X-MC-Unique: XMZiZ3S8OXCuDg_bHnU4IQ-1
Received: by mail-wm1-f72.google.com with SMTP id v188-20020a1cacc5000000b003cf76c4ae66so2918681wme.7
        for <linux-i2c@vger.kernel.org>; Thu, 22 Dec 2022 15:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDeshYsFzsV86X1KOSZ/3pdcOk+Tna6Uckljdyy2RF8=;
        b=PauGbkBsOg0MZYpKk9szCXJ4snI1/moFd/TpdBnhRQ9AsxH6qqyNN0Uarle4mUEAnP
         AbY+R+nNuMmDHp6oshIjB7WHZm/8fJZThKlPbOpGJLOqrwDNWkszqW0jf5gvkgUqxgo8
         VkW511BOBD8MHHPlRuUpSeDM8TbR8rG7vzOHHifWxcxjHvXggJp2GSUQf031TBEmV5hA
         KqJg8jLms/MSNl58GMqlGNty2IylEsUgdZW6nz3BrVISaTevvLsb50Ofvrzhu1A/zPi8
         TrPq949b5AFdYim1jScAZCFAVa60yX7WKwvaDMLJNkXJZf8OSEkKnR3f/5rJKTm6b4Dt
         4SYA==
X-Gm-Message-State: AFqh2koVanJl+ic2ekVdnuKSExQTfd53OwxdB7xTvRdcIuI1QI1b2FVc
        bsJzrrhQOs43fsgce5xkmWPOE85cNJDlX0TQZxQVW5ik0sgSP+ZT3T65ELI7xVTpjT5FCijR2lI
        HMudl0M6wgvLxZuyeZP19
X-Received: by 2002:adf:f052:0:b0:246:e6df:86ea with SMTP id t18-20020adff052000000b00246e6df86eamr4347857wro.25.1671750423505;
        Thu, 22 Dec 2022 15:07:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvrH4klu+A74NrToZfregAlXdCxKG5tW/xHZwohrIMNsMXyCpQxwUiG2Ea2TWPs1C6BwLEC8w==
X-Received: by 2002:adf:f052:0:b0:246:e6df:86ea with SMTP id t18-20020adff052000000b00246e6df86eamr4347835wro.25.1671750423242;
        Thu, 22 Dec 2022 15:07:03 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c17-20020a5d4cd1000000b002425c6d30c6sm1821042wrt.117.2022.12.22.15.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 15:07:02 -0800 (PST)
Message-ID: <4042f56c-22c8-0ffb-46e9-dfedc1d259ac@redhat.com>
Date:   Fri, 23 Dec 2022 00:07:01 +0100
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

