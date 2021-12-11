Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C229747160C
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Dec 2021 21:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhLKUMo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Dec 2021 15:12:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhLKUMn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Dec 2021 15:12:43 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88B5C061714;
        Sat, 11 Dec 2021 12:12:42 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id m27so23914852lfj.12;
        Sat, 11 Dec 2021 12:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=1NX00lfdfJEOmAGyiJqx+//AAUizbRo1RDb63QViKlk=;
        b=WLa28H62/MxLZ/L/Fc9vw8GNYtDrk/K22CQruONOV7GwAwD/dLgLjwXdwd7hZ+Hg2W
         EImb9TQZtJfGit9HwbXsz0vghR/slk9HUDpHGNwTKSlw34JRrUt/pzHbo0eSmyQgvsWH
         4P0bE7DhfkD6zZh1/rl0ITod5jA8IrkplpKRzRy5J8/njc2h309o73FiC3DV1Qi574nx
         0GByGwBSNdrrOG0z+C3CGa4KvkeMOZRPmt+0L0k0tiqBr19JLVTlur2U32muIfezGt01
         L0Q5sG1XgtCK8fMzuGpVg0rgtLV7T/OJ4SN9V8Yq1Us2OBGduqFViH7MB4sZLY12Fsep
         6h8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1NX00lfdfJEOmAGyiJqx+//AAUizbRo1RDb63QViKlk=;
        b=l3Rh/om4ZGTVazyqw3AQKMsoJUFrd3e9PAK27l19gDla/o1ocBCDPpzKB18+7IGxz4
         I7u6D4yoPsyrUzhLGqPU4RtXaHtbgvImdhQMdbJWr+HAlgXD/Pjieq+nQQJhLRbFFrmB
         BzdPgrEXRhUxhZaHRZAFW0YP0nsST5OL1f9mDf08SVcUVVtL46OaYTZB06+5+ZCNDM+A
         I4IUbGPIa6BzvpMyQ9Mb6vaEi6OfZTKQbvWAPRVmJPeXS5fI6CgNQ87o5UKX9vx3M6WI
         qjlwv0bzVeypI8+nK+zBwKoepNMqPuGWigYHSTatHLUon8yNceUmaDKGe6oQ1/kiyIIf
         G3xA==
X-Gm-Message-State: AOAM530r2RpDxL6owIFGxw+gg8T6Hicfmh7Re0z5o78YIaD1NWylmbFH
        oBzxIK5tPf129s9s4L5DMJcBvVmoqu4=
X-Google-Smtp-Source: ABdhPJwYvn9cCJZhDtDvzm/np2uqdT1CxD52LOZm/NibOjCeH2ooOvJR/7/oDphCpRJdH4VL2/A9tg==
X-Received: by 2002:ac2:4d0a:: with SMTP id r10mr18686144lfi.210.1639253560831;
        Sat, 11 Dec 2021 12:12:40 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id x18sm745539ljd.110.2021.12.11.12.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Dec 2021 12:12:40 -0800 (PST)
Subject: Re: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert
 functions
To:     Akhil R <akhilrajeev@nvidia.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
 <72ea6030-5f2d-4f51-3a42-8386c3638c65@gmail.com>
 <BN9PR12MB52733A443AA5D5A690CE7132C0719@BN9PR12MB5273.namprd12.prod.outlook.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <595413e0-3535-a40e-9a28-490d297c386a@gmail.com>
Date:   Sat, 11 Dec 2021 23:12:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <BN9PR12MB52733A443AA5D5A690CE7132C0719@BN9PR12MB5273.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.12.2021 12:38, Akhil R пишет:
>> Although, you shouldn't need it at all, use devm_gpiod_get_optional().
> smbus-alert is provided in the i2c dt bindings by default. I felt it is good
> to put it into use since the use case is same.

My point is that you don't need to use device_property_read_bool().

Instead, you could use devm_gpiod_get_optional() and check whether
returned GPIO is ERR or NULL (not present). Which could be a bit nicer
variant.
