Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A496F42620
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 14:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436780AbfFLMlJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 08:41:09 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39295 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408385AbfFLMlJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jun 2019 08:41:09 -0400
Received: by mail-pf1-f193.google.com with SMTP id j2so9604363pfe.6;
        Wed, 12 Jun 2019 05:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P5Dp1NVMrDezDBxchJbtidsCgF7ZHAzWG1BGHh9wI5w=;
        b=TjJhwpae0AdVN7/Ih/nU7jzjIhzilu72zXxDDnWBWAlBD4gMj20MWAC3Rne5OJC+nb
         NfofgLH9IOYbAcHkod3VkTu28KxuQ5y9EUyypzoGbR8R7EQ7mvCVesEfeEnErWWxhQ7G
         wq/rVV53FchD0m9i3zJV1IiHdPXEUtOXlMljLswZQkzSxF/O67zI0ANCafg3EKmG2v10
         rgE74XKRiAJf0UVnNp2gvX8b9M1JgKQ06Ry3iagSOeVZYT29CT73LHzSmtGQM79VKovU
         FSj5xZ7IBWeqgYVSkOhh/zrC78DQDoXZggW8qJQWAyvTMvNR0jL6AE/UR1KdhcFkNZUW
         lfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=P5Dp1NVMrDezDBxchJbtidsCgF7ZHAzWG1BGHh9wI5w=;
        b=rhkLNQ7mAJTQ/DF01NWaP1PWgsthze2dYi8CoWPtpMNrZHMljXi80YqvbHJZcrON/s
         ymTQoZzxKS2aiIaA0ouhY96o+mfJyz30JVYi/7DcY2VZrgVRUs+3RDjW5PDeq/lDnI9l
         h5nSB2l5eRWjkk6IV1mIH+LXuQUCz91dzA+4FXPRoKFlJDFrQFtroLDhcEDxU/I3yYNO
         UaSVtJvjAzNo7Fqx2RdY+a951kHPMdBeLhxY7hUpHWANW8EcH6vmwgYrm1fBbZcH0olw
         7tLEdRKtjXE1fYR5xEjW6E9OThFYTAJQZsO0Iuxtk2rCBhZhfzb1WOxxYE14CwIaDoiQ
         rPBg==
X-Gm-Message-State: APjAAAUF7QUg8fewW3U2wRlOhXhaN4kJ+XIlz2Lle2B2MQNYvx+oc19p
        Zk+vQjcaqtuQI8kZUoT7WqI=
X-Google-Smtp-Source: APXvYqykw/FoscQaeHTHCdJKLksKNGhMrdKmKHPpcOTH2jsByq7pbFsayWBhId0XqaVmpkcv15zWJQ==
X-Received: by 2002:a63:5247:: with SMTP id s7mr7454711pgl.29.1560343268513;
        Wed, 12 Jun 2019 05:41:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i3sm17847203pfa.175.2019.06.12.05.41.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 05:41:07 -0700 (PDT)
Date:   Wed, 12 Jun 2019 05:41:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: lm90: simplify getting the adapter of a client
Message-ID: <20190612124106.GA26013@roeck-us.net>
References: <20190610095157.11814-1-wsa+renesas@sang-engineering.com>
 <20190610095157.11814-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610095157.11814-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 10, 2019 at 11:51:54AM +0200, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Reported-by: Peter Rosin <peda@axentia.se>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Aplied.

Thanks,
Guenter

> ---
> 
> Please apply to your subsystem tree.
> 
>  drivers/hwmon/lm90.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index e562a578f20e..2ebcab8b0a9b 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -1718,7 +1718,7 @@ static int lm90_probe(struct i2c_client *client,
>  		      const struct i2c_device_id *id)
>  {
>  	struct device *dev = &client->dev;
> -	struct i2c_adapter *adapter = to_i2c_adapter(dev->parent);
> +	struct i2c_adapter *adapter = client->adapter;
>  	struct hwmon_channel_info *info;
>  	struct regulator *regulator;
>  	struct device *hwmon_dev;
