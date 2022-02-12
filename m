Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C094B37C1
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Feb 2022 21:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbiBLUJE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Feb 2022 15:09:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbiBLUJD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Feb 2022 15:09:03 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C235D64D;
        Sat, 12 Feb 2022 12:08:58 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id c15so16915288ljf.11;
        Sat, 12 Feb 2022 12:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=iDqtOt/nsLXFW/P9mlVQ5J44jLF7B4SNG/aEUEeVTQk=;
        b=gkBUn3SFuVkRVSWRVkzAtpgzYTtKCAYVtuV61OVZNQXAOe3kqPOEQcc8Lso542ttgQ
         jDHuv5Cz6JM9WLN3u/jTCoZzYWsGD6NjPG5IPgZ1CO1xiMxkLsTKBum+R4SVgr0w1uf0
         O8Gwx7ELLa4CK6mhaz+sLqy3Ya0JwE0VqW4xL5XAJNaXeutKEvolrDnnfnaiE7V3Bwng
         Mga9jPodJDGOWPOq83gALwnaPj5lGQPFBy3MTVsCBTlPkRRhoh3X519HzAxg91FmctfP
         Ifb2VQc8ezdlLw2J+x+Ug8nqhf3H/IUVgtKOCvO/HuFuHLi/RcblCKMEafPPg8jnO5Pk
         +VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=iDqtOt/nsLXFW/P9mlVQ5J44jLF7B4SNG/aEUEeVTQk=;
        b=nQL6JLNtf1JiptvxrG2E+j2D4CZ4oohT/th/d1j0ybf0n+cKFzLwxlri4oG5BaOSsz
         W2GFXOubUbx8lXEscmurr2ytC4xIn4jCB8NvcyhEuhvt7Wv8LRseT5B6gihMsGF8yu5T
         Prf2J6LR3ckgz3U20QqBVwbGPBgaZCiajg64UBGBXByeybC2bxTZ7Z10zd0K41+oQvsh
         l9TQV2gPZvCuO4TZC6scmxUoMxE+rHx/PWOeRV0ng/d7bXUjyRLtPpgMq08rhwZ24a7J
         NbDJSOot+PhvasTucZi6qrcG4r9D/tvGBfjkWOg4zmUuszDZXlhnFHafLoBXNXOt6Tj/
         gDCQ==
X-Gm-Message-State: AOAM5300R9OBpT58AuugNLJwzkldTLapTOAtaqUsCdPobGSxKPbbp575
        CNxgp51IESOlyQkl3u+AZM4=
X-Google-Smtp-Source: ABdhPJwAQltC+YgEKXEFlwdqkX9QRERgt4D8ITsRpwWGHRQR11NMjnxXrSD+IyQg+uO+yGgU+ilsgQ==
X-Received: by 2002:a2e:9091:: with SMTP id l17mr4546428ljg.474.1644696536629;
        Sat, 12 Feb 2022 12:08:56 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id k12sm3534514ljh.45.2022.02.12.12.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Feb 2022 12:08:56 -0800 (PST)
Message-ID: <f3db5152-0e1f-4258-4cfd-521828a243c2@gmail.com>
Date:   Sat, 12 Feb 2022 23:08:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RESEND] i2c: tegra: Add SMBus block read function
Content-Language: en-US
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <94fc8b11-6149-56ca-a028-cf7f39930992@gmail.com>
 <ff83adba-7919-fa48-4637-a4cb9b94a8e1@gmail.com>
In-Reply-To: <ff83adba-7919-fa48-4637-a4cb9b94a8e1@gmail.com>
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

12.02.2022 19:20, Dmitry Osipenko пишет:
> 12.02.2022 19:15, Dmitry Osipenko пишет:
>> 11.02.2022 12:11, Akhil R пишет:
>>>> 10.02.2022 18:36, Akhil R пишет:
>>>>> Emulate SMBus block read using ContinueXfer to read the length byte
>>>>>
>>>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>>>> ---
>>>>>  drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++++++++--
>>>>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>>>> index 03cea102ab76..2941e42aa6a0 100644
>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>> @@ -1233,6 +1233,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev
>>>> *i2c_dev,
>>>>>               return err;
>>>>>
>>>>>       i2c_dev->msg_buf = msg->buf;
>>>>> +
>>>>> +     /* The condition true implies smbus block read and len is already read */
>>>>> +     if (msg->flags & I2C_M_RECV_LEN && end_state !=
>>>> MSG_END_CONTINUE)
>>>>> +             i2c_dev->msg_buf = msg->buf + 1;
>>>>> +
>>>>>       i2c_dev->msg_buf_remaining = msg->len;
>>>>>       i2c_dev->msg_err = I2C_ERR_NONE;
>>>>>       i2c_dev->msg_read = !!(msg->flags & I2C_M_RD);
>>>>> @@ -1389,6 +1394,15 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap,
>>>> struct i2c_msg msgs[],
>>>>>                       else
>>>>>                               end_type = MSG_END_REPEAT_START;
>>>>>               }
>>>>> +             /* If M_RECV_LEN use ContinueXfer to read the first byte */
>>>>> +             if (msgs[i].flags & I2C_M_RECV_LEN) {
>>>>> +                     ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i],
>>>> MSG_END_CONTINUE);
>>>>> +                     if (ret)
>>>>> +                             break;
>>>>> +                     /* Set the read byte as msg len */
>>>>> +                     msgs[i].len = msgs[i].buf[0];
>>>>> +                     dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
>>>>> +             }
>>>>>               ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], end_type);
>>>>>               if (ret)
>>>>>                       break;
>>>>> @@ -1416,10 +1430,10 @@ static u32 tegra_i2c_func(struct i2c_adapter
>>>> *adap)
>>>>>  {
>>>>>       struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
>>>>>       u32 ret = I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL &
>>>> ~I2C_FUNC_SMBUS_QUICK) |
>>>>> -               I2C_FUNC_10BIT_ADDR | I2C_FUNC_PROTOCOL_MANGLING;
>>>>> +               I2C_FUNC_10BIT_ADDR | I2C_FUNC_PROTOCOL_MANGLING;
>>>>>
>>>>>       if (i2c_dev->hw->has_continue_xfer_support)
>>>>> -             ret |= I2C_FUNC_NOSTART;
>>>>> +             ret |= I2C_FUNC_NOSTART | I2C_FUNC_SMBUS_READ_BLOCK_DATA;
>>>>>
>>>>>       return ret;
>>>>>  }
>>>>
>>>> Please describe how this was tested.
>>> This is tested using an I2C EEPROM to emulate SMBus block read in which
>>> we read the first byte as the length of bytes to read. This is an expected
>>> feature for NVIDIA Grace chipset where there will be an actual SMBus device.
>>
>> We have several Tegra30+ tablets that have EC on SMBus. Svyatoslav tried
>> your I2C patch + [1] on Asus TF201 and reported that it breaks EC. Any
>> idea why it doesn't work?
>>
>> [1]
>> https://github.com/grate-driver/linux/commit/aa8d71f5a960ef40503e5448c622d62d1c53a2c0
> 
> Ah, I see now that I2C_FUNC_SMBUS_WRITE_BLOCK_DATA not supported, we
> should check again without the write then.

We also missed that i2c_smbus_read_i2c_block_data() populates the first
byte of the read data with the transfer size. So
i2c_smbus_read_block_data() actually works properly.

It's unclear to me what's the point of emulating
I2C_FUNC_SMBUS_READ_BLOCK_DATA within the driver if you could use
i2c_smbus_read_i2c_block_data().
