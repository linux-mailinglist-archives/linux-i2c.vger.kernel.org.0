Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86631631F19
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 12:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiKULGU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 06:06:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbiKULGJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 06:06:09 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57434877B
        for <linux-i2c@vger.kernel.org>; Mon, 21 Nov 2022 03:06:07 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id i64-20020a1c3b43000000b003d016c21100so2877415wma.3
        for <linux-i2c@vger.kernel.org>; Mon, 21 Nov 2022 03:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=evsmNawcwqO6lha6bUl7Gf+9LrN+sO/Pwn+zWyJO1wM=;
        b=G7QARcYbyW9f0dfiOsuBOrzCi/KpTEH27qaR9M7P1StW3Su1gT/rmw6fHc+4P/zfIf
         hkSo6DC9X6i+YByHPbQiIJTE6T9n15th1reaNS1U4nfIuDwCmGFuIir81EODva9IqJQJ
         RjnH4fy8CwH2PD54C7YIcoeAq+yo8qq04nMIhz+cNHYwO7hl12P07Gp46hvFgltwXK13
         FS3Z/QZ93naI77vLXZPWC1xmUvSYPXkReYh6jb0QtdMw/cO9J7L0XxniiOAomxKljHqo
         azsgIR5KmfZbZsAL2q6df0Nk4WPpV6ELMjGg6LSMFb1T5QyK2pnlT8jpvjNUT+B2/z0z
         /j5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evsmNawcwqO6lha6bUl7Gf+9LrN+sO/Pwn+zWyJO1wM=;
        b=cj8LjLF3eEtrqNcB/Sr2yPLUJsiNogmKshwQHRBDkLnQu8bDUD33DBGga2DYVzPN7n
         PeDdb7K93oK+Goo+5N2Z33uclDC5QLeWfUvPARGxIPoPRWa30LP50NETWe/0dW/Kaf+C
         X14VvwFgjXb/EGxgu6srz4tSvFZcqca8bvh0tlkXgco/R1stTePf3t8itpdHou2OZVHX
         pf+fCcGfJecf8sUYgGl3BdqCXpEmp4zEAnWNqjc8fwlaCQxgKDGRm/zI4rgSqwXHJlx8
         XMwIjojSAktRCkYWN3lUtpQFD2CMKtE0waIyKjiZ2NmaegeohJC7JcFSzZupxTgoMOby
         gO2A==
X-Gm-Message-State: ANoB5pneC7akoFmOGfRjRkyAIAw/WRBYjQUW5r6tjYhTlCoKkkFUjNjv
        8+qZW7bYELzC4luR/L1HLi+tqw==
X-Google-Smtp-Source: AA0mqf6lVXLamDzYQYOoqpf6gqacemtmk+Na0iIl6z9H0biRW1QNT519RrWCrVA/rY7FWftqZiXvzw==
X-Received: by 2002:a05:600c:a41:b0:3cf:895a:b22b with SMTP id c1-20020a05600c0a4100b003cf895ab22bmr3567784wmq.81.1669028766360;
        Mon, 21 Nov 2022 03:06:06 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id v3-20020a1cf703000000b003cf774c31a0sm16576295wmh.16.2022.11.21.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 03:06:05 -0800 (PST)
Date:   Mon, 21 Nov 2022 11:06:04 +0000
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
Subject: Re: [PATCH 589/606] backlight: lm3630a: Convert to i2c's .probe_new()
Message-ID: <Y3tbnHgRScTsI+o6@maple.lan>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-590-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-590-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:23PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
