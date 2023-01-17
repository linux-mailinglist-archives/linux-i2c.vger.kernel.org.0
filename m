Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E29B666E9C1
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 22:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjAQV6b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 16:58:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjAQV5T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 16:57:19 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1943542DDC;
        Tue, 17 Jan 2023 12:34:47 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id kt14so19305466ejc.3;
        Tue, 17 Jan 2023 12:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lc4VaJLAvuEtHfl2rD1jPE4f8tuwKTBgnejphTOXUQ=;
        b=mRyKI2JkPtnpMXw9D7sqrpbj38NJE3CW1qcB8CzGKUFEyhG8Sh0/npHhqNmpi9vjtX
         l3qPWTGwnqMnzvc1sIt6AJyk6GjNWrNmL0lg19/wuxIWUg3cm73j8VNg3fXOlVdV/TdY
         Rf1qw2ZJ4tadHqg2LokTQiU336cVMVVJcB8o1GZqIFEmLxhcWsdkqJLT3iABNVwbcV5d
         tOxlziXkre6a+prdtacrD2ARyhEbAG88QLRZ7KzBcC1hDQjn2TDkbcl32/M1G+Fe6J6M
         FUg/9K9uAR57IwP1OX/VQXqFuLMu7t6A1pDd/I432A3Vyx64yVcXgjC6JN9Bsex+BrZr
         1ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6lc4VaJLAvuEtHfl2rD1jPE4f8tuwKTBgnejphTOXUQ=;
        b=0ATv9loQrODRiYevQ+/0K7RQhPYckcyv/MCD+Prt9G4+mfx9dB9BXPbuEG6/EcWdSf
         g7rsovFooskPm9RY4LEXCQwnpWE+/A1jirT9I4Es8ZbE8SPbYIc0Ks1qzxiukpTgHi+Z
         n9e6daEIHU6ulm5AmhaoAZqBgZd1Xxirk9YDmGaQsusG8k6FTH4ow5vCarHBqrulQf4Q
         lAPwDNlbUUFMoXQffj4BoG3ORM+oq9BMcD6zD9lnxlRUQo6v4dauYjRJe9QJXf3Q+a5z
         viP1MoGsuQfHCL1FcNkRxalpb0JA8dJVT6TwI7lOXFdLhGSRVoD/oSK0c1C7TQO5BdH1
         b6Pg==
X-Gm-Message-State: AFqh2kpI3hVJTOuHgoCEb7D8XLSHIr7Gtk7+SQEKx/SfowVmVNsRFAL1
        9ZnMKZy3koGMrzIp4efZKqnzQJFRe2g=
X-Google-Smtp-Source: AMrXdXs/xlziqN0dvRwkiF02V9asrBCGA9MOHc2E+7DTtCGq05sZuluClUf4cJ39cngzMhMn8wWBwA==
X-Received: by 2002:a17:906:848e:b0:7c4:fa17:7202 with SMTP id m14-20020a170906848e00b007c4fa177202mr4234545ejx.33.1673987685401;
        Tue, 17 Jan 2023 12:34:45 -0800 (PST)
Received: from ?IPV6:2a01:c22:7346:8100:11fa:3b53:e36a:9e73? (dynamic-2a01-0c22-7346-8100-11fa-3b53-e36a-9e73.c22.pool.telefonica.de. [2a01:c22:7346:8100:11fa:3b53:e36a:9e73])
        by smtp.googlemail.com with ESMTPSA id gk8-20020a17090790c800b0084d35ffbc20sm12555382ejb.68.2023.01.17.12.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 12:34:43 -0800 (PST)
Message-ID: <57666b4f-4c12-7feb-caf1-5bd38908bfc7@gmail.com>
Date:   Tue, 17 Jan 2023 21:34:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v4 0/3] i2c: gpio: support write-only sda
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>
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

There are slave devices that understand I2C but have read-only SDA and
SCL. Examples are FD650 7-segment LED controller and its derivatives.
Typical board designs don't even have a pull-up for both pins.
Therefore add properties for not using open-drain. For write-only SCL
we have a property already, add one for write-only SDA.

v2:
- improve commit message for patch 1

v3:
- patch 2: check for adap->getsda in readbytes()
- patch 2: align warning message level for info on missing getscl/getsda
- patch 3: improve description of attribute sda_is_output_only

v4:
- patch 1: add no-pullup properties
- patch 2: handle SDA and SCL independently
- patch 2: properly handle case that SDA is NULL but SCL not
- patch 3: handle new no-pullup attributes

Heiner Kallweit (3):
  dt-bindings: i2c-gpio: Add properties for dealing with write-only SDA/SCL w/o pullup
  i2c: algo: bit: allow getsda to be NULL
  i2c: gpio: support write-only sda/scl w/o pull-up

 .../devicetree/bindings/i2c/i2c-gpio.yaml     | 16 ++++
 drivers/i2c/algos/i2c-algo-bit.c              | 77 +++++++++----------
 drivers/i2c/busses/i2c-gpio.c                 | 13 +++-
 include/linux/platform_data/i2c-gpio.h        |  9 +++
 4 files changed, 70 insertions(+), 45 deletions(-)

-- 
2.39.0

