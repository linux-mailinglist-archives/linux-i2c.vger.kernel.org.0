Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE02247144B
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Dec 2021 15:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhLKOw0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Dec 2021 09:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbhLKOwZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Dec 2021 09:52:25 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ADA7C061714;
        Sat, 11 Dec 2021 06:52:24 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bu18so23244994lfb.0;
        Sat, 11 Dec 2021 06:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sVjMFdeuBLQSPpKHTdYhUbqD/ObKT0xUXQ+uzu60LvM=;
        b=ofUbA147cPQrvvcyvnqccNBaic9AraNmvjEhJmPnUTFrGyDSJGkh3vtHA+UIZLPkk/
         1w64GrW0fz2nKX1Hw/JucIpKjuEe+6SH8xGGf2+9j++kgUi1BY9+qcBGPq2z5jmCdk8C
         pxE/LghkdGxS7xHc/F1ypn4FXOnWljj3R7TF6ZffGF/9a/6TqRDhkcEVwQU3wF1IuCk7
         tbCb3RYhSEZvYt1dCZe55wIlOPSxm9DfdUJTne5/XUl7812n6UkBnJeXCyLYqFz03hQP
         6ailwjtiMpLPVn4Zm9coy1QHJOGevs7VmPIkB7xCCISpdQLQVx4e9rKJTZgdgHxJOMgM
         oufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sVjMFdeuBLQSPpKHTdYhUbqD/ObKT0xUXQ+uzu60LvM=;
        b=fNjSequZT+WzdD+e9eUbTeX7ENBcZbV594Au1l/Oek/7Hr5AXi35iaQjRNCIvrtwd1
         0UbGrvbpO+Ad3K9hLZTyr3fC2a6+PaaYwIADyooyjRzNKQti6o7+h4QVBBuB4FYa4jdM
         GoF/ueIapZzca2+s2EGyjUadZJFfoxxrP4/h/kbTjWXgF3z/Hqqh+HjCInFkUEQH/TFo
         lwGYNclgHwrW19atKYH9T0zQW9MYEee73cwXT4a3Dd3+XLyHkXQssgl5fi2Tx+oPQOcD
         vfMEXA/O5xIs7xLtt1iUaWHTTJ+wblfyoTRnnYJ6iIOBosimxAxl6fZTXZtwFM20RWHC
         WfJw==
X-Gm-Message-State: AOAM532kQibfzyxu3eLS9sX/Hh9Wn5irQ9YxqoMClyMmDArX/XyLYo4y
        2E5hZ4fJ41LRi1wMwc40F3Ovyz0jknw=
X-Google-Smtp-Source: ABdhPJy0NhAEgx0YueavHkoSGEGm8/Mr33UwaW2jLvNQQvPaYv8aq5+3hyMTwVmG12Oro9tTskAoDA==
X-Received: by 2002:a05:6512:3a5:: with SMTP id v5mr18645438lfp.250.1639234342465;
        Sat, 11 Dec 2021 06:52:22 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id p10sm679546lja.0.2021.12.11.06.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Dec 2021 06:52:21 -0800 (PST)
Subject: Re: [PATCH v3] i2c: tegra: use i2c_timings for bus clock freq
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Akhil R <akhilrajeev@nvidia.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
References: <1639138557-1709-1-git-send-email-akhilrajeev@nvidia.com>
 <1056abdf-684b-b808-3471-d4733fd5e449@gmail.com>
 <CAHp75VfykSN6Jnoq6XsEL7W9+yCq-uwRdFRTSAJ6bBuYCuMa5Q@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e0d4a63f-b5c6-8c01-f11e-a0af331a5f0c@gmail.com>
Date:   Sat, 11 Dec 2021 17:52:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfykSN6Jnoq6XsEL7W9+yCq-uwRdFRTSAJ6bBuYCuMa5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.12.2021 23:07, Andy Shevchenko пишет:
> On Fri, Dec 10, 2021 at 7:24 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>> 10.12.2021 15:15, Akhil R пишет:
>>> Use i2c_timings struct and corresponding methods to get bus clock frequency
>>>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>
>> Note that your s-b should be the last line of the commit message. No
>> need to resend for that.
> 
> AFAICT there is no such requirement in the documentation. It says that
> SoB should be last among SoBs, which is not broken here.

Correct, that's why I said no need to resend.
