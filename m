Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A7A2A7AD7
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 10:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgKEJnS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Nov 2020 04:43:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbgKEJnS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Nov 2020 04:43:18 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988FCC0613CF
        for <linux-i2c@vger.kernel.org>; Thu,  5 Nov 2020 01:43:17 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id l28so1325693lfp.10
        for <linux-i2c@vger.kernel.org>; Thu, 05 Nov 2020 01:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AB1Nk1+sPuO4WBNU58NwEYCRA8u7gXMMHhqysPkPnzQ=;
        b=ZriJJMVvznt2rPDHy92anzxk66ymxJ52aCWv4HSS788mQGZkGyN4i0goExeryZ0ODg
         30inLgzhta5lIuMnbe8x/8FAD7YQm/kfYculjbN9TSryZm2uHQemplBntQ20PmNW3+LE
         Ic3Ykifyz6xyxUuXW/wL55iM12U3NW4Tq4Mco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AB1Nk1+sPuO4WBNU58NwEYCRA8u7gXMMHhqysPkPnzQ=;
        b=ZI4YHV/8eekYUWSVOnlLYRbmhpZMSM2ni3S/Iui0xqyD/QDkbBthgvoPKIf7+hVWvY
         wHW5vgPWEzi01BbAonbJpf0IJGFsePXydLqPx6S6fGIIby1wFnqaHWTm7nhPqbpyAKMQ
         13yC3zioXsjx7ZBVy/B2iRq6B7mZEyIxU3oMTx8edVhvMHUv+AFWtqretSNdyMedIu4A
         RnYYuuzGSpfuk6Bm+lkmmuTiQegdxDkeKV6Wk4PLRmebg/6ks642HflSiLzl1AvsBBhR
         Zn8BOBpRNRfBQt+rBRRBG8LEKKI659dCNGr+jrOylRVhS4f5zqqcafTkXRs19hSTS41t
         9RRg==
X-Gm-Message-State: AOAM530/15A2Ln9SPgKu+qDVeTUh3BuwqtVUYVhiJg0BoJX17XqFNs0m
        u5CnxrfZKNHxKrz1jRkc+609xDX16hVWDgjjaGa3ag==
X-Google-Smtp-Source: ABdhPJxNBi9lJumNDCQsJnessqCVFtAmsIUiW/WfoYi59qLVhmXCM1m3BB6m3bicn7SDIVa2ktzqNuDzbLuWxT5+2pQ=
X-Received: by 2002:a05:6512:1087:: with SMTP id j7mr623808lfg.122.1604569395807;
 Thu, 05 Nov 2020 01:43:15 -0800 (PST)
MIME-Version: 1.0
References: <97a8d7bf-e877-c03a-f789-16cac9bb2643@broadcom.com> <1604562405-25414-1-git-send-email-dphadke@linux.microsoft.com>
In-Reply-To: <1604562405-25414-1-git-send-email-dphadke@linux.microsoft.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Thu, 5 Nov 2020 15:13:04 +0530
Message-ID: <CAHO=5PGAMvRAyrBF3_ubbgciqHV3hAbmt4B7Rb3hdibMbgs6ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] i2c: iproc: handle master read request
To:     Dhananjay Phadke <dphadke@linux.microsoft.com>
Cc:     Ray Jui <ray.jui@broadcom.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000e2460c05b358ec30"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000e2460c05b358ec30
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 5, 2020 at 1:16 PM Dhananjay Phadke
<dphadke@linux.microsoft.com> wrote:
>
> On Wed, 4 Nov 2020 10:01:06 -0800, Ray Jui wrote:
>
> >>>> +#define MAX_SLAVE_RX_PER_INT         10
> >>>>
> >>>
> >>>> In patch [3/6], you've enabled IS_S_RX_THLD_SHIFT in slave ISR bitmask,
> >>>> however it's not actually used in processing rx events.
> >>>>
> >>>> Instead of hardcoding this threshold here, it's better to add a
> >>>> device-tree knob for rx threshold, program it in controller and handle
> >>>> that RX_THLD interrupt. This will give more flexibility to drain the rx
> >>>> fifo earlier than -
> >>>> (1) waiting for FIFO_FULL interrupt for transactions > 64B.
> >>>> (2) waiting for start of read transaction in case of master write-read.
> >>
> >> Yes this is one way to implement.
> >> But do you see any issue in batching 64 bytes at a time in case of
> >> transaction > 64 Bytes.
> >> I feel batching will be more efficient as it avoids more number of
> >> interrupts and hence context switch.
> >>
> >>>
> >>> The Device Tree is really intended to describe the hardware FIFO size,
> >>> not watermarks, as those tend to be more of a policy/work load decision.
> >>> Maybe this is something that can be added as a module parameter, or
> >>> configurable via ioctl() at some point.
> >>
> >
> >Yes, DT can have properties to describe the FIFO size, if there happens
> >to be some variants in the HW blocks in different versions. But that is
> >not the case here. DT should not be used to control SW/use case specific
> >behavior.
>
> So the suggestion was to set HW threshold for rx fifo interrupt, not
> really a SW property. By setting it in DT, makes it easier to
> customize for target system, module param needs or ioctl makes it
> dependent on userpsace to configure it.
>
> The need for tasklet seems to arise from the fact that many bytes are
> left in the fifo. If there's a common problem here, such tasklet would be
> needed in i2c subsys rather than controller specific tweak, akin to
> how networking uses NAPI or adding block transactions to the interface?
>
> For master write-read event, it seems both IS_S_RD_EVENT_SHIFT and
> IS_S_RX_EVENT_SHIFT are detected, which implies that core is late to
> drain rx fifo i.e. write is complete and the read has started on the bus?

Yes it's true that for master write-read events both
IS_S_RD_EVENT_SHIFT and IS_S_RX_EVENT_SHIFT  are coming together.
So before the slave starts transmitting data to the master, it should
first read all data from rx-fifo i.e. complete master write and then
process master read.

To minimise interrupt overhead, we are batching 64bytes.
To keep isr running for less time, we are using a tasklet.
Again to keep the tasklet not running for more than 20u, we have set
max of 10 bytes data read from rx-fifo per tasklet run.

If we start processing everything in isr and using rx threshold
interrupt, then isr will run for a longer time and this may hog the
system.
For example, to process 10 bytes it takes 20us, to process 30 bytes it
takes 60us and so on.
So is it okay to run isr for so long ?

Keeping all this in mind we thought a tasklet would be a good option
and kept max of 10 bytes read per tasklet.

Please let me know if you still feel we should not use a tasklet and
don't batch 64 bytes.

Thanks
Rayagonda
>
>
> Thanks,
> Dhananjay
>
>

--000000000000e2460c05b358ec30
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
hkiG9w0BCQQxIgQg8VB9srFPwNQymK1ybJsugw8jDfR4M3Pqjtl5euqHb2EwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMTA1MDk0MzE2WjBpBgkqhkiG9w0BCQ8x
XDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsG
CSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAK80
No/GKCbIpRylz0jDyNxUpMqTrgOrO/NQb+lWd0q5jfbIo2O3DtQSvnLfoJV9huxzZN1dTExpje/D
fwhEBQUIvuczt4X8qRs2CCBqL+XczTSViuOEbgGgdeZfpNvztyh6nuZurMUguiXRBGNkuk05mVys
sOzecdqHdB33HgO9C3Mqa914zyZZ23d3QHpDZTRnBD+DF/d82ngJiWlkG/IfM8tdxTFIa1M3vaFp
kTCN7LzXhv9X1IxGLh+PBWc7c+Zz+qmKOGqHCwX1Ck6IQsk8GO75DwjNsWWL8h9hjapK1KsHBANq
uR6kfxE5v7fcKTwYQyTwT4UQ9looNA52+bY=
--000000000000e2460c05b358ec30--
