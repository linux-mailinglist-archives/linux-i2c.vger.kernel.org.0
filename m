Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07D654D6F8
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 03:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348113AbiFPBXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 21:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236585AbiFPBXG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 21:23:06 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667962229E;
        Wed, 15 Jun 2022 18:23:04 -0700 (PDT)
Received: (Authenticated sender: frank@zago.net)
        by mail.gandi.net (Postfix) with ESMTPSA id CF658100006;
        Thu, 16 Jun 2022 01:22:59 +0000 (UTC)
Message-ID: <825b7446-b082-8c6c-7cb0-f97a19bf0862@zago.net>
Date:   Wed, 15 Jun 2022 20:22:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 3/3] i2c: ch341: add I2C MFD cell driver for the CH341
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20220401023306.79532-1-frank@zago.net>
 <20220401023306.79532-4-frank@zago.net> <YojVHBofkBOFVYap@shikoro>
From:   Frank Zago <frank@zago.net>
In-Reply-To: <YojVHBofkBOFVYap@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 5/21/22 07:03, Wolfram Sang wrote:

> Hi Frank,
> 
> I am not super familiar with USB drivers, so mostly some high level
> review questions first:
> 
> On Thu, Mar 31, 2022 at 09:33:06PM -0500, frank zago wrote:
>> The I2C interface can run at 4 different speeds. This driver currently
>> only offer 100MHz. Tested with a variety of I2C sensors, and the IIO
> 
> 100kHz.
> 
>> subsystem.
>>
>> Signed-off-by: frank zago <frank@zago.net>
> 
> ...
> 
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index a1bae59208e3..db9797345ad5 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -1199,6 +1199,16 @@ config I2C_RCAR
>>  
>>  comment "External I2C/SMBus adapter drivers"
>>  
>> +config I2C_CH341
>> +	tristate "CH341 USB to I2C support"
>> +	select MFD_CH341
> 
> Hmm, it selects a symbol which depends on USB. Not good AFAIK. I think
> this driver should depend on MFD_CH341.

I've been asked earlier to change it to select. 

>> +
>> +/*
>> + * The maximum request size is 4096 bytes, both for reading and
>> + * writing, split in up to 128 32-byte segments. The I2C stream must
>> + * start and stop in each 32-byte segment. Reading must also be split,
>> + * with up to 32-byte per segment.
>> + */
>> +#define SEG_COUNT 128
> 
> You mean between every 32 bytes, there is a START and STOP condition on
> the bus? Then, the maximum message size is 32 byte only, sadly. Or did I
> misunderstand?

I've tried to reword that section. The usb command is up to 4kb, but each 
32-byte section is a command to the chip, not i2c.

> 
> Can the driver send an arbitrary number of messages within one transfer?
> E.g. write, read, read, write, read? All connected with a REPEATED START
> and not with STOP and START?

Yes it can.

> 
> ...
> 
>> +static u32 ch341_i2c_func(struct i2c_adapter *adap)
>> +{
>> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
>> +}
> 
> Have you also tested zero length messages AKA SMBus Quick commands?

Not properly at the time, although this didn't break the driver. 
I've fixed that by adding the special case.

Regards,
  Frank
