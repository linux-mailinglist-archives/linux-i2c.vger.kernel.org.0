Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4E8E790C5A
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Sep 2023 16:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234155AbjICOP2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Sep 2023 10:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjICOP2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Sep 2023 10:15:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E7BF3;
        Sun,  3 Sep 2023 07:15:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 108FA60B78;
        Sun,  3 Sep 2023 14:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E50C433C7;
        Sun,  3 Sep 2023 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693750523;
        bh=3nZq1Ove0wV3ykT1sVJXUlFB1AvqBRnX4RP6rs0xc4k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tEz2weD72worS/M8SYQYbBJCDkfZrREEpt67vzuoa13bU7fT0e74NZaa/++wvhaO+
         Ij9OdWJPgVsSJaHfMmcwSqGlx7+/z4UMGup3LEhGb6SUBBuyWpaJu3x7GjugjT1KPt
         /CnMLe4xA1zVYzUcaCSykh/KqlLFlkjGxh2BhvQ8eOhKd5kyiIdg0igEIgNMySZuoP
         2nlBnnwlTykMnnsohP7OFZ3u6/Gz7VjVoVvdZVe5Cz2iomBlUKtNU22lzTs8lCLyj2
         iRnnqhszacXctgM5qS0iYrfBvq0olRxUwFLw6HjKHHqgipI2kxPiMp2zglORz1reVk
         5RQdfdTkfTymQ==
Date:   Sun, 3 Sep 2023 16:15:19 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Tommy Huang <tommy_huang@aspeedtech.com>
Cc:     brendan.higgins@linux.dev, p.zabel@pengutronix.de,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        benh@kernel.crashing.org, joel@jms.id.au, andrew@aj.id.au,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        BMC-SW@aspeedtech.com, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH] drivers:i2c:add controller reset when the timeout
 occurred
Message-ID: <20230903141519.ha6aakgkrq6ohy5s@zenone.zhora.eu>
References: <20230814111534.2771900-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814111534.2771900-1-tommy_huang@aspeedtech.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tommy,

Please fix the title of the patch from:

   drivers:i2c:add controller reset when the timeout occurred

to something like:

   i2c: aspeed: Reset the controller when timeout occurs

Note:

 - leave a space after the ':'
 - start with a capital letter after the last ':'

On Mon, Aug 14, 2023 at 07:15:34PM +0800, Tommy Huang wrote:
> 1.Call i2c controller reset when the i2c transfer timeout occurred.
> The rest of interrupts and device should be reset avoid unperdicted
> controller behavior occurred.

Please remove the '1.' and please rewrite this sentence in order
to be grammatically correct, something like:

"Call the i2c controller reset when an i2c transfer timeout
occurs. The remaining interrupts and the device should be reset
to avoid unpredictable controller behavior."

> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>

Is this a fix? If so please add:

Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.1+

Jae Hyun is the author of the line you are changing therefore he
needs to be Cc'ed

[...]

>  		/*
>  		 * If timed out and bus is still busy in a multi master
> -		 * environment, attempt recovery at here.
> +		 * environment, attempt recovery at here. Even the bus is
> +		 * idle, we still need reset i2c controller avoid rest of
> +		 * interrupts.

Please fix the grammar here, as well

   In a multi-master setup, if a timeout occurs, attempt
   recovery.  But if the bus is idle, we still need to reset the
   i2c controller to clear the remaining interrupts.

We take this chance to improve the previous comment, as well.

>  		 */
>  		if (bus->multi_master &&
>  		    (readl(bus->base + ASPEED_I2C_CMD_REG) &
>  		     ASPEED_I2CD_BUS_BUSY_STS))
>  			aspeed_i2c_recover_bus(bus);
> +		else
> +			aspeed_i2c_reset(bus);

I'd like also someone from Jae Hyun, Brendan, Benjamin or Joel to
take a look here, as well. Thanks!

Andi
