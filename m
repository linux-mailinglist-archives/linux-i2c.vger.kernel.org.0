Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608C52975BB
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Oct 2020 19:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461447AbgJWR0x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Oct 2020 13:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S370301AbgJWR0w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Oct 2020 13:26:52 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF99AC0613CE
        for <linux-i2c@vger.kernel.org>; Fri, 23 Oct 2020 10:26:52 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id e10so1883412pfj.1
        for <linux-i2c@vger.kernel.org>; Fri, 23 Oct 2020 10:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=UwAqWyzZBSZG6scxd7ox700b3jjiUlPsMK0gxlNxYp8=;
        b=GBd/2aHWNNST3epMv6+OjlLx6ULONotzdvTHkuTK6r45GJ2XYazmmqSTsMCl++hjyn
         9SqGcZcctV1JrB7F7d9fFlUNAZpEJh7aJo+3MUTcM6JehWjnMT8MOV36AuDwHkOCyeKi
         792LrdRU2ZSDDp5/+6bFzw6RxaiE3A+GxqGeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=UwAqWyzZBSZG6scxd7ox700b3jjiUlPsMK0gxlNxYp8=;
        b=RSNDqMNW1gVN4MmDS3sHn5TAZfDcwn/IYBe/rYTVdz2FVgnC50HaLOHD0fV34Bc/A4
         rmfs48rQuClzCUYYF4hT8m89StiNU7pvtYJjF77xyU11plPCdO86QYFGt7oWAISeiPtq
         Ulf2bz3ARfhsyMuk1QhWCj6uze9cPZQpc2zSc2HknBIJyxJgZZt66MGx3OJnPkrB+kJd
         /PKpZpUgw8X+ABNpuyFXu4+Z+Y1kfZuE6nXMcwJPF5OGedFrqV/knsRlC6rWT1DFRXFe
         1vJUFLEWp47NAR/lKmlBnj1U83t8+MZaurhS3UJQNb84VA81NCUjRTehhWAm2Uyz5r8D
         Wo6Q==
X-Gm-Message-State: AOAM5339xl6yiZmSe6OMUm0iWlZPYjDvE0HlEg+6e19+iFlPKYX2XR8q
        Eo1CfEZUY2SH7L6gCscQ2WoFsg==
X-Google-Smtp-Source: ABdhPJyiRjRu2Ph1eCxnSucW8TUUW1duiXliDoRNQFtn1l7vp/lIr02sxk7+nMFf1jXxPApyfSC2sg==
X-Received: by 2002:a17:90b:4303:: with SMTP id ih3mr3816001pjb.25.1603474012141;
        Fri, 23 Oct 2020 10:26:52 -0700 (PDT)
Received: from [10.230.182.181] ([192.19.224.250])
        by smtp.gmail.com with ESMTPSA id ga19sm3147741pjb.3.2020.10.23.10.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 10:26:51 -0700 (PDT)
Subject: Re: [PATCH v1 5/6] i2c: iproc: handle master read request
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
References: <20201011182254.17776-6-rayagonda.kokatanur@broadcom.com>
 <1602645639-12854-1-git-send-email-dphadke@linux.microsoft.com>
 <CAHO=5PEtoJrFEPin0hH19Ubs9Zmhxiay4jSGAhXBFE=ft=+CYg@mail.gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <6c16052c-e427-90c1-8095-4135f35cc775@broadcom.com>
Date:   Fri, 23 Oct 2020 10:26:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAHO=5PEtoJrFEPin0hH19Ubs9Zmhxiay4jSGAhXBFE=ft=+CYg@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000ee4e1105b259e2d3"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000ee4e1105b259e2d3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 10/13/2020 10:12 PM, Rayagonda Kokatanur wrote:
> 
> 
> On Wed, Oct 14, 2020 at 8:50 AM Dhananjay Phadke
> <dphadke@linux.microsoft.com <mailto:dphadke@linux.microsoft.com>> wrote:
> 
>     On Sun, 11 Oct 2020 23:52:53 +0530, Rayagonda Kokatanur wrote:
>     > --- a/drivers/i2c/busses/i2c-bcm-iproc.c
>     > +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
>     >
>     > -             } else if (status & BIT(IS_S_RD_EVENT_SHIFT)) {
>     > -                     /* Start of SMBUS for Master Read */
>     > +                                     I2C_SLAVE_WRITE_REQUESTED,
>     &rx_data);
>     > +                     iproc_i2c->rx_start_rcvd = true;
>     > +                     iproc_i2c->slave_read_complete = false;
>     > +             } else if (rx_status == I2C_SLAVE_RX_DATA &&
>     > +                        iproc_i2c->rx_start_rcvd) {
>     > +                     /* Middle of SMBUS Master write */
>     >                       i2c_slave_event(iproc_i2c->slave,
>     > -                                     I2C_SLAVE_READ_REQUESTED,
>     &value);
>     > -                     iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
>     > +                                     I2C_SLAVE_WRITE_RECEIVED,
>     &rx_data);
>     > +             } else if (rx_status == I2C_SLAVE_RX_END &&
>     > +                        iproc_i2c->rx_start_rcvd) {
>     > +                     /* End of SMBUS Master write */
>     > +                     if (iproc_i2c->slave_rx_only)
>     > +                             i2c_slave_event(iproc_i2c->slave,
>     > +                                           
>      I2C_SLAVE_WRITE_RECEIVED,
>     > +                                             &rx_data);
>     > +
>     > +                     i2c_slave_event(iproc_i2c->slave,
>     I2C_SLAVE_STOP,
>     > +                                     &rx_data);
>     > +             } else if (rx_status == I2C_SLAVE_RX_FIFO_EMPTY) {
>     > +                     iproc_i2c->rx_start_rcvd = false;
>     > +                     iproc_i2c->slave_read_complete = true;
>     > +                     break;
>     > +             }
>     > 
>     > -                     val = BIT(S_CMD_START_BUSY_SHIFT);
>     > -                     iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
>     > +             rx_bytes++;
> 
>     rx_bytes should be incremented only along with
>     I2C_SLAVE_WRITE_RECEIVED event?
> 
> 
> It should be incremented in both I2C_SLAVE_WRITE_REQUESTED and  
> I2C_SLAVE_WRITE_RECEIVED cases because in both case it is reading valid
> bytes from rx fifo.
> 
> 
>     >
>     > +static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev
>     *iproc_i2c,
>     > +                                 u32 status)
>     > +{
>     > +     u32 val;
>     > +     u8 value;
>     > +
>     > +     /*
>     > +      * Slave events in case of master-write, master-write-read and,
>     > +      * master-read
>     > +      *
>     > +      * Master-write     : only IS_S_RX_EVENT_SHIFT event
>     > +      * Master-write-read: both IS_S_RX_EVENT_SHIFT and
>     IS_S_RD_EVENT_SHIFT
>     > +      *                    events
>     > +      * Master-read      : both IS_S_RX_EVENT_SHIFT and
>     IS_S_RD_EVENT_SHIFT
>     > +      *                    events or only IS_S_RD_EVENT_SHIFT
>     > +      */
>     > +     if (status & BIT(IS_S_RX_EVENT_SHIFT) ||
>     > +         status & BIT(IS_S_RD_EVENT_SHIFT)) {
>     > +             /* disable slave interrupts */
>     > +             val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
>     > +             val &= ~iproc_i2c->slave_int_mask;
>     > +             iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
>     > +
>     > +             if (status & BIT(IS_S_RD_EVENT_SHIFT))
>     > +                     /* Master-write-read request */
>     > +                     iproc_i2c->slave_rx_only = false;
>     > +             else
>     > +                     /* Master-write request only */
>     > +                     iproc_i2c->slave_rx_only = true;
>     > +
>     > +             /* schedule tasklet to read data later */
>     > +             tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
>     > +
>     > +             /* clear only IS_S_RX_EVENT_SHIFT interrupt */
>     > +             iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET,
>     > +                              BIT(IS_S_RX_EVENT_SHIFT));
>     >
> 
>     Both tasklet and isr are writing to status (IS_OFFSET) reg.
> 
> 
> Yes this is required.
> 
> For ex, If IS_S_RD_EVENT_SHIFT interrupt, this should be cleared once
> the driver completes reading all data from rx fifo.
> After this the driver can start sending data to master.
>  

If both tasklet and isr are accessing the IS_OFFSET register, don't you
need lock protection against race condition? That is, ISR can interrupt
tasklet.

> 
> 
>     The tasklet seems to be batching up rx fifo reads because of
>     time-sensitive
>     Master-write-read transaction? Linux I2C framework is byte interface
>     anyway.
>     Can the need to batch reads be avoided by setting slave rx threshold for
>     interrupt (S_FIFO_RX_THLD) to 1-byte?
> 
> 
> To process more data with a single interrupt we are batching up rx fifo
> reads.
> This will reduce the number of interrupts.
> 
> Also to avoid tasklet running more time (20us) we have a threshold of 10
> bytes for batching read.
> This is a better/optimised approach than reading single byte data per
> interrupt.
> 
> 
>     Also, wouldn't tasklets be susceptible to other interrupts? If fifo
>     reads
>     have to be batched up, can it be changed to threaded irq?
> 
> 
> tasklets have higher priority than threaded irq, since i2c is time
> sensitive so using a tasklet is preferred over threaded irq.
>  

--000000000000ee4e1105b259e2d3
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
BglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgk+L2CYR/23gmADLuEtSwG7cYVmrVxxzz
dUxKZId/YuMwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMDIz
MTcyNjUyWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZI
AWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIB
MA0GCSqGSIb3DQEBAQUABIIBADEnGene93/T9+y0QNdlBgyEH9Qo2KuXVz0l86h7zNpEudqkGe0K
+34NqQqWxuiLptCE/4nGScnCWIuAHwjQtsmne5OIsKORmusyTZxX1Tz3FPxII4TFQxBbfXgFJ5GT
5pghDBYlt7kJpPcBbsbZ0fopJGK3NL6qgOLw4OrHt5dMuw53WrDlkJEuKA5fzUFTMxslhVonc1ti
PyxxRCib04W7tJJiDw+fP3xqSYW9CGruIENyWhiNUOuWda8N8fYmCqtjuCwaQe4u4+bxJZgUnJLg
RYA3tlAlKy2roAdsKHDFYkEmya9iXIdBQT8fTaaEdZxyyCvx0yS4JIWEJEHh9L8=
--000000000000ee4e1105b259e2d3--
