Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8682A6C51
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Nov 2020 19:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732147AbgKDSBf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Nov 2020 13:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729718AbgKDSBe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Nov 2020 13:01:34 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98E9C0613D4
        for <linux-i2c@vger.kernel.org>; Wed,  4 Nov 2020 10:01:34 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id x23so10661879plr.6
        for <linux-i2c@vger.kernel.org>; Wed, 04 Nov 2020 10:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=+jiLFbkdhETYcwPwjRNUR6BHun275xgC+h6E+mSiOcI=;
        b=Lysic94t2bBLlHDprPaIytfsFoHzsHS1KqycbeHEucsNR8g69/YvfIt8b/Aqpq9s43
         1BlHFSZ9ELTzPAZeCPelNUn6SpU2pVrRpv/R0ENnub2Tj0xxUTPdYsP7bxjm5PmW31yU
         0DjFdFyhYYr7aRbCJlpDewBZkpIyqnP6nm7q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=+jiLFbkdhETYcwPwjRNUR6BHun275xgC+h6E+mSiOcI=;
        b=hOHygh9Cr4eByEzhyKXYc82kxOJaBGZQLHEQX7a3jiR4qbEnfVZaRxV9IJFFBhrg6f
         et0eqfv+EYilVDU7HUtG+xwOJ17yylK3DraTwRQz5XSgUtNW6bcMiSkIZGrAUjVjeu6Z
         GHtPIkf48RCKByV3Zi+9azG1L3tL75XubgWSdCdUH4RioT4oh5JImN/CQ6NoKTV0iz/N
         6YQ8LKF6ysinn1Jt0H5tcSrh16pp9lVZCT+l5o+msgfhGjKigeVY/Qync9oSKIHncYV/
         9YusVfCF68BPckKW2uaw3LmY4Bad0hr0N9xRWhvBXxmCnpOlCma/c3/ot7zceiM3H1MQ
         SpvQ==
X-Gm-Message-State: AOAM531p2mXerPeYWEPUtMcT/i8e4k5RxojHDr7SHJ8wKs3OU6JEVILP
        YnjaM1zk5FYeUKxkjF3WrlT6xg==
X-Google-Smtp-Source: ABdhPJxYdYQ60QyrOurwYf3i1tIWRYc7HuQmU5W7wZN9870oXZaXoJO5aHhGN69/spm6QTmsMQA35g==
X-Received: by 2002:a17:902:8c88:b029:d6:d0e4:7e1b with SMTP id t8-20020a1709028c88b02900d6d0e47e1bmr13278681plo.70.1604512893873;
        Wed, 04 Nov 2020 10:01:33 -0800 (PST)
Received: from [10.230.1.222] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id h26sm3047654pfq.139.2020.11.04.10.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 10:01:32 -0800 (PST)
Subject: Re: [PATCH v3 5/6] i2c: iproc: handle master read request
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20201102035433.6774-6-rayagonda.kokatanur@broadcom.com>
 <861d734f-c776-f70b-e414-a4b32c0f991e@gmail.com>
 <CAHO=5PGdcN2V8XOKdtTHwUBJW9eB2mjQ-CeMvwK4Rem7KBy5GA@mail.gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <97a8d7bf-e877-c03a-f789-16cac9bb2643@broadcom.com>
Date:   Wed, 4 Nov 2020 10:01:06 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAHO=5PGdcN2V8XOKdtTHwUBJW9eB2mjQ-CeMvwK4Rem7KBy5GA@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="0000000000001c145d05b34bc5ef"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--0000000000001c145d05b34bc5ef
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/3/2020 7:57 PM, Rayagonda Kokatanur wrote:
> On Wed, Nov 4, 2020 at 9:05 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>>
>>
>> On 11/2/2020 10:19 PM, Dhananjay Phadke wrote:
>>> On Mon,  2 Nov 2020 09:24:32 +0530, Rayagonda Kokatanur wrote:
>>>
>>>> Handle single or multi byte master read request with or without
>>>> repeated start.
>>>>
>>>> Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
>>>> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
>>>> ---
>>>>  drivers/i2c/busses/i2c-bcm-iproc.c | 215 +++++++++++++++++++++++------
>>>>  1 file changed, 170 insertions(+), 45 deletions(-)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
>>>> index 7a235f9f5884..22e04055b447 100644
>>>> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
>>>> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
>>>> @@ -160,6 +160,11 @@
>>>>
>>>>  #define IE_S_ALL_INTERRUPT_SHIFT     21
>>>>  #define IE_S_ALL_INTERRUPT_MASK      0x3f
>>>> +/*
>>>> + * It takes ~18us to reading 10bytes of data, hence to keep tasklet
>>>> + * running for less time, max slave read per tasklet is set to 10 bytes.
>>>> + */
>>>> +#define MAX_SLAVE_RX_PER_INT         10
>>>>
>>>
>>> In patch [3/6], you've enabled IS_S_RX_THLD_SHIFT in slave ISR bitmask,
>>> however it's not actually used in processing rx events.
>>>
>>> Instead of hardcoding this threshold here, it's better to add a
>>> device-tree knob for rx threshold, program it in controller and handle
>>> that RX_THLD interrupt. This will give more flexibility to drain the rx
>>> fifo earlier than -
>>> (1) waiting for FIFO_FULL interrupt for transactions > 64B.
>>> (2) waiting for start of read transaction in case of master write-read.
> 
> Yes this is one way to implement.
> But do you see any issue in batching 64 bytes at a time in case of
> transaction > 64 Bytes.
> I feel batching will be more efficient as it avoids more number of
> interrupts and hence context switch.
> 
>>
>> The Device Tree is really intended to describe the hardware FIFO size,
>> not watermarks, as those tend to be more of a policy/work load decision.
>> Maybe this is something that can be added as a module parameter, or
>> configurable via ioctl() at some point.
> 

Yes, DT can have properties to describe the FIFO size, if there happens
to be some variants in the HW blocks in different versions. But that is
not the case here. DT should not be used to control SW/use case specific
behavior.


> #define MAX_SLAVE_RX_PER_INT         10
> 
> is not hw fifo threshold level, it is a kind of watermark for the
> tasklet to process the max number of packets in single run.
> The intention to add the macro is to make sure the tasklet does not
> run more than 20us.
> If we keep this as a module parameter or dt parameter then there is a
> good possibility that the number can be set to higher value.
> This will make the tasklet run more than 20us and defeat the purpose.
> 
> This number is constant and not variable to change
> 
> Please feel free to add your comments.
> 
> Best regards,
> Rayagonda
> 
>> --
>> Florian

--0000000000001c145d05b34bc5ef
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Gp3tsmw0Vz7IMJs6DQIm7T8CfIzeId1IIHcH02MbpO7m1Btzyz625FoBWF8CAwEAAaOCAcswggHH
MA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEwgY4wTQYIKwYBBQUHMAKGQWh0dHA6Ly9z
ZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVyc29uYWxzaWduMnNoYTJnM29jc3AuY3J0
MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24y
c2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3
dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEQGA1UdHwQ9MDswOaA3oDWG
M2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hhMmczLmNybDAfBgNV
HREEGDAWgRRyYXkuanVpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSME
GDAWgBRpcoJiMWeVRIV3kYDEBDZJnXsLYTAdBgNVHQ4EFgQUvUTLkCwFvnpejW/KGvdaDA31b+sw
DQYJKoZIhvcNAQELBQADggEBACMny/9Y1OPK7qwiBKBMt478eBgXnTlJ0J0HNebYcxN/l7fKIKMb
/eX/AQKIDsHeshmV2ekPU4yY/04veXx3QTgmE1bb4ksKEFEbU0LXlVPrnlgNn8M75cPymegn/2yU
r1+htd2eve3obmKc5Lrl0GP+4m72XxAOL687Aw5vRa4Lf294s+x4d+VRwUjoFTj9zyLhexWQuJv/
yX1HjSkrlIsRwi6DN0/ieL04O9aD1UNPlCC6akGnv4tgwlESh51M564qhonlfSW6La+L/aTIuQc0
88lq8s/VMBBGdc7176/v5TbNwEC/c5QYbp2n76rAmKKjhjwWmBk64yLT7CoIxk0xggJvMIICawIB
ATBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQDEypH
bG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMCDCUMagLNLily51ao1jAN
BglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgWe6ZSIeZPW4Qlzug8cuBdN8j8qmdz6eK
5VgVCzLgAcowGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMTA0
MTgwMTM0WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIB
MA0GCSqGSIb3DQEBAQUABIIBAILmo26Gdp7PTPI8TEkoOOxcyhXc4a8yj+NSqM+felPVFGIs2/Da
1cLN6aGymnVz5r7Ud1/M4OeOlkiCjH1k+0ATAGcX5rm0dGOKiU+HF6UZ1n2vJK5V+iv86u696a4j
lDpq3OtF0RlVsER6tHTouvDB5e9GTKd1bRZUruE/HHXGtvG6W9tKfCk04sfK/pyrxGUHeI0QqgOg
OHu0qeRzSxw+4pTaYMaCrzdICmzGIUPQQS4y4KrWwd0P4vJYbCqwvzKHp/7pCRRJE16qVvCfqoLJ
NNRO2ytxZ+z2YQ8F8qlFhspqBsiWgZ8nywl6+eZJYa0hI8PmL6DmkkNgnQdDGSo=
--0000000000001c145d05b34bc5ef--
