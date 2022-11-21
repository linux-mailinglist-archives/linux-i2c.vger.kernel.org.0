Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5362363222C
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 13:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbiKUMdu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 07:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbiKUMdV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 07:33:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E75A9B4A6;
        Mon, 21 Nov 2022 04:32:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F7C761168;
        Mon, 21 Nov 2022 12:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A1DC433D7;
        Mon, 21 Nov 2022 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669033936;
        bh=nM/4PXXiiRvTy1GwbBTLsZNqf/mkb0cxsfzWdyrKLuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nhZW6hE1AF39SD/Dtf7lp7mQBXmDsmnKxhwr0z7f382S8mkRk8YpZPhHtXIxQlpF4
         +wypXwBfaDSVKN3J/KEme3UycWecRQ+AB6ul2U7HFZ34nWkHYPKkLP0IaGjfIqjpzo
         f5G8fp+R5J9EY9QcSugkcTSERNFapiSi2LAZq6e0zuNo5Ea7ZiqNdi0PbXMKg2rdrK
         ifx+ST6Vtuscn6oEcRq446Vq/Av3hqC9OhQ1CacWEdkDV3T/OMUJ5bx/0mOKvLxxKC
         ml0a0cCcHtjm6tcYg5DvNBGg6mH88QHJNxuy1r9F859j4h69e3WSjdHg3jtOeUh/Ds
         ndw9gjAgV0yuw==
Date:   Mon, 21 Nov 2022 12:32:10 +0000
From:   Lee Jones <lee@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <Y3tvypIDVdCYxAVB@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-432-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 18 Nov 2022, Uwe Kleine-König wrote:

> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mfd/khadas-mcu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

After a week or so, please collect-up all the tags you have received
and submit a per-subsystem set for me to hoover up, thanks.

-- 
Lee Jones [李琼斯]
