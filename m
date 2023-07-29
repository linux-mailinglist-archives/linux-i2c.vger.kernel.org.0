Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C5876807B
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jul 2023 18:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjG2QJ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jul 2023 12:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjG2QJ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 29 Jul 2023 12:09:27 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F6EA8;
        Sat, 29 Jul 2023 09:09:26 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9dc1bff38so6975011fa.1;
        Sat, 29 Jul 2023 09:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690646965; x=1691251765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYuOI65YzPrj3n+lLQ6cTdOtLO/GiTyHb3SVK41xJL0=;
        b=T4NbtfL5FaqYm+mdCgKbufrc7EjCOxUovoV+JIx4PGuceIV38teYQyza+3ly+p+h7C
         rvPSqPc91EVn7T2N9Y8zft15HndkjRj4HDiqS+J5QDjlk+oPR/8Z7+qtDyKB4lsJYXNB
         exZD7P3iwAkglYsrN4hzBV5839nmu+5X18WzzXykh9JLsPmrrxSICcsd632u5M+l8YLX
         cSjYztcHeR8NGAqq+cIJB5ERQns+mNFHe9yUAnn1wsN0K4EWpnG9G7mmi6SpeOJw9iGE
         JUPG29huPwAglcGc+u8PI7OTKI3pQQNjJhGYSrL1a7zRJnsk6c+zLEb8rADuXju/Srs7
         /Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690646965; x=1691251765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYuOI65YzPrj3n+lLQ6cTdOtLO/GiTyHb3SVK41xJL0=;
        b=Y03d6Hv8exjTWfdDPS2YJI66hvuEYr2U2+Ajt+QCafN97AQMRDiJleOpIiPTZAaXx3
         ufTtLmptrP/H8LQn/+/gx2gjUPar8LDhNj0E/jCU0mePGyZ4Rg4Rf9VHUuG6+D4jysYX
         oYQNoEAxsDwJOlTsNxLClUDoxFZKFRxNkbudpQ9KBqoUpdgrfrlqOCLHs28oFmJfcrQT
         ON1LiHujzVrRBDleo3j6j466pa6NKCyzhvIgzemUWibiUd30rNenRDK+MugE1i2dFlL/
         YJnFAe2HazAIaJouyzBUL7Esg/SKlPtkODBE5VMrc7MetGoSGzfB6SouDqIXj6r6edoq
         qYTg==
X-Gm-Message-State: ABy/qLbbXM3DgdoVmsA7jtT3/mPQ9vYYWYd8it+LL6J8fGrLzEWGCrkN
        jG2vnd7irCiZtoIwm12XHDG+HvhZ5PebUg==
X-Google-Smtp-Source: APBJJlFUFhd+ptGTWIR2/XIehd1W1q97EaDiefhCvwjmtmYrhEAObEDy2Tstemz3GwyVG0i77H+wwQ==
X-Received: by 2002:a2e:9150:0:b0:2b9:b27c:f727 with SMTP id q16-20020a2e9150000000b002b9b27cf727mr4056532ljg.8.1690646964408;
        Sat, 29 Jul 2023 09:09:24 -0700 (PDT)
Received: from xeon.. ([188.163.112.48])
        by smtp.gmail.com with ESMTPSA id f10-20020a2ea0ca000000b002b6daa3fa2csm1346886ljm.69.2023.07.29.09.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 09:09:24 -0700 (PDT)
From:   Svyatoslav Ryhel <clamor95@gmail.com>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] GPIO-based hotplug i2c bus
Date:   Sat, 29 Jul 2023 19:08:55 +0300
Message-Id: <20230729160857.6332-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ASUS Transformers require this driver for proper work with their dock.
Dock is controlled by EC and its presence is detected by a GPIO.

The Transformers have a connector that's used for USB, charging or
for attaching a keyboard (called a dock; it also has a battery and
a touchpad). This connector probably (I don't have the means to verify
that) has an I2C bus lines and a "detect" line (pulled low on the dock
side) among the pins. I guess there is either no additional chip or
a transparent bridge/buffer chip, but nothing that could be controlled
by software. For DT this setup could be modelled like an I2C gate or
a 2-port mux with enable joining two I2C buses (one "closer" to the
CPU as a parent).

In this case it's hard to tell the difference if this is real or virtual
hardware.

This patchset is a predecessor of a possible larger patchset which
should bring support for a asus-ec, an i2c mfd device programmed by
Asus for their Transformers tablet line. Similar approach is used in
Microsoft Surface RT for attachable Type Cover.

> What is this actually doing?
Basically it duplicates the parent i2c bus once detection GPIO triggers
and probes all hot-pluggable devices which are connected to it. Once
GPIO triggers a detach signal all hot-pluggable devices are unprobed and
bus removed.

> Is the GPIO an irq line for signalling hoplugging and can be used by
> any driver or just this one?
It can be shared if necessary but usually all hot-pluggable devices
are gathered in one container and are plugged simultaneously.

---
Changes from v2:
- expanded descryption of driver implementation commit
- expanded descryption in patchset cover
- no changes to code or yaml from v2

Changes from v1:
- documentation changes:
  - dropped | from description
  - dropped nodename
  - unified use of quotes
  - used GPIO_ACTIVE_LOW define
  - used phandle instead of path
---

Michał Mirosław (1):
  i2c: Add GPIO-based hotplug gate

Svyatoslav Ryhel (1):
  dt-bindings: i2c: add binding for i2c-hotplug-gpio

 .../bindings/i2c/i2c-hotplug-gpio.yaml        |  65 +++++
 drivers/i2c/Kconfig                           |  11 +
 drivers/i2c/Makefile                          |   1 +
 drivers/i2c/i2c-hotplug-gpio.c                | 266 ++++++++++++++++++
 4 files changed, 343 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
 create mode 100644 drivers/i2c/i2c-hotplug-gpio.c

-- 
2.39.2

