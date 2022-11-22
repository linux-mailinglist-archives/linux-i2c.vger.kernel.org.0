Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C294C634937
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Nov 2022 22:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234441AbiKVV1E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Nov 2022 16:27:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235040AbiKVV1A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Nov 2022 16:27:00 -0500
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7275B70C5;
        Tue, 22 Nov 2022 13:26:58 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id 11so11953729iou.0;
        Tue, 22 Nov 2022 13:26:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XtpnipOFdnq+mBaHcFKVPpfnhE0exHAwrX0/FWWNOM8=;
        b=gNUh8RG96UGU8Q9nGEm3ivlLGEhe5cFGdawPkfKBEB7j5aPAry5RK4M5tQ/2jldosw
         LI31bFN73gnwhowXB6FHuVLV7yzBYcsq04Ba7p2kA9I1EbkUYLedrks6FzKnHEVfSTfw
         z/iiE5cluAzqgJgPxfF9SIUOYKn4Is9/pC4aqJcgUzD3LaXM+erIe3a0hySX4zGb5uEE
         H0CnvJDN9TeCt7bnAkrBQzUYjOyt4YOfNFagtLRXPGYiMfd6pNTX4pkQwcWwvmubu56g
         ago3wFQMS1N3/iF+Rld8/qfdaPXmzWmvr1T/g6G8LRLnXmiX+uHnX2W904V513P0EGzp
         aivA==
X-Gm-Message-State: ANoB5pnCVuVoA+/c0YVxZSXfrXMMpX045D639K3o4PjNu3QeHOA2Ctkb
        XKQq/q/KEsM1YwyKlQYyGw==
X-Google-Smtp-Source: AA0mqf5gaVQoirD5BRSZtKt9hIjMNcsMTA5c22ECAcsMTraPXMNLhB8rEIm82P4CV84E5rhFQdITjg==
X-Received: by 2002:a02:9f8a:0:b0:363:db63:a796 with SMTP id a10-20020a029f8a000000b00363db63a796mr11929790jam.250.1669152418126;
        Tue, 22 Nov 2022 13:26:58 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id m30-20020a02a15e000000b0036e605a3e79sm5478012jah.17.2022.11.22.13.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 13:26:57 -0800 (PST)
Received: (nullmailer pid 604225 invoked by uid 1000);
        Tue, 22 Nov 2022 21:26:59 -0000
Date:   Tue, 22 Nov 2022 15:26:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Grant Likely <grant.likely@linaro.org>, kernel@pengutronix.de,
        devicetree@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 509/606] of: unittest: Convert to i2c's .probe_new()
Message-ID: <166915240511.603832.11118752169249997535.robh@kernel.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-510-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-510-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 18 Nov 2022 23:44:03 +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/of/unittest.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Applied, thanks!
