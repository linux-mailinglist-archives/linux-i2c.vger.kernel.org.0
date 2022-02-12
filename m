Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61E5D4B3643
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Feb 2022 17:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236257AbiBLQP2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Feb 2022 11:15:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbiBLQP1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Feb 2022 11:15:27 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315F5B9;
        Sat, 12 Feb 2022 08:15:23 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id k10so13470029ljq.2;
        Sat, 12 Feb 2022 08:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=+bLQNNEblIC5geVmVX1Ky6VyAG+e5kuw8DN9ed77ZzA=;
        b=GHQRW//KaW4Xpt121VAS4so1huVepme3fuw/Kjn4ztzP27D/OB5pu7dCjFN/6caGrw
         IfxppmLgUaxoLaOq+Y/ZR9Am6D979iantFvS4iQ108lgEJAqpHWJiCthUET72raHNWNP
         iNOWqVG4n2AgpzwzdR6pxUUQEyUc/O/kxVAHTtbzQ29iLUWj9GQFjfkOK4X5dASEJEHA
         1p+OYQXhsGy0kQJIsoTHquEqvn+t3B08M7Eb+11+GKOsMqCjZi0M32mLZ5WvBBBv2BDz
         06mLvKmjcE96R6EP2KbBw1P+JYZECA4TqRxS4ChtbSFfl909HtaisasioMpnsx569X7q
         /pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+bLQNNEblIC5geVmVX1Ky6VyAG+e5kuw8DN9ed77ZzA=;
        b=qveYZDMd/kq3QRPX8LuCR3s3zD2kaKTb4it35EOfjiHMJ/C+8X3USQHldYEm4EV1pt
         gFgpXU4s+wauDq2cu56ai3X/7Qquuhq7ntUgO/dI7lQZr7e+f7DpUtjSNwi/la5NHP4u
         UxKJQKpeGh9+27HH9rImcfIgj81T9zBfjaKTdfef1UbbSskB1GqNnqEUZZ+kZm6zFhnQ
         L/Iq6v63BHs0DjhYw95e2LTM7PB05lrpbi52+E/mGGXPTF4DLi//oMfwPTcZ9X/Vk0oo
         j7mErkpHcNZnhRzMiXGsaF/57KDKnS5dw/1BLc/1/ZEwnmx1JUlJejwOpbJIv8Rrednq
         FPXA==
X-Gm-Message-State: AOAM530t0bP8PB9BxL5yNBMr2QvvNB4wMybjoonm0MnlRkpoxzHDNlGq
        ra8rnV3qt7XwFIW2Bf4BFx4=
X-Google-Smtp-Source: ABdhPJzAjvqOlnVtrEiBCtkwlBi6lYk7q1tbFL2n84J71inN9lg9sVtQrnl+docZUl+hUBVF1+2CBA==
X-Received: by 2002:a2e:2c11:: with SMTP id s17mr3949493ljs.424.1644682521353;
        Sat, 12 Feb 2022 08:15:21 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id d11sm2660320lfl.92.2022.02.12.08.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Feb 2022 08:15:20 -0800 (PST)
Message-ID: <94fc8b11-6149-56ca-a028-cf7f39930992@gmail.com>
Date:   Sat, 12 Feb 2022 19:15:20 +0300
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
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20220210153603.61894-1-akhilrajeev@nvidia.com>
 <ae6d300f-962d-9731-bb78-3594b4c31aea@gmail.com>
 <DM5PR12MB18502CF86E602F7071A1EA58C0309@DM5PR12MB1850.namprd12.prod.outlook.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <DM5PR12MB18502CF86E602F7071A1EA58C0309@DM5PR12MB1850.namprd12.prod.outlook.com>
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

11.02.2022 12:11, Akhil R пишет:
>> 10.02.2022 18:36, Akhil R пишет:
>>> Emulate SMBus block read using ContinueXfer to read the length byte
>>>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>> ---
>>>  drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++++++++--
>>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> index 03cea102ab76..2941e42aa6a0 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -1233,6 +1233,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev
>> *i2c_dev,
>>>               return err;
>>>
>>>       i2c_dev->msg_buf = msg->buf;
>>> +
>>> +     /* The condition true implies smbus block read and len is already read */
>>> +     if (msg->flags & I2C_M_RECV_LEN && end_state !=
>> MSG_END_CONTINUE)
>>> +             i2c_dev->msg_buf = msg->buf + 1;
>>> +
>>>       i2c_dev->msg_buf_remaining = msg->len;
>>>       i2c_dev->msg_err = I2C_ERR_NONE;
>>>       i2c_dev->msg_read = !!(msg->flags & I2C_M_RD);
>>> @@ -1389,6 +1394,15 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap,
>> struct i2c_msg msgs[],
>>>                       else
>>>                               end_type = MSG_END_REPEAT_START;
>>>               }
>>> +             /* If M_RECV_LEN use ContinueXfer to read the first byte */
>>> +             if (msgs[i].flags & I2C_M_RECV_LEN) {
>>> +                     ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i],
>> MSG_END_CONTINUE);
>>> +                     if (ret)
>>> +                             break;
>>> +                     /* Set the read byte as msg len */
>>> +                     msgs[i].len = msgs[i].buf[0];
>>> +                     dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
>>> +             }
>>>               ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], end_type);
>>>               if (ret)
>>>                       break;
>>> @@ -1416,10 +1430,10 @@ static u32 tegra_i2c_func(struct i2c_adapter
>> *adap)
>>>  {
>>>       struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
>>>       u32 ret = I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL &
>> ~I2C_FUNC_SMBUS_QUICK) |
>>> -               I2C_FUNC_10BIT_ADDR | I2C_FUNC_PROTOCOL_MANGLING;
>>> +               I2C_FUNC_10BIT_ADDR | I2C_FUNC_PROTOCOL_MANGLING;
>>>
>>>       if (i2c_dev->hw->has_continue_xfer_support)
>>> -             ret |= I2C_FUNC_NOSTART;
>>> +             ret |= I2C_FUNC_NOSTART | I2C_FUNC_SMBUS_READ_BLOCK_DATA;
>>>
>>>       return ret;
>>>  }
>>
>> Please describe how this was tested.
> This is tested using an I2C EEPROM to emulate SMBus block read in which
> we read the first byte as the length of bytes to read. This is an expected
> feature for NVIDIA Grace chipset where there will be an actual SMBus device.

We have several Tegra30+ tablets that have EC on SMBus. Svyatoslav tried
your I2C patch + [1] on Asus TF201 and reported that it breaks EC. Any
idea why it doesn't work?

[1]
https://github.com/grate-driver/linux/commit/aa8d71f5a960ef40503e5448c622d62d1c53a2c0
