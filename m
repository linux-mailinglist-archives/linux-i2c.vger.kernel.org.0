Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1300F554BA1
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jun 2022 15:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245358AbiFVNpT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jun 2022 09:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357344AbiFVNpR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jun 2022 09:45:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38062245A0;
        Wed, 22 Jun 2022 06:45:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CC5F4B81EB6;
        Wed, 22 Jun 2022 13:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3D2C34114;
        Wed, 22 Jun 2022 13:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655905514;
        bh=nb+4r1+9+2eYNY4+XedvPOxrCh321bMG7JzYtzSlN2Y=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=SpkrBfCHfGbfkZ5vEW3LQPgzOHpkFq9zJS9vYNXSYS4c1dqttFO1cYPOMbrreFOpl
         T6rvTHSYeCwkdB/sAvEaX7cqYNc5eRqLeUJyjfEhYrjPCFhh/jMdl7VtglzOF0+AA5
         Us3wjPQFl6cNo5xJPfn0QQ0+wjXada+3Opb9VvJG6P3FJc5v/ueImQMIA8IbIJ4E/U
         rH6pb+YUOr+6W8BKLJ5kTNnTD1I8IN4C1/OrufthDDw8x5eA+OQ43XqZl3+4zAb0oW
         bz3wRsBw5wodqJP70LWO1VIJIgtA1qGcAwUoHdqOaO420h6YE1djLqS0QkDO+EgGDR
         4xllbkzreJYrA==
Message-ID: <928b2996-b2e7-d847-0e20-7e19df3cbf03@kernel.org>
Date:   Wed, 22 Jun 2022 08:45:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCHv6 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220620230109.986298-1-dinguyen@kernel.org>
 <YrI6EeVkkWVMNPFY@shikoro>
From:   Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <YrI6EeVkkWVMNPFY@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/21/22 16:37, Wolfram Sang wrote:
> On Mon, Jun 20, 2022 at 06:01:08PM -0500, Dinh Nguyen wrote:
>> The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
>> thus cannot be recovered by the default method of by doing a GPIO access.
>> Only a reset of the I2C IP block can a recovery be successful, so this
>> change effectively resets the I2C controller, NOT any attached clients.
> 
> I am afraid here is a serious misunderstanding. The I2C bus recovery
> procedure is a documented mechanism how to get a stalled bus back in the
> case that a client device holds SDA low. This mechanism consists of 9
> SCL pulses. A reset of the IP core is *not a recovery*. If SocFPGA
> cannot togle SCL in some way, it cannot do recovery and
> adap->bus_recovery_info should be NULL. Or did I miss something?

 From the original code, the first mechanism to a recovery is to acquire 
a GPIO for the SCL line and send the 9 SCL pulses, after that, it does a 
reset of the I2C module. For the SOCFPGA part, there is no GPIO line for 
the SCL, thus the I2C module cannot even get a reset. This code allows 
the function to reset the I2C module for SOCFPGA, which is the 2nd part 
of the recovery process.

> 
>> +static int i2c_socfpga_scl_recovery(struct i2c_adapter *adap)
>> +{
>> +	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
>> +
>> +	bri->prepare_recovery(adap);
>> +	bri->unprepare_recovery(adap);
>> +
>> +	return 0;
>> +}
> 
> See, this function is named scl_recovery, but there is no SCL involved.
> This is why I think there is the misunderstanding here.
> 

I understand your point here. Perhaps just call it i2c_socfpga_recovery()?

Dinh
