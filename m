Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D862A5D3E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Nov 2020 04:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgKDD5a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Nov 2020 22:57:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgKDD53 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Nov 2020 22:57:29 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64389C061A4D
        for <linux-i2c@vger.kernel.org>; Tue,  3 Nov 2020 19:57:29 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s30so2988462lfc.4
        for <linux-i2c@vger.kernel.org>; Tue, 03 Nov 2020 19:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gaXtHpBrlxR6wEbbsYCmBn5xIrujwPP1FIE/bo3ltmc=;
        b=SACbZ+dtgAEBxH40AQNaityku77yrm9mmYixEvcePZKJk/th+nr72AXWgKE5Td9zKS
         KEBlxMSt0ApYsIORwUwgTKVxn5Mb8eRSIIThfKH1UlFcNSUlyMvHFJXtrKoeNrhBw6Ga
         Q95+cyIFNbwDawvG/4rbxFK64bamwkCqkJMlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gaXtHpBrlxR6wEbbsYCmBn5xIrujwPP1FIE/bo3ltmc=;
        b=iiiv3fB/FaFg7DJvboisPghNIa0qik7p79Vr3LD2tnlxzz7/QGQcioCMSFCZqTOfr6
         /67jSfTFMG0euK8fkUlcvsFUr2TuQJPdwPumHiRQCYMIhL0+By8BnS/wqhd4Q9LVhULT
         cOqCZmhHYvAulRichFc0E7FQ+PMLCKPLQKOp9V6oWGurPNdSGM3Zld2mOSWU3G0NKHpu
         B7vPYuhf7AIjcGL51r6gCNvZmuK2XWlEr9VB5MOWTPKDI0hVmwL4XB/d5V/xf/b3OElu
         Om3EMulhyUC5q8u8mBEk4hFoKILzpHfP+xlorVo3OUobgXYU5pVjSqQyrL/foS13MlBC
         hJ+A==
X-Gm-Message-State: AOAM531NYuMSfQUZe2wWxvziL8Jwns8TwDP2SUemFrS35DwOEjf6+jF5
        sAu1Es/eOi3ilq62kVSm7Hmtm1cxwURDOJP4dd2ORjX7rEP7MYB3
X-Google-Smtp-Source: ABdhPJy0KlKHv7n8jvHCRk3WYvhvUrG7sZqZBvezZPpkVKRsk8FaPsUQId11RTWZfCBQN7zpIKMYs7uTBOzHWlmDcY4=
X-Received: by 2002:a05:6512:1da:: with SMTP id f26mr9576019lfp.245.1604462247625;
 Tue, 03 Nov 2020 19:57:27 -0800 (PST)
MIME-Version: 1.0
References: <20201102035433.6774-6-rayagonda.kokatanur@broadcom.com> <861d734f-c776-f70b-e414-a4b32c0f991e@gmail.com>
In-Reply-To: <861d734f-c776-f70b-e414-a4b32c0f991e@gmail.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Wed, 4 Nov 2020 09:27:16 +0530
Message-ID: <CAHO=5PGdcN2V8XOKdtTHwUBJW9eB2mjQ-CeMvwK4Rem7KBy5GA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] i2c: iproc: handle master read request
To:     Florian Fainelli <f.fainelli@gmail.com>
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
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="0000000000005a74fb05b33ffaeb"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--0000000000005a74fb05b33ffaeb
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 4, 2020 at 9:05 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 11/2/2020 10:19 PM, Dhananjay Phadke wrote:
> > On Mon,  2 Nov 2020 09:24:32 +0530, Rayagonda Kokatanur wrote:
> >
> >> Handle single or multi byte master read request with or without
> >> repeated start.
> >>
> >> Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
> >> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> >> ---
> >>  drivers/i2c/busses/i2c-bcm-iproc.c | 215 +++++++++++++++++++++++------
> >>  1 file changed, 170 insertions(+), 45 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> >> index 7a235f9f5884..22e04055b447 100644
> >> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> >> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> >> @@ -160,6 +160,11 @@
> >>
> >>  #define IE_S_ALL_INTERRUPT_SHIFT     21
> >>  #define IE_S_ALL_INTERRUPT_MASK      0x3f
> >> +/*
> >> + * It takes ~18us to reading 10bytes of data, hence to keep tasklet
> >> + * running for less time, max slave read per tasklet is set to 10 bytes.
> >> + */
> >> +#define MAX_SLAVE_RX_PER_INT         10
> >>
> >
> > In patch [3/6], you've enabled IS_S_RX_THLD_SHIFT in slave ISR bitmask,
> > however it's not actually used in processing rx events.
> >
> > Instead of hardcoding this threshold here, it's better to add a
> > device-tree knob for rx threshold, program it in controller and handle
> > that RX_THLD interrupt. This will give more flexibility to drain the rx
> > fifo earlier than -
> > (1) waiting for FIFO_FULL interrupt for transactions > 64B.
> > (2) waiting for start of read transaction in case of master write-read.

Yes this is one way to implement.
But do you see any issue in batching 64 bytes at a time in case of
transaction > 64 Bytes.
I feel batching will be more efficient as it avoids more number of
interrupts and hence context switch.

>
> The Device Tree is really intended to describe the hardware FIFO size,
> not watermarks, as those tend to be more of a policy/work load decision.
> Maybe this is something that can be added as a module parameter, or
> configurable via ioctl() at some point.

#define MAX_SLAVE_RX_PER_INT         10

is not hw fifo threshold level, it is a kind of watermark for the
tasklet to process the max number of packets in single run.
The intention to add the macro is to make sure the tasklet does not
run more than 20us.
If we keep this as a module parameter or dt parameter then there is a
good possibility that the number can be set to higher value.
This will make the tasklet run more than 20us and defeat the purpose.

This number is constant and not variable to change

Please feel free to add your comments.

Best regards,
Rayagonda

> --
> Florian

--0000000000005a74fb05b33ffaeb
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
hkiG9w0BCQQxIgQguIgJQdoPdON4MJRNk4F8yoCvkyKE0Zah3wDbm3Xu6fcwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMTA0MDM1NzI4WjBpBgkqhkiG9w0BCQ8x
XDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsG
CSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAHt1
4SvmJzLo6BpvQ3LeHXmESkQZS5nS0UW0eZ1djH+86BzYaV8M5BpqCSEzeI05YBJ4/B0dD9U4B9MU
sHHgMJ4caOPTIzb6Ku0B81Bqlzru8IZD06fKaYN411w9L3c514umqAHCHDe9HKBtt0bQkOl71m2x
0nu9+vsMBna1VxGmxItLOosiBbhlI3AjXSYrgmz4iutfnru0cVDc4YxeKB2q3VxXlOfjkQMC1jr5
X7oJEqTdD906DlEA4JxRsyWhSmi/MltYiu6Fa2s/EV0caIkwTPjx6QEQDtQXZNVJvnpy+PO6jqBw
G3DRV7n5b1MuNNSvridsp+VovXopRNS6yjc=
--0000000000005a74fb05b33ffaeb--
