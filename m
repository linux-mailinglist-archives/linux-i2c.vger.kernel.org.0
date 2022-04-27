Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1993D51227F
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Apr 2022 21:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbiD0TZw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Apr 2022 15:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234249AbiD0TZQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Apr 2022 15:25:16 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0FD6515B8;
        Wed, 27 Apr 2022 12:20:46 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t6so3848434wra.4;
        Wed, 27 Apr 2022 12:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :content-language:content-transfer-encoding;
        bh=l+fWRCnlsDX073yEnS2AwNoaDg75F4nU098U70Iwazw=;
        b=XQ7Tmh35axRFQPHV2QSYPADNzmaPb568O/5D2oDi9Een/DFOirBn1j6CPAcNahRZcS
         MYBGgi0+DA6aNu0j/7V6pP/goI5jW7ktJgIXN71ofVmFeIdz3fSfNjYZ4LlWGjE4+y8G
         H8XvyIqEdyQ2pCR4QqSXcvicztmmfnrEExE5mfhed7HIv+xaPMXBnPrvs44ubuUdO5WL
         yRHG0SL4wCsh2rAcmmI1l40qer4f0Sm1KKodjNaFtYMUt60hSzcdHRfy5bJIRHuHIe/X
         bwMeZRGe0AE8FSDh6L4+mDZVHKyWEVIz/hVUvUbShU7PumxTCTcGRJi1oINmldVd8Lr0
         ZQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=l+fWRCnlsDX073yEnS2AwNoaDg75F4nU098U70Iwazw=;
        b=I2PHlu07BMt5J1b/eVL4+FsC3NxPdR5fMtDkw/TXPPZw8C62pfKgl4Q9NHgQKslJs2
         yI63+TiHrt0WlqkJXjZ4P/Ei5+pdtJ2XByysKiMiSUWwtPjsQNEJbFcmGeinlcBK57W4
         e17fik3S94XA2MnqaoYt3hKBRHOpMJLKqyIV7ywNx0OZkJGxpsvO1uc/mD5jvKgYLEH5
         WRH5xAh5UNfU53QsnvgIWgNyaQ1uOdN93+ai3mnyddzj2IDz/M8DFNrmPK9lnoWNfIMY
         e7hnShsIlqDz2JhrnHFImb4EKUAAEaoQSElDn36YyVxPtTydYN13n2cAsiPerBXiLEe7
         vTIA==
X-Gm-Message-State: AOAM530SkXyN0M6I1LEeVzTmAzES2fUY7tj/DtZmvJoO0e5AHnY7i6PJ
        kMyysm3sK3YbKklEdbNcZt8=
X-Google-Smtp-Source: ABdhPJyQuKyD0Ue7NvGpQOg3e2fy2XDG7LhcnSm4XToT4rx/2GyfR4m+gitgPaifyJLYl/9Fp+Awhg==
X-Received: by 2002:adf:eb09:0:b0:207:bb77:9abb with SMTP id s9-20020adfeb09000000b00207bb779abbmr23721563wrn.375.1651087245295;
        Wed, 27 Apr 2022 12:20:45 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c002:fc00:393a:1fdf:a518:6420? (dynamic-2a01-0c23-c002-fc00-393a-1fdf-a518-6420.c23.pool.telefonica.de. [2a01:c23:c002:fc00:393a:1fdf:a518:6420])
        by smtp.googlemail.com with ESMTPSA id v18-20020adfc5d2000000b0020589b76704sm16188366wrg.70.2022.04.27.12.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 12:20:44 -0700 (PDT)
Message-ID: <3e6c934e-5298-42c5-c346-31b1acaa06ba@gmail.com>
Date:   Wed, 27 Apr 2022 21:20:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 0/3] i2c: gpio: support write-only sda
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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

v2:
- improve commit message for patch 1

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

