Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98FBD185FD5
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Mar 2020 21:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbgCOUqi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Mar 2020 16:46:38 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39509 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729103AbgCOUqi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Mar 2020 16:46:38 -0400
Received: by mail-lf1-f65.google.com with SMTP id j15so12271345lfk.6;
        Sun, 15 Mar 2020 13:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9dBoWQB/ml0hk5Qe+/PU1e6xzvLE6eH1Uq+FF1UbaBM=;
        b=N1jsJl98+edwpQ3U3xYGKBXtuG9f2+p3l3eZftB0jtb8ElizWDs6wv12duKacxpAF+
         EFcfeqFfBrt4uTmPWAPVvYFTNnSOcBkwDMYhVT4g+sJJWdGK6C0VqrWPCaeUwfsrX5dH
         J6taxbLhJ/Pg1t0l2ikAe6mjHxSbdCjBz4rsz6UvyQIR+18obhrGyHHxq2/5DIfWsyuK
         fY49j1GOo+FYljKYZRxWEKmkdqPIEjCebvs+MRMf7C6eoU8WkmjBZb3lIaLkOxPfsqtd
         srNTFKyFridk4dMqi+2hZs5RyO+R6pVjVaOxHGimJaL6Lg/8INLIjL2RydldcD6/X4RI
         MB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9dBoWQB/ml0hk5Qe+/PU1e6xzvLE6eH1Uq+FF1UbaBM=;
        b=EjNvmL66y+HV4f1jj8ewP6rhg4xUXaDI/92hQcgcaEnB3rMYJCD4xieA62gda8J6KY
         +Erigh0AoLniBwthWZLYTmp2wMvvabYOzdkAP4NTr+4NIzxt9tChPqbMqZp7BdM9u/Av
         jmIC1zlKtDn+tqm2c6QpUTgEMeCr2ff/nMbKiwtag3P2APH6MVKDynUsVXPDFstODZRa
         0CyKM6AmCKUEtZwD5in91kOE/ejv7p3ZkHWZ8V8GKTmtiFyV8xBSUdu6BQQ4nAaRoyhR
         VAEFqPwdJmTwXVRyVHoofhlx3qiKdG4yx/1Ko0DxQY0BJf7YV8VYj4qxNPBDT2v8xp5T
         J4EA==
X-Gm-Message-State: ANhLgQ2xhXbqqKBH66VtPmiUgP2ge4D3/j+BqxtXIiqgb+XFU4li9piG
        3zjq4MzRNw+cuftVJbIh6ThESknQ
X-Google-Smtp-Source: ADFU+vuTb7Kbplf4fBj7Hux62r3HmVMSDiqSg8vipYbNBHEdkhdEM88EjfaHtx8T9RH3oPAAaXwWXw==
X-Received: by 2002:a19:c116:: with SMTP id r22mr1158578lff.123.1584305195291;
        Sun, 15 Mar 2020 13:46:35 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id b3sm14250989ljj.46.2020.03.15.13.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 13:46:34 -0700 (PDT)
Subject: Re: [PATCH] i2c: at91: support atomic write xfer
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <c05f76f74cd6a7ec2735c96861f9d5933631c112.1584296795.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9924dd54-dd8b-d130-9607-2bbbc65675d5@gmail.com>
Date:   Sun, 15 Mar 2020 23:46:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c05f76f74cd6a7ec2735c96861f9d5933631c112.1584296795.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

15.03.2020 21:27, Michał Mirosław пишет:
> Implement basic support for atomic write - enough to get a simple
> write to PMIC on shutdown. Only for chips having ALT_CMD register,
> eg. SAMA5D2.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---

Hello Michał,

...
> +	ret = pm_runtime_get_sync(dev->dev);
> +	if (ret < 0)
> +		goto out;

Runtime PM can't be used while interrupts are disabled, unless
pm_runtime_irq_safe() is used and driver's RPM callback is IRQ-safe.

...
> +	timeout = jiffies + (2 + msg->len) * HZ/1000;
> +	for (;;) {
> +		stat = at91_twi_read(dev, AT91_TWI_SR);
> +		if (stat & AT91_TWI_TXCOMP)
> +			break;
> +		if (time_after(jiffies, timeout)) {
> +			ret = -ETIMEDOUT;
> +			goto out;
> +		}
> +		udelay(100);
> +	}

Jiffies can't be used with the disabled interrupts because jiffies are
updated by timer's interrupt.

Either ktime() API or iterator-based loop should be used.
