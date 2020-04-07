Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52F151A0A9B
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 11:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgDGJ6e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 05:58:34 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45241 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728075AbgDGJ6e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 05:58:34 -0400
Received: by mail-wr1-f68.google.com with SMTP id v5so3088108wrp.12
        for <linux-i2c@vger.kernel.org>; Tue, 07 Apr 2020 02:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=17rM6IjmKNZZODjeRxanNL0pY2eyTkdVNq2/tT7WZmE=;
        b=ERxD/TeOIqmAldeFFhLoPnM73o+qNAQOYxMQWrckKjWSlIndJjheH5SAwj8+W6+JQE
         Cxa0LZu8ElpRx5M/aB/POW8ykMJoY4tj+Zglqqb+f6n+Jlmki5mviLlHY59SnofZUFdj
         b4WwAcIDAPzAGCKar1Tm9m1q16gf+GOblIe6WMAKa9FyNKzJvKptE3FyT1kuQhkvQ5f2
         53f3IY+71nkYJEATIybBctYfmNJeHo6jPgK4oKuh09YrrucFH9XntXiGxuIgxceUbmqZ
         66G1xUjnT3hQdxHrkinoltxJwUEPdmGo/MOmtwFv1hKxqgdMnpIS+/oNaWsDSb2Wobo9
         nFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=17rM6IjmKNZZODjeRxanNL0pY2eyTkdVNq2/tT7WZmE=;
        b=ROYHHEenQIqgqJl+nNdqGUyOJnq+l0vw2SiYj4uEcUGRXaY3tf1yXafatapjSEHnnh
         tYqKFedyOuK/43W7PEle0WdlP1CPGL1X4/PPGQEwjl3k8iywpM/TOMXS7l2ViVAQ5bKt
         RtHTKQDvYXQSGIngXlHFlsYhJx9mttsNTVcK+ZRlUWpDNLMt+uR/dnPV5pKjvrsap939
         Ip4IIJLtUVcz20B/3NWvV69SwsvNPAUL5iwxybW0VX2CD5vhNd3UoPIJfNZ/n8RTJosI
         /HL3CRR3x9Ux+olJWMcvWbHRSVKob3ERY1AndotignaQnqMPYlWO+Sj66GMRGZDt2XpN
         g4tw==
X-Gm-Message-State: AGi0PuZdPfRTiVwGOT/6T9WVtyq/ABtGUMN8XJs9xMaH7pt8yLVMRgWi
        qePDlMGrRVAldUvBnfo0X5yHbQ==
X-Google-Smtp-Source: APiQypL2FllgryYtHwOLtsaM3rTG/9cMFgFuErEQsvHGtP9IzpT3hFO2SL44+fh//EJSQMYbP7QJqg==
X-Received: by 2002:a5d:53d1:: with SMTP id a17mr1964915wrw.41.1586253512412;
        Tue, 07 Apr 2020 02:58:32 -0700 (PDT)
Received: from [192.168.0.136] ([87.120.218.65])
        by smtp.googlemail.com with ESMTPSA id s7sm5647638wrt.2.2020.04.07.02.58.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Apr 2020 02:58:31 -0700 (PDT)
Subject: Re: [PATCH V3 2/8] soc: qcom: geni: Support for ICC voting
To:     Akash Asthana <akashast@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>, wsa@the-dreams.de,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-3-git-send-email-akashast@codeaurora.org>
 <20200331233209.GF254911@minitux>
 <CAE=gft6B2UCBVaKVCJXED8waFWci8WJ+sTM3CT+3e_eYS=-BDQ@mail.gmail.com>
 <66da4cc6-3873-1d39-ecb7-e9866320c469@codeaurora.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <866a5cac-9f05-703e-8c3c-168d8f219c4d@linaro.org>
Date:   Tue, 7 Apr 2020 12:58:30 +0300
MIME-Version: 1.0
In-Reply-To: <66da4cc6-3873-1d39-ecb7-e9866320c469@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 4/7/20 09:46, Akash Asthana wrote:
> Hi Bjorn, Evan,
> 
>>> Given that these two functions only switch the bandwidth request between
>>> some value and 0, I really think we should carry a "bool enabled" on the
>>> path and replace these two functions with
>>> icc_bulk_enable()/icc_bulk_disable().
> So, if above is implementation "bool enabled" on path can be used directly in
> aggregation of ICC votes on particular node without using icc_set_bw call, if
> yes then I am not aware how? or we'll be using icc_set_bw API indirectly inside
> icc_bulk APIs?

If there is a repeated pattern to switch between some bandwidth value and zero,
it really makes sense to introduce such functions in the framework core. I think
that this might be very useful especially for suspend and resume cases.
Something like icc_{enable,disable}(struct icc_path *path) functions and also
the bulk versions, that will flag the path as disabled, re-aggregate and do
icc_set_bw().

>>> The added benefit of this would be that you call icc_set_bw() instead of
>>> changing the geni_icc_path->{avg_bw,peak_bw} and don't need to keep
>>> track of them here.
> 
> Ok IIUC, we need to call icc_set_bw() from GENI driver only if we change (avg_bw
> | peak_bw)?

Yes, exactly.

Thanks,
Georgi

> 
> Regards,
> 
> Akash
> 
>> Yes yes! I had the same thought here [1].
>>
>> Georgi, what do you think?
>> -Evan
>>
>> [1]
>> https://lore.kernel.org/linux-arm-msm/CAE=gft58QsgTCUHMHKJhcM9ZxAeMiY16CrbNv2HaTCRqwtmt7A@mail.gmail.com/
>>
> 
