Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 359F74FA9AF
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Apr 2022 18:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239741AbiDIQpq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Apr 2022 12:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239832AbiDIQpp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Apr 2022 12:45:45 -0400
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1972E2414EB;
        Sat,  9 Apr 2022 09:43:38 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id l26so22978395ejx.1;
        Sat, 09 Apr 2022 09:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pVmzukBjy0oK5OWKVTDNtxD4bzljFSiqXQowPFnBMAs=;
        b=ihuV1XAQXcB4zoZMmEQcaiHloP5uBDw+kpfi/IJX8q0Cq/cgof3X1oAGmKFXujZ1Pq
         fLle/bdsZS+CPemgKP3KiTXRRZgAq42lktZ3KWwOwppdkwF6OX8KB9aZSQjvPXfRjuRq
         a4sIWzbVYOhnjgarqZ7zEXlXII5QIKWc7hAvO81cFK7XxeM9F9tObO1dgcwoWvN92ibi
         2v2NRz15bo/HQD5HXot9KoPHimpWseOPdsDwVtFOufJym+4vbuqgSUBUyZaYZJT3SDzi
         bjL5yrLaXfy2zqp2ZHHb47A3sBstc31V5dd91XLZqYcbnT4NHas7GCEWmndsNfEPpw3a
         wcQg==
X-Gm-Message-State: AOAM530/Wku3QSgSJQsvTdN0K8+znbfShbhPReyl7zIM0RYo3RwAI1bF
        yT+lYZRnSFrFyo1NOAfWeow=
X-Google-Smtp-Source: ABdhPJzqla9fbXMWhSk7USFQi80ez1A3cQaB67I3GHpphQCdfi0MUOiNvSFfSUUj+Z8egjN7MomlTw==
X-Received: by 2002:a17:906:9c84:b0:6e0:7c75:6f01 with SMTP id fj4-20020a1709069c8400b006e07c756f01mr22916698ejc.103.1649522616408;
        Sat, 09 Apr 2022 09:43:36 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.googlemail.com with ESMTPSA id hu8-20020a170907a08800b006dfd2056ab2sm9893735ejc.97.2022.04.09.09.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 09:43:35 -0700 (PDT)
From:   Lucas Tanure <tanure@linux.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lucas Tanure <tanure@linux.com>
Subject: [PATCH v2 0/2] Ensure High and Low periods of SCL are correct
Date:   Sat,  9 Apr 2022 17:43:32 +0100
Message-Id: <20220409164334.157664-1-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The default duty cycle of 33% is less than the required
by the I2C specs for the LOW period of the SCL clock at
100KHz bus speed.

So, for 100Khz or less, use 50%H/50%L duty cycle, and
for the clock above 100Khz, use 40%H/60%L duty cycle.
That ensures the low period of SCL is always more than
the minimum required by the specs at any given frequency.

I did a few measures on the Khadas Vim3 board:

i2c_AO (i2c@5000):

Before the patchset, I got:
- 100KHz: 3.338us HIGH, 6.746us LOW, 33%/67%, Freq 99KHz (Not Valid tHIGH < 4.0us)
- 400KHz: 860ns HIGH, 1.734us LOW, 33.15%/62.85%, Freq 385.505KHz (Valid)
- 1000KHz: 362ns HIGH, 732ns LOW, 33.09%/66.91%, Freq 914.077KHz (Valid)

With the patchset
- 100KHz: 4.952us HIGH, 5.134us LOW, 49%/51%, Freq 99KHz (Valid)
- 400KHz: 966ns HIGH, 1.628us LOW, 37.24%/62.76%, Freq 385.505KHz (Valid)
- 1000KHz: 372ns HIGH, 720ns LOW, 34.07%/65.93%, Freq 915.741KHz (Valid)

i2c3 (i2c@1c000):

Before the patchset, I got:
- 100KHz: 3.348us HIGH, 6.704us LOW, 33%/67%, Freq 99.5KHz (Not Valid tHIGH < 4.0us)
- 400KHz: 864ns HIGH, 1.69us LOW, 33.83%/62.17%, Freq 391.543KHz (Valid)
- 1000KHz: 360ns HIGH, 690ns LOW, 34.29%/65.71%, Freq 952.381KHz (Valid)

With the patchset
- 100KHz: 4.958us HIGH, 5.092us LOW, 49%/51%, Freq 99KHz (Valid)
- 400KHz: 970ns HIGH, 1.582us LOW, 38%/62%, Freq 391.85KHz (Valid)
- 1000KHz: 370ns HIGH, 680ns LOW, 35.24%/64.76%, Freq 952.57KHz (Valid)

v2 changelog:
 - Keep the previous calculation for Meson6
 - Use I2C_MAX_STANDARD_MODE_FREQ
 - move the comment before the if()
 - use FIELD_PREP for setting div_l
 - Drop removal of meson_i2c_data

Previous versions:
 V1: https://lkml.org/lkml/2022/3/26/109

Lucas Tanure (2):
  i2c: meson: Use _SHIFT and _MASK for register definitions
  i2c: meson: Use 50% duty cycle for I2C clock

 drivers/i2c/busses/i2c-meson.c | 111 ++++++++++++++++++++++++---------
 1 file changed, 82 insertions(+), 29 deletions(-)

-- 
2.35.1

