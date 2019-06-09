Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0FC3A517
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Jun 2019 13:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbfFILRr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Jun 2019 07:17:47 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35353 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbfFILRr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Jun 2019 07:17:47 -0400
Received: by mail-wr1-f65.google.com with SMTP id m3so6348010wrv.2;
        Sun, 09 Jun 2019 04:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ta91NurKEAOuV3biILdolmhtWxdEx4xNrjafBvP4nDI=;
        b=DsTk1FJaFbVPoYlTHAMkCJ+6GRAOQ+gzzrHChiHOnmK6DjUCxuO6pWajsq6qk9t5mQ
         A7m4B2uKEVHkhTQswUP07ysKAojjn7YOs7ibE74jnK2xnAd2OiP94H6jIpsZW7585Qs2
         nkIiL871cq926N2uWcTXPb7lPNLrwQP4kTpjOZlclLOZB8NFWelPzXP46FX2lKRyikFa
         8mj2e36YnRzQaubyMTn091nKzbaYQcX2w093y9saAK+3WdK6qDGJ1d8jVdIMamWOtAlN
         yPNnWiyJKEW5GS879aJY7VL0iYQR8p3hn1dnsGkcR1oQ5manK5uJ09GxlVN9g/5kxQdY
         tz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ta91NurKEAOuV3biILdolmhtWxdEx4xNrjafBvP4nDI=;
        b=j5wwTA/0FkQfUjoZpxPFiqxPn9cWF8wO7oq1KInuwpMOqzJmWzRUcLeuT36XEP3XfZ
         gFq8Fqoh3+UoU1A/gGerjFIZWD8BiqKKBnlOJ1q+JDPJj8KMCRvaEgc1N8sovHu5M0je
         moJXaZnx+ddeTxnSFNcwsMZF9hWqOMIWg8RV6n48iiSDnYGGzSRITaE7LJ+Dbf3AQGuf
         d87BKILQPVw5zeZTNsIANoyKjCOgDCebU8inkccg87PDxiu4Nwz32OKXDMUM/k+ak65B
         ks89xa+oMQD/WfH2fPbHxJSM9usyPqcmSMayX1Vo+Nr1iOZGBTn40xUYkdhuddmK7WVn
         j4MA==
X-Gm-Message-State: APjAAAW0ftreu/EkWAt2GNLLr+7RkiF8Cs5V9HOSLnbUWbIbK0t+UgOc
        JpCdEtlc8JgcmQ3/9ajvYiUSgcA2
X-Google-Smtp-Source: APXvYqyNwECSjybSOyeIyWfb9hSWmAAaJtp5O6MDMMuWVhGO3olUMOFaynHUfS8a7C5VsrUIjysiDQ==
X-Received: by 2002:a5d:4992:: with SMTP id r18mr26761300wrq.107.1560079065865;
        Sun, 09 Jun 2019 04:17:45 -0700 (PDT)
Received: from [192.168.1.17] (bkq78.neoplus.adsl.tpnet.pl. [83.28.184.78])
        by smtp.gmail.com with ESMTPSA id w5sm6872110wrr.86.2019.06.09.04.17.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 04:17:44 -0700 (PDT)
Subject: Re: [PATCH 04/34] leds: leds-pca955x: simplify getting the adapter of
 a client
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-5-wsa+renesas@sang-engineering.com>
 <e5a91999-a156-77b2-702b-8931140f0f8d@gmail.com> <20190609110519.GA2375@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <304cd75e-1bf9-bd4b-3822-7f8a78adb5a4@gmail.com>
Date:   Sun, 9 Jun 2019 13:17:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190609110519.GA2375@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/9/19 1:05 PM, Pavel Machek wrote:
> On Sun 2019-06-09 13:03:40, Jacek Anaszewski wrote:
>> Hi Wolfram,
>>
>> Thank you for the patches.
>>
>> On 6/8/19 12:55 PM, Wolfram Sang wrote:
>>> We have a dedicated pointer for that, so use it. Much easier to read and
>>> less computation involved.
>>>
>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>> ---
>>>
>>> Please apply to your subsystem tree.
>>>
>>>   drivers/leds/leds-pca955x.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>>> index a9f5dad55956..460626d81c6a 100644
>>> --- a/drivers/leds/leds-pca955x.c
>>> +++ b/drivers/leds/leds-pca955x.c
>>> @@ -432,7 +432,7 @@ static int pca955x_probe(struct i2c_client *client,
>>>   	int ngpios = 0;
>>>   	chip = &pca955x_chipdefs[id->driver_data];
>>> -	adapter = to_i2c_adapter(client->dev.parent);
>>> +	adapter = client->adapter;
>>>   	pdata = dev_get_platdata(&client->dev);
>>>   	if (!pdata) {
>>>   		pdata =	pca955x_get_pdata(client, chip);
>>>
>>
>> For both 4/34 and 5/34:
>>
>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
> 4 and 5:
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> But I wonder if it should go through the leds tree?

Yes, I missed that "Please apply to your subsystem tree." comment.
And this change relies on the existing code.

Applied 4/34 and 5/34 to the for-next branch of linux-leds.git.

Thanks.

-- 
Best regards,
Jacek Anaszewski
