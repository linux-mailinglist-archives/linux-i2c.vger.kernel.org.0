Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C78096633A6
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 23:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235306AbjAIWEX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 17:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbjAIWEV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 17:04:21 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729BE13DC6;
        Mon,  9 Jan 2023 14:04:20 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 3D5A240002;
        Mon,  9 Jan 2023 22:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1673301858;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=inY30xisfam4YsgnPcMR38i+CvhLKAgVwrVah5uQ76s=;
        b=OqNAa3wF2sn6lXv0kug09Fl9zzZSf4UalHBh6pb+X1GmaeOux5zfD918K/cl+Ams1bF9Po
        SydVLFNQlynY4/6sLct6Nv2ZCh4/TBcj4FAQpREyGFpqB5bDMslUbL73gMlW2ydxSQFG0T
        l7xM93zQwdP91zAK2E7wrG13sUdIlIhepTr7rEsMHmDvsN3LeAAKjif1y/K4tRV1nTGGb0
        YfPL8foszWTPEsezwLxA080y2j+ho5Hf4bjRT82nBG+uqb0Xt5veapLm06bJwQFE55Qnmt
        pMCwNQEnie72B1mPConidzHn6pgDqh6fyJ8qEFfLBlkl09fn+HvyZ+Btr+9YgA==
Date:   Mon, 9 Jan 2023 23:04:17 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 560/606] rtc: ds1307: Convert to i2c's
 .probe_new()
Message-ID: <167330184365.58615.1381399815168512020.b4-ty@bootlin.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-561-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-561-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Fri, 18 Nov 2022 23:44:54 +0100, Uwe Kleine-König wrote:
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> 

Applied, thanks!

[560/606] rtc: ds1307: Convert to i2c's .probe_new()
          commit: 4cd0ca1fe9a79d81a001ff14f14035531773fe43

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
