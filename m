Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10658139EE9
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2020 02:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729459AbgANB15 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 20:27:57 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43811 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbgANB1z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jan 2020 20:27:55 -0500
Received: by mail-lj1-f193.google.com with SMTP id a13so12340563ljm.10;
        Mon, 13 Jan 2020 17:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9J+ZBDrrbAWIuYb9veix6cNQ5A4bHUrnUSJB4zcW68k=;
        b=ZdLGHd8ALoHsOB7Odi9BlE3MBkQlCtuLWt/omzqH2vJyZA1f7nzweh/ne+kv87A165
         MW9iHcqmiclnGk2LCki08DEjy7Yb5TrxILnjxsQAP8mhgYh7yzHScwn3AaeFJBtombzW
         cvL2Nohgsi4uDiTCtrkxmz3zafTIfjdBhofs2M66VHxO/XmEpV0HtHNPuE9frVX9AF7Y
         46yzJv50UpQKZs8GbG94m+lQ3CP72m5dCV6utACRjHVlLKHK9tOY524mQHUuOSm489p4
         PiSBJt2FoKKvXSGvod22r3Zd5Nes64D4HrAVMQD0S0vsFX1fjOq5cFKVRS4Z2cwfZ9jB
         YcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9J+ZBDrrbAWIuYb9veix6cNQ5A4bHUrnUSJB4zcW68k=;
        b=RvarO9fHWCkr2AJ1b117AkTcCTVy3uxltrauN56sk14/41GjwR5MW8Ty6r1ctiR3LU
         /cRlfjqbJXnzorB3E34Il/F3O6DacZUhs+TgXdHKNWzb9tDbM62YVcUHDMfTmJl7DrWS
         casMtC7ycg824UfHhkRkGj/1BB/tIfBU3hC7rD29XS1iiPKVrOVUN2497id0zBrPWQaV
         H1ZRQ4fbt3l2y2JcTh6WNFFHdt3aq5C4WYjPKkSqZOepWAL8LhRCiflCverIBVxmq2gL
         RzxnSSugAKJN0SDQ7O9G70N3qgO7Y772AvvBtBEwi8qU4KCaEktfbcfNoVXagWKeIQ7Q
         C89Q==
X-Gm-Message-State: APjAAAUm9SxmLNbOQUZ+k6gQDiPPyeQGNTEk31/vEJwo9H4eSwYpihKx
        kFTgto3rk9aMC9rsciLt7v98mnbC
X-Google-Smtp-Source: APXvYqzzO9l1yft9CikyOnAO3k3mUKutKwk/sQe+BlAogzYNR1k2D/EI85SPG+Ynq1mZQJOxpLfLxQ==
X-Received: by 2002:a2e:8916:: with SMTP id d22mr11919214lji.19.1578965273521;
        Mon, 13 Jan 2020 17:27:53 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id s12sm6698527ljs.96.2020.01.13.17.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2020 17:27:52 -0800 (PST)
Subject: Re: [PATCH v4 4/8] i2c: tegra: Support atomic transfers
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200112171430.27219-1-digetx@gmail.com>
 <20200112171430.27219-5-digetx@gmail.com> <20200113220315.GB2689@ninjato>
 <86f71bfe-7d17-0bf4-edda-13c84301a598@gmail.com>
Message-ID: <49fbcb5d-011b-8ace-15f9-a36d4ae30397@gmail.com>
Date:   Tue, 14 Jan 2020 04:26:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <86f71bfe-7d17-0bf4-edda-13c84301a598@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

14.01.2020 01:52, Dmitry Osipenko пишет:
> 14.01.2020 01:03, Wolfram Sang пишет:
>> On Sun, Jan 12, 2020 at 08:14:26PM +0300, Dmitry Osipenko wrote:
>>> System shutdown may happen with interrupts being disabled and in this case
>>> I2C core rejects transfers if atomic transfer isn't supported by driver.
>>
>> Well, not quite. The core complains about it nowadays, but does not
>> reject messages. It will try the same behaviour as before. It will just
>> inform the user that somethings is tried which may not work. I probably
>> should update the error message printed saying that the transfer is
>> still tried.
> 
> Indeed, now I'm recalling noticing that the transfer actually should
> happen despite of the error message, but then completely forgot to
> update the commit's message. I can update the message and send out v5,
> if you're thinking that it's worthwhile to do.

I have time to do it now, will send v5 shortly.

And yes, clarifying the error message could be helpful. Although,
perhaps it won't help much to drivers which may schedule during the
atomic transfer.

>>> There were several occurrences where I found my Nexus 7 completely
>>> discharged despite of being turned off and then one day I spotted this in
>>> the log:
>>
>> Given my reasoning above, that should have happened before the warning
>> was printed as well? Because same behaviour. I'd be surprised if there
>> was a change...
> 
> Pretty sure that it was happening before, but I wasn't paying much
> attention back then.
> 
