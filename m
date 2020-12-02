Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6062CC418
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 18:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730934AbgLBRoZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 12:44:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730932AbgLBRoZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Dec 2020 12:44:25 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A3EC0613CF
        for <linux-i2c@vger.kernel.org>; Wed,  2 Dec 2020 09:43:45 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id f1so1054647plt.12
        for <linux-i2c@vger.kernel.org>; Wed, 02 Dec 2020 09:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=nZMdoUVYxcC0L6bjMl6ANc/Hb5POkP3YvgJYdyFZ97A=;
        b=RXKiyWrvdoPpUWr8+DR6hmojOuQrUf4rCZ9wMmsJ53C8zuSbm52IBZ4z+eyD0kOcmO
         Yyo4q06qZyFo6HSS/8UROsXxO0+ggLQsICmx2aEoVyz3KoM12u9XIK6Z0z7Q+GptXCDw
         a78UtZbns7H6ePDKWjV8TLVupnvCOI1vx/+Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=nZMdoUVYxcC0L6bjMl6ANc/Hb5POkP3YvgJYdyFZ97A=;
        b=CWtJudbFAz1uWt10QHW9Nzqx/jmozq4Roq9BKxp3ZhwQPOQWL7osOvqmbzVGgoIZ1f
         b8hGHt5T/U50pUF8202qNh3joaieA4RqPF/bCD9TjESdSFGRaubU2FmFCB5z1t3IV+aU
         yxDows9nTStZ4QQLt8TO+qFaFHi9hZUw+dx5MZ1KDBfOBuNgpJzIyuezmhUCrc8tAkZl
         lTrheqsyTTWrnINQxNJzm56m6OCUxOW/57NupspdNCqL0ELytNjjJMO85SHfOPFauTVy
         fj9ZFMG4UpA8Z/nrALokYceSfN7H3+L1accxeH1l1qlDHOiFhL7ZS46ygj4PLUz8kn0c
         QpeQ==
X-Gm-Message-State: AOAM5311jfUE8i+j6UjqHEnwVI7HVHqtIUUZgKTz4Z9QQEURI1hgnmtO
        PXPUh+yiguGWj7vQaqh+tOE6gQ==
X-Google-Smtp-Source: ABdhPJzusdH6WxP/MFttvRFYAInUUFjGzkoDMKo6zHdMbVWiL5znkRYKxHzm8XPp7mPHSfbf5K7dWw==
X-Received: by 2002:a17:90a:d801:: with SMTP id a1mr951358pjv.90.1606931024333;
        Wed, 02 Dec 2020 09:43:44 -0800 (PST)
Received: from [10.230.2.165] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id f92sm279705pjk.54.2020.12.02.09.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 09:43:42 -0800 (PST)
Subject: Re: [PATCH v3 5/6] i2c: iproc: handle master read request
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
References: <38a23afc-57da-a01f-286c-15f8b3d61705@broadcom.com>
 <1605316659-3422-1-git-send-email-dphadke@linux.microsoft.com>
 <CAHO=5PFzd9KTR93ntUvAX5dqzxqJQpVXEirs5uoXdvcnZ7hL4g@mail.gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <23732970-d454-2655-48cd-ccaed3f8484b@broadcom.com>
Date:   Wed, 2 Dec 2020 09:43:38 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <CAHO=5PFzd9KTR93ntUvAX5dqzxqJQpVXEirs5uoXdvcnZ7hL4g@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000ebab2a05b57ec8aa"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000ebab2a05b57ec8aa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/19/2020 9:59 PM, Rayagonda Kokatanur wrote:
> Hi Ray and Dhananjay,
> 
> All review comments are scattered now, please let me know what has to be
> done further,
> Are we going to change the tasklet to irq thread ?

It really depends on the time it takes to read data out of the FIFO.
Dhananjay pointed out that your comment indicates reading 10 bytes of
data takes 20 us, i.e., 2 us per byte read. Do you know why it took so
long? The APB bus should be a lot faster than that (in the hundreds of
ns range). I am making the assumption that by the time when you try to
read data out of the FIFO, the data is of course already in the FIFO, so
it's not like you are waiting for data from the I2C bus and I cannot
understand why it took this long.


> Are we going to remove batching 64 packets if transaction > 64B and use
> rx fifo threshold ?
> 

I don't see any issue with batching. It's more efficient and less
context switch overhead.

> I don't see any issue with current code but if it has to change we need
> a valid reason for the same.

I think we need to confirm the exact time it takes to fetch data from
FIFO. Once that's done, we can make a decision between keeping the
tasklet based approach vs irq thread.

Thanks.


> If nothing to be done, please acknowledge the patch.
>  
> Best regards,
> Raygonda
> 
> 
> On Sat, Nov 14, 2020 at 6:47 AM Dhananjay Phadke
> <dphadke@linux.microsoft.com <mailto:dphadke@linux.microsoft.com>> wrote:
> 
>     On Tue, 10 Nov 2020 11:24:36 -0800, Ray Jui wrote:
> 
>     >>>> Yes it's true that for master write-read events both
>     >>>> IS_S_RD_EVENT_SHIFT and IS_S_RX_EVENT_SHIFT  are coming together.
>     >>>> So before the slave starts transmitting data to the master, it
>     should
>     >>>> first read all data from rx-fifo i.e. complete master write and
>     then
>     >>>> process master read.
>     >>>>
>     >>>> To minimise interrupt overhead, we are batching 64bytes.
>     >>>> To keep isr running for less time, we are using a tasklet.
>     >>>> Again to keep the tasklet not running for more than 20u, we
>     have set
>     >>>> max of 10 bytes data read from rx-fifo per tasklet run.
>     >>>>
>     >>>> If we start processing everything in isr and using rx threshold
>     >>>> interrupt, then isr will run for a longer time and this may hog the
>     >>>> system.
>     >>>> For example, to process 10 bytes it takes 20us, to process 30
>     bytes it
>     >>>> takes 60us and so on.
>     >>>> So is it okay to run isr for so long ?
>     >>>>
>     >>>> Keeping all this in mind we thought a tasklet would be a good
>     option
>     >>>> and kept max of 10 bytes read per tasklet.
>     >>>>
>     >>>> Please let me know if you still feel we should not use a
>     tasklet and
>     >>>> don't batch 64 bytes.
>     >>>
>     >>> Deferring to tasklet is OK, could use a kernel thread (i.e.
>     threaded_irq)
>     >>> as i2c rate is quite low.
>     >>>
>     >
>     >kernel thread was proposed in the internal review. I don't see much
>     >benefit of using tasklet. If a thread is blocked from running for more
>     >than several tenth of ms, that's really a system-level issue than an
>     >issue with this driver.
>     >
>     >IMO, it's an overkill to use tasklet here but we can probably leave it
>     >as it is since it does not have a adverse effect and the code ran in
>     >tasklet is short.
>     >
>     >How much time is expected to read 64 bytes from an RX FIFO? Even with
>     >APB bus each register read is expected to be in the tenth or
>     hundreds of
>     >nanosecond range. Reading the entire FIFO of 64 bytes should take less
>     >than 10 us. The interrupt context switch overhead is probably longer
>     >than that. It's much more effective to read all of them in a single
>     >batch than breaking them into multiple batches.
> 
>     OK, there's a general discussions towards removing tasklets, if this
>     fix works with threaded isr, strongly recommend that route.
> 
>     This comment in the code suggested that register reads take long time to
>     drain 64 bytes.
> 
>     >+/*
>     >+ * It takes ~18us to reading 10bytes of data, hence to keep tasklet
>     >+ * running for less time, max slave read per tasklet is set to 10
>     >bytes.
> 
>     @Rayagonda, please take care of hand-off mentioned below, once the
>     tasklet
>     is scheduled, isr should just return and clear status at the end of
>     tasklet.
> 
>     >>
>     >> Few other comments -
>     >>
>     >>> +              /* schedule tasklet to read data later */
>     >>> +              tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
>     >>> +
>     >>> +              /* clear only IS_S_RX_EVENT_SHIFT interrupt */
>     >>> +              iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET,
>     >>> +                               BIT(IS_S_RX_EVENT_SHIFT));
>     >>> +      }
>     >>
>     >> Why clearing one rx interrupt bit here after scheduling tasklet?
>     Should all that
>     >> be done by tasklet? Also should just return after scheduling tasklet?
> 
>     Regards,
>     Dhananjay
> 

--000000000000ebab2a05b57ec8aa
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQMwYJKoZIhvcNAQcCoIIQJDCCECACAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg2IMIIE6DCCA9CgAwIBAgIOSBtqCRO9gCTKXSLwFPMwDQYJKoZIhvcNAQELBQAwTDEgMB4GA1UE
CxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMT
Ckdsb2JhbFNpZ24wHhcNMTYwNjE1MDAwMDAwWhcNMjQwNjE1MDAwMDAwWjBdMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEzMDEGA1UEAxMqR2xvYmFsU2lnbiBQZXJzb25h
bFNpZ24gMiBDQSAtIFNIQTI1NiAtIEczMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
tpZok2X9LAHsYqMNVL+Ly6RDkaKar7GD8rVtb9nw6tzPFnvXGeOEA4X5xh9wjx9sScVpGR5wkTg1
fgJIXTlrGESmaqXIdPRd9YQ+Yx9xRIIIPu3Jp/bpbiZBKYDJSbr/2Xago7sb9nnfSyjTSnucUcIP
ZVChn6hKneVGBI2DT9yyyD3PmCEJmEzA8Y96qT83JmVH2GaPSSbCw0C+Zj1s/zqtKUbwE5zh8uuZ
p4vC019QbaIOb8cGlzgvTqGORwK0gwDYpOO6QQdg5d03WvIHwTunnJdoLrfvqUg2vOlpqJmqR+nH
9lHS+bEstsVJtZieU1Pa+3LzfA/4cT7XA/pnwwIDAQABo4IBtTCCAbEwDgYDVR0PAQH/BAQDAgEG
MGoGA1UdJQRjMGEGCCsGAQUFBwMCBggrBgEFBQcDBAYIKwYBBQUHAwkGCisGAQQBgjcUAgIGCisG
AQQBgjcKAwQGCSsGAQQBgjcVBgYKKwYBBAGCNwoDDAYIKwYBBQUHAwcGCCsGAQUFBwMRMBIGA1Ud
EwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFGlygmIxZ5VEhXeRgMQENkmdewthMB8GA1UdIwQYMBaA
FI/wS3+oLkUkrk1Q+mOai97i3Ru8MD4GCCsGAQUFBwEBBDIwMDAuBggrBgEFBQcwAYYiaHR0cDov
L29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3RyMzA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3Js
Lmdsb2JhbHNpZ24uY29tL3Jvb3QtcjMuY3JsMGcGA1UdIARgMF4wCwYJKwYBBAGgMgEoMAwGCisG
AQQBoDIBKAowQQYJKwYBBAGgMgFfMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNp
Z24uY29tL3JlcG9zaXRvcnkvMA0GCSqGSIb3DQEBCwUAA4IBAQConc0yzHxn4gtQ16VccKNm4iXv
6rS2UzBuhxI3XDPiwihW45O9RZXzWNgVcUzz5IKJFL7+pcxHvesGVII+5r++9eqI9XnEKCILjHr2
DgvjKq5Jmg6bwifybLYbVUoBthnhaFB0WLwSRRhPrt5eGxMw51UmNICi/hSKBKsHhGFSEaJQALZy
4HL0EWduE6ILYAjX6BSXRDtHFeUPddb46f5Hf5rzITGLsn9BIpoOVrgS878O4JnfUWQi29yBfn75
HajifFvPC+uqn+rcVnvrpLgsLOYG/64kWX/FRH8+mhVe+mcSX3xsUpcxK9q9vLTVtroU/yJUmEC4
OcH5dQsbHBqjMIIDXzCCAkegAwIBAgILBAAAAAABIVhTCKIwDQYJKoZIhvcNAQELBQAwTDEgMB4G
A1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNV
BAMTCkdsb2JhbFNpZ24wHhcNMDkwMzE4MTAwMDAwWhcNMjkwMzE4MTAwMDAwWjBMMSAwHgYDVQQL
ExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMK
R2xvYmFsU2lnbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMwldpB5BngiFvXAg7aE
yiie/QV2EcWtiHL8RgJDx7KKnQRfJMsuS+FggkbhUqsMgUdwbN1k0ev1LKMPgj0MK66X17YUhhB5
uzsTgHeMCOFJ0mpiLx9e+pZo34knlTifBtc+ycsmWQ1z3rDI6SYOgxXG71uL0gRgykmmKPZpO/bL
yCiR5Z2KYVc3rHQU3HTgOu5yLy6c+9C7v/U9AOEGM+iCK65TpjoWc4zdQQ4gOsC0p6Hpsk+QLjJg
6VfLuQSSaGjlOCZgdbKfd/+RFO+uIEn8rUAVSNECMWEZXriX7613t2Saer9fwRPvm2L7DWzgVGkW
qQPabumDk3F2xmmFghcCAwEAAaNCMEAwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8w
HQYDVR0OBBYEFI/wS3+oLkUkrk1Q+mOai97i3Ru8MA0GCSqGSIb3DQEBCwUAA4IBAQBLQNvAUKr+
yAzv95ZURUm7lgAJQayzE4aGKAczymvmdLm6AC2upArT9fHxD4q/c2dKg8dEe3jgr25sbwMpjjM5
RcOO5LlXbKr8EpbsU8Yt5CRsuZRj+9xTaGdWPoO4zzUhw8lo/s7awlOqzJCK6fBdRoyV3XpYKBov
Hd7NADdBj+1EbddTKJd+82cEHhXXipa0095MJ6RMG3NzdvQXmcIfeg7jLQitChws/zyrVQ4PkX42
68NXSb7hLi18YIvDQVETI53O9zJrlAGomecsMx86OyXShkDOOyyGeMlhLxS67ttVb9+E7gUJTb0o
2HLO02JQZR7rkpeDMdmztcpHWD9fMIIFNTCCBB2gAwIBAgIMJQxqAs0uKXLnVqjWMA0GCSqGSIb3
DQEBCwUAMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQD
EypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMwHhcNMjAwOTIxMTQz
MTQ3WhcNMjIwOTIyMTQzMTQ3WjCBhDELMAkGA1UEBhMCSU4xEjAQBgNVBAgTCUthcm5hdGFrYTES
MBAGA1UEBxMJQmFuZ2Fsb3JlMRYwFAYDVQQKEw1Ccm9hZGNvbSBJbmMuMRAwDgYDVQQDEwdSYXkg
SnVpMSMwIQYJKoZIhvcNAQkBFhRyYXkuanVpQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBAKn4hxAQIaUc/63CGGAfKpCpBLQZU/mobqbKwTdwXmkNVlWkldmfbV1C
wdSx9vgMN7hDrNLmOcurXjYSYT0seO6NLnsRvQ6lc2v92pqK7i8HwzTOL/b9z4XC5VnoYcHRuz75
IcF8U8x+x6Rq4UutUQgoQDREvwBcsCj6ZDNmxDaEyyIflO3+HYvjI2hpJFOd+Wt5H/l9Nq1r7OLj
jtK7Nlq1VqsruL98ME7ID5QhbF4tLGQgZEw250Sctjx8R8+zZPNxIIDREhAsGiupe5j3rEXDFv39
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
BglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgU5FLHNhrR8qX/RQ1yHpeDxjNR51L6OOE
V0o1ZLNkU0swGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMjAy
MTc0MzQ0WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIB
MA0GCSqGSIb3DQEBAQUABIIBAIqvSSuBDkOBTV9ZP5UjRwybktgMB1XfYtM5HwhtqlU9eeRrc9Oa
WJb2C4wUFdIQSu5w/YG4OMi9g9nQrYjPF1aw+OeGaXX7+JswuZs5RV08gGfpb6otgrWwqFERkw1n
QZfUHeE0AmvzHrWgFSaEKglJX2o25Z10SwT9gn3ZuapS8TeXvBnIUnNHMI63ED3NpWCKKc3rptZW
kQ/XQ/bdhHvfT1V4YQo1zVQ5Hw77bjFoU1KV3PVhh5KwpbyCVLFdPjWwljr1AOObplVEINYhzBUD
/h/x1juDWKFUHi7u0trgywrmZiR5kDscqF1A1aJW/GvHoUXZLhTOqbV+9lBoc3g=
--000000000000ebab2a05b57ec8aa--
