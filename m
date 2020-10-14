Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F53628DC7C
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 11:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbgJNJMy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 05:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgJNJMu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Oct 2020 05:12:50 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A54EC051100
        for <linux-i2c@vger.kernel.org>; Wed, 14 Oct 2020 02:12:49 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id d24so2363945ljg.10
        for <linux-i2c@vger.kernel.org>; Wed, 14 Oct 2020 02:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tHGFq3L7Zl1w8RXJgF+T37/fuHyhrHL3ZGX0bfp+th4=;
        b=RqeKmdJ3gP4tBEyIyuKkr348YvBNazjiScVcHRmB46q3Pl0XivZgNmW418aHqpRbFj
         uC7dZ+tuvZYimsMETLrutJHx27Q21i8p1OvCKVi/ReLNv3EiJA8ttbTqjsiVGBLNQxUY
         AtXFmtySWEFZM6m3lV35/0RY1yIjykuv3+peE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tHGFq3L7Zl1w8RXJgF+T37/fuHyhrHL3ZGX0bfp+th4=;
        b=b3IReM4UD1LlIql30GmQ1Juvd4qUPaLENNv9Tp5FhfTEg1f1o6mZDUgDgEHVSMe0WU
         GwI5kVZ4qQ4kP5OSoGcQlM/8yyCQlf6rBThC/SbMwqtRSpcknogPxudei30Dh2PQ+m9K
         KXO/uSzEcF+XUYVadlS2daJvXYjGFPvH+kaODOoxkgukozAmokoQRBTuplNnFV4oucIU
         o1vQjvodZFIfIfE/qOwE0O+zBYa5zPsDEJlTVmSPHFMcl4DeTmhx0H6+N8z2vFRzOkFl
         VIi7IX12qIcZ1c13xIFLbfT5DBkM9FFkPsKzLmJG/+6z0VTI5fQSzz6NyqIEIOlGhhA7
         dDfg==
X-Gm-Message-State: AOAM531He6SyGlXPYdkN81g+ATAMJHNdAg6xK4HwlwSzptEbFcA7QQpl
        PkiuyDJTZLrnCVCjMn8PFnkOp9BvvbJ+isVIWV/Q1g==
X-Google-Smtp-Source: ABdhPJx1F1qNFgs7b1joZhHNOlMhOymvJTpmXjhzGE3qBMVyxVB6byhbpUs8PIGJwTedNYIciu7aD1FJpCaqDQgCj1s=
X-Received: by 2002:a2e:808a:: with SMTP id i10mr1317726ljg.427.1602666767726;
 Wed, 14 Oct 2020 02:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201011182254.17776-6-rayagonda.kokatanur@broadcom.com> <1602645639-12854-1-git-send-email-dphadke@linux.microsoft.com>
In-Reply-To: <1602645639-12854-1-git-send-email-dphadke@linux.microsoft.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Wed, 14 Oct 2020 14:42:36 +0530
Message-ID: <CAHO=5PFXGvQjvDtMSDuk5bPdOHeNNFPQ6wnmr7ats3k3S-wp_g@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] i2c: iproc: handle master read request
To:     Dhananjay Phadke <dphadke@linux.microsoft.com>
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
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000697aba05b19def2c"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000697aba05b19def2c
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2020 at 8:50 AM Dhananjay Phadke
<dphadke@linux.microsoft.com> wrote:
>
> On Sun, 11 Oct 2020 23:52:53 +0530, Rayagonda Kokatanur wrote:
> > --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> > +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> >
> > -             } else if (status & BIT(IS_S_RD_EVENT_SHIFT)) {
> > -                     /* Start of SMBUS for Master Read */
> > +                                     I2C_SLAVE_WRITE_REQUESTED, &rx_data);
> > +                     iproc_i2c->rx_start_rcvd = true;
> > +                     iproc_i2c->slave_read_complete = false;
> > +             } else if (rx_status == I2C_SLAVE_RX_DATA &&
> > +                        iproc_i2c->rx_start_rcvd) {
> > +                     /* Middle of SMBUS Master write */
> >                       i2c_slave_event(iproc_i2c->slave,
> > -                                     I2C_SLAVE_READ_REQUESTED, &value);
> > -                     iproc_i2c_wr_reg(iproc_i2c, S_TX_OFFSET, value);
> > +                                     I2C_SLAVE_WRITE_RECEIVED, &rx_data);
> > +             } else if (rx_status == I2C_SLAVE_RX_END &&
> > +                        iproc_i2c->rx_start_rcvd) {
> > +                     /* End of SMBUS Master write */
> > +                     if (iproc_i2c->slave_rx_only)
> > +                             i2c_slave_event(iproc_i2c->slave,
> > +                                             I2C_SLAVE_WRITE_RECEIVED,
> > +                                             &rx_data);
> > +
> > +                     i2c_slave_event(iproc_i2c->slave, I2C_SLAVE_STOP,
> > +                                     &rx_data);
> > +             } else if (rx_status == I2C_SLAVE_RX_FIFO_EMPTY) {
> > +                     iproc_i2c->rx_start_rcvd = false;
> > +                     iproc_i2c->slave_read_complete = true;
> > +                     break;
> > +             }
> >
> > -                     val = BIT(S_CMD_START_BUSY_SHIFT);
> > -                     iproc_i2c_wr_reg(iproc_i2c, S_CMD_OFFSET, val);
> > +             rx_bytes++;
>
> rx_bytes should be incremented only along with I2C_SLAVE_WRITE_RECEIVED event?

It should be incremented in both I2C_SLAVE_WRITE_REQUESTED and
I2C_SLAVE_WRITE_RECEIVED cases because in both cases it is reading
valid bytes from rx fifo.

>
> >
> > +static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
> > +                                 u32 status)
> > +{
> > +     u32 val;
> > +     u8 value;
> > +
> > +     /*
> > +      * Slave events in case of master-write, master-write-read and,
> > +      * master-read
> > +      *
> > +      * Master-write     : only IS_S_RX_EVENT_SHIFT event
> > +      * Master-write-read: both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
> > +      *                    events
> > +      * Master-read      : both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
> > +      *                    events or only IS_S_RD_EVENT_SHIFT
> > +      */
> > +     if (status & BIT(IS_S_RX_EVENT_SHIFT) ||
> > +         status & BIT(IS_S_RD_EVENT_SHIFT)) {
> > +             /* disable slave interrupts */
> > +             val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
> > +             val &= ~iproc_i2c->slave_int_mask;
> > +             iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
> > +
> > +             if (status & BIT(IS_S_RD_EVENT_SHIFT))
> > +                     /* Master-write-read request */
> > +                     iproc_i2c->slave_rx_only = false;
> > +             else
> > +                     /* Master-write request only */
> > +                     iproc_i2c->slave_rx_only = true;
> > +
> > +             /* schedule tasklet to read data later */
> > +             tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
> > +
> > +             /* clear only IS_S_RX_EVENT_SHIFT interrupt */
> > +             iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET,
> > +                              BIT(IS_S_RX_EVENT_SHIFT));
> >
>
> Both tasklet and isr are writing to status (IS_OFFSET) reg.
>
> The tasklet seems to be batching up rx fifo reads because of time-sensitive
> Master-write-read transaction? Linux I2C framework is byte interface anyway.
> Can the need to batch reads be avoided by setting slave rx threshold for
> interrupt (S_FIFO_RX_THLD) to 1-byte?

To process more data with a single interrupt we are batching up rx fifo reads.
This will reduce the number of interrupts.

Also to avoid tasklet running more time (20us) we have a threshold of
10 bytes for batching read.
This is a better/optimised approach than reading single byte data per interrupt.

>
> Also, wouldn't tasklets be susceptible to other interrupts? If fifo reads
> have to be batched up, can it be changed to threaded irq?

tasklets have higher priority than threaded irq, since i2c is time
sensitive so using a tasklet is preferred over threaded irq.

Best regards,
Rayagonda

>
>

--000000000000697aba05b19def2c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQVwYJKoZIhvcNAQcCoIIQSDCCEEQCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg2sMIIE6DCCA9CgAwIBAgIOSBtqCRO9gCTKXSLwFPMwDQYJKoZIhvcNAQELBQAwTDEgMB4GA1UE
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
2HLO02JQZR7rkpeDMdmztcpHWD9fMIIFWTCCBEGgAwIBAgIMPD6uL5K0fOjo8ln8MA0GCSqGSIb3
DQEBCwUAMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQD
EypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0gRzMwHhcNMjAwOTIxMTQw
OTQ5WhcNMjIwOTIyMTQwOTQ5WjCBnDELMAkGA1UEBhMCSU4xEjAQBgNVBAgTCUthcm5hdGFrYTES
MBAGA1UEBxMJQmFuZ2Fsb3JlMRYwFAYDVQQKEw1Ccm9hZGNvbSBJbmMuMRwwGgYDVQQDExNSYXlh
Z29uZGEgS29rYXRhbnVyMS8wLQYJKoZIhvcNAQkBFiByYXlhZ29uZGEua29rYXRhbnVyQGJyb2Fk
Y29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAN9ijdrC8+HqBpo0E+Ls+FXg
gOtAgdzwYtCbNN0FYITddIelxuEryOGaYFXqdi3WiAeyCbHIy0pRxs5Zqq0SLiAuaHbHc2t3cTGA
WQ4i1+Z5ElQVIpZeHqb/exklZ7ZCZ8iUygtNsZqKyqgmFmDMkpEl0CT08yp8/xbhge9NVXOqmA0w
O9iP6hfXOost0TwtIL/JlL94BiyaEOL7a3BwSRXhR2fJO17WpT8X27Dr0gJMx6X0rXkpiiF091Ml
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
hkiG9w0BCQQxIgQgX/+edKBORd1M9vSRw5PCMDTz0u5LVYX8YkkqePkfVPAwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMDE0MDkxMjQ4WjBpBgkqhkiG9w0BCQ8x
XDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsG
CSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBABZL
m6mn0udQYwN2vnxtirjl78VautpqAZ3LrDHT+Di/QYPdKLHLka8gzDAs2Qftv4zhx/vilM/NtVFj
czQLlTShyGMFuwhmdjEd6wJZ30HQVqmUOUQMVu31e8RK9w9klQ22Um7A5fSEljya/7WNCiXQ/QTD
JQVI3gqvcZ5bbQy65DpAt1ReY7NrVOXXt6Pe+kAqHRfK8PA+5rLmTpOV5khnGQBSaNdE8nG699XN
6pPOgGTgovvF624zIy5a8/LDijcRsqh5Sa84d1qQDs+F3Vjl8heI2gDf98MY2JFXXf/3lOJG+Pap
vgtM5+tKJREsJphWZwGqnwKapISwO9JW3Xk=
--000000000000697aba05b19def2c--
