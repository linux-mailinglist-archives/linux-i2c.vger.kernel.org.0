Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97955571A32
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jul 2022 14:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbiGLMl1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jul 2022 08:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232871AbiGLMl0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jul 2022 08:41:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3170AA5E77;
        Tue, 12 Jul 2022 05:41:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 588DE616C3;
        Tue, 12 Jul 2022 12:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BE6C3411C;
        Tue, 12 Jul 2022 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657629680;
        bh=YhdHurAYvqU9HYvYJ3QQIe0wxM38NxHxJZeD7l5WnZs=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=bOlWhFyLAUZ4n40G98F2TnE3+uccvtlSfKhQQHDY0/cl+jRP2CGCkRqwps7fX1pjC
         dh7vhzieJgblBblEr0h6bW5ylAoYhCYtc4H2F0vvJ/ebiADU2ZqZMz9fKbRD4qL3Cd
         Hj8rMvIVeNGT2jHJUEPK7soUC8Z96bAVdEHD1stLtZV/hvsgObKFQuhj6C3XDZNh2A
         S2Aj+AgAHqPi1EIFzU5ZtNceFr3CZwcWZsYMlBCkPRXV7H6pycc701kHe/gw+50Lgo
         rINuIVnVXrPOPUxA13Mnlz6MrS/WPMIWlo1DRbbMaAyv4tnWTrxe4BHuDEHQeg04Mb
         qCnbipBADBz+A==
Message-ID: <c765455f-c1b9-2da0-675e-591f7c268d99@kernel.org>
Date:   Tue, 12 Jul 2022 07:41:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCHv6 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220620230109.986298-1-dinguyen@kernel.org>
 <YrI6EeVkkWVMNPFY@shikoro> <928b2996-b2e7-d847-0e20-7e19df3cbf03@kernel.org>
 <YrN2lxvlP4cWfelY@kunai>
From:   Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <YrN2lxvlP4cWfelY@kunai>
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

Hi Wolfram,

On 6/22/22 15:07, Wolfram Sang wrote:
> 
>>  From the original code, the first mechanism to a recovery is to acquire a
>> GPIO for the SCL line and send the 9 SCL pulses, after that, it does a reset
>> of the I2C module. For the SOCFPGA part, there is no GPIO line for the SCL,
>> thus the I2C module cannot even get a reset. This code allows the function
>> to reset the I2C module for SOCFPGA, which is the 2nd part of the recovery
>> process.
> 
> The second part is totally useless if the client device is holding SDA
> low. Which is exactly the situation that recovery tries to fix. As I
> said, if you can't control SCL, you don't have recovery.
> 

This is recovery of the master and not the slave.  We have a customer 
that is the using I2C with the signals routed through the FPGA, and thus 
are not GPIO. During a timeout, with this code, the driver is able to 
recover the master.

Dinh
