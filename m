Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAA22FB16
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2019 13:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbfE3LnJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 May 2019 07:43:09 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33958 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfE3LnI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 May 2019 07:43:08 -0400
Received: by mail-lf1-f67.google.com with SMTP id v18so4781950lfi.1;
        Thu, 30 May 2019 04:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AfIJUQIJtYB15GKYwWwSC4aOpQ5iN7AaoTDt0q758OI=;
        b=C6caECW1ACTDGTB5k3qKTLFFXCM5giPH2RO3+zrU2HieJt9TAFjtfq9XDFweICrekd
         lBUgQeooHd736yMnaBX/Rlk7gOrJZUc+fcylhk8cOi2+NX77wn7tTK7jOLU5AGhcUy7f
         J0eCA0a0p6JwIOAg33kSjPA3dmf/AkXbWIeh7vBMNCRxoxPO/XM4crzxOoBLlGes9g5I
         7hKf+LeuBpuByUjp2OVRv8//h9pxhwDQ+27qoF92KlTiBBOOEf2156ySmOKZ3l5oVKfo
         vJH9y5vaP6Bi5QnpAnXEy946zFWg7+buOA/1vOjkh+7yjVtCHsjxPfO5iCwWe/LFSh77
         V5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AfIJUQIJtYB15GKYwWwSC4aOpQ5iN7AaoTDt0q758OI=;
        b=kRX9vYnNjIRjti5IJTo8/mtIR890NcQOT712f8nLKxF+n6amGZ9NuQEa+p3nUD1z7X
         Nx9GvwsJCbn3ylAuYVnLKt7H/J9F5uaTGxdRY2jc/SGueMkLXf0S999jcG61bsjlvtMH
         RTZKzQR2Al8Pci/OFWi/+cSc/bqDmfMYuLjAHpS1iyEfiOQNHWBDHZaB7ePUW7++oQ62
         a/avE0WdnemqZ0KzrhZiAGmqOrgLlJBggmXfg1WoJy4PG7DM5HHJM79hz8IDX+Ol6UBL
         3M+fzn0IYWbePWgXUjBzklVw9Z4D6fZSRQxWmWo8EIfYzUjsYQ/ZxlvlEB/OI4hydEhC
         e5bA==
X-Gm-Message-State: APjAAAX6Y1yOeNmQktLSB0ejxfLYLpVCQM5BuO6j4ie7XA8tlAXMzGfE
        e3niSg6c8YTN/I19ZyfXF2kw139m
X-Google-Smtp-Source: APXvYqyMw0O8azT+38bH3/Lq9CJrahVmxItdzYLZauTb1HSG62AyVGY1RZH+JWengrRCA+8jSPA0mA==
X-Received: by 2002:a19:4017:: with SMTP id n23mr2066509lfa.112.1559216586593;
        Thu, 30 May 2019 04:43:06 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id d2sm446964lfh.1.2019.05.30.04.43.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 04:43:06 -0700 (PDT)
Subject: Re: [PATCH V2] drivers: i2c: tegra: fix checkpatch defects
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559196850-7007-1-git-send-email-bbiswas@nvidia.com>
 <e9e3d8b0-a76a-81a9-1110-2d07ba1c787f@gmail.com>
Message-ID: <911e52ed-8f3c-583a-7610-e38723219eca@gmail.com>
Date:   Thu, 30 May 2019 14:43:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e9e3d8b0-a76a-81a9-1110-2d07ba1c787f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

30.05.2019 14:36, Dmitry Osipenko пишет:
> 30.05.2019 9:14, Bitan Biswas пишет:
>> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
>> except for BUG/BUG_ON checks
> 
> Please turn the BUG_ON's into WARN_ON's. The machine won't go on fire,
> hence there is absolutely no good reason in making system unusable on a
> software bug. BUG_ON may be more useful for development, but not for a
> casual daily usage.
> 
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
> 
>> @@ -1034,7 +1038,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>>  	u32 *buffer = NULL;
>>  	int err = 0;
>>  	bool dma;
>> -	u16 xfer_time = 100;
>> +	u16 xfer_tm = 100;
> 
> What's wrong with the "time"? I'm finding the "xfer_tm" as a very
> unintuitive naming.
> 

Also, please don't version patch as v2 if v1 was never sent out.
