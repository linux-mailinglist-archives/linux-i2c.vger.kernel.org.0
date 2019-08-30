Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D82AA3DBC
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 20:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbfH3SfP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 14:35:15 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36166 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbfH3SfP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Aug 2019 14:35:15 -0400
Received: by mail-pf1-f196.google.com with SMTP id w2so5155384pfi.3
        for <linux-i2c@vger.kernel.org>; Fri, 30 Aug 2019 11:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bIeN59zLlf9hPECJ+a5c6Glfl7dAXXKY36z7SizN9gM=;
        b=IQGa3Mt4+au2PyMQHW+PvrAcz/AETV0wFmHOYGLymVh/gc+dTht/JO4nBjR1m4Z8Qx
         B7KxIkemrczvh45Jb/1x2k0NFOVuub+ATOjZSexJsTNLChgVm8aVno/qRULf4iIGKJ07
         z71IX/iXX3oF2ff6SAr+g37jeArEF4jRYP+lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bIeN59zLlf9hPECJ+a5c6Glfl7dAXXKY36z7SizN9gM=;
        b=FLIKxIYInpwuK5pPnu1TklkrAgWm1k64jaoPysKpCc5TrpV+esfUdtOW+c/jiPYAUK
         kJbeg8gCIm8xeMdNtZjUOwNeq30x97hRuDrfaSTfafS0/SUDYX7USjmkCNV2157B29r9
         vGPEsbIcieB2F0/FIwvI00L1K2QqlGW6LiQ+FHu4im6GghTOEk6ZXZTcJKRBN2lsWlPT
         RkmEVaarJpPRMttmaNyxOeHLCJbJhOZwJyuNCbaUpNJN02H3fWKefZtE/gOpQnhX/jcL
         egaisF2OaBlpG77xYZm6TUXPYF9zabTtRwfVp+wvI6dkcEA7LCR3UyefbJXp9X54QRbZ
         flhw==
X-Gm-Message-State: APjAAAW52TPIKbkRI3uPr6AcYz2S8fVOUTaEW8M3o4km8hse5zHR0UUZ
        /M2LWERxLcAdXdJS1eMVPjsQgA==
X-Google-Smtp-Source: APXvYqygSJnu7L2JedNmYX5ICyfUrGX+E4J3wKc8DRjWeJwkgnQsT/NWZZ9V0F2txVYvAu85h9YZmw==
X-Received: by 2002:a17:90a:8081:: with SMTP id c1mr17371952pjn.62.1567190113962;
        Fri, 30 Aug 2019 11:35:13 -0700 (PDT)
Received: from rj-aorus.ric.broadcom.com ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id x16sm7420135pff.99.2019.08.30.11.35.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 11:35:12 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] i2c: iproc: Add i2c repeated start capability
To:     Wolfram Sang <wsa@the-dreams.de>,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Icarus Chau <icarus.chau@broadcom.com>,
        Shivaraj Shetty <sshetty1@broadcom.com>
References: <1565150941-27297-1-git-send-email-rayagonda.kokatanur@broadcom.com>
 <20190830125626.GC2870@ninjato>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <3e70fa7e-de13-4edd-2e17-b7c56e91d220@broadcom.com>
Date:   Fri, 30 Aug 2019 11:35:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830125626.GC2870@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/30/19 5:56 AM, Wolfram Sang wrote:
> Hi everyone,
> 
>> +/*
>> + * If 'process_call' is true, then this is a multi-msg transfer that requires
>> + * a repeated start between the messages.
>> + * More specifically, it must be a write (reg) followed by a read (data).
>> + * The i2c quirks are set to enforce this rule.
>> + */
> 
> With all the limitations in place, I wonder if it might be easier to
> implement an smbus_xfer callback instead? What is left that makes this
> controller more than SMBus and real I2C?
> 

Right. But what is the implication of using smbus_xfer instead of 
master_xfer in our driver?

Does it mean it will break existing functions of the i2c app that our 
customers developed based on i2cdev (e.g., I2C_RDWR)?

1) Does
>> +	/* Process the read message if this is process call */
> 
> Also, the term "process call" here seriously sounds like SMBus.
> 
>> +		addr = msg->addr << 1 | 1;
> 
> addr = i2c_8bit_addr_from_msg(msg);
> 
>> +		u32 protocol;
> 
> Hmm, another SMBus terminology.
> 
> 
>> +	if (num > 2) {
>> +		dev_err(iproc_i2c->device,
>> +			"Only support up to 2 messages. Current msg count %d\n",
>> +			num);
>> +		return -EOPNOTSUPP;
>> +	}
> 
> With your quirks flags set, the core checks it for you.
> 
> Kind regards,
> 
>     Wolfram
> 
