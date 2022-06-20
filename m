Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 137BD552703
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 00:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238834AbiFTWlJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jun 2022 18:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233825AbiFTWlI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jun 2022 18:41:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A572A1208A;
        Mon, 20 Jun 2022 15:41:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 427606132A;
        Mon, 20 Jun 2022 22:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975DAC3411B;
        Mon, 20 Jun 2022 22:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655764863;
        bh=nZWufb/2NK+PuNUs4fGkoUzOuk6Ahii+9n03Nug/AVk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=IGPEgoOaPENQItD1VXLoQGdJOD5tp17KAY43++lGTW9VTaTmFrM0sAlcp1gPtlf52
         iKB8gi8czTY/B9LN4Yc4VjVdX35yXet9Vx0yVqO+H7AFpaqBViIZR/hNLYziB3pzzl
         QHziamEjBI07YKx1B3sqDsdeeFIMSXnYOM/SCbWsRQ69avOmApWDA4ZhX1K/q0MmNY
         aS6W6C8AlCZH1Kq3OnTqB5Wv6EFbeJ6RhqISj7E35EXZ2c+V6U77FuNqZuORm+q9Ki
         wDMJiBPoYskI0DWkHMWurAKxhO/XY8Y1ScOT9kVxsKJK7m0Za8wytMJzOBHsjai237
         VNmrHcmiucakA==
Message-ID: <b4fb0c7f-2fd9-35ff-1d09-8940e3b66455@kernel.org>
Date:   Mon, 20 Jun 2022 17:41:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCHv5 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Content-Language: en-US
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220616141230.858409-1-dinguyen@kernel.org>
 <f8647bec-eca7-b318-4f79-bc4bae721004@linux.intel.com>
From:   Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <f8647bec-eca7-b318-4f79-bc4bae721004@linux.intel.com>
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



On 6/17/22 07:59, Jarkko Nikula wrote:
> Hi
> 
> On 6/16/22 17:12, Dinh Nguyen wrote:
>> The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
>> thus cannot be recovered by the default method of by doing a GPIO access.
>> Only a reset of the I2C IP block can a recovery be successful.
>>
> One thing what is unclear to me how does this release the I2C slave that 
> potentially keeps the SDA stuck low. Does platform specific reset 
> sequence send 9 SCL pulses, toggle HW reset of the clients or cycle 
> power of them?
> 
> If recovery is only controller point of view then worth to emphasis it 
> in the commit log and perhaps add a comment too into 
> i2c_socfpga_scl_recovery(). Some might hit an issue that I2C client is 
> stuck and wonder why recovery won't work.

The recovery is only resetting the controller itself and not the client. 
I'll add a comment in v6 to highlight this.
> 
>> The assignment of the recover_bus needs to get done before the call to
>> devm_gpiod_get_optional(), otherwise, the assignment is not taking place
>> because of an error after returning from devm_gpiod_get_optional().
>>
> This sentence no longer true after v3?

Correct...will update.

Dinh
