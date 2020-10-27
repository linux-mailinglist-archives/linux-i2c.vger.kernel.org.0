Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9329A29A1D1
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Oct 2020 01:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409073AbgJ0AoI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Oct 2020 20:44:08 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44083 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436771AbgJ0AgM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Oct 2020 20:36:12 -0400
Received: by mail-pg1-f195.google.com with SMTP id o3so7013377pgr.11
        for <linux-i2c@vger.kernel.org>; Mon, 26 Oct 2020 17:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=OOAZi1TGJloAiQqosVHHMdmpdn4GYar9ETx5k6SZ6WM=;
        b=P1tnxEX2oZ6ftzB4xTWL0DesBKun3QP1KD4pq/unAiUkWLFz0dXfz1SCEWHA41TSur
         g8AC0qQT/vLMI721uGerJby3lgRUzopA/olCkGKBoGbpFY+QKTKRGhI7U/OaZeLSRnz/
         N6yYgJLgNrTQM6tHlcEUCrXnKJ3VzP+cuQhDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=OOAZi1TGJloAiQqosVHHMdmpdn4GYar9ETx5k6SZ6WM=;
        b=KIzE3Jqz/I0rojKQub0VT4NTO3mtPe2bEalEmWTapodHxM81hUhoPfihWdbcie93RR
         05to4BrdQUqDm/xpaH0Ho1u1AxX2pQaxnOyl4Mzrrh54k5M/cFZE+VOLDtFUAlDU1iy3
         LHaKR3icO95MBMm7exDVg7VIeFoKYegSvomJAXNtAMAsyOng0UQvTFeJpxVJ4QGjJo71
         ucxy6zAdwNu6bONEYyX1Vf/Wb3QW1vQ+3eGXxda15CxirXN6HMTpE9St9u69r2bZuK0s
         NyuePXao2b2L1OBsoTs766IelYolvWH93Y0Fu6DiMu/jlSovWurs/lmG+pxKHddO5st3
         jNDg==
X-Gm-Message-State: AOAM530xJUwJaYHLOI6+ZSkhvwtsh/ACtre8/IuyTEJZ+1h97m6Qdd3L
        cR5YH1YW41XldSRkKtfO9sFV6A==
X-Google-Smtp-Source: ABdhPJx7iGUpRWW64X/vx9Y6gi5GRDWwfOF7mr/CiJOuOJxHJ7elouSf+EIHPqG7B4rj04zZrqnieA==
X-Received: by 2002:a62:2b88:0:b029:163:c6fb:f2a with SMTP id r130-20020a622b880000b0290163c6fb0f2amr280260pfr.7.1603758971033;
        Mon, 26 Oct 2020 17:36:11 -0700 (PDT)
Received: from [10.230.1.222] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id a11sm12698804pfn.125.2020.10.26.17.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 17:36:10 -0700 (PDT)
Subject: Re: [PATCH v1 6/6] i2c: iproc: handle rx fifo full interrupt
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20201011182254.17776-7-rayagonda.kokatanur@broadcom.com>
 <e9d15e5a-e868-baff-177f-81aa1d742ff1@broadcom.com>
 <CAHO=5PE_tk0nzvd6x1ZNJvKu2d6zHGvb7NoLw3JtmO7Ho-tm8A@mail.gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <94f8211d-1273-4c68-31e9-2f35f364e6c8@broadcom.com>
Date:   Mon, 26 Oct 2020 17:36:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAHO=5PE_tk0nzvd6x1ZNJvKu2d6zHGvb7NoLw3JtmO7Ho-tm8A@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000d0b4e405b29c3b54"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000d0b4e405b29c3b54
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/26/2020 8:13 AM, Rayagonda Kokatanur wrote:
> Hi Dhanajay,
> 
> On Fri, Oct 23, 2020 at 11:12 PM Ray Jui <ray.jui@broadcom.com> wrote:
>>
>>
>>
>> On 10/12/2020 3:03 PM, Dhananjay Phadke wrote:
>>> From: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
>>>
>>> On Sun, 11 Oct 2020 23:52:54 +0530, Rayagonda Kokatanur wrote:
>>>> Add code to handle IS_S_RX_FIFO_FULL_SHIFT interrupt to support
>>>> master write request with >= 64 bytes.
>>>>
>>>> Iproc has a slave rx fifo size of 64 bytes.
>>>> Rx fifo full interrupt (IS_S_RX_FIFO_FULL_SHIFT) will be generated
>>>> when RX fifo becomes full. This can happen if master issues write
>>>> request of more than 64 bytes.
>>>>
>>>
>>> ARM cores run much faster than I2C bus, why would rx fifo go full when
>>> rx interrupt is enabled and bytes are read out by bus driver isr?
>>> Isn't fifo read pointer updated on these byte reads?
>>
>> Hi Rayagonda,
>>
>> Could you please reply on this question? For transactions > 64 bytes, do
>> we batch until RX FIFO is full before we read out the data?
> 
> Sorry I missed this question.
> Yes with current design we are batching 64 bytes for translation > 64 bytes.
> 

So we do batch the transfer and read them in one shot, and that's how
the FIFO full interrupt is being utilized for. That sounds okay to me.

Thanks,

Ray

> Best regards,
> Rayagonda
> 
> 
>>
>> Thanks,
>>
>> Ray
>>
>>> Does controller stretch clock when rx fifo is full (e.g. kernel has
>>> crashed, bus driver isn't draining fifo)?
>>>

--000000000000d0b4e405b29c3b54
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
BglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgDgAmt1rygMqQIwtFvwYt13dlaWcVSpUP
LgODP6lzWi8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMDI3
MDAzNjExWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIB
MA0GCSqGSIb3DQEBAQUABIIBAHzuFV7QH71Xcb4Lp31cd5vge4dtbDEfevxaJQDrPtkIRTpO2uez
jABW/YfSbMFkbYlOZ8MzHyCKU/euzh1zyd30fg0UeK0b41FrB0Ezu81WYoFAGqmvD2IjdeSIx5FM
PO5vrz4b34UZ+2ZO/SLFch8G4VG+PkiPVN2KuYd+NspmwZyQpzIkpGhJFXiz1K14NjyLDel7uUSb
Cu3pfPGwpIwm/kVepAo9HCase5fj3ezY4VNB92jq+UWDVkMQkDro2sV0MvFfmcFP/87wPzCG5ACf
thZ3VLD6H76ZMme9fNbQqQX7V4dEluhItFvdH6NBgZ1hFXF1up/N4MPr2QB/s/8=
--000000000000d0b4e405b29c3b54--
