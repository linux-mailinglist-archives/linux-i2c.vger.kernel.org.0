Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7F339FC1
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 14:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfFHM7V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 08:59:21 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44190 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbfFHM7V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jun 2019 08:59:21 -0400
Received: by mail-pf1-f195.google.com with SMTP id t16so2692869pfe.11;
        Sat, 08 Jun 2019 05:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U6kNzw9jg6wjnbbAdjWukgPoHdW/wsFLgOtzXedRmQY=;
        b=GpSA+M/dnDLmUIfKHKILYGlW+ssHIXlWIknKgB3dionkiIycmDI90wnlNQo6gTe54f
         B5aM/REyPQ05QVbvR8PSpEMOa85NIwd7h5t//8DwC7BhDNpspLJBSk0DNGMsGEdc+vnn
         cLXSdSQFliisilIf3KMKKo4VmlFeyt9JO18JmVAMY0hzOO0g28gCqLvMHGohRMJtK8yd
         CP1GlR3zSZ0+85KfzNSe+8ur9RuP//cMEiU3vm7ZyuzOfAGL7QVq+f7tHrsq85uh7Psh
         HmQVOqpjDINB4RhIkCE21li55iVE4TDiaXGk/CTEitIWxcr+CO4w9AH9Kz6g2VBT0eY1
         7VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U6kNzw9jg6wjnbbAdjWukgPoHdW/wsFLgOtzXedRmQY=;
        b=Pn3Hbaqz36Su0Qr8bBx60NwZPZbCvu6+2RYbI6f+Jma+1AZ7hZ2FQ1Rm4mfJMSOZop
         uJFs/kVdjNWVBZuLeuTa+1uK8gCmdQBObSCV8tOPcxKgsIx5S7etDAUqvek0aZpch61k
         LJuOVNBQJvTP4nOSUZkWTFIXeFoDcdjG9CdeBmmW1NsY3/QVqMwKKRY3iLHYvUGwwK3V
         66VGDYvy78acjkr24K6LDa+tdpyR96u5bZFdXNfvpr2dUIw1XghgJPPNHgR5T5mVHT/c
         qUi+1NyOe0Yshnuqr1Ol8VG1MQsdsaIPuzL57ZxOMsMQrZf0WzsFVNkjBE/lP+pguOeZ
         YxVQ==
X-Gm-Message-State: APjAAAW/zWadXfx27o4Mlbl33b4KESf1qyQepuFsYZXXbbg6o7NQX5TI
        MZckO6ATt5tlYUHoYFiBm0a20iHr
X-Google-Smtp-Source: APXvYqxr/wei3HEkeiEAaJNqCFNiiLSJWQcad/VgHMXw/qaK0q94sYMsz8v0iNdbfA4n0SYluSTAAA==
X-Received: by 2002:a65:4907:: with SMTP id p7mr7301950pgs.288.1559998760078;
        Sat, 08 Jun 2019 05:59:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v23sm5099951pff.185.2019.06.08.05.59.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Jun 2019 05:59:19 -0700 (PDT)
Subject: Re: [PATCH 34/34] usb: typec: tcpm: fusb302: simplify getting the
 adapter of a client
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-35-wsa+renesas@sang-engineering.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <bb8439e5-f56a-c848-180f-1feddbb198fe@roeck-us.net>
Date:   Sat, 8 Jun 2019 05:59:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608105619.593-35-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/8/19 3:56 AM, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Please apply to your subsystem tree.
> 
>   drivers/usb/typec/tcpm/fusb302.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 7302f7501ec9..c524088246ee 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1697,13 +1697,12 @@ static int fusb302_probe(struct i2c_client *client,
>   			 const struct i2c_device_id *id)
>   {
>   	struct fusb302_chip *chip;
> -	struct i2c_adapter *adapter;
> +	struct i2c_adapter *adapter = client->adapter;
>   	struct device *dev = &client->dev;
>   	const char *name;
>   	int ret = 0;
>   	u32 v;
>   
> -	adapter = to_i2c_adapter(client->dev.parent);
>   	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_I2C_BLOCK)) {
>   		dev_err(&client->dev,
>   			"I2C/SMBus block functionality not supported!\n");
> 

