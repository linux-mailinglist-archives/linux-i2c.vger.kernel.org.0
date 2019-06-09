Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB3963A4FA
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Jun 2019 13:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728168AbfFILDp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Jun 2019 07:03:45 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46425 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728095AbfFILDp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Jun 2019 07:03:45 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so6260684wrw.13;
        Sun, 09 Jun 2019 04:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9e/6BEecOpB8/qEVGj7iB3+DWeBNFNef87WWsJLtnfU=;
        b=vcz5mKQuwLx/2iD/T4aGbNqV6Snpbc3WihScPLk2NJb2cMS5xiH8bS14GZLRKlF6Zu
         /yWqdsOiyh63B8f7cP/rEyi/Nxed2cEDLKrHmF/WMCu5t6boN/H/TF+aaFKsyFrarMUd
         zKKAfmQeO/n5nAq0wu2xwllqzYO9oHxbYFz+f2z58B1vo9FEXpJ+E/o3aV9/hFZWQEl3
         aXZi5MRXc4ic4yuM4M8TWUkPO3MqC2FUY/lrxCS0WmrUT9Wids21NprRl6sVR96k20Jf
         k+ybke5BXAwE9EesTNu3gghJENKXO2c9j3rd0Lyq/x6KbFDVoub61ugKL/SfQrIHihWb
         ovAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9e/6BEecOpB8/qEVGj7iB3+DWeBNFNef87WWsJLtnfU=;
        b=XaOPwRCuSVMP7qMheLT/4FC6NzErI/EYOOWhxIEhHkQvsu0XQsLCCgf/siTJTf7Br3
         pM5ZKe9K0mO+AkZAG2SnbjP/Xl1qRt61HBERu+yXeJJA6dKeljTcbeRnCfsNjUdVu4pD
         pQZ1IlNH9LJilQ2aNdUayJuJKvIVT0kdAxWXeVn5vTMSZNj2FeIkS64U6rk0M/etEjuo
         VJ6aINcc7DjQN2+kVNNNaFoRekuumfJrR2zuGU/q+VtWfZhOZBRWn4EIm7ZkJQRZKclR
         O4p6bpazQm9JT58hJcKGEl2rt2Z4sNZ1VZZmU6K+wAoKCBfVKUEc50xJLRUjKHrS3/87
         Su8w==
X-Gm-Message-State: APjAAAUA1mK1N5kT6sJ9RCXId0PlZMgO0mBvqcqCbjJIC2DKB9FY0BHQ
        4pyG3aDnJ9u6LJLareltYGQUVgeA
X-Google-Smtp-Source: APXvYqwKxuSOZ+DsYOii5g3xjA3NfzG64WDTcodvFiCE28a9amTVNWTkVF/R7gnB6AtRBhdH06K2xQ==
X-Received: by 2002:adf:efc8:: with SMTP id i8mr12829342wrp.220.1560078223105;
        Sun, 09 Jun 2019 04:03:43 -0700 (PDT)
Received: from [192.168.1.17] (bkq78.neoplus.adsl.tpnet.pl. [83.28.184.78])
        by smtp.gmail.com with ESMTPSA id d10sm11587976wrh.91.2019.06.09.04.03.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 04:03:42 -0700 (PDT)
Subject: Re: [PATCH 04/34] leds: leds-pca955x: simplify getting the adapter of
 a client
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-5-wsa+renesas@sang-engineering.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e5a91999-a156-77b2-702b-8931140f0f8d@gmail.com>
Date:   Sun, 9 Jun 2019 13:03:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608105619.593-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thank you for the patches.

On 6/8/19 12:55 PM, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Please apply to your subsystem tree.
> 
>   drivers/leds/leds-pca955x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index a9f5dad55956..460626d81c6a 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -432,7 +432,7 @@ static int pca955x_probe(struct i2c_client *client,
>   	int ngpios = 0;
>   
>   	chip = &pca955x_chipdefs[id->driver_data];
> -	adapter = to_i2c_adapter(client->dev.parent);
> +	adapter = client->adapter;
>   	pdata = dev_get_platdata(&client->dev);
>   	if (!pdata) {
>   		pdata =	pca955x_get_pdata(client, chip);
> 

For both 4/34 and 5/34:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
