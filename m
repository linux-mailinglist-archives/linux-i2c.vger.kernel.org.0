Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCF5729B29
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 15:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbjFINLS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 09:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241087AbjFINLP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 09:11:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC27630FE
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 06:11:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 85245657E1
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 13:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294E6C433D2;
        Fri,  9 Jun 2023 13:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686316272;
        bh=g9u9c77/acXG6bBcL5Ks6SfSnMn+y61eQeG3zOBNH1Q=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KQdPq+W6f0i7pXrhxsuamWXdxd+GVuMHc6rWn8ilCqVPLgIdrY7prTDifdyVEzwin
         1/3I3YThxb5N659UgPNHPS4oZiAHcsF+Is9VrZDRBWijN+917NQReeaPq0PS95OsCk
         7Rvmmf2UaNfHFdOxodVlKPD7IiFXnk1+gZZuRNJtz1hCqpl/1FPrKz66zYMkVL5sWu
         r6vKl4Ap4SwwmWk7sFDOxgRAw/yKFuJ5SbEPZ+hQdg4gvyaS5Vhqxe0lYXLlhENpqV
         VEejLKA3y5zD9f15CLqWFwL1tCagSICUDKUnWPFJNtIUFmsss2r66PG6t7s89oB/GW
         AfmYo3n/XNsjQ==
Message-ID: <01ddc13a-8be1-2b1f-4986-0218fa9c3324@kernel.org>
Date:   Fri, 9 Jun 2023 15:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4] i2c: add support for Zhaoxin I2C controller
To:     Andi Shyti <andi.shyti@kernel.org>, Hans Hu <hanshu-oc@zhaoxin.com>
Cc:     linux-i2c@vger.kernel.org, cobechen@zhaoxin.com,
        TonyWWang@zhaoxin.com
References: <20230609031625.6928-1-hanshu-oc@zhaoxin.com>
 <20230609122414.l2pcuwv5foclkxea@intel.intel>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230609122414.l2pcuwv5foclkxea@intel.intel>
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

On 09/06/2023 14:24, Andi Shyti wrote:
>> +
>> +static int zxi2c_probe(struct platform_device *pdev)
>> +{
>> +	int err = 0;
>> +	struct zxi2c *i2c;
>> +	struct pci_dev *pci;
>> +	struct device *dev;
>> +
>> +	/* make sure this is zhaoxin platform */
> 
> Krzysztof is asking what does this mean? I guess here you are
> checking if the device connected is really the zhaixin plaform of
> this driver. Makes sense. Just to avoid misunderstandings we
> could rephrase this with something like:
> 
> 	/*
> 	 * Check if vendor and device ID match the expected
> 	 * values for the zhaoxin platform
> 	 */
> 
> would it work?

I don't understand why does it make sense. Only correct devices are
matched, right? So either this is impossible condition or  this is
plugged into other proper platform. In both cases you should not have
such checks.

Why would ever a driver check in probe what platform it is?

Best regards,
Krzysztof

