Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D117B493A2A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 13:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354401AbiASMUl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 07:20:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234677AbiASMUj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 07:20:39 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15592C06173E;
        Wed, 19 Jan 2022 04:20:39 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id o12so8493274lfu.12;
        Wed, 19 Jan 2022 04:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=x7T608envSn65mtmAeo3YxF/Yj94yNBfmWXtPvIkNW0=;
        b=I/eG5Cu69oB4/0oQ+fNPOnT9X0A31uHTGLbkOqXSP7km1HqT2g9YJ8jwlJeqCJVsAy
         R6huVxNhLier+x2F5E/+ai9eX5ff/0dNk1rb9ZMsVsD+hH3gq3zgg08CK5l/R8+wRIGc
         cd3O1DQmqr1LBrAvWyqCKMB6NKrwgcRPjVV+aizoDmxbsXFyKb+GJaCT+MqqflrdLuD6
         xA5dyqgr/r9CUvx02JhdnzXHqiX2QCLZVV1eHWt9bAG4Q5tQAhWETakkBjfSl12NJQs+
         mkOGqBRzuql17MJxD1gOsHm0whP8y6DhyjdMZPI4EFEFyZ6eVnT9ZVqJyNQ3BdOUWiiS
         5L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x7T608envSn65mtmAeo3YxF/Yj94yNBfmWXtPvIkNW0=;
        b=mmO5bLA5HmH/Ogfl8MOVwcamEb9ZY+9JPBFExgjU2DtUHHg8TthyP5ZALdbFa6OGqp
         hhO390HVCoAJcD9PQ2yPeUefQjAC3O7MUSLnsCRTUojCM+YMDXTJ3mPryBp+K/FDEFvE
         tZWouydomG6TrbZNZOR+U5Y8YHTHtvfr8EGUff3wSp+Zv79UrGGtVh/9e9QBAY3l5sWE
         lo+kjd2DQZqat2X8LYQV04rjz7tiQYvVm8ZkLKFEkT3VEcBc04SbkkTMq2uHnZAyuQF3
         ra6h9k+HWgNdT6TYVWmktOnHjzbh4/76a8BGFOjW9lbZmvHt4aZZcVD9cq5wp5wDzSa1
         Ys3A==
X-Gm-Message-State: AOAM530iSxChbOEeMWnxjJ1/sBwcBdhty2C+qGsGNnV/QSk9NCvF1ks8
        DJNusHrzjNAZOdyAQRUcfyeq3nbjnGg=
X-Google-Smtp-Source: ABdhPJwe3MenFJXbtwjTP43X46FVmE45XDOXbaFhj5zqSnHc1YYf6U7W+nqb8VaP4KwEdb0Uqiaqgg==
X-Received: by 2002:a05:651c:2059:: with SMTP id t25mr24872735ljo.427.1642594837409;
        Wed, 19 Jan 2022 04:20:37 -0800 (PST)
Received: from [192.168.2.145] (109-252-139-36.dynamic.spd-mgts.ru. [109.252.139.36])
        by smtp.googlemail.com with ESMTPSA id z13sm141770lfr.183.2022.01.19.04.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 04:20:36 -0800 (PST)
Message-ID: <a7a33c29-427d-5e82-f327-aa4701d51898@gmail.com>
Date:   Wed, 19 Jan 2022 15:20:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] i2c: tegra: Add support for Tegra234 I2C
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Petlozu Pravareshwar <petlozup@nvidia.com>
References: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
 <1642080623-15980-2-git-send-email-akhilrajeev@nvidia.com>
 <d9a21970-b403-4674-dbd6-5dfab0a83a3b@gmail.com>
 <DM5PR12MB1850237ECA6C115AD776635EC0599@DM5PR12MB1850.namprd12.prod.outlook.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <DM5PR12MB1850237ECA6C115AD776635EC0599@DM5PR12MB1850.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

19.01.2022 11:20, Akhil R пишет:
>> 13.01.2022 16:30, Akhil R пишет:
>>> +static const struct tegra_i2c_hw_feature tegra234_i2c_hw = {
>>> +     .has_continue_xfer_support = true,
>>> +     .has_per_pkt_xfer_complete_irq = true,
>>> +     .clk_divisor_hs_mode = 0x2,
>>> +     .clk_divisor_std_mode = 0x4f,
>>> +     .clk_divisor_fast_mode = 0x58,
>>> +     .clk_divisor_fast_plus_mode = 0x24,
>>> +     .has_config_load_reg = true,
>>> +     .has_multi_master_mode = true,
>>> +     .has_slcg_override_reg = true,
>>> +     .has_mst_fifo = true,
>>> +     .quirks = &tegra194_i2c_quirks,
>>> +     .supports_bus_clear = true,
>>> +     .has_apb_dma = false,
>>> +     .tlow_std_mode = 0x8,
>>> +     .thigh_std_mode = 0x7,
>>> +     .tlow_fast_fastplus_mode = 0x1,
>>> +     .thigh_fast_fastplus_mode = 0x1,
>>> +     .setup_hold_time_std_mode = 0x08080808,
>>> +     .setup_hold_time_fast_fast_plus_mode = 0x02020202,
>>> +     .setup_hold_time_hs_mode = 0x090909,
>>> +     .has_interface_timing_reg = true, };
>>
>> Why tegra194_i2c_hw can't be reused by T234? Looks like I2C h/w hasn't
>> changed and somebody just made a minor tuning of the timing parameters, does
>> it really matter in practice?
> The timing parameters are important to get the desired data rate for I2C. The values,
> unfortunately, cannot be reused from Tegra194.

From where those T194 parameters specified in the Tegra I2C driver came
from?

I'm now looking at T194 TRM (Xavier_TRM_DP09253002_v1.3p 10.2.3.1.1
Example Settings for Various I2C Speeds) and see that all the values
should match T234. Please check whether T194 configuration is correct
and fix it if needed.
