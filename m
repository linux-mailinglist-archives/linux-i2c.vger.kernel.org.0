Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 199F77AAF5A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 12:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbjIVKUJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 06:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbjIVKUI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 06:20:08 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C916E195
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 03:20:01 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40537481094so14992045e9.0
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 03:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695378000; x=1695982800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CBjVQHt6lJR98WMcj0g8bXV/0FXx+4Mx0XUDt7zYWY4=;
        b=e2NL2FiLNn66W3R1El43ZS4/mRjkGNR7UsfW8lGCRDRymutepxnrqSkFKASWI/PmyN
         shenWso+0LmX2H+HZvJoTdETfYdHdj1u8AaNI1bV3zDXfPLLNtH2UeQ35nVMM2VWd5mN
         VWOwm7tILPIk+MVjzzlw7xXj0Ofpw0rKTU4Ql/ylaCMC/1EWNd7VPILLjRO1dK977uHI
         ZO9q1pTixOzMeB7tvu8dsysW9e3RqC1yj+k8gZzko99YqcFl8NoX80ovB+Xq2Z8GsX9R
         lkuc2+w4BL9uPLpxx1wrBBE8KPqpFgXoW5/S+pY+t2Rn4adQzMBAoCGvPtU9iBQbv5/p
         hOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695378000; x=1695982800;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBjVQHt6lJR98WMcj0g8bXV/0FXx+4Mx0XUDt7zYWY4=;
        b=Dy4Hu+O+xCkWEEi/x96sWn3PRmDKughDF3PClZwsCp4LS9TByIfiZAC89SYcv5Akm3
         BFzc+bXeL5Z0v4rI+B053i55L2CCHwAaAzpl2ZYQWBLXBRPoB5l9QjdgVaWJYXJY9Zmb
         zBym7mPQPt38l6XZbUOYwhYryaA3q0sKuCD1OsQTpC7FBGn2VHYw2ag5cd/wLiurLBto
         R3tNDv9RRmA7bMFcsjySjxRZCpv/RsgOpYgaTrb2JSmx2lVhopqh15fjByFfb7u2BnB5
         4sV7Z17MdK3KeSNCbKW8PY6aemwVQYbNftq2gDWpvg+kFtvFFfsqZ3XqgWLfZwBn9SEk
         D99g==
X-Gm-Message-State: AOJu0Yzg3aoFM+4Vzd7Qmcw+Mb5P8NLUgrWENT4H86VD9Nhf8uv0/Eh/
        pAnX9gjVnjPsj6YbHguc/5Y=
X-Google-Smtp-Source: AGHT+IEH1pG7TzukrA8knFK2cYp4xzlv7vUqCaeFnTV88/Xa9VIiC4fbKfffZ6OSP4RIHOYutFqYgQ==
X-Received: by 2002:a7b:c047:0:b0:403:787:e878 with SMTP id u7-20020a7bc047000000b004030787e878mr7074076wmc.21.1695377999843;
        Fri, 22 Sep 2023 03:19:59 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9589:7c00:b10e:5fd8:e6fa:a54? (dynamic-2a02-3100-9589-7c00-b10e-5fd8-e6fa-0a54.310.pool.telefonica.de. [2a02:3100:9589:7c00:b10e:5fd8:e6fa:a54])
        by smtp.googlemail.com with ESMTPSA id m5-20020a05600c280500b003feeb082a9fsm4274696wmb.3.2023.09.22.03.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 03:19:59 -0700 (PDT)
Message-ID: <de39777d-5b13-403a-ab59-f6df22780c09@gmail.com>
Date:   Fri, 22 Sep 2023 12:20:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] i2c: i801: Switch to new macro
 DEFINE_SIMPLE_DEV_PM_OPS
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <1de49847-bb13-38b1-2820-15a7aa0fcb9a@gmail.com> <ZQ1kPTNbMTGOLwKH@shikoro>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZQ1kPTNbMTGOLwKH@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22.09.2023 11:54, Wolfram Sang wrote:
> On Sat, Mar 04, 2023 at 10:37:34PM +0100, Heiner Kallweit wrote:
>> By using the newer macro DEFINE_SIMPLE_DEV_PM_OPS we can get rid
>> of the conditional compiling.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> So, only this patch is left which only needs rebasing, right? Great
> work, guys, for keeping at it! Could you also kindly have a look for the
> remaining i801 patches from this year while we are at it?
> The same patch from another author has been applied in the meantime:
a6273e413a9a ("i2c: i801: Remove #ifdef guards for PM related functions")
So you can set my patch to superseeded.

> http://patchwork.ozlabs.org/project/linux-i2c/list/?series=&submitter=&state=&q=i801&archive=&delegate=
> 
> Thanks everyone!
> 

