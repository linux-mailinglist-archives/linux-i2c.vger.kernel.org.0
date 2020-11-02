Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA98F2A23A5
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Nov 2020 04:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgKBDyu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Nov 2020 22:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbgKBDyu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Nov 2020 22:54:50 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF69C0617A6
        for <linux-i2c@vger.kernel.org>; Sun,  1 Nov 2020 19:54:50 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id r10so9620915pgb.10
        for <linux-i2c@vger.kernel.org>; Sun, 01 Nov 2020 19:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=YrsuMiexC3WiBU7PUxjK0Rkk4BgHl4RBp9ESpZ78hcU=;
        b=GFCUlYVLwzQe6wqkpcPHk+D+a6iT6fOgjQ4ZaEz3nnUIQJX2LQG/UBt5XCtRnOmlP+
         m0AgkA8Cfk9Zlf9UpCQ5jvxV+Z8gnd8XFNbD7DEEMA2TG2u2kKWMX5xbj4e/rn74+Gb/
         nx/8RZZwX05leuY4Abmg1uhF55h4HomiOeKbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YrsuMiexC3WiBU7PUxjK0Rkk4BgHl4RBp9ESpZ78hcU=;
        b=GiOE+LxQxtOyqF/ANMDqB2BMhNpcy5C3VEngG3MdmhtZQWkTbD1sY1dIJcjX9jfaSl
         hQPlkzFicyqAGAv7rLA+HThecuyJOuIL7HE2QWy3isEoF0gTX4a8GFDg8a+0Cp0mbFuN
         VgG0mohl3u0wYsqZbkkVz5/vGbHMOBXTXqgj0u7FTC9z4Qmvw+oC9Xrd2GRKcgSdE7qx
         VVJO0XAUUQ0LjQ/tKTg0E8gRrW5Lx6jOOIZSiXHgQjXjNJGpq51PFio4eUyO6yw++1n8
         SgbuJxJGyY+tM+QJ/PeOje5sxjo7JMKmaIGuoMin1gYnjAsPfqiHjQgGM6Q45kMXAhFP
         NkhA==
X-Gm-Message-State: AOAM533wg31PPxe0xLCJ2m9Fnfibtyqwvf9cJvZX3iDBtmRrALR+pt/B
        vOrbi/PBermVZninOcujtBwkXw==
X-Google-Smtp-Source: ABdhPJxhRMmrZiwgG89UX6WijG4ChIfZ/8+djpYXbbz2yfoic4k/3K5cHLHfmXpcEUVNkh9rRG9Ykg==
X-Received: by 2002:a63:d445:: with SMTP id i5mr11598308pgj.53.1604289289322;
        Sun, 01 Nov 2020 19:54:49 -0800 (PST)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id y5sm5655711pfc.165.2020.11.01.19.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 19:54:48 -0800 (PST)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH v3 0/6] fix iproc driver to handle master read request
Date:   Mon,  2 Nov 2020 09:24:27 +0530
Message-Id: <20201102035433.6774-1-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="0000000000003cc5d405b317b5ce"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--0000000000003cc5d405b317b5ce

This series of patches adds the following,
- Handle master abort error
- Fix support for single/multi byte master read request with/without
repeated start.
- Handle rx fifo full interrupt
- Fix typo

Changes from V2:
--Add missing Acked-by tag.

Changes from V1:
--Address review comments from Ray Jui,
  Remove fixes tag

Rayagonda Kokatanur (6):
  i2c: iproc: handle Master aborted error
  i2c: iproc: handle only slave interrupts which are enabled
  i2c: iproc: update slave isr mask (ISR_MASK_SLAVE)
  i2c: iproc: fix typo in slave_isr function
  i2c: iproc: handle master read request
  i2c: iproc: handle rx fifo full interrupt

 drivers/i2c/busses/i2c-bcm-iproc.c | 254 +++++++++++++++++++++++------
 1 file changed, 200 insertions(+), 54 deletions(-)

-- 
2.17.1


--0000000000003cc5d405b317b5ce
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
hkiG9w0BCQQxIgQg79LDm8+g6U1mEoDQWUZtx7r7wJ4YAFL9Q8wS42kZoywwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMTAyMDM1NDQ5WjBpBgkqhkiG9w0BCQ8x
XDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsG
CSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAJsA
E4Rpv5LV4WmMR/9x5OGGEuip3jlktnbW8an8DSkS6a0Y7QCwELnF9ExdCQu1rlJzw9/cWj6VhtV+
8zhsN/Bv1mbYqF1oyWH6dNAIPOSyYhGGsmSQINc0XfVCvBVSOnv0RH8LDGk4st07r/0JQxQ/qP/T
/Ac7C4jpM41F2SmIij+MR/1TQ5+KgrMMsijj3K5PXstzZkijAOBwn/oseDEy6PyTozBiW2Bm9kzB
djzj+i8km7/VfshZeDXH4YShJd3/MpbDozoNKXMzs9iVQzZh59BooiZyCOFy8LzVQkRo2Bs/cfZ1
c/pJOAi5xbTub/+i/tDvx5WNWnzz1l6Tpg4=
--0000000000003cc5d405b317b5ce--
