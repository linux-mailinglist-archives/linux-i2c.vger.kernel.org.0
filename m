Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5C072775C
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 08:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233976AbjFHGh3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 02:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234719AbjFHGh2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 02:37:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD287272E
        for <linux-i2c@vger.kernel.org>; Wed,  7 Jun 2023 23:37:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 65C5864808
        for <linux-i2c@vger.kernel.org>; Thu,  8 Jun 2023 06:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7B9C43442;
        Thu,  8 Jun 2023 06:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686206238;
        bh=wKWHoWmnTwKkiqnwtNbzba/UgDpnFBVXHmgKcvVi4N8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=IC20CJNdeP2bdJZvCNZLFhtlqfWJ8ATWqcbArU1dFkJe7U978wPg+jRytBosOIVWO
         w8OTG4EJKokhR+egMNO/eCqZMS35iddYyezJLyA9w0LfW3Oerr63ENKXu09d4dZ1gu
         gnf3yWGBqeiTgG+/bxQRS+W39XDt67l9UKwj6G3RhxGsLYa+2IXAzJIxt0o6eKudcL
         B2XoJ8T8cIIsgkPvoMvNcOXHzw7Okhj0ClplHCtHL90HUz5oG++amEMmWAjy9ZF77A
         3bRTj51uyWgp/W/dnRppU97eCxHw4P4wcwMvgvLDJG+XzFLFB5DjT7LCMwFwA7nBc0
         x9vv6OvPJ9a6Q==
Message-ID: <e5ecb4ca-f56a-b0cd-cd17-eff0277dfd14@kernel.org>
Date:   Thu, 8 Jun 2023 08:37:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3] i2c: add support for Zhaoxin I2C controller
To:     andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        Hans Hu <HansHu-oc@zhaoxin.com>
Cc:     cobechen@zhaoxin.com, TonyWWang@zhaoxin.com
References: <20230602050103.11223-1-hanshu-oc@zhaoxin.com>
 <0489dec4-cd7a-4f50-e811-d4798d514fb4@kernel.org>
 <87c0be06-0ac4-5d34-671c-5668739bdb8b@zhaoxin.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <87c0be06-0ac4-5d34-671c-5668739bdb8b@zhaoxin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07/06/2023 14:33, Hans Hu wrote:

>>> +
>>> +	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
>>> +	if (IS_ERR(i2c)) {
>>> +		return dev_err_probe(&pdev->dev, -ENOMEM,
>>> +				"devm_kzalloc failed\n");
>> Don't print ENOMEM.
> 
> 
> will change to just return -ENOMEM;
> 
> 
>> Run:
>> 1. Checkpatch
>> 2. Coccinelle
>> to fix trivial issues.
> 
> 
> I used the checkpatch in different versions of the kernel, and there were
> no errors, just a warning about the modify MAINTAINERS, will modify it.

You did not run Coccinelle/coccicheck, so you have trivial issues in the
code. There is no need for us to manually review something which tools
point out.

Please run Coccinelle/coccicheck and fix all errors.

Best regards,
Krzysztof

