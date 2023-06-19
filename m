Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2CF4735B34
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 17:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbjFSPhv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 11:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbjFSPhu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 11:37:50 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E72113;
        Mon, 19 Jun 2023 08:37:49 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5186a157b85so5195439a12.0;
        Mon, 19 Jun 2023 08:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687189068; x=1689781068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfbivNkUyRqUuO2dy5Pvjng0AOI0erWsssVVox7EkxU=;
        b=U7IA9um402pom7Vfn68x9rYJsi5G8Gc8DyRp7c3g9NxHbf+4915W3HlmFO0crI5Sex
         3KjLWzfA7L34zuOC/xgrHke6+1+fi7LLIa+/PUaI6ASm0rXCcfW3tqvcLpZlnMmwkXc6
         s1fJHLGzn/SGlyTS52Awfld0dMKBdUu83FgeGoAOFKWwPelwi/MlAfA2DuQrzNGAWHWw
         yOytdQtU6cfzT+nXU+QDom6cYHvXskXmzXJH9NSG5r4dFHFqu7oOM30sWY8dnOlYncoK
         I24JGwvtRTwUXASmOcddfhkCh0pFxwdoknAg7QZ62ejvzJIOa6l7rNx8ICUUx+tk2ovP
         YqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687189068; x=1689781068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfbivNkUyRqUuO2dy5Pvjng0AOI0erWsssVVox7EkxU=;
        b=PIHv5SCgWOYrFA6wxmMG1Wv7wkquaI2WaPSgKJwH/Tn5Ef/uChu8P6gg4Y46s4yGKO
         SRH3S0WZ4CeAJ4rnuE6pnYkoCRrBJK/BWKdYA+oNkbJpMfZqgYqKWnZdZPF0plnCpn5G
         o0ysrenIGMjNwphnRneVOtzJ2qiirjikvoL7cV29JBdQh559cYPdmZm9PPCLYP3Usan4
         NF1knHy8e8xx7br25FDVNgrb3wWw0NDF3rAq5N0Kx64cIFHiglf3vSpvM3eYS/t9REmM
         n43em3Q3j5PwHv+d8CBje8PD6yZaeme8UygJryUX/MwTYQioYgWKlm5l9yu00HadD9EQ
         hJ+g==
X-Gm-Message-State: AC+VfDxmQVPzvx+VlclVScPNybF45mj6A/7x39qCcRRA+tYSajPZSPDI
        EXq+XE1PnwmNp3dkWYWvvZg=
X-Google-Smtp-Source: ACHHUZ7I63Psrd0vceBOOgWfqVCcsOm9i/fBn9QmXuZWND45VGoFOumg+WpOBAF0aYBOxlXHDcCEUg==
X-Received: by 2002:a05:6402:1245:b0:51b:52fa:4448 with SMTP id l5-20020a056402124500b0051b52fa4448mr890931edw.6.1687189067841;
        Mon, 19 Jun 2023 08:37:47 -0700 (PDT)
Received: from xeon.. ([188.163.112.79])
        by smtp.gmail.com with ESMTPSA id l8-20020a056402344800b005187a42b44fsm7469043edc.58.2023.06.19.08.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:37:47 -0700 (PDT)
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
Subject: [PATCH v2 0/2] GPIO-based hotplug i2c bus
Date:   Mon, 19 Jun 2023 18:37:30 +0300
Message-Id: <20230619153732.46258-1-clamor95@gmail.com>
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

---
Changes in v2:
- adjusted documentation
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

