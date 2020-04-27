Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E770B1B9F5A
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 11:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgD0JHX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 05:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgD0JHX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 05:07:23 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01034C0610D5;
        Mon, 27 Apr 2020 02:07:23 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id l11so13169531lfc.5;
        Mon, 27 Apr 2020 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sy/BiIF7MlDKyvs/3N6qGMthyzCx+6azEumh9x7zlKA=;
        b=fAWwMpDEZgjeFsLgESUWCr77pQtXlTPdOnuWsxubHrz+DJOML90wIbhFC3olJ/9M5y
         E+qrPN6HN0D0YJqBcrFskQViweSYf7dt6xR6BcD/d2Ai9+NKSGHff2dsMuBhlnGJCwX5
         UwezvA2iKqxKtjsAAklSd2S18Bf3q6LeGqHuNwQWarow1vaTszrMqZ8WXzZ6yyhC5olz
         5m6Qqa3/grMNGM/wmUK+g5hStmp0aLZvX/Bw4jYO88JyjtbSZBHVKVT3CQTT6RENZO4b
         wbvCVJWwoaPad8kld6XGDHEvD2vh5O5/zenElQC41EoUDf4yYH2Nxo1k7aPA+BJaE2Cq
         xZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sy/BiIF7MlDKyvs/3N6qGMthyzCx+6azEumh9x7zlKA=;
        b=TY9IriMgv9WgWRnCoQIW9kVfagcgLLAmsXkmEgVjW+6LluXzKeteDGZUL9DwSP1SzY
         ZsIuelfStkFlYi9gi3roRoGb33COMSqDmhnpOMNBVgsDJwXSdvD3tBAmSMtU4RGa+1ak
         7WWbvF8bzYgzyML5wGVItOQPwxVv1pSJzKo99LbXwK2Ihoos22zRXcjqLnmHDnZTQ6U+
         yAydMYjSZo2DMltTpMEreLIhWxcXklF5K0PGVJixksQ4m3j6YgiJVp6PsMpc4WmZsJxP
         EO5twXaaYh9aB8VJhAtyX8aIeVE+a70jkvWcLStA//jJjiZif6iRkDRBQI03skWJOugQ
         JWZw==
X-Gm-Message-State: AGi0PuZrMQSsoaIUMPZsDB8/PmLzC7ZY9JiB5qOD9FTTGcn3qMamIRzx
        sXVm0+q/AVIZCBYzj4lEWozOy4yE
X-Google-Smtp-Source: APiQypKTpD3mFp0Z5Xq1WcHmOAiYtei5qhCQm7A0dwP45V/+Ap6sUukXL1MJW2Nq7MZJFTfYGpX44Q==
X-Received: by 2002:a19:dcc:: with SMTP id 195mr14919048lfn.193.1587978441240;
        Mon, 27 Apr 2020 02:07:21 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id e7sm12205240lfc.72.2020.04.27.02.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 02:07:20 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Wolfram Sang <wsa@the-dreams.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
 <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo> <20200427084424.GA28817@kunai>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <820200ce-17f3-18c0-6f79-3e582f45492d@gmail.com>
Date:   Mon, 27 Apr 2020 12:07:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427084424.GA28817@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

27.04.2020 11:44, Wolfram Sang пишет:
> 
>> Wolfram, can you revert the following two patches for v5.7, please?
>>
>> 	8814044fe0fa i2c: tegra: Synchronize DMA before termination

This patch has nothing to do with your trouble, why do you want to
revert it?

>> 	a900aeac2537 i2c: tegra: Better handle case where CPU0 is busy for a long time
> 
> Sure, will do!
> 

