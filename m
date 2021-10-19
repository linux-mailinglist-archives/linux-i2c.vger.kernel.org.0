Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B459433D7E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 19:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234630AbhJSRbu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Oct 2021 13:31:50 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:61782 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbhJSRbs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Oct 2021 13:31:48 -0400
Received: from [192.168.1.18] ([92.140.161.106])
        by smtp.orange.fr with ESMTPA
        id csvdmJ16MPNphcsvem4kWR; Tue, 19 Oct 2021 19:29:34 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 19 Oct 2021 19:29:34 +0200
X-ME-IP: 92.140.161.106
Subject: Re: [PATCH] i2c: thunderx: Fix some resource leak
To:     Robert Richter <rric@kernel.org>
Cc:     jan.glauber@gmail.com, wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <6657505309174d3ea6df14169d42b6df91298470.1634374036.git.christophe.jaillet@wanadoo.fr>
 <YW3j4MF/y4T6Rtzp@rric.localdomain>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <5a3eccff-f39d-29dc-976c-1de7b32e36c5@wanadoo.fr>
Date:   Tue, 19 Oct 2021 19:29:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YW3j4MF/y4T6Rtzp@rric.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 18/10/2021 à 23:15, Robert Richter a écrit :
> On 16.10.21 10:48:26, Christophe JAILLET wrote:
>> We need to undo a 'pci_request_regions()' call in the error handling path
>> of the probe function and in the remove function.
> 
> Isn't that devm and thus not needed?

My bad, you are obviously right, sorry for the noise.

I was aware that 'pcim_enable_device()' was turning automagically 
'pci_alloc_irq_vectors()' into a managed function. But I wasn't for 
'pci_request_regions()'. Now I'm :)

CJ

> 
>>
>> Fixes: 22d40209de3b ("i2c: thunderx: Add i2c driver for ThunderX SOC")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/i2c/busses/i2c-thunderx-pcidrv.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
>> index 12c90aa0900e..2d37096a6968 100644
>> --- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
>> +++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
>> @@ -177,8 +177,10 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
>>   		return ret;
>>   
> 
> There is a pcim_enable_device() call before all that, so the regions
> should be removed on device release, see pcim_release().
> 
> -Robert
> 
>>   	i2c->twsi_base = pcim_iomap(pdev, 0, pci_resource_len(pdev, 0));
>> -	if (!i2c->twsi_base)
>> -		return -EINVAL;
>> +	if (!i2c->twsi_base) {
>> +		ret = -EINVAL;
>> +		goto err_release_regions;
>> +	}
>>   
>>   	thunder_i2c_clock_enable(dev, i2c);
>>   	ret = device_property_read_u32(dev, "clock-frequency", &i2c->twsi_freq);
>> @@ -231,6 +233,8 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
>>   
>>   error:
>>   	thunder_i2c_clock_disable(dev, i2c->clk);
>> +err_release_regions:
>> +	pci_release_regions(pdev);
>>   	return ret;
>>   }
>>   
>> @@ -241,6 +245,7 @@ static void thunder_i2c_remove_pci(struct pci_dev *pdev)
>>   	thunder_i2c_smbus_remove(i2c);
>>   	thunder_i2c_clock_disable(&pdev->dev, i2c->clk);
>>   	i2c_del_adapter(&i2c->adap);
>> +	pci_release_regions(pdev);
>>   }
>>   
>>   static const struct pci_device_id thunder_i2c_pci_id_table[] = {
>> -- 
>> 2.30.2
>>
> 

