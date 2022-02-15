Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A98E4B79B7
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 22:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242802AbiBOVdu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 16:33:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244415AbiBOVdu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 16:33:50 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27775F4057;
        Tue, 15 Feb 2022 13:33:39 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id t14so408725ljh.8;
        Tue, 15 Feb 2022 13:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Ovvir5BtpZLZ8DCjyJs2646HrpaMhCZVk8jBms3NL6w=;
        b=dCy5EmnocrQKemV8SOj+IlR/sNEHWp1BrACPRUYSEzyeUijyBIqMX7SJJOfCk9zKZq
         RuzvecWZC6XYj8VaJTm2lX/mwx5PfJq4Lmc4L+QMcnkmMUwXBZjEzGDxzpZ2G9jAMlf5
         dnGBIw8ZqgTLNP8JK7Td6hmXG4OxO9Nu10wkL6tjPWCHI8xFlhGTTHFRBJ0Qt4Q/zmhv
         LZ3GRWU9NDow8/aR/dmhTmxInK89gaY2czlLuI5WosqE7YeSvbOiROwGSMxSFLKz7GGC
         pSn+OaIDLKKBjbtDOu7wxxn1/tYB/O3TGSUtthAL0qvyzTD+y83EG+Z4TqHJA7pF5TZS
         L1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ovvir5BtpZLZ8DCjyJs2646HrpaMhCZVk8jBms3NL6w=;
        b=ZhnVxIHQJVESsABUcRYNaot25r93kmbx5gp/stmxNcZyfbjtAi1suhsfvfp2jnQyxr
         P9dFqgkUJI7KVt9lrxqI/mC2G7XWVwSwBvRxVe2Jk7EZrBhdcpcaG1p1ZvP/j0Sust35
         iEHZ0NhtEP6TgfnH2s/+FidwhnVkHbF0R7yM576QtxRpU4PFkSDS+I2xGX2FS2siRv+h
         Kxv5TqZ00PEEjrgxq6V0twu/Q8S/Vl9xCval2LtqAaL4kcj5l0ivM6IIriIaImaV148E
         D5yvuRb1RWMy0nYuw2tfntkcfero2R7UDGQT76qTis8lERHv1lNU8z32ZTnj8YyCLols
         VHpQ==
X-Gm-Message-State: AOAM532zYT4KRCK5hNYDNQEqhVaIYpK5dZp2rGH17MK97NjyXjqX/sdW
        orslHZXIUNiO/CakY1z10TQ=
X-Google-Smtp-Source: ABdhPJyApZwOB54j1wGuh+A5cT9IZ70e0f6fM/BpGnGfw64Q4qGeMP1F38CSuo7bSA4zsY9lqc/jrQ==
X-Received: by 2002:a05:651c:199e:: with SMTP id bx30mr705963ljb.274.1644960817394;
        Tue, 15 Feb 2022 13:33:37 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id k5sm162684ljc.4.2022.02.15.13.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 13:33:36 -0800 (PST)
Message-ID: <bfed059f-046c-63e9-800f-b8c9b1544471@gmail.com>
Date:   Wed, 16 Feb 2022 00:33:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
References: <20220210153603.61894-1-akhilrajeev@nvidia.com>
 <ae6d300f-962d-9731-bb78-3594b4c31aea@gmail.com>
 <DM5PR12MB18502CF86E602F7071A1EA58C0309@DM5PR12MB1850.namprd12.prod.outlook.com>
 <94fc8b11-6149-56ca-a028-cf7f39930992@gmail.com>
 <ff83adba-7919-fa48-4637-a4cb9b94a8e1@gmail.com>
 <f3db5152-0e1f-4258-4cfd-521828a243c2@gmail.com>
 <DM5PR12MB18509DCA809CCE62A4A74133C0339@DM5PR12MB1850.namprd12.prod.outlook.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <DM5PR12MB18509DCA809CCE62A4A74133C0339@DM5PR12MB1850.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

14.02.2022 07:49, Akhil R пишет:
>> It's unclear to me what's the point of emulating
>> I2C_FUNC_SMBUS_READ_BLOCK_DATA within the driver if you could use
>> i2c_smbus_read_i2c_block_data().
> We are looking to support I2C_M_RECV_LEN where the length is read from the
> first byte of data. I see that i2c_smbus_read_i2c_block_data() requires the length
> to be passed from the client driver.
> 
> BTW, I2C_FUNC_SMBUS_WRITE_BLOCK_DATA is also expected to be supported.
> It is included in I2C_FUNC_SMBUS_EMUL. I suppose, it doesn't require any additional
> change in the driver. The client driver should populate the first byte as the length
> of data to be transferred.

Please support both read and write.
