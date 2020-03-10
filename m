Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C40E417FD3C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 14:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729792AbgCJN0q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 09:26:46 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33624 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbgCJN0p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 09:26:45 -0400
Received: by mail-lj1-f194.google.com with SMTP id f13so14135714ljp.0;
        Tue, 10 Mar 2020 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OFEfv78mqxElApVv1PrLdhetmsXCx++xAuLsijmT7RU=;
        b=MPjkwmXIAf3FWyEgLP72VjHIRYpfGhG20UY8BhN66PsNpd4eGCduEIgthZsYBz4n9C
         5H9OfqJmEgjp2Du2id90Wx5m8OyU9+TmYOjINHJkzc1MiJV6yIfrsGPCiafRVAOWGSuI
         1Gs+jLcTEOpUsyfNPXJF25iNTJOrR8OVSF9/i3xeJiy8Y6D57slJhMk+tWGFtq3QujnP
         mciLBxJjYSs+Px/jakxMHhE/edRBjYPhwpCEOW7gEDNifraZRlkCfEkeqfeNmacRF/kx
         qhxV+c2mGxh8SBUwtPRh02MYUUi5QbY75MS43mhKGPjlYRn3XXCTvXwUoHI55oLqsOkD
         bbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OFEfv78mqxElApVv1PrLdhetmsXCx++xAuLsijmT7RU=;
        b=WfPklX4tjngMs3psv/VlVntfAMWekYLHNpA3vkNHc9XyL575gYOpHI2v09EcxJfUbA
         0K4UekBNGdr7Cp6HAP1u6I8aE9QiqlRk9Oquks2B8ID7IFaajf/nb8KaW8Ksv74bX7zC
         qfMHFY6Es5WNoiVBqACJmngb35k6H3AXVWNTNbXM2UMoP/QW85Mj1fCHy3bBsGKJPWrV
         WUKDrfTmFAEPj/u12YYMLHULHkfW2ViBIG9q1AxPIDzfsxgeHYlRc/Z1v/si7X/rDfdY
         KlXaT13q9Hk58BMTcDXQe3lpsn5wEH/1poaQsmZDzUaqA5VMomALjM3o265RcRa6VNM5
         d8lQ==
X-Gm-Message-State: ANhLgQ2h63mwAj4hKZlTXL9dQRn43KDEr+hZdPvhAKHVKoGzjCob1HuW
        owJPnt4KjiMw15rkYLT48K0MiP8n
X-Google-Smtp-Source: ADFU+vs0D5hsfb7X1yf/tpe6lP/YNwM1B9Ae7W/yTvjMuZrOxV1xdmC8WTPJFzqs51fKWHW5jAXXMQ==
X-Received: by 2002:a05:651c:114:: with SMTP id a20mr12995219ljb.122.1583846803027;
        Tue, 10 Mar 2020 06:26:43 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id j24sm8742473lji.76.2020.03.10.06.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 06:26:42 -0700 (PDT)
Subject: Re: [PATCH v1] i2c: tegra: Make timeout error more informative
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200302173512.2743-1-digetx@gmail.com>
 <20200310113706.GW1987@ninjato>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <017aad72-9872-a4aa-dc99-bd7d08c0db14@gmail.com>
Date:   Tue, 10 Mar 2020 16:26:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310113706.GW1987@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.03.2020 14:37, Wolfram Sang пишет:
> On Mon, Mar 02, 2020 at 08:35:12PM +0300, Dmitry Osipenko wrote:
>> The I2C timeout error message doesn't tell us what exactly failed and some
>> I2C client drivers do not clarify the error either. Adding WARN_ON_ONCE()
>> results in a stacktrace being dumped into KMSG, which is very useful for
>> debugging purposes.
> 
> This is good for debugging, in deed, yet not good in the generic case.
> Timeouts are not an exception on the I2C bus (think of an EEPROM which
> is busy during an erase cycle), so it shouldn't be printed at all.
> 
> This prinout should rather be dropped or at least be dev_dbg.

Oh, well. I'll keep this debugging applied locally then, it's quite
unfortunate when something fails silently :)
