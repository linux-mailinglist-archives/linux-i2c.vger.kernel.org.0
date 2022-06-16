Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E42EA54D6EA
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 03:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350732AbiFPBTG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 21:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350964AbiFPBTF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 21:19:05 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2ACA57159;
        Wed, 15 Jun 2022 18:18:57 -0700 (PDT)
Received: (Authenticated sender: frank@zago.net)
        by mail.gandi.net (Postfix) with ESMTPSA id AD1D960002;
        Thu, 16 Jun 2022 01:18:49 +0000 (UTC)
Message-ID: <af03596e-f06c-9c23-1904-34317e25620a@zago.net>
Date:   Wed, 15 Jun 2022 20:18:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 1/3] mfd: ch341: add core driver for the WCH CH341 in
 I2C/SPI/GPIO mode
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20220401023306.79532-1-frank@zago.net>
 <20220401023306.79532-2-frank@zago.net> <YmgDID8pRYDFK8vi@google.com>
From:   Frank Zago <frank@zago.net>
In-Reply-To: <YmgDID8pRYDFK8vi@google.com>
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

Hi Lee,

>> +	dev->ep_in = endpoints[0].desc.bEndpointAddress;
>> +	dev->ep_out = endpoints[1].desc.bEndpointAddress;
>> +	dev->ep_intr = endpoints[2].desc.bEndpointAddress;
>> +	dev->ep_intr_interval = endpoints[2].desc.bInterval;
>> +
>> +	usb_set_intfdata(iface, dev);
>> +
>> +	rc = mfd_add_hotplug_devices(&iface->dev, ch341_devs,
> 
> Why are you using 'hotplug' here?

I replaced with mfd_add_devices, however I'm not sure what the difference
 is since mfd_add_hotplug_devices() is just a helper with less parameters.
That's what the viperboard driver does; I just copied since both devices 
are similar in functionality.

> 
> ch341_devs is empty right?
> 
> So no child devices are registered.
> 
> In which case this is not (yet) an MFD and cannot be accepted.
> 
> Please add the children.
> 
>> +				     ARRAY_SIZE(ch341_devs));
>> +	if (rc) {
>> +		rc = dev_err_probe(&iface->dev, rc,
>> +				   "Failed to add mfd devices to core\n");
> 
> I'm not even sure what this means.  Should be:
> 
> "Failed to register child devices\n"

Changed. The original string was also from the viperboard driver.

> 
>> +MODULE_DESCRIPTION("CH341 USB to I2C/SPI/GPIO adapter");
> 
> Is it?  What makes it one of those?

That's what this chip does, in addition to UART and printer modes. See patch 4.

Frank.
