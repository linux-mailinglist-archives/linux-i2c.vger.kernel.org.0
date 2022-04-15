Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 858B9502AF9
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 15:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354053AbiDONeb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 09:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354055AbiDONe1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 09:34:27 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1A766F9E;
        Fri, 15 Apr 2022 06:31:49 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id bg10so15412831ejb.4;
        Fri, 15 Apr 2022 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=BqkDESvx5EgSrvUEAlpsXdgJbFp7aNWScfBQ63WFXyM=;
        b=aXKUlvKxcwQD4dBnLAjkdAVc0Ezr8LUGd4Ea/mBaJHCV4j09XEc86O4bqevSNWJvIW
         fjoRiadwE9mZVXvBawR8FjRH2RA1nd0b3T5jW6ffM8V/iTZifLsolMzN6UEbifxR6I/j
         V/zQcsO4+/0tcBUdNJELxRKtX59M7un5mIO38xAjyrTlI9YUB6Tz3Vfdkx9zjy7UGrmc
         S9bJJsesQBVpitkAii0cWAUg/wcc3VqOrTJeGBV6N4+tnIytFC8KGFsxJgrqD7j1+iMw
         Twhcnw8SstUm35cEk40+4XuXPuuWuC9P2Syaz8vnhiUajIL/XWwQ394sZCxMdOp1TsdN
         MwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=BqkDESvx5EgSrvUEAlpsXdgJbFp7aNWScfBQ63WFXyM=;
        b=Dd1KBwiDmbeDSqCge2MlcHRQHYUv9tm5wIvN1zalu91DpxXu8uQgkIryBwtPzlgcJa
         +hxZJnqgsbwIp8aSCHHVCo3ZR3Xw7IjhblHq/DHILXiLTNZKeJcoPLmTTuh0OHJl6ToQ
         CjVJaQ9cPhx96bP8HmSfG2HQkw9z5TnMP552KsXaYkSkGe34NHK93O8SUs7VyQ85MMZo
         8CuadFjtTScIjqvwAPsmfh/dtMSn0Kts0WBxKvRIvcKCwEzt/6MMrWWW2Fv1i4I0ONBu
         dkrz4drrf6iLawlHq9a5p62hqYtt37Nd0RXugZqspAeRg1ZallnGwmkMeYCqNzsnb6L0
         F5zg==
X-Gm-Message-State: AOAM531oU4bFqu2lLg2Vc2jDKyOl8z63+s7VYUoCBHA05JHnatiaS8Mc
        KtwCOBjKbG7f1Bcs2obhVGM=
X-Google-Smtp-Source: ABdhPJx/rCyBmBGygbfVjgunz2AZO4ac3VzTsZsSRGRDolLWMangx/k+ElKpJVYFYSDI/Mh1/P1i1A==
X-Received: by 2002:a17:906:c103:b0:6e0:df50:7f52 with SMTP id do3-20020a170906c10300b006e0df507f52mr6476870ejc.501.1650029507578;
        Fri, 15 Apr 2022 06:31:47 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id kw3-20020a170907770300b006b2511ea97dsm1697892ejc.42.2022.04.15.06.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 06:31:46 -0700 (PDT)
Message-ID: <bc229e73-52aa-9f5d-c6fd-e84b64a589ba@gmail.com>
Date:   Fri, 15 Apr 2022 15:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/3] i2c: gpio: support write-only sda
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are slave devices that understand I2C but have read-only
SDA and SCL. Examples are FD650 7-segment LED controller and
its derivatives. Typical board designs don't even have a
pull-up for both pins. This patch makes i2c-gpio usable with
such devices, based on new DT property i2c-gpio,sda-output-only.

Heiner Kallweit (3):
  dt-bindings: i2c-gpio: Add property i2c-gpio,sda-output-only
  i2c: algo: bit: allow getsda to be NULL
  i2c: gpio: support write-only sda

 .../devicetree/bindings/i2c/i2c-gpio.yaml        |  4 ++++
 drivers/i2c/algos/i2c-algo-bit.c                 | 16 +++++++++++++---
 drivers/i2c/busses/i2c-gpio.c                    | 14 +++++++++++---
 include/linux/platform_data/i2c-gpio.h           |  2 ++
 4 files changed, 30 insertions(+), 6 deletions(-)

-- 
2.35.3

