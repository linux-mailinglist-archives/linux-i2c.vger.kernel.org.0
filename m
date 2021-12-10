Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856684706EB
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Dec 2021 18:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243779AbhLJR1k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Dec 2021 12:27:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhLJR1j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Dec 2021 12:27:39 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33923C061746;
        Fri, 10 Dec 2021 09:24:04 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id k23so14800286lje.1;
        Fri, 10 Dec 2021 09:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=2IHG+224jizpqOrnxgQSmdGEKmll0BWkyNyhmdaM0bE=;
        b=L5qlDiCtGk1LiLizXL2C6SosffEX7C64GJhEQltHM2lxsdWBecylY8QgwtBctzYaa0
         eRX94RDRAps8pDAdUWSZDSp4KDRKmrv+6NF7KI/MGHQ6MP0JlGfemBo2sTRDRHqQwiF6
         /FQXqObm9BQVYaVmx2RauEGl8RgYmpDgHSlJNnVMDPRJc6yDsY87QE0tjQ94VB/y8etf
         5gluf975JfpOIxvq1ML3eTnGcxuS8zkHVCJkKeijTbciMD9lSyI290Fz4BW6SGGF6Uhw
         A6TmpOfh8AECTpbwBkzWLC+lbvHxHDZSHPIv2O8LmX/pje3wghTv1/68pqkKx/POekwg
         MPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2IHG+224jizpqOrnxgQSmdGEKmll0BWkyNyhmdaM0bE=;
        b=0CmMpt4CqZXlvIAamvxbQa+nIUKrBD0iG5hPdSTuyCyLu12ojLX40SMF0AYBE2Mqrc
         CDOaWr1shyMCFSBs68naz/RsWpiASuEzM+Yjs2uJUL7tX1e7cs4BN4+vQKsb3iA72Np3
         Q6i/BKn2Ui6aiti9mWf2/+ItLq0eiBX8w7IU4PhGBj0sitFEjAMxX5xfen985bRLICCF
         Ia7AlX9kKRwuzZvnytMwKQLqfZ58jlKBcJITjrNg+gt+rqdJH7cPxmKEYmSq3vnhwRve
         GjpCeC93Oeobqj6Oxkt4J1Xrkf4wEkhcgcbCXx8vUAEAF2rQ59yo9zASVfaeL38NaX+3
         Wq6g==
X-Gm-Message-State: AOAM532vsEBhRLgCFSJdyHIW1zx7/SKKLfl/7BR9Gj0zjdsts9xntHCa
        o8KoQI1dALNLS+zyN0C2+exGw+B1GD8=
X-Google-Smtp-Source: ABdhPJwZkhCEsqEVnMoHnpOfPKK8tGBlJt+jCpYBEDSjDTIq0Rj+8s36PTIWmcqQKXwGFvvjVGV+kw==
X-Received: by 2002:a2e:9b17:: with SMTP id u23mr14238757lji.258.1639157042322;
        Fri, 10 Dec 2021 09:24:02 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id a1sm397489lfb.190.2021.12.10.09.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 09:24:01 -0800 (PST)
Subject: Re: [PATCH v3] i2c: tegra: use i2c_timings for bus clock freq
To:     Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
        christian.koenig@amd.com, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        p.zabel@pengutronix.de, sumit.semwal@linaro.org,
        thierry.reding@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1639138557-1709-1-git-send-email-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1056abdf-684b-b808-3471-d4733fd5e449@gmail.com>
Date:   Fri, 10 Dec 2021 20:24:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1639138557-1709-1-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.12.2021 15:15, Akhil R пишет:
> Use i2c_timings struct and corresponding methods to get bus clock frequency
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Note that your s-b should be the last line of the commit message. No
need to resend for that.

> ---
>  drivers/i2c/busses/i2c-tegra.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> v2->v3: Removed unused variable 'err'.
> v1->v2: Added temp var for i2c_timings struct in function.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
