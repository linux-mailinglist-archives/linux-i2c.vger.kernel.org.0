Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B49C4A9F7
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2019 20:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730448AbfFRSeM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jun 2019 14:34:12 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38424 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729642AbfFRSeM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jun 2019 14:34:12 -0400
Received: by mail-lj1-f195.google.com with SMTP id r9so568603ljg.5;
        Tue, 18 Jun 2019 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LUTcC8R+5dFr9R0YY+BhHcC1Z9+J2f6PapOJUQzgkSs=;
        b=DAlZdM4CzRLCjdt8CtdqrU2BUOC0C2LJP2ZSloK1/ylQ8IApeYFnaQuSmIcYq2W3ny
         M0lzE7674VSrYkq1Qyff0punD6tR9xtE7+F+Z8STbBxP+M+/izpIxQOa5MtYBK19okQq
         Jpx0XcywJlMf8ERGPCjJV86UKlfUvhXegjIpYgRgZyUjHIMCKQ+9WpbdxPt1EyLDgAB/
         61/r9ftEtynbLQpOpshnYdeHnFltFZQZrKmfaibN2o73F5OXj88m9RN9P/zMsdVusbEO
         IHy6Uyb3nwNXyC050fVkvWfwjm66VfCy8vCYQD1llUCrHjTf+yibrlzd/MUlf+9GQJLY
         7Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LUTcC8R+5dFr9R0YY+BhHcC1Z9+J2f6PapOJUQzgkSs=;
        b=hMM3ragAd8rxhwDFZ0YA6IhqeMq8EGSSrFOr4dhOpF0nXtQC0eYx7/8mcC0d5CL13n
         JhGOey924T4Jh8sngwxes998BnUIHw5ExuI++JusFA4MK+YQZRojqltb8cXLiGtuOBD7
         3qNW5v+YmtmEqbiSKBcpM/jh7Sc+7RrfYKltibq9O4NsBGOuo9IiwHlEyWcZ+IpxTxZt
         Hhlpuuece8DReD+UdWT5m+E6Xj9TI8VUQw2g99xV5vTS4msOUt76sNhY0qHnboO7ZV+L
         JTP2WkTXUAbW/JrUFJdbbhcMV1f7J5fOyLTuw0stvZPn2EgC7htSbs8exyJTOWKoEcLc
         sZKA==
X-Gm-Message-State: APjAAAVYN2Fk5QGA/7SpOfb0PF5SKBHQ2Z3gNa4+QtNNijUsJD6Gxbj3
        g8k1B9dDk6JJPGb98OyfRso=
X-Google-Smtp-Source: APXvYqwgIyXPVkyoagm4bVZF4xt0brYs6vaWPpojnz7lmpws28SY8JiVu2fVW7oUCLUCkbIc+710iw==
X-Received: by 2002:a2e:89ca:: with SMTP id c10mr4868002ljk.106.1560882850067;
        Tue, 18 Jun 2019 11:34:10 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id l15sm3031426ljh.0.2019.06.18.11.34.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 11:34:09 -0700 (PDT)
Subject: Re: [PATCH V2] i2c: tegra: disable irq in tegra_i2c_xfer_msg
To:     Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560847368-16069-1-git-send-email-bbiswas@nvidia.com>
 <61c2dbcd-85f2-2094-7596-78ac01f55421@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <28cd06ca-3bd4-87e1-6d52-504cd00e1adb@gmail.com>
Date:   Tue, 18 Jun 2019 21:34:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <61c2dbcd-85f2-2094-7596-78ac01f55421@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

18.06.2019 12:13, Jon Hunter пишет:
> 
> On 18/06/2019 09:42, Bitan Biswas wrote:
>> tegra_i2c_xfer_msg initiates the I2C transfer in DMA
>> or PIO mode. It involves steps that need FIFO register
>> access, DMA API calls like dma_sync_single_for_device, etc.
>> Tegra I2C ISR has calls to tegra_i2c_empty_rx_fifo in PIO mode
>> and in DMA/PIO mode writes different I2C registers including
>> I2C interrupt status. ISR cannot start processing
>> before the preparation step at tegra_i2c_xfer_msg is complete.
>> Hence, a synchronization between ISR and tegra_i2c_xfer_msg
>> is in place today using spinlock.
>>
>> Spinlock busy waits and can add avoidable delays.
>>
>> In this patch needed synchronization is achieved by disabling
>> I2C interrupt during preparation step and enabling interrupt
>> once preparation is over and spinlock is no longer needed.
> Sorry but I still don't understand the problem you are trying to solve.
> Yes spinlocks are busy waits but is this busy wait an actual problem? If
> so what is the problem with this?

There is no real problem here, the intent is to clean up the code more and that should
be mentioned in the commit message for clarity. This was actually my suggestion that
Bitan is now started to implement, which is very nice! It should be a good result in
the end.

> It appears that the spinlock was added to prevent error interrupts
> occurring until the transfer has started. If this is for error cases,
> then probably it is not often that the CPU is stuck busy waiting on the
> spinlock.
> 
> Furthermore, in addition to the spinlock we also have calls to
> tegra_i2c_unmask_irq/tegra_i2c_mask_irq. Therefore, if we are going to
> change this it would seem like a good idea to consolidate the
> masking/unmasking of IRQs and the spinlock, if possible.
> 
> Finally, I still see that we have a spinlock in the downstream kernels
> we are shipping and so I would prefer to see such a change also be
> tested in the downstream kernels we are releasing.
