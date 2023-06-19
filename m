Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1A57359B4
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 16:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbjFSOge (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 10:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjFSOgd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 10:36:33 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3C7F1;
        Mon, 19 Jun 2023 07:36:32 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b479d53d48so13717411fa.1;
        Mon, 19 Jun 2023 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687185390; x=1689777390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lb3BsbwhSdIU8ke3rmUbsQpQJmTyimjl4tAXInZCbwI=;
        b=XMY1F52O9BeRJswuECfglKhJp0K5TP9PrZgTIoRvwkIqaEzCLjYFZ1LEAv0RELrwGs
         7oYHHKGMKXw2sHR3BMolNDOcDfNyEpNlqNdQCMO9GFGRIbNS+C0wFru2przkyxjh8hXC
         LlUCAOOQgtz39imbzV2WISnrse8RLz9hKSN6Iim2b4klrxXZDR1pFVU9rzEcvmK+CKaK
         COQLmPG8LzoXXCpMCnQMyZFoAoj0vZJxfvvDQ/uk8b1fnZUZz5bV0rlcXvYnRft+sHFu
         eVjyxZfaAt1m3ltvDIXd4t2vD8JD5O//CLNTA0op9xXGskT8vHF7gd+EYKzADclOV8ne
         Amsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687185390; x=1689777390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lb3BsbwhSdIU8ke3rmUbsQpQJmTyimjl4tAXInZCbwI=;
        b=YnYLvJ+J2qyxd3zwEXmkbWME9gg2DRhfR4Dii5I7gY65MFbD41GPAhZn3iYcoB8t5X
         QQc4AepZwHfTCndZ4muxq6rlEJShZPwcCgimfL/jn/LLP1FtLM1Lt+nrO8DFaUYEPePd
         q8rZuEXlqaMBZj759XZS0siRGQRhpi1v2SlmCkblxiL3vyI7CP9Wjl/qbSBqnDOmWAKH
         UFulrrcEj6orbb70fdpWHSWV+bwCSxtmKaepd/kvQZuHhgGbV5AIdsTnr4ZtakYW8pxB
         PRtAfG7viBD38NN3WHKmn3QIgLPzJi2pNcLIsWCpXN8q+eHvZHq+xxfC8iFWfeRanGbo
         di4w==
X-Gm-Message-State: AC+VfDxlHM+p/iyBJae34jI+5q08n/UeRkckT2Op2w2zVOdrtdfjUL1m
        DByn2h8wtLKepPl7xJnXM+wV+C+zG2VPIQ==
X-Google-Smtp-Source: ACHHUZ6GsPsB+1U6ide6EgMslbglikC2ezyhHxNi+lDsPqQu+TQt9FwBoIglgfL7iYj0sw6VR/czyw==
X-Received: by 2002:a2e:3019:0:b0:2b4:7380:233 with SMTP id w25-20020a2e3019000000b002b473800233mr2007580ljw.5.1687185389312;
        Mon, 19 Jun 2023 07:36:29 -0700 (PDT)
Received: from xeon.. ([188.163.112.79])
        by smtp.gmail.com with ESMTPSA id r13-20020aa7d58d000000b00514b2a9ce60sm13073283edq.81.2023.06.19.07.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:36:28 -0700 (PDT)
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
Subject: [PATCH v1 0/2] GPIO-based hotplug i2c bus
Date:   Mon, 19 Jun 2023 17:36:09 +0300
Message-Id: <20230619143611.24482-1-clamor95@gmail.com>
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

Michał Mirosław (1):
  i2c: Add GPIO-based hotplug gate

Svyatoslav Ryhel (1):
  dt-bindings: i2c: add binding for i2c-hotplug-gpio

 .../bindings/i2c/i2c-hotplug-gpio.yaml        |  68 +++++
 drivers/i2c/Kconfig                           |  11 +
 drivers/i2c/Makefile                          |   1 +
 drivers/i2c/i2c-hotplug-gpio.c                | 266 ++++++++++++++++++
 4 files changed, 346 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
 create mode 100644 drivers/i2c/i2c-hotplug-gpio.c

-- 
2.39.2

