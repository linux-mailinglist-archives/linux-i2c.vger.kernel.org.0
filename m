Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6E84672ADA
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 22:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjARVuC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 16:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbjARVt4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 16:49:56 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A599653B37;
        Wed, 18 Jan 2023 13:49:55 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id x10so535004edd.10;
        Wed, 18 Jan 2023 13:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yb/C3spzKnUDdjhlZvjBZg+IJ28N2MyVtHoQt9/7I/U=;
        b=baSUebx+t5JDT+L3z/M/N+pVAPzi3c8CKN0i8MW4t77mnjpbow/8oHL5q6uC0uwM6x
         Tu/j9DyB4Ppsyw3DvdQRzOLd0MT+vtqOoy7y89z74zxOiZcYNsC+90OxQehrq1T9uWIJ
         kzJiRA8xYw86YRQW70y4sc3T0A9t/AQ8axazjVuLFvVZX+tVnZEt9WC506fsEU73l1ec
         Ww35AEMwCaT/EY0XxodE87XXps/eJzgvukqqvcsItuXGMm3v3gJmg8xsuwrajPUf6NPR
         ArZyNvQMukhxXjqC3b9YPJrYl5x8XaJa0nwUaLCtWinDi9Qpt9AysIof+5mv/Gaiwxbj
         4ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yb/C3spzKnUDdjhlZvjBZg+IJ28N2MyVtHoQt9/7I/U=;
        b=E8SgT61atoAEwwBQyudEoHXWMHbtJ68vPjtGpyQ7TGUrq1NqvqDevK1/82W8CLBDoS
         414oMybLO6vnuXowW/3jfPuUhtJAQHOs6fksjuK20o4zzc7yMVZgsgwt5oZffDcz2/FR
         dvwcSj1vWYlZIlIa9HZ1kP7er/ibOh/iTwVIWXfvZcUkK3gx9nmNhOeNhKSS+k4SQsdL
         tUXqUmX7yCbP0huXLQCcbDQ2jNzEntMlONRgkkarZlAbNXPePMjXHXLt8etKcOIxlgNM
         sfpM3lK0fswD/tzWIoD/uKYxRrfGsCQyc+tEA/qBAp8EMrO4VbaURbqZP+wGRuhg4Mol
         sveQ==
X-Gm-Message-State: AFqh2kqY5F/ro87RokFyQxXBg3sp1rjxzzb9Ec+E4o/eSvpdT/RrAxQe
        Kms9TCjPDC9P09DFBp1KjGtpuZ2a/pg=
X-Google-Smtp-Source: AMrXdXsaZh0MiSdNihvrnbthUgCrIhFU8c1s17dtZUxoTRI8oO6vJKrJnHdbhF1os6BXvsMwRRgpwg==
X-Received: by 2002:a05:6402:4284:b0:499:b672:ee30 with SMTP id g4-20020a056402428400b00499b672ee30mr10833875edc.11.1674078594062;
        Wed, 18 Jan 2023 13:49:54 -0800 (PST)
Received: from ?IPV6:2a02:3100:94be:5400:80c7:5ea4:ed2f:1a59? (dynamic-2a02-3100-94be-5400-80c7-5ea4-ed2f-1a59.310.pool.telefonica.de. [2a02:3100:94be:5400:80c7:5ea4:ed2f:1a59])
        by smtp.googlemail.com with ESMTPSA id w5-20020a50fa85000000b00491c819d6d2sm14746264edr.44.2023.01.18.13.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 13:49:53 -0800 (PST)
Message-ID: <6f4b54d9-ab6d-a4d4-5142-27c89e03c6d2@gmail.com>
Date:   Wed, 18 Jan 2023 22:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v5 0/3] i2c: gpio: support write-only sda
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
v5:
- patch 1: add checking mutually-exclusive attributes to schema

Heiner Kallweit (3):
  dt-bindings: i2c-gpio: Add properties for dealing with write-only SDA/SCL w/o pullup
  i2c: algo: bit: allow getsda to be NULL
  i2c: gpio: support write-only sda/scl w/o pull-up

 .../devicetree/bindings/i2c/i2c-gpio.yaml     | 26 +++++++
 drivers/i2c/algos/i2c-algo-bit.c              | 77 +++++++++----------
 drivers/i2c/busses/i2c-gpio.c                 | 13 +++-
 include/linux/platform_data/i2c-gpio.h        |  9 +++
 4 files changed, 80 insertions(+), 45 deletions(-)

-- 
2.39.0

