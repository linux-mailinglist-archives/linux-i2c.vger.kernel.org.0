Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334705353C7
	for <lists+linux-i2c@lfdr.de>; Thu, 26 May 2022 21:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233708AbiEZTJC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 May 2022 15:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiEZTJB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 May 2022 15:09:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C797DBA55A;
        Thu, 26 May 2022 12:09:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8776CB821AA;
        Thu, 26 May 2022 19:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EEBC385A9;
        Thu, 26 May 2022 19:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653592138;
        bh=Tmtblp5WjlLWc8JQfBqXUxUtQqL2wo/TVVPY6RHiXl4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SwRUJPwzs7dNhqM/Hk1X4C/h8vQF9gF7PnGt43HJVqTs22Qf9YK5Lfu3OkFoOfu26
         g5t9UZNyASt93JGKMzdT1dtKHulUUUStmmN4ecaVMPSwwg4nbNBROG+Q4MVcV7U8cO
         pWoW8G+1cWkAQN+7vLaCyleISQfUIJcZEdnRr7+JxH+wrshIiru/7PpzpfNevQjkqz
         VdTOt6BSoQNp6JkTf5UTDv1tM0OJIJaEVJqXKLowShhUSiUHJcWiJsr3JmdCI6xsHE
         Nd1q4akU2/72v20a0Xl3ETpIVb+4NFWiYsp6wMpEQ/IN7LutYSllfoUM/iEralcdD9
         JjifB4EKOweBw==
Message-ID: <3dafa370-cd77-e3ba-a48b-2ca3674432ab@kernel.org>
Date:   Thu, 26 May 2022 14:08:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCHv2 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220524135441.420600-1-dinguyen@kernel.org>
 <Yo0LKQchQwitJVHm@smile.fi.intel.com>
From:   Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <Yo0LKQchQwitJVHm@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/24/22 11:43, Andy Shevchenko wrote:
> On Tue, May 24, 2022 at 08:54:40AM -0500, Dinh Nguyen wrote:
>> The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
>> thus cannot be recovered by the default method of by doing a GPIO access.
>> Only a reset of the I2C IP block can a recovery be successful.
> 
> Better now, but see my additional comments.
> 
> ...
> 
>> +	switch (dev->flags & MODEL_MASK) {
>> +	case MODEL_SOCFPGA:
>> +		rinfo->recover_bus = i2c_socfpga_scl_recovery;
>> +		break;
>> +	default:
>> +		rinfo->recover_bus = i2c_generic_scl_recovery;
>> +		break;
>> +	}
> 
>> +	adap->bus_recovery_info = rinfo;
> 
> Usually we do not assign the pointer while data structure is incomplete.
> That's said, please leave this line as it was.
> 
> On top of that, why you can't move the above switch to the place where old
> function was assigned?
> 

I have to put the switch statement before the call to 
devm_gpiod_get_optional(), otherwise the recover_bus function pointer 
will not get set.

Dinh
