Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6CD769E47B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Feb 2023 17:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234120AbjBUQ0N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Feb 2023 11:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233858AbjBUQ0M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Feb 2023 11:26:12 -0500
X-Greylist: delayed 963 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 21 Feb 2023 08:26:08 PST
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [IPv6:2a02:9e0:8000::27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529A726CE9
        for <linux-i2c@vger.kernel.org>; Tue, 21 Feb 2023 08:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protonic.nl; s=202111;
        h=message-id:references:in-reply-to:reply-to:subject:cc:to:from:date:
         content-transfer-encoding:content-type:mime-version:from;
        bh=tB1CUucmQAwq5ZhrBGTWbBkWbli8ZqziqAP8HRDZv7g=;
        b=mSM2Xy9hIHzl6N4po1m1kLi+QN88FJY6XQ3p35fNUJbdzIyKoExkhxHNC89DHxiCCgS6/28t9iH6T
         hCQH7L6d6iYBF7Qqk/hLtzWgjJ65fjN7i1BLD0vEj7XRtfYBTTs9NjjCy5mE052wHG8iYLwcWfJHoU
         StvRl5f47fUZTqQiysVm9fR/usUo5stcneGQJGgE3NEKpUTt0xkxi3ERslF6mbKcIBJAXR8fzjKptH
         PFBqtPEKfMXITlrvo+VH6PtJ/X+mK4XQrcNLCiHU/iqYKMFwqXZfOYYjL+uAtHCzdKc80RyiqqDqwe
         FwfmzyzuvV64/fpvw8MRjiKQumBxhgg==
X-MSG-ID: 31362270-b202-11ed-829c-0050569d2c73
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 21 Feb 2023 17:10:00 +0100
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
In-Reply-To: <Y/TJs+Arban0ats8@smile.fi.intel.com>
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
 <20230221133307.20287-3-andriy.shevchenko@linux.intel.com>
 <Y/TJs+Arban0ats8@smile.fi.intel.com>
Message-ID: <be203dfd290e67c8ce74d11c5c9478a4@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.1 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Andy,

On 2023-02-21 14:40, Andy Shevchenko wrote:
> On Tue, Feb 21, 2023 at 03:33:06PM +0200, Andy Shevchenko wrote:
>> Switching to use device_get_match_data() helps getting of
>> i2c_of_match_device() API.
> 
> ...
> 
>> -	id = i2c_of_match_device(dev->driver->of_match_table, client);
>> -	if (id)
>> -		priv->type = (uintptr_t)id->data;
>> +	priv->type = (uintptr_t)device_get_match_data(dev);
> 
> Looking closer the I²C ID table should provide DISP_MATRIX to keep 
> default and
> this needs to be not dropped.
> 
> So, the question is what to do with unknown type then, return -EINVAL 
> from
> probe()?

If you leave out your addition of the DISP_UNKNOWN type, the default 
type will
be DISP_MATRIX if no match is found, which is as it is now.

In that case the following change should suffice:

@@ -713,7 +715,6 @@ static int ht16k33_seg_probe(struct device *dev, 
struct ht16k33_priv *priv,
  static int ht16k33_probe(struct i2c_client *client)
  {
      struct device *dev = &client->dev;
-    const struct of_device_id *id;
      struct ht16k33_priv *priv;
      uint32_t dft_brightness;
      int err;
@@ -728,9 +729,8 @@ static int ht16k33_probe(struct i2c_client *client)
          return -ENOMEM;

      priv->client = client;
-    id = i2c_of_match_device(dev->driver->of_match_table, client);
-    if (id)
-        priv->type = (uintptr_t)id->data;
+    priv->type = (uintptr_t)device_get_match_data(dev);
+
      i2c_set_clientdata(client, priv);

      err = ht16k33_initialize(priv);

Or do you think falling back to DISP_MATRIX if no match is found is 
wrong?

Kind regards,
Robin
