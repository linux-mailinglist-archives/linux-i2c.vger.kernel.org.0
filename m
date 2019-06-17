Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22285481A5
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 14:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfFQMQR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 08:16:17 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:32930 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfFQMQR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jun 2019 08:16:17 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so6356087lfe.0;
        Mon, 17 Jun 2019 05:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=udosfGcsxFjuEN1zHDqJn+M1NCMIGyoOGu6CEwS0pac=;
        b=jT6Q8qRlLptMoZIpkA1ya0gK8Hw5DW2D9Hc/oZSFod6/4ON8smZ2C7pacHVBKJtwif
         M+xf14CBbD/qagu98vIVvN7eUlakgVL6aPxSZYBEugSmRZnoCp0Eew+WqZufuoPMUzTv
         9PpvWRw8UiFn9Ge4YwGlGP1kyvOhW34lP9M3ZdXvxWhMHUa9k4uCr/Xfz4dpv+Eehvzn
         UTvd6YRbzndJvOK79fD9uLdXHE7VJ/WhdmlBLoVQBbzlkg3ocRIB6IAxJNYllvdAiw3H
         5Qo9n8tqkBDMSJgvjKMS5O6eWZtW5svcIMoXivzy2xeNcbNmX8/E3FiRCv9Tcuwj6D1P
         Jnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=udosfGcsxFjuEN1zHDqJn+M1NCMIGyoOGu6CEwS0pac=;
        b=FOjOFKtECsYnTp6z6bUcsh7OPKhQbhdxFN9E6qTeaWE36MXwjA3s7GJdkkfL5qel7S
         nP8ZavD/IjYvcUr+txuxwpWiNPPXCK766PVbiAok2Tv1enkRzwgtxkTFYVjtEH+TFReJ
         4DlXsdeph8sJt2iL35Lcwd0WZPMuy/O8SjG8g0PzrijCNMd1T4VXRSJoR/HTxP8A+25C
         iJ/ZNBE0bpwTbNhCYQOa9P8uSIJ0a2UyDFTQvaC2MoXPU2l0yEkPu7LSAmjqzOE0PbLM
         ckLfcyO4nfczG7vz6DCC1oM/tBi1amW2cehsD19E8OcL6KKhsjp7qbQNLvXbfIdvcPBw
         g0MQ==
X-Gm-Message-State: APjAAAXbseUN1XADJymcRlFytk06JvQoUxAA2TtmjEr6g1d6Z8HS5fWn
        l03zxGselx5oqHPe43+9SGI=
X-Google-Smtp-Source: APXvYqwKB+ebv49DdCC7IQFSoLc/U1801tvGqjIasHp0bM9bHN0LQJ7nTRElnvd5f7F/YByM2GjGqA==
X-Received: by 2002:ac2:48a5:: with SMTP id u5mr49615261lfg.62.1560773774658;
        Mon, 17 Jun 2019 05:16:14 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id k12sm1940837lfm.90.2019.06.17.05.16.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:16:14 -0700 (PDT)
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
To:     Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Bitan Biswas <bbiswas@nvidia.com>,
        Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
 <20190614211129.GG17899@ninjato>
 <758d6dc2-f044-6be3-6896-196ef477d393@nvidia.com>
 <20190615045405.GA1023@kunai>
 <69a9a7e3-f885-b6ab-60bb-a1165ce2db23@gmail.com>
 <20190617070259.GA30126@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3f5adcda-49e3-46b3-9881-bc33532db4df@gmail.com>
Date:   Mon, 17 Jun 2019 15:16:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190617070259.GA30126@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.06.2019 10:02, Thierry Reding пишет:
> On Sun, Jun 16, 2019 at 04:56:06PM +0300, Dmitry Osipenko wrote:
>> 15.06.2019 7:54, Wolfram Sang пишет:
>>>
>>>>> Without a maintainer ack, this is an exception this time. Should we add
>>>>> Dmitry as another maintainer or reviewer at least?
>>>>>
>>>> I shall followup with Maintainer for ACK in future I2C tegra patches.
>>>
>>> This comment was not directed at you, sorry if that was not clear. It
>>> was more for Laxman, Thierry, Jonathan, and Dmitry (if he is
>>> interested).
>>>
>>
>> I don't mind at all to review and test patches for the driver and can propose myself
>> as a reviewer if that helps and if there are no objections from the Tegra maintainers.
>> My primary interest is to have my devices working after next kernel update, but I also
>> like to review patches in general if they are touching area that I'm familiar with.
> 
> No objection from me.

Thanks! I guess the same from Laxman and Jon?

I'll prepare the patch to add myself as a reviewer.
