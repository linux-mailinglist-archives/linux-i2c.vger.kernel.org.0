Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6C93E1D28
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 22:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240516AbhHEUG2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 16:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240502AbhHEUG2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 16:06:28 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6B0C061765
        for <linux-i2c@vger.kernel.org>; Thu,  5 Aug 2021 13:06:12 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id a192-20020a1c7fc90000b0290253b32e8796so6157829wmd.0
        for <linux-i2c@vger.kernel.org>; Thu, 05 Aug 2021 13:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ffw0KDSWxuqPttYfADjFkD7te3fHMXYXrFeqxaRNgzo=;
        b=n5JV2peDtFD6qYY+IJIuHK2e4F3LCX1VT6Y0jLTsl7d0B61oLkUW+/5OKHLYYKYJEK
         W1pd6Fbw5YRnO28ELxIbDk+D8DTZDCByvysf5tnxZznX1cIquLU9AU/aqiRlnuWtZiVz
         ORZDKOtghNwq/LzJ3CBdKZC3eTd1PItqzSPuPHG37mii0fsXtw4AwEoE2sCNVdw1FXaS
         JViy6ZIkWjFPdfRj24FZfpgCzmkcdBRGXCH5JyByTBUxIATD0oqv9EbZeW17oiEYHGUM
         ynimwKs0ayAD0ER/JlOWYEMb4LysTaNFQ2GnSUf2bTLQCt1qc9/YfbnF26aUbydEZ61x
         Pd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ffw0KDSWxuqPttYfADjFkD7te3fHMXYXrFeqxaRNgzo=;
        b=RufDV8TE5Oj+9ziT9J0NDXd8Jkd+AeSSU5ttqhut543jqVytHztn0lRnFdGsz02rDA
         V+MAUHxGl7FJL4pkFoQXdanYS6E7PV/A2f8gP9cct0MIN1Xk81IHN3j+Qb65iFOalKwO
         LhWufGGqKYK6wqoHjsJWXbN6JhVQr6GmjCX2H4O10ZCZHkMqyTTqO4G63StXAB9SWEBx
         QtvhB/HwcWkZtxuGhxJ0dvWlnKTIKM51V6Plg/79yIyeqbxqvdHJRXAxhHwFBOVKVlJM
         gkIgMOtPmPr237/OL3F9XsgDL+nHWEfyLSvLGkM2D+Asnv9ozVO5g7sdkYO0dFJ+VIEo
         +3Lw==
X-Gm-Message-State: AOAM53391xauEWK5rqyHxRzuWzs+cS61UK8f6kQsxYXD6Q5eWs4136ZT
        0ADDhI7ldUHe/eSqIk+KXYzR5XYYJf8RCg==
X-Google-Smtp-Source: ABdhPJyQpsyhTicgyp6AvGvegRxHTUk6rlTzVDSQF76ydXlSMWSAfdC9bMb/gTOXY1wCCFL19+0QNw==
X-Received: by 2002:a7b:cf13:: with SMTP id l19mr17447813wmg.134.1628193971112;
        Thu, 05 Aug 2021 13:06:11 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:75d1:7bfc:8928:d5ba? (p200300ea8f10c20075d17bfc8928d5ba.dip0.t-ipconnect.de. [2003:ea:8f10:c200:75d1:7bfc:8928:d5ba])
        by smtp.googlemail.com with ESMTPSA id u11sm7145526wrt.89.2021.08.05.13.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 13:06:10 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <f9115eb4-4b19-0a9c-0354-b3ded261c155@gmail.com>
 <20210805124150.3fbdfa9b@endymion>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 06/10] i2c: i801: Remove not needed check for
 PCI_COMMAND_INTX_DISABLE
Message-ID: <cfe089f3-fe26-5373-63f2-c47b8d13f491@gmail.com>
Date:   Thu, 5 Aug 2021 22:04:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805124150.3fbdfa9b@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05.08.2021 12:41, Jean Delvare wrote:
> Hi Heiner,
> 
> On Sun, 01 Aug 2021 16:21:08 +0200, Heiner Kallweit wrote:
>> do_pci_enable_device() takes care that PCI_COMMAND_INTX_DISABLE
>> is cleared if a legacy interrupt is used.
> 
> Only if pci_read_config_byte(dev, PCI_INTERRUPT_PIN, &pin) returned a
> non-zero pin, if I read the code correctly. While I can't remember the
> context in which I wrote this piece of code, I suppose that pin == 0
> was the situation where this test was needed. I mean, the board
> designer can legitimately not wire the interrupt pin, and require that
> polling is being used, right?
> 
I think we have such a use case, but it's handled in ACPI and results
in dev->irq == IRQ_NOTCONNECTED.

In case of pin == 0 pci_dev->irq is 0, and I'd expect that irq_to_desc(0)
returns NULL and request_threaded_irq() returns -EINVAL. This would
result in switching to polling.

Having said that I see no scenario where the check would be needed.

> In your favor, I can't find any online kernel log with this message.
> However that doesn't mean I'm comfortable removing the safety check.
> 
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 9 +--------
>>  1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index a6287c520..5b9eebc1c 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1825,19 +1825,12 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>  		priv->features &= ~FEATURE_IRQ;
>>  
>>  	if (priv->features & FEATURE_IRQ) {
>> -		u16 pcictl, pcists;
>> +		u16 pcists;
>>  
>>  		/* Complain if an interrupt is already pending */
>>  		pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
>>  		if (pcists & PCI_STATUS_INTERRUPT)
>>  			dev_warn(&dev->dev, "An interrupt is pending!\n");
>> -
>> -		/* Check if interrupts have been disabled */
>> -		pci_read_config_word(priv->pci_dev, PCI_COMMAND, &pcictl);
>> -		if (pcictl & PCI_COMMAND_INTX_DISABLE) {
>> -			dev_info(&dev->dev, "Interrupts are disabled\n");
>> -			priv->features &= ~FEATURE_IRQ;
>> -		}
>>  	}
>>  
>>  	if (priv->features & FEATURE_IRQ) {
> 
> 

