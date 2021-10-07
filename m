Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A448442577A
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 18:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233590AbhJGQRO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Oct 2021 12:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbhJGQRO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Oct 2021 12:17:14 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36550C061570;
        Thu,  7 Oct 2021 09:15:20 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id r19so25430099lfe.10;
        Thu, 07 Oct 2021 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NVp1p0nCFR3X43ikg5thFg4Xm8FhZjoXjQvfc0kutms=;
        b=IwRn6jP2f2FR/YQIgbNtIHjHvLXYcff+wA9ksYCMvSt4oCH0HUyfSlrYROCxzepVZU
         Ov+k49Ciy1dKzghN1Fd3UZHLa7Hz1Oadsl+DLO6WUsf9gCl57rhQCynElwcLU0VTXLIo
         PbRRFtmcTp6FcZ3zCS+MUzzBHC9GrbHZhtWf/9aW53H+jhSyJtFEoYobZ1yktFFxTokU
         db1QwYX0SAToqfRd9qN+xWlnPmKeUMHeI/Fs2PQdEp1v0tXB2/NPQZoijHz4uYG3w2XY
         MwIC+kRwfBDzu1pSw7rDkTdsYYYvXno9fkfh0rq1d+fJoa/of1CA/koFYK2mbqvAdxkB
         cw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NVp1p0nCFR3X43ikg5thFg4Xm8FhZjoXjQvfc0kutms=;
        b=gcMP31R79tGVz7pMhnjQ7jwcfEky7SV1FiBrl3pQLpAv6416XsKOu8jspgCxrcx2+n
         d9wv5RRqqVc7UhzxjDf+10j/uDVemD23+I2NQXosBUU5Z9fYRMmsdzH+7boOIwrpL9Gz
         Amge2waj4XBfEaollHahDbSytl7KpiRdJU/G2n2cylTcOpIV01X9U/CMZ7rZbmdHYQrs
         tqHqODV7TIGTT89849K5Rwir+4AKp8KCVMg4gvU83U85pJZiH5E08bqRtc4F2zm0yE0w
         Mp0T3PggBrONbn/sihDmPx+RItaUPdBIgUZFCb7ymR8q7YN8+lTwqgP6LMhb3DqhpVoQ
         vK1Q==
X-Gm-Message-State: AOAM533HjJLzSIfxUthEgknliR/eJ447aEyZVVWtvqXuFpjG7+hXzoB7
        O+7zX5qYIdlQwEibFwqC/zpSbtnPvNc=
X-Google-Smtp-Source: ABdhPJzfnojQqySrlmKNnzOckxx3599YWXsOIHqc4ojJ7oOmzuGVkhrzPeJB1vDp9HrSSwJ4f4Md1w==
X-Received: by 2002:a05:6512:308:: with SMTP id t8mr4806432lfp.684.1633623311709;
        Thu, 07 Oct 2021 09:15:11 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id m4sm2335133ljq.4.2021.10.07.09.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 09:15:11 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] i2c:busses:Read and Write routines for PCI1XXXX
 I2C module
To:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        treding@nvidia.com, mirq-linux@rere.qmqm.pl, s.shtylyov@omp.ru,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     UNGLinuxDriver@microchip.com
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
 <20210929062215.23905-3-LakshmiPraveen.Kopparthi@microchip.com>
 <ff447184-b510-4e70-c941-1f0c5b7d0fb5@gmail.com>
 <43c25d97a64010b9785a4cd75821564d511bc090.camel@microchip.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0ad0472-16df-ef45-61cb-27e81bfeb9b5@gmail.com>
Date:   Thu, 7 Oct 2021 19:15:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <43c25d97a64010b9785a4cd75821564d511bc090.camel@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

05.10.2021 11:48, LakshmiPraveen Kopparthi пишет:
> On Wed, 2021-09-29 at 10:20 +0300, Dmitry Osipenko wrote:
>> [Some people who received this message don't often get email from
>> digetx@gmail.com. Learn why this is important at 
>> http://aka.ms/LearnAboutSenderIdentification.]
>>
>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>> know the content is safe
>>
>> 29.09.2021 09:22, LakshmiPraveen Kopparthi пишет:
>>> Read and Write callbacks for PCI1XXXX I2C adapter is added.
>>>
>>> Signed-off-by: LakshmiPraveen Kopparthi <
>>> LakshmiPraveen.Kopparthi@microchip.com>
>>> ---
>>>  drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 485
>>> +++++++++++++++++++++++++
>>>  1 file changed, 485 insertions(+)
>>
>> Why this is a separate patch?
> 
> I thought of splitting the driver into two patches.
> 1. Contains the intialisations,ISR, supend and resume callbacks.
> 2. Contains read and write functions.
> If it make sense to merge these into a single patch, I will do it.  

Please combine it all into a single patch. In general it's better to
have a single patch for new drivers since it's easier to review.
