Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A304E2F3749
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 18:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbhALRfH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 12:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391487AbhALRfG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 12:35:06 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F5CC06179F;
        Tue, 12 Jan 2021 09:34:26 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id m10so3791585lji.1;
        Tue, 12 Jan 2021 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RiW/FLv2FRd7sYgDVBGA2OdRwmdznOMyGqvLQ1X/Wzw=;
        b=K54w132M65U3eRJXHCnxrtYFZV9OjUhoKEBJd7J1+isRBT9XFEM9oZ/hXDtior3igT
         kjzJttmYW6KrqXZX4sjwanG/I4AzNQKXJlOpyGU9LtTAMJLKDaPJCilHOp8Hru31yfyn
         YK8//8ge39n4RrjVg1kdOPLJsuGQP21lgqYw4onH4d5AbQUY0yQ3ErVZM5/SubPsnj3M
         aNyfaN7kDrqWKBTJDbgnP3h+WnOtcXo6O2rJpvLl5gw3r1eYFxOuJd20br7npeSfhxgr
         z8SrVHWS7rQn+36ovXTHKqxKbNZhaQEA6PTQ/u3MP7TVMglBf/WAVJIbpNe3mPhbC+uP
         /XqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RiW/FLv2FRd7sYgDVBGA2OdRwmdznOMyGqvLQ1X/Wzw=;
        b=KFgDpkU4CAWRVJJH6+eI2LoMLi3MRP7QvCs+tm/jxDCfbg4p6XYNam27o8pWRPKp3z
         U8V96EwoYP8hzGBSudZhWyx/BhiySx4Lu0LzckBr7XBM/Qr7e+faLi4qYdhIMMWOI2rY
         G9/L26FaDQLUnHyguWBcpwbNOJwLFwf2fdXZh+BXeJdBAMqvaJye6JPNj8VFARq7PnDZ
         1OJYFdgy8pBwg1VWEah0s/x82L3WcLeYcQykeAn95reivxiAJJpQmUIRORXb70I5kwLT
         578rs+d594lWIeT64WG6WPyAlgxb1em9jfsmXhPYLY39rfoYBQKoUzrel+HlR2g0GOld
         pxOg==
X-Gm-Message-State: AOAM533fRuuNovXfCp/cvXKQ/HQZO2LjX9JyikmI7iiC+aAmp32vAjIg
        zl6vT9CeIwR1kTrvvf/3UEX6baB4MZY=
X-Google-Smtp-Source: ABdhPJyrfGmJx7vMXXqTz23kJXpDyMtyWdyaKxzWqLvTD5TklJdqqjyDx8bhty2Y39153o+yLoIYtg==
X-Received: by 2002:a2e:870e:: with SMTP id m14mr151998lji.166.1610472864592;
        Tue, 12 Jan 2021 09:34:24 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id s2sm407794ljj.100.2021.01.12.09.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 09:34:23 -0800 (PST)
Subject: Re: [PATCH v2] i2c: tegra: Create i2c_writesl_vi() to use with VI I2C
 for filling TX FIFO
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, wsa@the-dreams.de
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1610424379-23653-1-git-send-email-skomatineni@nvidia.com>
 <1610424379-23653-2-git-send-email-skomatineni@nvidia.com>
 <ae886d28-ef6c-63d3-2cc7-90752ddb8b21@gmail.com>
 <c250dd2d-85fd-75a6-cdae-71e4300007de@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f9a65bdd-edfa-2935-9f01-90e22e4d6246@gmail.com>
Date:   Tue, 12 Jan 2021 20:34:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <c250dd2d-85fd-75a6-cdae-71e4300007de@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

12.01.2021 19:57, Sowjanya Komatineni пишет:
...
>> @@ -326,6 +326,8 @@ static void i2c_writel(struct tegra_i2c_dev
>> *i2c_dev, u32 val, unsigned int reg)
>>       /* read back register to make sure that register writes
>> completed */
>>       if (reg != I2C_TX_FIFO)
>>           readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev,
>> reg));
>> +    else
>> +        readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev,
>> I2C_INT_STATUS));
>

Perhaps will be a bit better to replace this "else" with "else if
(i2c_dev->is_vi)".
