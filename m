Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 871C54F6A6F
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 21:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbiDFTw1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Apr 2022 15:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232840AbiDFTwG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Apr 2022 15:52:06 -0400
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F5B1AE1BA;
        Wed,  6 Apr 2022 10:18:41 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id CBD203C0579;
        Wed,  6 Apr 2022 19:18:39 +0200 (CEST)
Received: from lxhi-065 (10.72.94.4) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Wed, 6 Apr
 2022 19:18:39 +0200
Date:   Wed, 6 Apr 2022 19:18:34 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v4] i2c: rcar: add support for I2C_M_RECV_LEN
Message-ID: <20220406171834.GA14741@lxhi-065>
References: <20220405100756.42920-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220405100756.42920-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.4]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Wolfram,

On Di, Apr 05, 2022 at 12:07:56 +0200, Wolfram Sang wrote:
> With this feature added, SMBus Block reads and Proc calls are now
> supported. This patch is the best of two independent developments by
> Wolfram and Bhuvanesh + Andrew, refactored again by Wolfram.
> 
> Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
> Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> For testing, I wired a Lager board (R-Car H2) and a Salvator-XS (R-Car
> H3 ES2.0) together. The Lager board ran the testunit and provided SMBus
> Proc Calls. The Salvator-XS board was requesting the data.
> 
> Compared to my previous version: sending 1 byte works now, sending with
> DMA as well. Invalid sizes are detected, too. This is as much as I can
> test, I'd think.
> 
> Compared to Bhuvanesh + Andrew's last version: less intrusive and more
> self contained (no goto), Proc Calls are covered as well
> 
> I tried some other refactoring as well (like one single place where
> rcar_i2c_dma() is called) but IMHO this is the most readable solution.
> 
> Thank you everyone for working on this. I am very interested in your
> comments and test results!
> 
>  drivers/i2c/busses/i2c-rcar.c | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)

I am not an i2c/SMBus expert, but I genuinely tried to attack the patch
from multiple angles, including static analysis (smatch, cppcheck, sparse,
PVS Studio, coccicheck, make W=123), code review, dynamic testing
(KASAN, UBSAN and friends enabled) and couldn't spot any misbehavior or
any obvious opportunities for optimization.

We've tested this patch on vanilla and on 4.14 using reference and
non-reference boards and the behavior matched our expectations.

I've also briefly glanced at the i2c fault injection possibilities, as
described in https://elinux.org/Tests:I2C-fault-injection, but soon
realized this will require HW/board modifications, which are not
straightforward in my personal environment.

Looking forward to any other review comments.
Thank you for your friendly support and cooperation.

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Best regards,
Eugeniu
