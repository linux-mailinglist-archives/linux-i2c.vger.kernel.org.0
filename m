Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A57274E805A
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Mar 2022 11:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232404AbiCZKYL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Mar 2022 06:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbiCZKYL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 26 Mar 2022 06:24:11 -0400
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546D916BCD9;
        Sat, 26 Mar 2022 03:22:34 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id h23so13804592wrb.8;
        Sat, 26 Mar 2022 03:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d3ncUlwyfN23LAHneA+x8RC86+EtUpdCtRwDExYqA3A=;
        b=eumcFiw9W2vFL0tlWQF4whfsQk4CfpQ+ALZihxL4HnnBYwPaKX4KoFg2i/q0jQxsVV
         iEcCmx7F7KIpxvQSm2YdE3boOiGi7BWoUTPJJMvZ00jmuruVtt/Ld/N3hsoZc0sh9d3E
         Hqujj/m0kpmr4MvF/LdsbxbZdD7RagWvl5fKX7eMsv4EMK+ueQGmRfr9e9Kr9nSH69ia
         0go9aMsCQm1NSK+mdnWZ4MLsxseJqMfWCp9xltdJNgQRthVYh4smXSz5M206QuplyZ7W
         yXEFZWJCoHnXQn1Dmnn3TrObxOfDdDXjWsAv+M9aQy0Y1G5L7qkqa6o+Br0yAvdpUYsb
         7c+A==
X-Gm-Message-State: AOAM53214iIKW6J1JVuH/OykKdKnUsey7fNNe5BaO+H+pu/vPQiqNR+h
        6zkj4Jql/ksBUab4ddceQqs=
X-Google-Smtp-Source: ABdhPJzdOmzoCWz7kkm5nG90337ILbCEmW8zPe4Ns407o7zoP4CeAmc5ADHNH6TPDEncX+twTvWSYQ==
X-Received: by 2002:a5d:5189:0:b0:205:9c7b:d374 with SMTP id k9-20020a5d5189000000b002059c7bd374mr9465343wrv.551.1648290152787;
        Sat, 26 Mar 2022 03:22:32 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.googlemail.com with ESMTPSA id l15-20020a05600c1d0f00b0038c8ff8e708sm6683057wms.13.2022.03.26.03.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 03:22:32 -0700 (PDT)
From:   Lucas Tanure <tanure@linux.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lucas Tanure <tanure@linux.com>
Subject: [PATCH 0/3] Ensure Low period of SCL is correct
Date:   Sat, 26 Mar 2022 10:22:26 +0000
Message-Id: <20220326102229.421718-1-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The default duty cycle of 33% is less than the required
by the I2C specs for the LOW period of the SCL clock.

So, for 100Khz or less, use 50%H/50%L duty cycle, and
for the clock above 100Khz, use 40%H/60%L duty cycle.
That ensures the low period of SCL is always more than
the minimum required by the specs at any given frequency.

Lucas Tanure (3):
  i2c: meson: Use _SHIFT and _MASK for register definitions
  i2c: meson: Use 50% duty cycle for I2C clock
  i2c: meson: Remove meson_i2c_data

 drivers/i2c/busses/i2c-meson.c | 104 ++++++++++++++++++---------------
 1 file changed, 56 insertions(+), 48 deletions(-)

-- 
2.35.1

