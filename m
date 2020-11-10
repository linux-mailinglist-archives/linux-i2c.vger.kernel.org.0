Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6109A2ADF39
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Nov 2020 20:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731373AbgKJTYl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Nov 2020 14:24:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731350AbgKJTYk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Nov 2020 14:24:40 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49F1C0613D1
        for <linux-i2c@vger.kernel.org>; Tue, 10 Nov 2020 11:24:40 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id j5so6987103plk.7
        for <linux-i2c@vger.kernel.org>; Tue, 10 Nov 2020 11:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=9pEbn+IM7MFeCw/FkKslWhQq2ehNr6rrc5YZHkoJjsw=;
        b=dQ3H4OkueZZF1HicieNioZuTqEqZsTNupdx7VnLBRqZc0B0RUoZS5eo4+S95OqWF2r
         FlBg9//NYYnlS1vHCcDZZ7MytQKxGIdL3TKQECt93W5wK75LJFFGwmbra2oni374Rk2H
         /SU53wQX24InfCItWBxFoJpF6fRsSW8m4eTHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=9pEbn+IM7MFeCw/FkKslWhQq2ehNr6rrc5YZHkoJjsw=;
        b=C06WAYVkSXlsnSPmhP+awmyXUPyuXOs05Kq7DqdsaTN3AzE4N8oqN+p4oDwKECF0ln
         NRxNCvSujE/84wd8LyrrkowC7LtzvX3uT7yL+Ng839FCpHVOIcLMPE3QeyQsPJOK7HMm
         JZWZwb1G/xxDE4/+ItU47KrUuNpjZ8u6AcodVobjxThuqbApLqVblCT5yMv7nwce+h7O
         sgkNQoOvu9dqhGQ/PS7ADPv3SIUv6Y3L/oY0/QbwbNL9PEeO1ly5q7LCy+royDWchyKL
         uYSR6VainrAXlTL4AgqdLLt+d6aX5UZB8+e29jAL4Jp8CZ89v3aeGB3jWu2dYYxVIV4v
         x7+Q==
X-Gm-Message-State: AOAM5334Qky1dhi9CXcorSEmlCBdd8ptQqy7aSFs8KkGlNQcc+ZiAMPv
        +z5Adp2ELPzOkM5iN466P7okrA==
X-Google-Smtp-Source: ABdhPJww9SyUL4gPn15CySh4Hg8H57l+EV2HFuSrFgmjwuXbaiPJypmlZFSd3tmBIlK5Wz2sQhOmXQ==
X-Received: by 2002:a17:902:8b8c:b029:d6:df70:fa21 with SMTP id ay12-20020a1709028b8cb02900d6df70fa21mr18328853plb.15.1605036279943;
        Tue, 10 Nov 2020 11:24:39 -0800 (PST)
Received: from [10.136.8.243] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id h13sm3013561pjj.30.2020.11.10.11.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 11:24:38 -0800 (PST)
Subject: Re: [PATCH v3 5/6] i2c: iproc: handle master read request
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>
References: <CAHO=5PGAMvRAyrBF3_ubbgciqHV3hAbmt4B7Rb3hdibMbgs6ZQ@mail.gmail.com>
 <1604684486-16272-1-git-send-email-dphadke@linux.microsoft.com>
 <CAHO=5PEJZ35O2Kwtinw5Kon+fXvciZHJDn9wCp6LKp8wtvVF=Q@mail.gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <38a23afc-57da-a01f-286c-15f8b3d61705@broadcom.com>
Date:   Tue, 10 Nov 2020 11:24:36 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAHO=5PEJZ35O2Kwtinw5Kon+fXvciZHJDn9wCp6LKp8wtvVF=Q@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="0000000000005984c805b3c5a104"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--0000000000005984c805b3c5a104
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/9/2020 8:23 PM, Rayagonda Kokatanur wrote:
> Hi Ray,
> 
> Could you please check Dhananjay comments and update your thoughts.
> 
> On Fri, Nov 6, 2020 at 11:11 PM Dhananjay Phadke
> <dphadke@linux.microsoft.com> wrote:
>>
>> On Thu, 5 Nov 2020 15:13:04 +0530, Rayagonda Kokatanur wrote:
>>>> So the suggestion was to set HW threshold for rx fifo interrupt, not
>>>> really a SW property. By setting it in DT, makes it easier to
>>>> customize for target system, module param needs or ioctl makes it
>>>> dependent on userpsace to configure it.
>>>>
>>>> The need for tasklet seems to arise from the fact that many bytes are
>>>> left in the fifo. If there's a common problem here, such tasklet would be
>>>> needed in i2c subsys rather than controller specific tweak, akin to
>>>> how networking uses NAPI or adding block transactions to the interface?
>>>>
>>>> For master write-read event, it seems both IS_S_RD_EVENT_SHIFT and
>>>> IS_S_RX_EVENT_SHIFT are detected, which implies that core is late to
>>>> drain rx fifo i.e. write is complete and the read has started on the bus?
>>>
>>> Yes it's true that for master write-read events both
>>> IS_S_RD_EVENT_SHIFT and IS_S_RX_EVENT_SHIFT  are coming together.
>>> So before the slave starts transmitting data to the master, it should
>>> first read all data from rx-fifo i.e. complete master write and then
>>> process master read.
>>>
>>> To minimise interrupt overhead, we are batching 64bytes.
>>> To keep isr running for less time, we are using a tasklet.
>>> Again to keep the tasklet not running for more than 20u, we have set
>>> max of 10 bytes data read from rx-fifo per tasklet run.
>>>
>>> If we start processing everything in isr and using rx threshold
>>> interrupt, then isr will run for a longer time and this may hog the
>>> system.
>>> For example, to process 10 bytes it takes 20us, to process 30 bytes it
>>> takes 60us and so on.
>>> So is it okay to run isr for so long ?
>>>
>>> Keeping all this in mind we thought a tasklet would be a good option
>>> and kept max of 10 bytes read per tasklet.
>>>
>>> Please let me know if you still feel we should not use a tasklet and
>>> don't batch 64 bytes.
>>
>> Deferring to tasklet is OK, could use a kernel thread (i.e. threaded_irq)
>> as i2c rate is quite low.
>>

kernel thread was proposed in the internal review. I don't see much
benefit of using tasklet. If a thread is blocked from running for more
than several tenth of ms, that's really a system-level issue than an
issue with this driver.

IMO, it's an overkill to use tasklet here but we can probably leave it
as it is since it does not have a adverse effect and the code ran in
tasklet is short.

>> But do enable rx_threshold and read out early. This will avoid fifo full
>> or master write-read situation where lot of bytes must be drained from rx
>> fifo before serving tx fifo (avoid tx underrun).
>>
>> Best would have been setting up DMA into mem (some controllers seem capable).
>> In absence of that, it's a trade off: if rx intr threshold is low,
>> there will be more interrupts, but less time spent in each. Default could
>> still be 64B or no-thresh (allow override in dtb).

How much time is expected to read 64 bytes from an RX FIFO? Even with
APB bus each register read is expected to be in the tenth or hundreds of
nanosecond range. Reading the entire FIFO of 64 bytes should take less
than 10 us. The interrupt context switch overhead is probably longer
than that. It's much more effective to read all of them in a single
batch than breaking them into multiple batches.

Like Florian already suggested, DT property is meant to describe
variants in HW, it should not be used for this purpose. DT maintainer
Rob also mentioned this multiple times in other reviews.


>>
>> Few other comments -
>>
>>> +              /* schedule tasklet to read data later */
>>> +              tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
>>> +
>>> +              /* clear only IS_S_RX_EVENT_SHIFT interrupt */
>>> +              iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET,
>>> +                               BIT(IS_S_RX_EVENT_SHIFT));
>>> +      }
>>
>> Why clearing one rx interrupt bit here after scheduling tasklet? Should all that
>> be done by tasklet? Also should just return after scheduling tasklet?
>>
>> Thanks,
>> Dhananjay

--0000000000005984c805b3c5a104
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
BglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgU87nJl7zyIgVLH4IHiOkB3wjV3uYqkOC
r4EvTcwzrRowGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMTEw
MTkyNDQwWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIB
MA0GCSqGSIb3DQEBAQUABIIBAEAe4YIjuCe0MsynHGJPOvznxShfFLjL5+Ut5+ue+C8dMpIasEEh
vPYszXGpvb0aYXCt9fAvQg+49rEfWDpsOuW8aEvxUTbZZY0UdrhHjXJkzLx3GBPOnwdDqbtuY17K
dx7iE7PvWt8po5bQvzyDd5QklQPZVvmazMKAgQzPbz2mVLmx0UCN8lMTF8mPR+Y8MDYiFuxEgAZ1
D+6zMwzfsXMOnIpQhVcSlcIiIyAOkKMR3FJ17K7t8UUoyC3BdvOTmYOCfZ9QQMawUmftkZQYNpxS
xn9DK7uAS4/LhnJZjUVUgeXPX4w7A9gAks26ilkGclNKViOmuqB+LARG2CnEsNo=
--0000000000005984c805b3c5a104--
