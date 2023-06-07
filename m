Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37FD87261BD
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 15:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235763AbjFGN4E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 09:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235753AbjFGN4E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 09:56:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33091BE2
        for <linux-i2c@vger.kernel.org>; Wed,  7 Jun 2023 06:56:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 543CC6356B
        for <linux-i2c@vger.kernel.org>; Wed,  7 Jun 2023 13:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F15EC433EF;
        Wed,  7 Jun 2023 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686146160;
        bh=LK25HV5L+pnG2i/e+/dLPLcOV68a8+juVwKEC94to2s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=iq4f4I6IYwgbza4FKBo4SUQMZ1oOJyKsisy8GBD6LqBKQdgy4CjIpUPdh438pxfO/
         NU6dRvA2aT0kkkKeuKzSFzKL4CSyEROvFsxk9prg2IyW0pgT286OwbibEk0mYr5qyR
         Y/08o+rTzTchSi7ZTgVH004FvDZnoLdI3O/vMaxWCMSWbgHZlkQSxmghZjG78piVW/
         j2sYxqqdLKH7V6HqCXWjspzHwfP8ju0+pp0zHoUGn26c0+vBs+Ag/C+RlKxCvLg72T
         W+qm3YJDbVANqjcJBEDNn5+9wBdpgZROnYqyHcpLUryRdpy4ZPhuEVNTibEqaALEBj
         kN55iB4pNgt5Q==
Message-ID: <4c2d8675-5cc0-ec6e-f352-b032600b9469@kernel.org>
Date:   Wed, 7 Jun 2023 15:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3] i2c: add support for Zhaoxin I2C controller
Content-Language: en-US
To:     andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        Hans Hu <HansHu-oc@zhaoxin.com>
Cc:     cobechen@zhaoxin.com, TonyWWang@zhaoxin.com
References: <20230602050103.11223-1-hanshu-oc@zhaoxin.com>
 <0489dec4-cd7a-4f50-e811-d4798d514fb4@kernel.org>
 <87c0be06-0ac4-5d34-671c-5668739bdb8b@zhaoxin.com>
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

Your email is corrupted. It was sent with "Reply to:
0489dec4-cd7a-4f50-e811-d4798d514fb4@kernel.org":

Reply-To: <0489dec4-cd7a-4f50-e811-d4798d514fb4@kernel.org>
In-Reply-To: <0489dec4-cd7a-4f50-e811-d4798d514fb4@kernel.org>


On 07/06/2023 14:33, Hans Hu wrote:
>>> +
>>> +static int zxi2c_parse_resources(struct zxi2c *i2c)
>>> +{
>>> +	struct platform_device *pdev = to_platform_device(i2c->dev);
>>> +	struct resource *res;
>>> +
>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	i2c->regs = devm_ioremap_resource(&pdev->dev, res);
>> There is a helper for these two.
> 
> 
> I want to use the lower 8 bits of the physical address to
> distinguish the controller's index, to set reset_bitmask.

OK

> 
> 
>>> +	if (IS_ERR(i2c->regs))
>>> +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->regs),
>>> +				"get base addr failed\n");
>>> +
>>> +	if (res->start & 0x20)
>>> +		i2c->reset_bitmask = BIT(4);
>>> +	else
>>> +		i2c->reset_bitmask = BIT(5);
>>> +
>>> +	i2c->irq = platform_get_irq(pdev, 0);
>>> +	if (i2c->irq < 0)
>>> +		return dev_err_probe(&pdev->dev, i2c->irq,
>>> +				"get irq failed\n");
>>> +
>>> +	zxi2c_get_bus_speed(i2c);
>>> +
>>> +	i2c->hrv = get_reversion(i2c->regs);
>>> +
>>> +	i2c->dynamic = get_dynamic_clock(i2c->regs);
>>> +	set_dynamic_clock(i2c->regs, i2c->dynamic);
>>> +
>>> +	i2c->fstp = get_fstp_value(i2c->regs);
>>> +	zxi2c_set_bus_speed(i2c);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int zxi2c_probe(struct platform_device *pdev)
>>> +{
>>> +	int error;
>>> +	struct zxi2c *i2c;
>>> +	struct pci_dev *pci;
>>> +	struct device *dev;
>>> +
>>> +	/* make sure this is zhaoxin platform */
>> Why? How can you match to different platform?
>>
> 
> In case a platform device named "IIC1D17" is also reported on
> non-zhaoxin platform, this driver may also be registered successfully,
> even if it shouldn't. In theory.

Why shouldn't it be registered on other platform? It's the same device,
isn't it?


Best regards,
Krzysztof

