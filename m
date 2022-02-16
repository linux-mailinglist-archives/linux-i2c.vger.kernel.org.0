Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC93E4B90B8
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Feb 2022 19:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237840AbiBPSvl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Feb 2022 13:51:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234614AbiBPSvk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Feb 2022 13:51:40 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B95635B;
        Wed, 16 Feb 2022 10:51:27 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id b38so4719154ljr.12;
        Wed, 16 Feb 2022 10:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Tiu2ZnjcXQvv8hwY5jgUCAWagGFM9zSK8+LojuR4cPI=;
        b=lWzx7zDXx3qFvpUYcXA3GjBy8AFydW+Sv7aMm4MGEwAq4YCEbzMIuAEC2Q6w4mItbp
         /NYzTeiz2Sc6UlgJ21fc6GGpMqUWbSLR29fYedvCTHM55H8vwcZnvbt9VX94pG/oH6es
         FC0xa1Nw7twScHktryTg3du6DB2GGFQkpfZCFlAr7Vioikb8gFY8UuWg0/DejNtd2Qg1
         aXX4vVh/MUV8IspzgAxK1G6rWOEXLc47JEiJO5i1bvtp20HLOTPCy2pbFjO//Lps1fpK
         iPeifyFBFCpNtRXifu1QgM55/rViyqzznzGQlY/sl+w4ipkcq36OTtrzKgtq2FzPMGJG
         il1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Tiu2ZnjcXQvv8hwY5jgUCAWagGFM9zSK8+LojuR4cPI=;
        b=xHw5r/oKoCvPpsxOdUyT4NsfEciELDHLlH5SjwSyfYf2QlTUSjJgBskRPxfwykNw/1
         hD4hzqP4GO+KbI/Iv/KhmnTPISOvtcAYGJ++5zuxmuN/4V999Bl3am5aqKG2PiNtqfxr
         TSb7Rf7qRBEN19/dSaaPhcYBpkwcl/occnmvOdkRVWuMbNKMEyJq4AM4KORLNTPuvUYW
         /6DkBpF1XcjkcMceVmoQrjgBCz+3eHsq7lWOuJIvWsyuAZBVWvty9lNPoqqZ2smWmbna
         7K1xGYTyci9pC37IkYD8IiLf7/bSZEtW/yuM4qJKaOhPLJS1uQnGzpoAHL6q4jqwrq2L
         CqAw==
X-Gm-Message-State: AOAM531+qdG+aoPl2CBogMwgX4ftv78Ze/Th5ZQW4SAEcV703wRABZpt
        2Mbucm+JCa8wWo2eXkVT7m0=
X-Google-Smtp-Source: ABdhPJxapaIdUgCUxgOADbvl4YsAYiVoQcGqvdxB5AE5tLAZLsfcoNUUvMk2/gnGlUBFWfysp4xuHQ==
X-Received: by 2002:a2e:b0cc:0:b0:235:dcdf:e6e9 with SMTP id g12-20020a2eb0cc000000b00235dcdfe6e9mr3366152ljl.88.1645037485423;
        Wed, 16 Feb 2022 10:51:25 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id c5sm1434599lfc.267.2022.02.16.10.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 10:50:47 -0800 (PST)
Message-ID: <178fd94a-3e2f-2ad7-dd6b-92f8c97d76a1@gmail.com>
Date:   Wed, 16 Feb 2022 21:50:36 +0300
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
 <bfed059f-046c-63e9-800f-b8c9b1544471@gmail.com>
 <DM5PR12MB1850AF583634853FB796581CC0359@DM5PR12MB1850.namprd12.prod.outlook.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <DM5PR12MB1850AF583634853FB796581CC0359@DM5PR12MB1850.namprd12.prod.outlook.com>
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

16.02.2022 06:54, Akhil R пишет:
>> 14.02.2022 07:49, Akhil R пишет:
>>>> It's unclear to me what's the point of emulating
>>>> I2C_FUNC_SMBUS_READ_BLOCK_DATA within the driver if you could use
>>>> i2c_smbus_read_i2c_block_data().
>>> We are looking to support I2C_M_RECV_LEN where the length is read from
>>> the first byte of data. I see that i2c_smbus_read_i2c_block_data()
>>> requires the length to be passed from the client driver.
>>>
>>> BTW, I2C_FUNC_SMBUS_WRITE_BLOCK_DATA is also expected to be
>> supported.
>>> It is included in I2C_FUNC_SMBUS_EMUL. I suppose, it doesn't require
>>> any additional change in the driver. The client driver should populate
>>> the first byte as the length of data to be transferred.
>>
>> Please support both read and write.
> Both read and write are supported. Write doesn't require any additional
> change in the driver as far as I understand.
> 
> It is actually the same that I mentioned before. Or am I missing something here?

I missed that I2C_FUNC_SMBUS_EMUL includes I2C_FUNC_SMBUS_WRITE_BLOCK_DATA.
