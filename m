Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF67346EBFF
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 16:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240016AbhLIPqd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 10:46:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236319AbhLIPqd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 10:46:33 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783EFC061746;
        Thu,  9 Dec 2021 07:42:59 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id l22so12734649lfg.7;
        Thu, 09 Dec 2021 07:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EvO/FOiOCWth/FsOcriskw+XXfX3SWZF4L2HEDkisk8=;
        b=NVpSCwixqgt/s+m64RE965+1r6N8iz0jKflNTSnOXDwsOUq+B1XphgPaMh11aW9sCA
         V++r7Biw3AQbu2oa345NgHRKfcBa5x7NjC/Bd+gJxKR8z+2/Jtu6aFKRde+Sk2AJc3Nz
         bnw5OHTGsApj8RSjGGwtwOvFaB3vEN6PQRycWuOvJN5V2Y9z+PHUFqKPKGfo/uDdDnHU
         PSowtofEMlyWKrxWHz+oMZHPjRsrqEnFP0Ytim7VpdVax9HBs0+E6OYGH5SkoM10i2aY
         VjHUf1EI8K3/5PQswKlLVCjdsKc0mBR9IaXi33ek/vlqsZSB1+WKqjhft0pwiNjkb2te
         qYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EvO/FOiOCWth/FsOcriskw+XXfX3SWZF4L2HEDkisk8=;
        b=bOk5eWmBM43ht8c5EaQxZB/VS/GtCkQhLTKW97JOI9d+HwT0It84NkFWv+z3hOHk4h
         vTAHbU/9TDjzFKWbmtXGzDiuxn7ackq9ruAGVlT5OMfkVSOvZzn+Pl26z4rmfYmliYlh
         b//wJJgWs9f7v61QWBDnllTNqfyuWkjL757e5jVTUNzBd5UQ6UP2K9z+9J0Sxco+5Xnb
         ObSFEsEZRfcZqR0/8Tb3Klf6nG6Zi7ZA+LDqLrzvXQf99octzDarXml13YHtGp00/7/R
         kijQ4harR+jE4K0NpFaS0jrV9zGcqg/dO6JSmmwQUMVUTlfJLcf3slWkS5obxjYtuzml
         /GLg==
X-Gm-Message-State: AOAM5306f8qh5ptQSQ3sNVak0bp88yf2O7o94bbLhKBs3APW4e7ZH7si
        DxDCID+8FkUS7bHnrzgMvJAcA6JDz9k=
X-Google-Smtp-Source: ABdhPJxjIgn0eiZzOehZ2++jZY7CvqrvLqgIMzHyNe2HnCPgiYagwaHSH2xhh9zQzvqXkDKw7MDOYQ==
X-Received: by 2002:ac2:428e:: with SMTP id m14mr6890090lfh.625.1639064577649;
        Thu, 09 Dec 2021 07:42:57 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id z24sm19608lfh.289.2021.12.09.07.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 07:42:57 -0800 (PST)
Subject: Re: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert
 functions
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Akhil R <akhilrajeev@nvidia.com>,
        Christian Koenig <christian.koenig@amd.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linaro-mm-sig@lists.linaro.org,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
 <976c8d73-d137-2050-ca82-18326456c9e8@gmail.com>
 <CAHp75VdzrT5z13qx-mMRdrS2=GrMOv87WaEPL5eoPO5cBiqjDg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8803c595-8cb8-2511-b3eb-dcd2add6f867@gmail.com>
Date:   Thu, 9 Dec 2021 18:42:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdzrT5z13qx-mMRdrS2=GrMOv87WaEPL5eoPO5cBiqjDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

09.12.2021 18:33, Andy Shevchenko пишет:
> On Thu, Dec 9, 2021 at 5:30 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>> 09.12.2021 18:05, Akhil R пишет:
>>> +static int tegra_i2c_setup_smbalert(struct tegra_i2c_dev *i2c_dev)
>>> +{
>>> +     struct tegra_i2c_smbalert *smbalert = &i2c_dev->smbalert;
>>> +     struct gpio_desc *alert_gpiod;
>>> +     struct i2c_client *ara;
>>> +
>>> +     alert_gpiod = devm_gpiod_get(i2c_dev->dev, "smbalert", GPIOD_IN);
>>> +     if (IS_ERR(alert_gpiod))
>>> +             return PTR_ERR(alert_gpiod);
>>> +
>>> +     smbalert->alert_data.irq = gpiod_to_irq(alert_gpiod);
>>> +     if (smbalert->alert_data.irq <= 0)
>>> +             return smbalert->alert_data.irq;
>>
>> 0 is the error condition.
> 
> I'm not sure what you implied here. gpiod_to_irq() returns 0 if and
> only if it goes to the architectures where it might be possible to
> have valid vIRQ 0, but this is not the case (at least I never heard of
> a such) for GPIO controllers on such platforms. So, looking at the
> above code I may tell that the '=' part is redundant.
> 

Yes, removal of the '=' should be enough here.
