Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B93F29EE48
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Oct 2020 15:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgJ2ObM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Oct 2020 10:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgJ2ObL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Oct 2020 10:31:11 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3892C0613CF;
        Thu, 29 Oct 2020 07:31:11 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id r10so1385626plx.3;
        Thu, 29 Oct 2020 07:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yGfVt0L4ftOqQYvVzpLAMtyqzm24yEPmmaeuYJHdcF4=;
        b=L9Ve7M9gsRbGmqPW4y2GbZH/PW9XpRBJKr8bcNLgo2jmnTrKJveNfyczvv9XTx+HUl
         YLInTPvtZFmjrEtguEph+0OATtBpSK8kwKDRVeByBXdRw0Buz+0hoaCPQT3R16L/79Yo
         j2u3swusX6/w6211/RM5QFW6qgwWkr0uCufzlloq+m9sBQ6S/+YCJgMjBnxeO8POZKcm
         GDWaaJnhiw4daofmYDRX9oZ4ehcZgPyqljtuIP8TlUBc9WWSKvz+hBiKPtri9cR0I/EM
         X0BoWxpLqADftyN/1V/sAG0fokCqb0gmHPn/edQDvwR53UdSASGvA7sXOUjA/L/o9sXm
         RMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yGfVt0L4ftOqQYvVzpLAMtyqzm24yEPmmaeuYJHdcF4=;
        b=S//hKfe1rpiG9CoY0m0EDJgdOyfCLdNNk96ltZc3laxmFdMpTfJnjQjPYHIRZAj6yF
         unIr6Q3whURSauDc9uCEC3i9f/c6iNctkYKq0aBpWKeWsu+o1wrlNdOzvfnzQKxWKG7h
         AslyQfsYX49p0ltJKqgxYpA0sSe5Ly2PR7j6B0+a/Cw9zz7/kT07K48cryl2RMrhrTVm
         7MSuYkJiSO6vHIAnopqSuyu+zHxgFyn3z59msHvx9A4mzJUbu8flEBeTW9IP/7o3jtyV
         sJHjQdweXUXhu+78f/FZKWvvGObV1vkkxN2rVctNkI45DwjG0DxsRG6HPYD9Zu8teqiH
         Y29Q==
X-Gm-Message-State: AOAM5325sk7OApv7OUZtUUKieHo6mFYI8xFwNGDYGcH9h9eLm433u/2L
        k3yBuM9DboZtH/tDgKEURkI1Mqix/Yb2113u
X-Google-Smtp-Source: ABdhPJx5yXpyzx2qbpNT/+t79uGRA4TnLTSZjBRsP0DnQS9c1W8oAAwcmW263hQYx6j5y/UQ3EDlpA==
X-Received: by 2002:a17:902:a50f:b029:d6:da2:aaa7 with SMTP id s15-20020a170902a50fb02900d60da2aaa7mr4686870plq.42.1603981871290;
        Thu, 29 Oct 2020 07:31:11 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id p12sm2776972pgm.29.2020.10.29.07.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:31:10 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Thu, 29 Oct 2020 22:18:57 +0800
To:     Fabrice Gasnier <fabrice.gasnier@st.com>
Cc:     linux-i2c@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        open list <linux-kernel@vger.kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "moderated list:ARM/STM32 ARCHITECTURE" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "moderated list:ARM/STM32 ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Alain VOLMAT <alain.volmat@st.com>
Subject: Re: [PATCH 5/5] i2c: stm32: remove unnecessary CONFIG_PM_SLEEP
Message-ID: <20201029141857.hts77kneb3j7aa67@Rk>
References: <20201029074654.227263-1-coiby.xu@gmail.com>
 <20201029074654.227263-5-coiby.xu@gmail.com>
 <699f4908-1ea1-6075-3375-7f1dfc6fb225@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <699f4908-1ea1-6075-3375-7f1dfc6fb225@st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Fabrice,

On Thu, Oct 29, 2020 at 12:31:54PM +0100, Fabrice Gasnier wrote:
>On 10/29/20 8:46 AM, Coiby Xu wrote:
>> SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.
>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-stm32f7.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
>> index f41f51a176a1..95ac9dfdf458 100644
>> --- a/drivers/i2c/busses/i2c-stm32f7.c
>> +++ b/drivers/i2c/busses/i2c-stm32f7.c
>> @@ -2262,7 +2262,6 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
>>  	return 0;
>>  }
>>
>> -#ifdef CONFIG_PM_SLEEP
>
>Hi Coiby,
>
>This generates warnings when building with W=1 and CONFIG_PM_SLEEP=n.
>Could you please add also "__maybe_unused" for relevant routines below ?
>
>>  static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
>             ^
>e.g. insert: __maybe_unused
>

Thank you for the suggestion. I'll add "__maybe_unused" in v2.

>Best regards,
>Fabrice
>>  {
>>  	int ret;
>> @@ -2356,7 +2355,6 @@ static int stm32f7_i2c_resume(struct device *dev)
>>
>>  	return 0;
>>  }
>> -#endif
>>
>>  static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
>>  	SET_RUNTIME_PM_OPS(stm32f7_i2c_runtime_suspend,
>>

--
Best regards,
Coiby
