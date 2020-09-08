Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD158261DCD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 21:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731793AbgIHTma (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 15:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730878AbgIHPws (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 11:52:48 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23EECC06125C;
        Tue,  8 Sep 2020 06:16:29 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id r24so1067221ljm.3;
        Tue, 08 Sep 2020 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2ob3Uu2PIV7nT5SLsDGzmqre4E7eymr6wADbftdvJ7s=;
        b=sHBZfPNkDu7qQ/ABlj/tJmyO+hyuIaD0i7Otp2n/gRkNQXppwriHIudfwvuTMV/eU8
         Reh+27n+d9CkUCqKE+iTP24S5cZ8Jodfl7NrIDEOE6mnSrxsb8emFOicItGzrxJIeHEO
         WzP9rNy+KrTZp2z0UYcfKlD+Km8COYz58aY1v1W4anzE4R1DqRcAZ/d5VqM/jGXujFSW
         yl2B+8AB55zFoHuI0nvit09zP6ula0J2xQ1Pr2qgeE10wU0YrqYUY4cS9jL99NTrLUkX
         UxkL54VXWhJVcNkkD+kH2WEJBeK4dZkl8tblMgYgzCjVQ8iZU1yfOJAojwxQxFsdI9Bg
         uoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2ob3Uu2PIV7nT5SLsDGzmqre4E7eymr6wADbftdvJ7s=;
        b=MvpCaly9u0GWd0UaI/uGvZtpHm1VN+S+u5iz3Mg8ocPjgQ7mmfT/RbiMEJawoWSiN6
         N+TNV9NSFAvhaSv6dC1GZkiAJdsISlr+SmmolC9fDP3ZPHa+Z/nl1VYTmlHt9w0D5YNE
         nyUx+dwD96Dg+6AGBakqXDatEtPqCmWjCuL8vaAXpeoUsDsEeaIljICY8uW+eVm+Aw8G
         oQr/Jnfk/zclxEEdudvDAsZDpSokEYEPSLVGbm3BBSfasFOAsgd3lEHW242ZsDF/n5Aq
         b1fdX/tW19ztlr8FB30fiEhxPjRyiuHcPyOBoolmc6bbZwoaDsPB345XSsJkBp+/eMaO
         DhXg==
X-Gm-Message-State: AOAM533ymPDVLNr+3H5V1WtjN4bLGLjInamfL/oAr8bXxzlz06U6maRv
        q280J6Ml2uNhCnLjJ9sR4ng3NP6wNNk=
X-Google-Smtp-Source: ABdhPJzdTI4rNxCjoKspr+yIbdJopN0tD13+QHFV+10jpjX4FDTBXbZoVi61q9LPhPcSEiMzvq9XTQ==
X-Received: by 2002:a2e:8782:: with SMTP id n2mr10169705lji.262.1599570987442;
        Tue, 08 Sep 2020 06:16:27 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 25sm10448215lji.130.2020.09.08.06.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 06:16:26 -0700 (PDT)
Subject: Re: [PATCH v6 14/35] i2c: tegra: Clean up probe function
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200908021021.9123-1-digetx@gmail.com>
 <20200908021021.9123-15-digetx@gmail.com>
 <CAHp75Vc9srPR1BYes9ZEo46gxV2BAhZ71ov_JZ_sHrmtgdAr-g@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dd51a8eb-5b8d-0b63-3130-428980cfe7ff@gmail.com>
Date:   Tue, 8 Sep 2020 16:16:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc9srPR1BYes9ZEo46gxV2BAhZ71ov_JZ_sHrmtgdAr-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

08.09.2020 11:40, Andy Shevchenko пишет:
> On Tue, Sep 8, 2020 at 5:11 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> The driver's probe function code is a bit difficult to read. This patch
>> reorders code of the probe function, forming groups of code that are easy
>> to work with.
>>
>> The probe tear-down order now matches the driver-removal order.
> 
>> All dev/&pdev->dev are replaced with i2c_dev->dev in order to have uniform
>> code style across the driver.
> 
> You see, below is my point why leaving a temporary variable can reduce a churn.
> 
>> The "ret" variable renamed to "err" since it only carries error code and
>> the new name clearly shows that.
> 
> Overall it sounds like you need to split this into a few patches.
> 
> ...
> 
>> -       struct device *dev = &pdev->dev;
> 
>> -       i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
> 
>> +       i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
> 
> You see, if it had been simple 'dev', this line would have not been changed.
> 
> And so on.
> 

Alright, I'll move all the renamings into the "Clean up variable names"
patch, thanks.
