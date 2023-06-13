Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F04472F0BB
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 01:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239910AbjFMXzO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 19:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241494AbjFMXy7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 19:54:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1229A7;
        Tue, 13 Jun 2023 16:54:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 65C0D63B11;
        Tue, 13 Jun 2023 23:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96005C433C8;
        Tue, 13 Jun 2023 23:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686700497;
        bh=A2KnQtXsxVJpgrtKvXpTSH8wQ4W6n9q6OJkUWV7Pgdg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FGxRYHdNSZOL8/eFuftct2nIlt1h5MiG6mu/9geKiEAgROtVlyppg+WF2rKGjlfp6
         4kJmR4FEE70TabwBFG2t8D39v5B1hRMlWb/MZsfBymjODHxvpZfEPwVDPZ0z7QTab8
         Uew17FZbZt4UJsd0Oc4WmXsfGjoKidyMdvn4NUhaH9EZMqjqxbaTbtX5MiCQ0tPZJE
         eluad5miyEMjSMEmW0s+s+aVKz1uxoeAkceQvlMmTuLymwHCAz/w3401jmCmyLKH0B
         Ii6vVhThYNhP7Vi/GwgQdvwtV+jBNh+MYGpcVymIeRMXM4i5rdmuetQ7dYlxj/rk8s
         tOx4j0jT4Q4Ew==
Date:   Wed, 14 Jun 2023 01:54:53 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wang Zhang <silver_code@hust.edu.cn>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>, Wolfram Sang <wsa@kernel.org>,
        Andreas Larsson <andreas@gaisler.com>,
        hust-os-kernel-patches@googlegroups.com,
        Peter Korsgaard <jacmet@sunsite.dk>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: ocores: use devm_ managed clks
Message-ID: <20230613235453.msezptxa5pwpizoi@intel.intel>
References: <b5c00122-0fe0-4020-9036-e4cc37d1b51a@lunn.ch>
 <20230526070534.76112-1-silver_code@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526070534.76112-1-silver_code@hust.edu.cn>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wang,

> -	i2c->clk = devm_clk_get(&pdev->dev, NULL);
> -
> -	if (!IS_ERR(i2c->clk)) {
> -		int ret = clk_prepare_enable(i2c->clk);
> -
> -		if (ret) {
> -			dev_err(&pdev->dev,
> -				"clk_prepare_enable failed: %d\n", ret);
> -			return ret;
> -		}
> -		i2c->ip_clock_khz = clk_get_rate(i2c->clk) / 1000;
> -		if (clock_frequency_present)
> -			i2c->bus_clock_khz = clock_frequency / 1000;
> -	}
> -
> +	i2c->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(i2c->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
> +				     "devm_clk_get_optional_enabled failed\n");
> +
> +	i2c->ip_clock_khz = clk_get_rate(i2c->clk) / 1000;

if devm_clk_get_optional_enabled() returns NULL, clk_get_rate()
returns '0' and op_clk_khz would be '0'...

> +	if (clock_frequency_present)
> +		i2c->bus_clock_khz = clock_frequency / 1000;
>  	if (i2c->ip_clock_khz == 0) {

... and we fall inside this 'if', as expected. Looks correct!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
