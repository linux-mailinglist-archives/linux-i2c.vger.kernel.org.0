Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2B62ACE86
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Nov 2020 05:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731601AbgKJEX6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Nov 2020 23:23:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731423AbgKJEX5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Nov 2020 23:23:57 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F155C0613D3
        for <linux-i2c@vger.kernel.org>; Mon,  9 Nov 2020 20:23:56 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id u18so15584988lfd.9
        for <linux-i2c@vger.kernel.org>; Mon, 09 Nov 2020 20:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MiPAXmdXxDChwVF+WMTIAHbHOfaVa1OeOFBletLvQMI=;
        b=S402EVfCj6IVs9PbyIpzP6pkVMtKioO/uA99wSIqMxXj+1t1Lusp8OWJz8m7T+kpZu
         1nEsj4nLs02q9ZUhmFURb3k+nKzgbB0ETVjqIlLwX0o7uuukW3hSQiLe1xxJo249JSnR
         560WETAellkB+EgZMCwyBYKn5HQLcatKTM9es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MiPAXmdXxDChwVF+WMTIAHbHOfaVa1OeOFBletLvQMI=;
        b=LW8Sr9B2/kFTIOxfa3HF5cdh53UwifFwsi9opbOjaW4Qslrs7hYpvPvlEfwdPu4NbF
         JfF4kEERj4tBz6vJO2zNi3VCrPfdxCtWI6ZNgOgvKYJIEsMxfsieT+RH6+DUDuV+hvNd
         P6kxS8yLWZyBPjqidzfF7gx4VgTsGFYPPFCQhKb3mvMjwMXKMVXBE6V0s5MtIqEeRH8G
         6liNzIqz3zt+fmbK1f49ZTkc4XRyTOpWerxdFguj4iL8bLm2zK4vII1oyYy8hc44+4w8
         /aPc15zUmjzZ/zdP2Yu0+BZkebnLMFdowTLR1h2eFNrPL4KSTitPHbX3NIPap1f2/Ime
         YG5g==
X-Gm-Message-State: AOAM533fiZP4NuhS1lGflq4QYgeMEYp6FPiVE0SsEQ5NmF7OnOYYhv0f
        iXMPa+hDDffRERZ8FAJXzG1GBBHKx1dh24r20A+12Q==
X-Google-Smtp-Source: ABdhPJwi5ELQ5QO+b3S4fCInqX1T5uwDQQv03C2RtO4vkjmLA202chT/DVVUQfxWRtzjHn5+vG1iU1UeE09Bj3++auE=
X-Received: by 2002:a19:4f47:: with SMTP id a7mr7360366lfk.245.1604982234320;
 Mon, 09 Nov 2020 20:23:54 -0800 (PST)
MIME-Version: 1.0
References: <CAHO=5PGAMvRAyrBF3_ubbgciqHV3hAbmt4B7Rb3hdibMbgs6ZQ@mail.gmail.com>
 <1604684486-16272-1-git-send-email-dphadke@linux.microsoft.com>
In-Reply-To: <1604684486-16272-1-git-send-email-dphadke@linux.microsoft.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Tue, 10 Nov 2020 09:53:41 +0530
Message-ID: <CAHO=5PEJZ35O2Kwtinw5Kon+fXvciZHJDn9wCp6LKp8wtvVF=Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] i2c: iproc: handle master read request
To:     Ray Jui <ray.jui@broadcom.com>
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
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000fb634e05b3b90b5a"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000fb634e05b3b90b5a
Content-Type: text/plain; charset="UTF-8"

Hi Ray,

Could you please check Dhananjay comments and update your thoughts.

On Fri, Nov 6, 2020 at 11:11 PM Dhananjay Phadke
<dphadke@linux.microsoft.com> wrote:
>
> On Thu, 5 Nov 2020 15:13:04 +0530, Rayagonda Kokatanur wrote:
> >> So the suggestion was to set HW threshold for rx fifo interrupt, not
> >> really a SW property. By setting it in DT, makes it easier to
> >> customize for target system, module param needs or ioctl makes it
> >> dependent on userpsace to configure it.
> >>
> >> The need for tasklet seems to arise from the fact that many bytes are
> >> left in the fifo. If there's a common problem here, such tasklet would be
> >> needed in i2c subsys rather than controller specific tweak, akin to
> >> how networking uses NAPI or adding block transactions to the interface?
> >>
> >> For master write-read event, it seems both IS_S_RD_EVENT_SHIFT and
> >> IS_S_RX_EVENT_SHIFT are detected, which implies that core is late to
> >> drain rx fifo i.e. write is complete and the read has started on the bus?
> >
> >Yes it's true that for master write-read events both
> >IS_S_RD_EVENT_SHIFT and IS_S_RX_EVENT_SHIFT  are coming together.
> >So before the slave starts transmitting data to the master, it should
> >first read all data from rx-fifo i.e. complete master write and then
> >process master read.
> >
> >To minimise interrupt overhead, we are batching 64bytes.
> >To keep isr running for less time, we are using a tasklet.
> >Again to keep the tasklet not running for more than 20u, we have set
> >max of 10 bytes data read from rx-fifo per tasklet run.
> >
> >If we start processing everything in isr and using rx threshold
> >interrupt, then isr will run for a longer time and this may hog the
> >system.
> >For example, to process 10 bytes it takes 20us, to process 30 bytes it
> >takes 60us and so on.
> >So is it okay to run isr for so long ?
> >
> >Keeping all this in mind we thought a tasklet would be a good option
> >and kept max of 10 bytes read per tasklet.
> >
> >Please let me know if you still feel we should not use a tasklet and
> >don't batch 64 bytes.
>
> Deferring to tasklet is OK, could use a kernel thread (i.e. threaded_irq)
> as i2c rate is quite low.
>
> But do enable rx_threshold and read out early. This will avoid fifo full
> or master write-read situation where lot of bytes must be drained from rx
> fifo before serving tx fifo (avoid tx underrun).
>
> Best would have been setting up DMA into mem (some controllers seem capable).
> In absence of that, it's a trade off: if rx intr threshold is low,
> there will be more interrupts, but less time spent in each. Default could
> still be 64B or no-thresh (allow override in dtb).
>
> Few other comments -
>
> >+              /* schedule tasklet to read data later */
> >+              tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
> >+
> >+              /* clear only IS_S_RX_EVENT_SHIFT interrupt */
> >+              iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET,
> >+                               BIT(IS_S_RX_EVENT_SHIFT));
> >+      }
>
> Why clearing one rx interrupt bit here after scheduling tasklet? Should all that
> be done by tasklet? Also should just return after scheduling tasklet?
>
> Thanks,
> Dhananjay

--000000000000fb634e05b3b90b5a
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
xVUYGnc0GLrYeHC2X4wJbUsgi+UFM/rVW0RKe5Sg4xmLXWc/rBhXDBVPeFVdN2dYsk5MyDRM/fXj
cAA+xTX+SQGoND8CAwEAAaOCAdcwggHTMA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEw
gY4wTQYIKwYBBQUHMAKGQWh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVy
c29uYWxzaWduMnNoYTJnM29jc3AuY3J0MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFs
c2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0
MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNV
HRMEAjAAMEQGA1UdHwQ9MDswOaA3oDWGM2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJz
b25hbHNpZ24yc2hhMmczLmNybDArBgNVHREEJDAigSByYXlhZ29uZGEua29rYXRhbnVyQGJyb2Fk
Y29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBRpcoJiMWeVRIV3kYDEBDZJ
nXsLYTAdBgNVHQ4EFgQU1rE7oQJ7FiSTADFOqokePoGwIq4wDQYJKoZIhvcNAQELBQADggEBAD8I
VcITGu1E61LQLR1zygqFw8ByKPgiiprMuQB74Viskl7pAZigzYJB8H3Mpd2ljve+GRo8yvbBC76r
Gi5WdS06XI5vuImDJ2g6QUt754rj7xEYftM5Gy9ZMslKNvSiPPh1/ACx5w7ecD1ZK0YLMKGATeBD
XybduRFIEPZBAjgJ5LOYT2ax3ZesfAkan1XJ97yLA93edgTTO2cbUAADTIMFWm4lI/e14wdGmK0I
FtqJWw6DATg5ePiAAn+S0JoIL1xqKsZi2ioNqm02QMFb7RbB3yEGb/7ZLAGcPW666o5GSLsUnPPq
YOfL/3X6tVfGeoi3IgfI+z76/lXk8vOQzQQxggJvMIICawIBATBtMF0xCzAJBgNVBAYTAkJFMRkw
FwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQDEypHbG9iYWxTaWduIFBlcnNvbmFsU2ln
biAyIENBIC0gU0hBMjU2IC0gRzMCDDw+ri+StHzo6PJZ/DANBglghkgBZQMEAgEFAKCB1DAvBgkq
hkiG9w0BCQQxIgQgzdzylOZ00558hEz3E5iTS4XcbaZocjIPgSDR7sFdzZowGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMTEwMDQyMzU0WjBpBgkqhkiG9w0BCQ8x
XDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsG
CSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAEH0
tAF/3I2UkyeK2AesPgympEjXy8noFEmApzb99+Q4c+A3dKlmjEtYieY49xCJBPFFeDTX2Rano22N
7aorULxLf+U7hd/h4lshOv4A9qvtay5/gIjJrI8fY9k8+e8YMgqM+RBIGsIVJjm9MW4BkrEzXAz6
NGr2ivYqj3cMQ0fqWvP+eBXD/mCiY2Y287MdjgvyzkIdGxozgyU+YbAXFlg273uWYHIh2X+aijuF
f+77uTXHs3A0MwrSqCykzxV0CjoaUlNCWmXkYtUX9n8cpV8zOyzE8ZnssSq0/GyPgaICWSkGbTqV
oJJSPLiwXhXmNZn3pRUYjzBsb9bVthcpn2A=
--000000000000fb634e05b3b90b5a--
