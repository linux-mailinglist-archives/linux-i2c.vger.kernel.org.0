Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFB93A7DD4
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 10:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfIDI0d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 04:26:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39160 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbfIDI0d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Sep 2019 04:26:33 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7A4B483F3B
        for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2019 08:26:33 +0000 (UTC)
Received: by mail-ed1-f71.google.com with SMTP id f9so5284808edv.1
        for <linux-i2c@vger.kernel.org>; Wed, 04 Sep 2019 01:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mdq+QracXr/iUxjMIxa/s/5noOnKKkBNDchKNpboJh8=;
        b=Jslw2nKnPx5SZX684vWgDj8DeM5JyX4+BjpUlqTfAIV/8oI+EqRQfT1qNkRivPDrZ1
         00Apzr+d2xXOlnIgkRaSmFkRolZ15VIjwAyEX359EALVUsuTZ1glUrJlq1pNywHKzMPo
         Pj6+O4AFLCWTRVfOqqeFPArYbGwpaJRGJqC2WGzECNlucXht7R9Zley+0DMoKesIgnze
         nCJU5HJJO/Z6sVuOQ6/IJAuUjvI3+YJHv29fV5ds+fe7kth0FDrGjNELUoBci3gdI+qH
         mp1jZzoVhIBKhBMYnnK7Mpe6MorTcPuyC8i5Q3f+TQzU1odou1/eBJXr7GopxngbzDJx
         ewwA==
X-Gm-Message-State: APjAAAVSANp3jch9w0KM9EleNofmlRhS0ZNE6jR3jccRCWDaUKtAtNV1
        4ne0kPMcRQTduWqvdek5S4TEFJnt5yluomaebSWTgJ3ISzQUFAluknWY04wojy/Z932ICyh0dnO
        uC7gNmBlz3XAyv/wa6ZfY
X-Received: by 2002:a50:935d:: with SMTP id n29mr17641210eda.294.1567585592283;
        Wed, 04 Sep 2019 01:26:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyrZIi/f7VkraEJ2lB8pAtxxch5NNjc6CDt2RyPZ8JPCmVki5CWKUep7EVPz+F/rfwvljQ3FQ==
X-Received: by 2002:a50:935d:: with SMTP id n29mr17641199eda.294.1567585592109;
        Wed, 04 Sep 2019 01:26:32 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id d10sm2621252ejd.86.2019.09.04.01.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 01:26:31 -0700 (PDT)
Subject: Re: [PATCH] i2c: cht-wc: drop check because i2c_unregister_device()
 is NULL safe
To:     Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190820153441.7693-1-wsa+renesas@sang-engineering.com>
 <20190903175218.GE2171@ninjato>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2e55f3cb-ba88-5404-3b38-585710976ed0@redhat.com>
Date:   Wed, 4 Sep 2019 10:26:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903175218.GE2171@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 03-09-19 19:52, Wolfram Sang wrote:
> On Tue, Aug 20, 2019 at 05:34:40PM +0200, Wolfram Sang wrote:
>> No need to check the argument of i2c_unregister_device() because the
>> function itself does it.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
> 
> Hans, are you OK with this change?

Yes this is fine by me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
>> Build tested only, buildbot is happy, too.
>>
>> Please apply to your tree.
>>
>>   drivers/i2c/busses/i2c-cht-wc.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
>> index 66af44bfa67d..3e2608a65c06 100644
>> --- a/drivers/i2c/busses/i2c-cht-wc.c
>> +++ b/drivers/i2c/busses/i2c-cht-wc.c
>> @@ -363,8 +363,7 @@ static int cht_wc_i2c_adap_i2c_remove(struct platform_device *pdev)
>>   {
>>   	struct cht_wc_i2c_adap *adap = platform_get_drvdata(pdev);
>>   
>> -	if (adap->client)
>> -		i2c_unregister_device(adap->client);
>> +	i2c_unregister_device(adap->client);
>>   	i2c_del_adapter(&adap->adapter);
>>   	irq_domain_remove(adap->irq_domain);
>>   
>> -- 
>> 2.20.1
>>
