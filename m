Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D007763201E
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 12:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbiKULPU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 06:15:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbiKULOt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 06:14:49 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65C8BFF62
        for <linux-i2c@vger.kernel.org>; Mon, 21 Nov 2022 03:10:24 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id bs21so19313162wrb.4
        for <linux-i2c@vger.kernel.org>; Mon, 21 Nov 2022 03:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bovRlaV+W5pxvhors/w9N6j//qWxcZTo0qg8XUozrUg=;
        b=Mq3lZGUFJvV2db5ccYAI3CTBXzUz18HyYkrHGH4ZjxfwsJjGhJQS8ioXSjg+mfaDEZ
         YlRTCEiwVtGuuUPRKsWMewBS75dGwa934vPNmalnoXfJUFAJWEBzEPylO48LNxu86ULj
         +ofRqY0hpLZOa+bBzVtb1D7TNfSXqVOuECGWE8wb62kOcVoUXHXtHTROfG5lovou9ifp
         3GEz2j+ZaxwhM+cl823HbyQtlJ9k31CUnoEIX30LQOwS/r6iHSCbM81h5VAwVm1ufSir
         H/XZRfWKVnxKxPeny7/UJh63vmqtLyqxIkunN72klDvLX0vNbj6W+i4d6mJGNqn2C9Va
         7yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bovRlaV+W5pxvhors/w9N6j//qWxcZTo0qg8XUozrUg=;
        b=6PbXAgXGhUmFrs2reQEjmmDrk/0Im7seVmZFyAMCbxThCEz4fZt8jJgZirO5+GNLbq
         wiosGxhd9rcxaoJ23oWFeqCswHaX9TqHJY7U9sYqY7r+Eij+nTq5aMi69U3eplbnvU3O
         lqsGKRA1+YewvxoBRAppZDDKG3BGxQHavKulltDhfrKxYqWscNu0paKbBQmoOUdHFbQC
         IaUmmUqS7HQXWgvHUZroTlCXGIdW5aXmzQXrRTr+CmapbVHYpRUnUUbvIb24JVgXSobS
         YcQ+XwSUwnWRCKSGrvX2fQiawxodlT3j5DDAXGVEotxZF8h/v6mWqf4VZxjAc8jGTMYe
         GzFQ==
X-Gm-Message-State: ANoB5plFdTJkjwY5ZDxTaSYKHKkoogW234f5ZsxSKHLMYQ9IToXVZU70
        ARTMnWGd/Zzv2XEdI/K3qXtV6A==
X-Google-Smtp-Source: AA0mqf4V3ZLnNNPcGkGa84Iox1i5ExYxfBP5BDriqNKkkM4OyvZF0Q6WAV8GEafnYO+omjGoAwSdkA==
X-Received: by 2002:adf:fd10:0:b0:241:b42c:2e4e with SMTP id e16-20020adffd10000000b00241b42c2e4emr10868331wrr.482.1669029021492;
        Mon, 21 Nov 2022 03:10:21 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id b14-20020a5d4d8e000000b0022cbf4cda62sm12947381wru.27.2022.11.21.03.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 03:10:21 -0800 (PST)
Date:   Mon, 21 Nov 2022 11:10:19 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 592/606] backlight: lv5207lp: Convert to i2c's
 .probe_new()
Message-ID: <Y3tcm9FGB/UCRbuC@maple.lan>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-593-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-593-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:26PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
