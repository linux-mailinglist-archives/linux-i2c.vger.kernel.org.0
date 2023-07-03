Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D276746248
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 20:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjGCSXi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 14:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbjGCSXh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 14:23:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344B8D7;
        Mon,  3 Jul 2023 11:23:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A55D560FF1;
        Mon,  3 Jul 2023 18:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6DDC433C8;
        Mon,  3 Jul 2023 18:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688408616;
        bh=VV5nlcHSQdU2CE/kaXRHO4TsB7jAH3jRL4fsIT9AC5I=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=g/gv8wQmnEK+0SC9oj+u2YDtTdqIYa0ibhF4prcDb5NBdrboGUEUpT2shV+MW+yzA
         TW8uTL/NBjYiorcJ5EuDMRdQmb5R24Eek4+9nEV2Ln2P1dVnFNiuoc+bEsd9X4pqw+
         XPPYlmNSNt5EJmeSrqG0vlFtOy5bIwaGzG/QAsHMsDiew+WtC1GGQSvMOyQVqrPhxF
         ROWsjgqencRE80Zvz1XdOdnDduAEGNCMzWOMb31/3opxRF2bg7Hvy1LjTQRmAWJqKs
         uqphevWI/vQK0ghvZx/bKwKVexThp6mIZXaQB8cavuWezg21QCxV6KgpgZtuJCf0PT
         MZTGOLZcn7tVw==
Message-ID: <19b2d721-06a3-bc17-eb81-18ee2d8856a3@kernel.org>
Date:   Mon, 3 Jul 2023 20:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] i2c: at91: constify at91_twi_pdata
To:     Andi Shyti <andi.shyti@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <6ac87dcbb660ae892bf8740c78d3eca7625d6db6.1687814664.git.mirq-linux@rere.qmqm.pl>
 <20230629223825.27q75s2a3eyiapgy@intel.intel>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230629223825.27q75s2a3eyiapgy@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 30/06/2023 00:38, Andi Shyti wrote:
> Hi Michal,
> 
> [...]
> 
>> -static struct at91_twi_pdata *at91_twi_get_driver_data(
>> +static const struct at91_twi_pdata *at91_twi_get_driver_data(
>>  					struct platform_device *pdev)
>>  {
>>  	if (pdev->dev.of_node) {
>> @@ -189,9 +189,9 @@ static struct at91_twi_pdata *at91_twi_get_driver_data(
>>  		match = of_match_node(atmel_twi_dt_ids, pdev->dev.of_node);
>>  		if (!match)
>>  			return NULL;
>> -		return (struct at91_twi_pdata *)match->data;
>> +		return match->data;
>>  	}
>> -	return (struct at91_twi_pdata *) platform_get_device_id(pdev)->driver_data;
>> +	return (const void *) platform_get_device_id(pdev)->driver_data;
> 
> the const's always confuse me... do you get an error here? Is
> this cast really needed?

I think this change is not necessary and actually should not matter. See
for example drivers/tty/serial/samsung_tty.c after my refactorings in
commit 3aec40096550 ("tty: serial: samsung: reduce number of casts").

Best regards,
Krzysztof

