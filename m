Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2402172FDC7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 14:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236513AbjFNMCY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 08:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243186AbjFNMCX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 08:02:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60E9E19A5;
        Wed, 14 Jun 2023 05:02:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E804464171;
        Wed, 14 Jun 2023 12:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91737C433C8;
        Wed, 14 Jun 2023 12:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686744141;
        bh=Ndt3qeBV1t7UZ/IrnN4tt6VjBFAtVfLwZMresw0Bg+M=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=TmaqT+pIvNRDcMhfZ8WrIBUDXP9SLxwHJCNLrimj1yS5T8nhLqAvwgG43JtWuj93z
         wEeJTxmOyxhYdN6Wmddc1EjsfOm6KsXkc+brCVgGg5i9Cxd4sv6j+XtFezJ3fHRgWB
         v1gywGb7OAmdSqdnTzHNXW7ucnBw8N095y2AZO4qTMbGXX/be4cmS/StZ3W4kzphfJ
         Tu6qKReqshLJ4gDUCo8izrHXbkByKqP7Hxws2NfTmr1QRzknnf/CFN/AFyaSvKfm5W
         LBQUwCBukvPtrNLUMC9+ntKP289QJd501djq2XB7f+mxZtn8lY49dNYWnU70i/EXO3
         LNB43PGGndiIg==
Message-ID: <bc8a4601-2651-cd69-42d2-f34992f797eb@kernel.org>
Date:   Wed, 14 Jun 2023 14:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1] drivers/i2c/muxes:Fix resource leaks in
 device_for_each_child_node() loops
To:     Andi Shyti <andi.shyti@kernel.org>, Wang Ming <machel@vivo.com>
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20230614112903.667-1-machel@vivo.com>
 <20230614114339.zhuhij6vobdnbse5@intel.intel>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230614114339.zhuhij6vobdnbse5@intel.intel>
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

On 14/06/2023 13:43, Andi Shyti wrote:
> Hi Wang,
> 
>> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
>> index 5d5cbe013..90966de7a 100644
>> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
>> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
>> @@ -106,6 +106,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
>>                 } else if (is_acpi_node(child)) {
>>                         rc = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), values + i);
>>                         if (rc)
>> +                               fwnode_handle_put(child);
>>                                 return dev_err_probe(dev, rc, "Cannot get address\n");
>>                 }
> 
> please, read it again and tell me what's wrong :)


No, we can't tell what's wrong because:

> The contents of this message and any attachments may contain
> confidential and/or privileged information

:)

Wang,
Just run the sparse and smatch before posting patches.

Best regards,
Krzysztof

