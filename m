Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5916865C1
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Feb 2023 13:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjBAMNv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 1 Feb 2023 07:13:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbjBAMNt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Feb 2023 07:13:49 -0500
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0E84AA7D;
        Wed,  1 Feb 2023 04:13:47 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id BBD91639922E;
        Wed,  1 Feb 2023 13:13:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id GouAGRHGtuwG; Wed,  1 Feb 2023 13:13:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 8E56D6399237;
        Wed,  1 Feb 2023 13:13:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 7w43NCUZ1Lft; Wed,  1 Feb 2023 13:13:43 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id 60FB5639922E;
        Wed,  1 Feb 2023 13:13:43 +0100 (CET)
Date:   Wed, 1 Feb 2023 13:13:43 +0100 (CET)
From:   Richard Weinberger <richard@nod.at>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        linux-i2c@vger.kernel.org, kernel <kernel@pengutronix.de>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <771653773.86636.1675253623278.JavaMail.zimbra@nod.at>
In-Reply-To: <20221118224540.619276-497-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-497-uwe@kleine-koenig.org>
Subject: Re: [PATCH 496/606] mtd: maps: pismo: Convert to i2c's .probe_new()
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: maps: pismo: Convert to i2c's .probe_new()
Thread-Index: DGoCIC9lu7BoF5uiWp7aeGNcBSO7dw==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

----- Ursprüngliche Mail -----
> Von: "Uwe Kleine-König" <uwe@kleine-koenig.org>
> An: "Angel Iglesias" <ang.iglesiasg@gmail.com>, "Lee Jones" <lee.jones@linaro.org>, "Grant Likely"
> <grant.likely@linaro.org>, "Wolfram Sang" <wsa@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "richard"
> <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Sebastian Reichel" <sebastian.reichel@collabora.com>,
> "Maximilian Luz" <luzmaximilian@gmail.com>, "Peter Rosin" <peda@axentia.se>, "Benjamin Mugnier"
> <benjamin.mugnier@foss.st.com>
> CC: linux-i2c@vger.kernel.org, "kernel" <kernel@pengutronix.de>, "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>,
> "linux-mtd" <linux-mtd@lists.infradead.org>, "linux-kernel" <linux-kernel@vger.kernel.org>
> Gesendet: Freitag, 18. November 2022 23:43:50
> Betreff: [PATCH 496/606] mtd: maps: pismo: Convert to i2c's .probe_new()

> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Richard Weinberger <richard@nod.at>

Feel free to carry it though the i2c tree.

Thanks,
//richard
