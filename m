Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0418631DF2
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 11:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbiKUKOc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 05:14:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbiKUKOb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 05:14:31 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71D52F397
        for <linux-i2c@vger.kernel.org>; Mon, 21 Nov 2022 02:14:23 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso8624578wms.4
        for <linux-i2c@vger.kernel.org>; Mon, 21 Nov 2022 02:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Dzbdx+YB/boCMO64dCfkzauhQz7NXTFwUFa4JU5m/I=;
        b=qhVVdWUoLbDIiuG/gwGKsCTx8p5RpzzYtUJp/Bg6xnf6S9Oe2ocd9NEPLVpdpfy9tu
         e4XdLEF6ETSp4sCmqb2KeFldyhvQC9EYRzjzA858QRJWFpgygD5RHYzPcbhgFpemPm4P
         xDPvVr6uctICfBhmjJwJMYBqHiqoDsSJijAZiwaSd6ORt5tckHuXqS2Gf6BKNnHtg8CD
         VOA8mLAF7A7HUrKwAqLU2DV4TEE60NJw4WjryhHuAcqqzkmG0EJlhRBUnxqIOjsPDNn7
         c/poaTMOgAaW9uceXs/2Tcgp22Fa7kyat5nUOuzyIFI5SJll8Kngx2ztNjHwWWUHOukk
         L4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Dzbdx+YB/boCMO64dCfkzauhQz7NXTFwUFa4JU5m/I=;
        b=k/+DxABEH9GyIn87KRyjA7NhFS1ilFHGgD0dIH818CluRdEEpMY5VtBH5GshrwgaNh
         PFP88iWDkcH0YbRH38XEXprDpmRZP1DzWcOjw9yf1ZVwTPYq4OEWj6THKvb+jjIhS0++
         eVSoEKiL3WEf0vpWvNW3VLy0JD2F79AVSUGiEdPz1nkKtMkwyMJS1zNaXxIbaYRxgvvy
         NbnN9uzV2N/r5/PBGl07LHxIAxAfknWksPAWGJ+6Ci8MgugGqG1NSQqYOhgcc415hRzi
         7WIEtUkxtFhKZo8lGR5WREcdN4U2J+hFYw+hg0mplFtzWF5jkB1q/e747eGiTK+FJ387
         /9mA==
X-Gm-Message-State: ANoB5plbbDNgivrO3Q1HNkbTldlfhvR3sbjrRuHfykEZkItpScJej7TN
        EsIAeKJMnMTchV1/mlpkDFf2IA==
X-Google-Smtp-Source: AA0mqf4mZ3vHBYk5iRMjwVfb91H1TAzjZF28Di5vZlwZDO5WrJ4yqKAzbSCZU0JmtUpvWsi6sqMjZQ==
X-Received: by 2002:a1c:c918:0:b0:3cf:f2aa:3dc2 with SMTP id f24-20020a1cc918000000b003cff2aa3dc2mr2879921wmb.175.1669025662121;
        Mon, 21 Nov 2022 02:14:22 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id l32-20020a05600c1d2000b003cfbbd54178sm27381570wms.2.2022.11.21.02.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 02:14:21 -0800 (PST)
Date:   Mon, 21 Nov 2022 10:14:19 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 585/606] backlight: adp8860: Convert to i2c's .probe_new()
Message-ID: <Y3tPe9mAnT9aGnGL@maple.lan>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-586-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-586-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:19PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
