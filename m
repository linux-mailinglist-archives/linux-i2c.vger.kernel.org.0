Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9940D43AC5
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732032AbfFMPXd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:23:33 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46339 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbfFMM2K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Jun 2019 08:28:10 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so13991808ljg.13;
        Thu, 13 Jun 2019 05:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UQ+Qox4hW8dsJtCk2ZCLCPvmN8eEmr4G4NBOJT4SbN0=;
        b=jdu1IhW6u+Yr+r8gEQ5i6y5O88urrnghhhxsYuGEcoakzlD/OdRaE1vy4Ih0NPkxQU
         eGpsnC07oZhKXnOYTgiIwfDNPmg1yRYqDJLtul0y5X99w5ZS5m2R8Fx4jPVcfYu2nCt3
         S3auR4bitV8Nnb4BCPBZdep56F6lMmPxUmd3RY3R63AlxTar71BFFo7PHqF+0i70f33h
         9BCPuFQtF/9P/6llw0OF0Z3PlvSICD3822L8yfbL7Uzy4CHgZlOMgiiwc1JOqAHNdzFB
         V5F3K5vPnJK9g2fgs+E0D3/xyZGZRVy+hSSbUBtN+sBeJXDRPmksYdStewc889WMHxas
         dTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UQ+Qox4hW8dsJtCk2ZCLCPvmN8eEmr4G4NBOJT4SbN0=;
        b=Hsk21cwaTvvUpH6yfIC8gdJj8/nMiFTy4s+3us5lmL9BaoG6EHGqWa4zGQcKJyH3SL
         zRg0rx3aqzNALhqCteRzoNiaJU93hv8yc8Tk5RdU94c9c7GzhYy/goG3N1Gd8Hn36pN5
         o/njGTiUfk2Q4/vPZ5caW37gy+vSaU0pxGwsv5SbxzK8Y6MRY/IvYXUUH6E1jjWUcLt2
         pAGspdgiX8tPMNcppejA4NN61FCONbLLmlIx2pec1myQBUiFM/hhZyr4vh+OD20oGG90
         T0jseLixUXMNBPOaHyYVfQNrV/4nG9XB+7A8GbWQFvQglgE7KqDmMGaW2bONmuPRLe0Z
         9Ipg==
X-Gm-Message-State: APjAAAX5nisU/b14EHG8apYHvBHNl8Zfc7NInUj6uRocfBDnws9DGuun
        0DjOI8adI8WNIlEKOj4F3Lk=
X-Google-Smtp-Source: APXvYqyBEzjakBkImaSdIOPRPwatSvpPTzKVKlduXaaNW1IJw4poVz29AEsii6/hb7BLvbc0JYlkNA==
X-Received: by 2002:a2e:98d7:: with SMTP id s23mr13507586ljj.179.1560428888349;
        Thu, 13 Jun 2019 05:28:08 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id a7sm571018lfo.22.2019.06.13.05.28.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 05:28:07 -0700 (PDT)
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
 <42ce2523-dab9-0cdf-e8ff-42631dd161b7@gmail.com>
 <78140337-dca0-e340-a501-9e37eca6cc87@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9cb7123a-1ebd-3a93-60dc-c8f57f60270b@gmail.com>
Date:   Thu, 13 Jun 2019 15:28:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <78140337-dca0-e340-a501-9e37eca6cc87@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

13.06.2019 14:30, Bitan Biswas пишет:
> 
> 
> On 6/12/19 7:30 AM, Dmitry Osipenko wrote:
>> 11.06.2019 13:51, Bitan Biswas пишет:
>>> Fix expression for residual bytes(less than word) transfer
>>> in I2C PIO mode RX/TX.
>>>
>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>> ---
>>
>> [snip]
>>
>>>           /*
>>> -         * Update state before writing to FIFO.  If this casues us
>>> +         * Update state before writing to FIFO.  If this causes us
>>>            * to finish writing all bytes (AKA buf_remaining goes to
>>> 0) we
>>>            * have a potential for an interrupt (PACKET_XFER_COMPLETE is
>>> -         * not maskable).  We need to make sure that the isr sees
>>> -         * buf_remaining as 0 and doesn't call us back re-entrantly.
>>> +         * not maskable).
>>>            */
>>>           buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;
>>
>> Looks like the comment could be removed altogether because it doesn't
>> make sense since interrupt handler is under xfer_lock which is kept
>> locked during of tegra_i2c_xfer_msg().
> I would push a separate patch to remove this comment because of
> xfer_lock in ISR now.
> 
>>
>> Moreover the comment says that "PACKET_XFER_COMPLETE is not maskable",
>> but then what I2C_INT_PACKET_XFER_COMPLETE masking does?
>>
> I2C_INT_PACKET_XFER_COMPLETE masking support available in Tegra chips
> newer than Tegra30 allows one to not see interrupt after Packet transfer
> complete. With the xfer_lock in ISR the scenario discussed in comment
> can be ignored.

Also note that xfer_lock could be removed and replaced with a just
irq_enable/disable() calls in tegra_i2c_xfer_msg() because we only care
about IRQ not firing during of the preparation process.

It also looks like tegra_i2c_[un]nmask_irq isn't really needed and all
IRQ's could be simply unmasked during the driver's probe, in that case
it may worth to add a kind of "in-progress" flag to catch erroneous
interrupts.
