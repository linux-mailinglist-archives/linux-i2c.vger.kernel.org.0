Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 461887430A7
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Jun 2023 00:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbjF2Win (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Jun 2023 18:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233357AbjF2Wig (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Jun 2023 18:38:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBDF3582;
        Thu, 29 Jun 2023 15:38:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E05A61650;
        Thu, 29 Jun 2023 22:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37118C433C9;
        Thu, 29 Jun 2023 22:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688078314;
        bh=TLw61Hh3yhzDZPN0ObhnMLkwRMby5ZO/pSE62EhSVoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uuaR/vqEp0+Be8De0J+fAEKawhOwVattodVSBXgqy0j2UodDRNqTQ2YF9KVEHX20x
         o1llmiIZNYkM8rr/T/inxRVA70aRNP6U8rAs5kBGoBHwR6IKS0fjb7Dsaew0IBpzYo
         0gC7ix5CEoAkbmYeuIyi/zGmx+TduDNf8LyEn1fRzFK466gLL2dwd0uGG3uBL6vkoH
         8LauYGiKNyRBXeqiT1pMnE3vburKfqconGpylAoU4oB9bWGAD2v9HUrKgGrZw1Qtx1
         NSk097Xpo96rTxRTHdSFmVjQQldioUiXt6BeMlpuEUdIimG/IYfdK80u3kSfAV+P/D
         U+A+rvfrZbzzQ==
Date:   Fri, 30 Jun 2023 00:38:25 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: at91: constify at91_twi_pdata
Message-ID: <20230629223825.27q75s2a3eyiapgy@intel.intel>
References: <6ac87dcbb660ae892bf8740c78d3eca7625d6db6.1687814664.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ac87dcbb660ae892bf8740c78d3eca7625d6db6.1687814664.git.mirq-linux@rere.qmqm.pl>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Michal,

[...]

> -static struct at91_twi_pdata *at91_twi_get_driver_data(
> +static const struct at91_twi_pdata *at91_twi_get_driver_data(
>  					struct platform_device *pdev)
>  {
>  	if (pdev->dev.of_node) {
> @@ -189,9 +189,9 @@ static struct at91_twi_pdata *at91_twi_get_driver_data(
>  		match = of_match_node(atmel_twi_dt_ids, pdev->dev.of_node);
>  		if (!match)
>  			return NULL;
> -		return (struct at91_twi_pdata *)match->data;
> +		return match->data;
>  	}
> -	return (struct at91_twi_pdata *) platform_get_device_id(pdev)->driver_data;
> +	return (const void *) platform_get_device_id(pdev)->driver_data;

the const's always confuse me... do you get an error here? Is
this cast really needed?

Andi
