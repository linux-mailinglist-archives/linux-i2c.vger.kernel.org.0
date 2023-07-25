Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8EA762778
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 01:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjGYXlJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 19:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjGYXlI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 19:41:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5759012E;
        Tue, 25 Jul 2023 16:41:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0426616C1;
        Tue, 25 Jul 2023 23:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8A6C433C8;
        Tue, 25 Jul 2023 23:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690328466;
        bh=sp25dJ6Y/KLI8MJmxJb9iKJpN51ML9wRrtiUXLyP2Ec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bmzZKVNizAdrfrpWp6sIWXbqX7bRAuU8H3UFp7g4Ht0WGdLPoXLNU7gR5UK9iYYDA
         cLYQf7qBnPJRxujlsHAPVhh18hhuboumHmWxKcPzwAcM3PM4ZwZWSdq37bRnASVayN
         RBSl8WEN/Fcdn0wqPohzgo81Nonke3IvOPejYBCo1M5WvizQe2iGrB0mxi0Gi7ZJ1Z
         3gNU1ccPFL4bqSirn9ZStTBQyLal28n1QpjRgy7Kn1tFC5I8K1adN3fvoqMq8uRRi+
         zE0ZTECJ49u9ioiYikjozGCJ1MIMToMqHGMWgz898mUAoytlhjmdiG9zi3ZkthNwRE
         SKHOyNGrz+I0A==
Date:   Wed, 26 Jul 2023 01:41:02 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     carlos.song@nxp.com
Cc:     u.kleine-koenig@pengutronix.de, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, xiaoning.wang@nxp.com, haibo.chen@nxp.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: imx-lpi2c: return -EINVAL when i2c peripheral
 clk doesn't work
Message-ID: <20230725234102.louqs6gvlhfehjur@intel.intel>
References: <20230725083117.2745327-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725083117.2745327-1-carlos.song@nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Carlos,

> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -209,6 +209,9 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
>  	lpi2c_imx_set_mode(lpi2c_imx);
>  
>  	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
> +	if (!clk_rate)
> +		return -EINVAL;
> +

this is a very unlikely to happen and generally not really
appreciated.

If you got so far it's basically impossible that clk_rate is '0'.
Uwe asked you in v2 if you actually had such case.

I don't have a strong opinion, thoug... I would drop this patch
unless Dong is OK with it and I can accept it with his ack.

Andi

>  	if (lpi2c_imx->mode == HS || lpi2c_imx->mode == ULTRA_FAST)
>  		filt = 0;
>  	else
> -- 
> 2.34.1
> 
