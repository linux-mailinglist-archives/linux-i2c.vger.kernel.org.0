Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 184BD8F726
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 00:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731946AbfHOWnp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Aug 2019 18:43:45 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44430 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731244AbfHOWno (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Aug 2019 18:43:44 -0400
Received: by mail-pf1-f193.google.com with SMTP id c81so2037457pfc.11;
        Thu, 15 Aug 2019 15:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jS6ShQKayPnRfpjr7j4ASXzzmaziPz8YNcXH2Dd4cGI=;
        b=qCJImpwQOUspMCTLKbwvXVRgGObb7V6OYqGLS8BjgWthmzLXv8hotcavowknGzXCsU
         Q8skwEIjCthehtVk/rrbB8uvTRNBz9JUxcdnkDVdVZ0M36fO2wT7xX6/Xbx4opoTXA1s
         1rq8b6rSC8MaKo/AC4WBP2sNJLP/3NHdi09MbtoVVCFZo6CvEq8DaKWs1wTJD3W2bsP1
         /jxVMaot27wvz+Hv2FTmH2z3QhLuRqqOH1/LpcqVTWuKsnIQV6yY52EY6dli+6xL9HV3
         oAYfeFgy8vXMr5FMuIilsg+TfMDP7J7qr8ca8uRAYkGXbwcTmGqNa13K4vK2JLWNZ8Bt
         fcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=jS6ShQKayPnRfpjr7j4ASXzzmaziPz8YNcXH2Dd4cGI=;
        b=Rr5iOmAgsGEY1wwgaV0zxSzVg+dRhlkvzeIu6LPalg5joIhS00eDzm441MLC/twKy5
         1f6kqWJmtq0O44WLykvH86oUF3jFbm0wdnMGuPEkG21BzuHPEZ2saeNA+WDIp0lrjCOJ
         dZv8uwSPFU+uflDZbSSQVrB2n7EiO05siBM6nFS/4xM3GQu/YDbCEt1hSGCBIFsMi0o/
         h2WmFAFMqmW9KAbsQVZDqVJLFxKlYnbu5wBhUEWH0vo+h7MpZ7M+auhGfV24LrrzlliR
         JOpMyutyLRkjIh+frA+rjkdHsf0lRYw679XRYPtRscggaWaJuB8n3+XAQpVbDJ9dWkS3
         nwSA==
X-Gm-Message-State: APjAAAWtosj8nWt36hFxXNUAf0+nGewwDI1OtgejGpA0TK734FEgX6xl
        8/37Ed4XjwnRa0RmFA6AwTXcGavd
X-Google-Smtp-Source: APXvYqy9PwdVKsaODSdLLrFGTDC0/CiqF1mCACd5317pAaqx6ZPgD8PIEXqW90ku1YNHlCgfqc4bZQ==
X-Received: by 2002:aa7:9e9a:: with SMTP id p26mr7875391pfq.25.1565909023971;
        Thu, 15 Aug 2019 15:43:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 16sm6203783pfc.66.2019.08.15.15.43.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 15:43:42 -0700 (PDT)
Date:   Thu, 15 Aug 2019 15:43:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Max Staudt <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH v3 2/3] hwmon/ltc2990: Generalise DT to fwnode support
Message-ID: <20190815224341.GA12420@roeck-us.net>
References: <20190815125802.16500-1-max@enpas.org>
 <20190815125802.16500-2-max@enpas.org>
 <6920f2da-3139-6fc8-b02c-3678cc17912e@enpas.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6920f2da-3139-6fc8-b02c-3678cc17912e@enpas.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 16, 2019 at 12:19:42AM +0200, Max Staudt wrote:
> On 08/15/2019 02:58 PM, Max Staudt wrote:
> > -	if (of_node) {
> > -		ret = of_property_read_u32_array(of_node, "lltc,meas-mode",
> > -						 data->mode, 2);
> > +	if (i2c->dev.of_node || i2c->dev.fwnode) {
> 
> One more idea, would it be better here to do the following?
> 
> 	if (device_property_present(i2c->dev, "lltc,meas-mode")) {
> 		ret = of_property_read_u32_array(of_node, "lltc,meas-mode",
> 						 data->mode, 2);
> 	}
> 
> I'm happy to prepare a patch if you wish to have this in - just let me know whether it should be on top of the last one, or instead of it.

That would be semantically different. The property is currently mandatory.
The above code would make it optional. This might work:

	if (dev_fwnode(&i2c->dev)) {
		ret = device_property_read_u32_array(...);
		...
	}

Feel free to send another version of your patch.

Thanks,
Guenter
