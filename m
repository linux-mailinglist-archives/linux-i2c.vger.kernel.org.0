Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78DF12975A8
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Oct 2020 19:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753274AbgJWRSb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Oct 2020 13:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465753AbgJWRSb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Oct 2020 13:18:31 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B381C0613CE
        for <linux-i2c@vger.kernel.org>; Fri, 23 Oct 2020 10:18:31 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r10so1743545pgb.10
        for <linux-i2c@vger.kernel.org>; Fri, 23 Oct 2020 10:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to;
        bh=krLRej/a9ZDnuJvhsWv6Njde4/ND84Gopon04bIBQJo=;
        b=QGc+8iJhVMp2soEipaRpXy1iQ0b/TkO+RRJSuglA4NOTQDOy03MJ3Nat98VadltwLD
         Zl5wSBJdRTHJSxezaxxH7tcSXS9JdJg2lm+j5TQs2SIDjTIQPLVwpzds0quETv2kZnM4
         p6gJAx6uPItATswB36Qa2kKZ+ZTdlaFqG4ETs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=krLRej/a9ZDnuJvhsWv6Njde4/ND84Gopon04bIBQJo=;
        b=sS5XBMqjL/ubCA0qAtfz0FOKvlb52nksLPX9abmW7kCKVoFj44QIDQORG3TIDO7/sw
         9Wv758JEBWNG14ASqM70sDVUf9DrXD94UQ+4rRtNJHYaItENn+wP9MWdRYrX8nDlkT0W
         vwjuhZHpUbqUOZ6Gq6lkJOiKiVTbTcB6i+WQcbf7RiUm2A5PfvJIn4bSgPT5G0Vqzbpq
         oSqU/+g16nWsWvdw7eNrv8MjKr+JnQ7QevlInCbvj7onF0wZU0CT8UvFUPWT0KleJNuO
         AI69tHpkA6/W8FOyoYA2KR9ty0GKX04q7iYJq+iP/oV4AJCRRoovv2DAJLE310Ud4zGY
         VGGg==
X-Gm-Message-State: AOAM532FRod++seq5GTpIlxb7+rKBdMQQczLfeNKPvkRy9l3UUnqYflG
        ook8pfMo38gJHX5hdzRzJg7i5Q==
X-Google-Smtp-Source: ABdhPJwnoO/oGM7S7jzXZYybN7c0XwzJV8Sd3oTvwyDPue8OToiIbqZl9VN5vQwKBsa153eK50Q3vg==
X-Received: by 2002:a62:ed11:0:b029:155:4bd9:6ade with SMTP id u17-20020a62ed110000b02901554bd96ademr232842pfh.6.1603473510403;
        Fri, 23 Oct 2020 10:18:30 -0700 (PDT)
Received: from [10.230.182.181] ([192.19.224.250])
        by smtp.gmail.com with ESMTPSA id j23sm2478591pgm.76.2020.10.23.10.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 10:18:29 -0700 (PDT)
Subject: Re: [PATCH v1 2/6] i2c: iproc: handle only slave interrupts which are
 enabled
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20201011182254.17776-1-rayagonda.kokatanur@broadcom.com>
 <20201011182254.17776-3-rayagonda.kokatanur@broadcom.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <e4f2c878-4117-d197-2d0b-fed8df90d4b3@broadcom.com>
Date:   Fri, 23 Oct 2020 10:18:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201011182254.17776-3-rayagonda.kokatanur@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="00000000000005fb5005b259c5e9"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--00000000000005fb5005b259c5e9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/11/2020 11:22 AM, Rayagonda Kokatanur wrote:
> Handle only slave interrupts which are enabled.
> 
> The IS_OFFSET register contains the interrupt status bits which will be
> set regardless of the enabling of the corresponding interrupt condition.
> One must therefore look at both IS_OFFSET and IE_OFFSET to determine
> whether an interrupt condition is set and enabled.
> 
> Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index 834a98caeada..b54f5130d246 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -507,12 +507,17 @@ static void bcm_iproc_i2c_process_m_event(struct bcm_iproc_i2c_dev *iproc_i2c,
>  static irqreturn_t bcm_iproc_i2c_isr(int irq, void *data)
>  {
>  	struct bcm_iproc_i2c_dev *iproc_i2c = data;
> -	u32 status = iproc_i2c_rd_reg(iproc_i2c, IS_OFFSET);
> +	u32 slave_status;
> +	u32 status;
>  	bool ret;
> -	u32 sl_status = status & ISR_MASK_SLAVE;
>  
> -	if (sl_status) {
> -		ret = bcm_iproc_i2c_slave_isr(iproc_i2c, sl_status);
> +	status = iproc_i2c_rd_reg(iproc_i2c, IS_OFFSET);
> +	/* process only slave interrupt which are enabled */
> +	slave_status = status & iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET) &
> +		       ISR_MASK_SLAVE;
> +
> +	if (slave_status) {
> +		ret = bcm_iproc_i2c_slave_isr(iproc_i2c, slave_status);
>  		if (ret)
>  			return IRQ_HANDLED;
>  		else
> 

Acked-by: Ray Jui <ray.jui@broadcom.com>

--00000000000005fb5005b259c5e9
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
BglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgBz7ln5A69VpcHR6dKPcalEU599pbhDaH
UlQZcTtzXDcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMDIz
MTcxODMwWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIB
MA0GCSqGSIb3DQEBAQUABIIBAAEdvNT2wR1w5qMrZW3w/Wh0wzBGDuC58t56x6onuQwRNAQRUQSo
LrkDccnaJ7WffaTZQUwvzm5fmFLSORjuMouyyqbcBpik7NyMRtaQ7oagZ9/po105W/LtkBoI4A9e
1RFqIvis82fXvQM6nP6uCwGIyC418PmtWsaZyrV0ZwtbLMW8Muij4HJQZllPEU2BBXaJpOZbazCY
tRe7hvQYwbo+Be9eIE5yb4uHEWXLnPB6cgAHeHdPGT3Ftrrdh+Ye4ARhuxis5t9xd1RfCW0ucGxs
WReQQ3Ta+eHcWKjXTgummEmehKycq7ukWj5QmGvR3HaWpK6R5cem7tOP72Whyb0=
--00000000000005fb5005b259c5e9--
