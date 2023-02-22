Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7CA469F942
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Feb 2023 17:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjBVQqO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Feb 2023 11:46:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbjBVQqN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Feb 2023 11:46:13 -0500
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [IPv6:2a02:9e0:8000::27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F633D93E
        for <linux-i2c@vger.kernel.org>; Wed, 22 Feb 2023 08:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protonic.nl; s=202111;
        h=message-id:references:in-reply-to:reply-to:subject:cc:to:from:date:
         content-transfer-encoding:content-type:mime-version:from;
        bh=v/6hTyPtYjejMluCOgghiXVypyxn1rjiX7XM4MA27ic=;
        b=gcNK/CN1ejlKs7laAktj1Kf3IQC5n0IF4kC4o/Hr5QQuVgajkp0BEf30urFQm6hTtIBMcXYx304CD
         L2USJFLjHoP/0XeL8TVgjLZOsZzYNVGntEswB0xAroA8a8eFvKVIrtahC5N2c41wzpSkBAO64/HsVT
         yeniFOv2v1NEFVNDE6a/kopaZuzD5Yiq/I7HWPM6DIGaeun0YWaQZswaXaNJ1Ub89op2kvCl2/nix6
         ig2SIvF5Hs3xPtk2aBcknBfo8VOZBHo1zW/4NTbM4lEocjbR7iC3/L4SUUa09IjTSWnv6Fmk9cspwe
         bWTAL/WK8t6J1y4FS+nLsLTgrmDW1iw==
X-MSG-ID: 6376de7c-b2d0-11ed-829c-0050569d2c73
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 22 Feb 2023 17:46:00 +0100
From:   Robin van der Gracht <robin@protonic.nl>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 2/3] auxdisplay: ht16k33: Make use of
 device_get_match_data()
Organization: Protonic Holland
Reply-To: robin@protonic.nl
Mail-Reply-To: robin@protonic.nl
In-Reply-To: <Y/UD3HWNy8uKYShC@smile.fi.intel.com>
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
 <20230221133307.20287-3-andriy.shevchenko@linux.intel.com>
 <Y/TJs+Arban0ats8@smile.fi.intel.com>
 <be203dfd290e67c8ce74d11c5c9478a4@protonic.nl>
 <Y/UD3HWNy8uKYShC@smile.fi.intel.com>
Message-ID: <0235f0fed989a8b027db720663699f5d@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.1 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2023-02-21 18:48, Andy Shevchenko wrote:
> On Tue, Feb 21, 2023 at 05:10:00PM +0100, Robin van der Gracht wrote:
>> On 2023-02-21 14:40, Andy Shevchenko wrote:
>> > On Tue, Feb 21, 2023 at 03:33:06PM +0200, Andy Shevchenko wrote:
>> > > Switching to use device_get_match_data() helps getting of
>> > > i2c_of_match_device() API.
> 
> ...
> 
>> > > -	id = i2c_of_match_device(dev->driver->of_match_table, client);
>> > > -	if (id)
>> > > -		priv->type = (uintptr_t)id->data;
>> > > +	priv->type = (uintptr_t)device_get_match_data(dev);
>> >
>> > Looking closer the I²C ID table should provide DISP_MATRIX to keep
>> > default and this needs to be not dropped.
>> >
>> > So, the question is what to do with unknown type then, return -EINVAL
>> > from probe()?
>> 
>> If you leave out your addition of the DISP_UNKNOWN type, the default 
>> type
>> will be DISP_MATRIX if no match is found, which is as it is now.
>> 
>> In that case the following change should suffice:
>> 
>> @@ -713,7 +715,6 @@ static int ht16k33_seg_probe(struct device *dev, 
>> struct
>> ht16k33_priv *priv,
>>  static int ht16k33_probe(struct i2c_client *client)
>>  {
>>      struct device *dev = &client->dev;
>> -    const struct of_device_id *id;
>>      struct ht16k33_priv *priv;
>>      uint32_t dft_brightness;
>>      int err;
>> @@ -728,9 +729,8 @@ static int ht16k33_probe(struct i2c_client 
>> *client)
>>          return -ENOMEM;
>> 
>>      priv->client = client;
>> -    id = i2c_of_match_device(dev->driver->of_match_table, client);
>> -    if (id)
>> -        priv->type = (uintptr_t)id->data;
>> +    priv->type = (uintptr_t)device_get_match_data(dev);
>> +
>>      i2c_set_clientdata(client, priv);
>> 
>>      err = ht16k33_initialize(priv);
>> 
>> Or do you think falling back to DISP_MATRIX if no match is found is 
>> wrong?
> 
> First of all, the I²C ID table should actually use DISP_MATRIX.
> 
> Second, there are two points:
> 
> - It would be nice to check if the OF ID table doesn't provide a 
> setting
>   (shouldn't we try I²C ID table and then, if still nothing, bail out?)
> 
> - The I²C ID table can be extended in the future with another entry 
> which
>   may want to have different default

For my understanding, please correct me if I'm wrong;

For all methods of instantiation during ht16k33 probe, 
i2c_of_match_device()
matches the compatible strings in the OF ID table due to a call to
i2c_of_match_device_sysfs().

device_get_match_data() only matches the compatible strings in the OF ID
table for devicetree instantiation because of_match_device() won't match
is there is no actual of_node.

So with only device_get_match_data() and a non devicetree instantiation,
priv->type will always be (uintptr_t)NULL = 0 = DISP_MATRIX.

Which effectively breaks i.e. user-space instantiation for other display
types which now do work due to i2c_of_match_device().
(so my suggestion above is not sufficient).

Are you proposing extending and searching the I2C ID table to work 
around that?

Kind regards,

-- 
Robin van der Gracht
Protonic Holland
Factorij 36
1689AL Zwaag
+31 (0)229 212928
https://www.protonic.nl
