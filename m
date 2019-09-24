Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06BDABD4DF
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2019 00:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437824AbfIXWYG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Sep 2019 18:24:06 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50344 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387532AbfIXWYG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Sep 2019 18:24:06 -0400
Received: by mail-wm1-f68.google.com with SMTP id 5so2165524wmg.0
        for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2019 15:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xfRFVkwkZkzLU7wLRDGsHMd8P8PHN/2mWFJxcO4s7yQ=;
        b=bC4zjM/qQley88yoN1EN4Khq52YC1EVZnPVnorS8QVonyQije6SNxXsss+W1BCmGm9
         QW8mDw4yWhAVxFZkbCH+fGd1m2Sv8k5TBQC277KT/58VgiPO3scryeuWGQ7YPbkQ4lFk
         1PlP+6vLAbi2aDsCK51nH+idhJcdxrYGYdjIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xfRFVkwkZkzLU7wLRDGsHMd8P8PHN/2mWFJxcO4s7yQ=;
        b=lrmYreBeU8CG7f6I1cJNexR4GmfTeop4GAWmyUDIvkHOG9rleoUMwszVDefBONfKCi
         BSGetFTq44+Cymcl9Qtb6rK6+KOOeiUO5KOczsi0tIQd8E87wyM6P6RXC7jaFXkwKBbP
         MFKbp5Q9oVbkI41bbRO1XL/8BaYLLfNskO+toSfH6xCAoIjryQbadTBxzzSM8fr/IW6w
         F3r/JzMT1XsM+71T+cULCjOpZwhKIvQAWnCEIvTWX3fgl/Fajmw7LthpoP41sNpX7d98
         vomu6CrqSIDwrQLt6dwHF4YIZQQvBI7vg9ETTx4PieLd0u55Z/tqkNIWH8jLDvkrsx5Q
         4xmw==
X-Gm-Message-State: APjAAAVefAWq5BK+M+8QsH3T7hqe+hTt1WwBB7SeRtI5p8M5OyOzbaCP
        fW3KJ9LHpPS24v4ZTjEPxctVAA==
X-Google-Smtp-Source: APXvYqygBR89fKBdCAQmPjpAqiV1ouU4IH0prxfGmTO/KT1bW4/bbP1SDFUrQEK1nfCjt9ckb/vW8g==
X-Received: by 2002:a1c:7509:: with SMTP id o9mr2944752wmc.21.1569363843889;
        Tue, 24 Sep 2019 15:24:03 -0700 (PDT)
Received: from rj-aorus.ric.broadcom.com ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id 94sm1749646wrk.92.2019.09.24.15.23.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 15:24:02 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] i2c: iproc: Add i2c repeated start capability
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
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
 <3e70fa7e-de13-4edd-2e17-b7c56e91d220@broadcom.com>
 <20190831094940.GA1138@kunai>
 <540c4e2d-0dd5-5260-30b2-e1589b279d71@broadcom.com>
 <20190904213745.GG23608@ninjato>
 <5ab79d0e-eb54-8fe1-1ca3-e763a17c6426@broadcom.com>
 <20190924185757.GA1538@kunai>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <e00520d8-5367-83a5-9c17-d2d8b0c983c3@broadcom.com>
Date:   Tue, 24 Sep 2019 15:23:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924185757.GA1538@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/24/19 11:57 AM, Wolfram Sang wrote:
> 
>> In my opinion, it's probably better to continue to support master_xfer in
>> our driver (with obvious limitations), in order to allow i2ctransfer (or any
>> apps that use I2C RDWR) to continue to work.
>>
>> What do you think?
> 
> Yes, don't break it for users. We should have paid more attention to it
> in the beginning. But, while not ideal, it is not such a big deal to
> keep it like this.
> 
> Thanks for your investigations!
> 

Thanks, Wolfram.

Let's please continue with the review process on the current patch then?

Note the patch was already internally reviewed by me.

Please help to review it and let us know if there's any change that 
needs to be made?

Regards,

Ray
