Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDC66AC1BF
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 14:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjCFNr6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Mar 2023 08:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbjCFNry (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Mar 2023 08:47:54 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583E4104
        for <linux-i2c@vger.kernel.org>; Mon,  6 Mar 2023 05:47:52 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id k10so14868733edk.13
        for <linux-i2c@vger.kernel.org>; Mon, 06 Mar 2023 05:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678110471;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=7yqvjSJOfmMKr1X7pi/yKdN0p0WXNRNNDU8eJl008Xs=;
        b=EB/+WfYhrgIpmSaPtWHbtJG4qfTEY783c5DFRkcwuTtmnIm74+gVpGfhg5c/CcBv4M
         ij+SIQ7tWinDvhA9dSRCBGkq6WqqrpHmvKrh9mr6sWmx8bidqr2ihuRaJEiFpfFaAy+J
         dgdjyeoNT+1SW8ibSvP9jz6DoHYM5TCelxmSBjDVIw//1VQ/HZN4KUOPFuI8Z3Jcl6B0
         NbU97bB0BJazJRSiMpyDOLOlmhxLTjoA75/QW9iajVUzOdLdN/trOopEyBEmipcVJzbx
         JC7yeRcl3EmPavvOfPwDYe4X8sPqyaxA+zSepCgAjvM1Z5+YNvwWZc0/oqx+grY1ul0N
         TnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110471;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yqvjSJOfmMKr1X7pi/yKdN0p0WXNRNNDU8eJl008Xs=;
        b=Ybr7clA5P2UjjYPWVOtGK1HJP7kuqw/LNwI808HqsUDWYYTfD8yvj4HWSjuHsRrE83
         SoDf8PxlWh66Qmu9ifqOu/Yd39NHItG52iy87LMVTH1uBoBtMp5uvIZujVTC9HYFCSZ1
         7u2pWnkX00NT/RgYZex2QMmcAC5P6772sf0UZ+BpR7lUUZZQro6De1mMyW+cPVIwZFx+
         XAxYqpo1kKmZqoKSTSBnMSqJFomGd+BeNPmCbi2dW2jEfMg9RnBvMJTS+HP4RsDFMlnp
         ywRE+RiVOJ4U8aHk1zbSKEt1GlOgrVZRhpYEDbWsm4lcbiutQkbHX3B3W+PUFR9q+0om
         x8MQ==
X-Gm-Message-State: AO0yUKUPyUyMvQk9Tys0CoaFAZp/Nu0MJFSb0dD68dX0hCDPWEMnSZHP
        I52g6p1kATEvTDQBbaMZN+mt1w==
X-Google-Smtp-Source: AK7set8e1MakN8+Mg4z6v5F+hlOxZs6gMD33KgMLuFHNsgvVhZQnoSalhDio/qK13oweQwZTfLrIBg==
X-Received: by 2002:a17:906:b15:b0:8b1:383d:cd50 with SMTP id u21-20020a1709060b1500b008b1383dcd50mr10556760ejg.48.1678110470773;
        Mon, 06 Mar 2023 05:47:50 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id y64-20020a50bb46000000b004bc2d1c0fadsm5193293ede.32.2023.03.06.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 05:47:50 -0800 (PST)
Subject: [PATCH v3 0/2] Add MediaTek MT8365 I2C support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAP7uBWQC/4XNTQqDMBAF4KtI1p1ixvhDV71H6SKZTmtAjSQaEPHuHbrsol0N78H7ZleJo+ekLs
 WuImeffJgkVKdCUW+nF4N/SFZYImqNCOPSVU0NHgnSOs8hLvCk0nQPi41mq2TobGJw0U7Uy3Rah0HK
 3qclxO3zKGs5t59m1lCCsexaqg01rbs6uw3eRT5TGNVdxIz/FRSFDQmiDbed/lKO43gDCL2l6gIBAA A=
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Mon, 06 Mar 2023 14:47:42 +0100
Message-Id: <20221122-mt8365-i2c-support-v3-0-ad9bb1076d7f@baylibre.com>
To:     Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        linux-mediatek@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=hfD5vVYRCGXPNMT+jA4ETz34GbWOZ3lcpTxfO3jv7sA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBe8FVScw8Ldx5KbA53YVxKhr5MCW85i7oiiBmw53
 wzNoK4KJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAXvBQAKCRArRkmdfjHURZyUD/
 9VeQopiSWM4snlYxEIYa09+Hy208zhn2gfrnovTlsQ/bZCzi012GQTQJduLhrxCpmNrAAeiBoGahq7
 4V36PBCzWKjos7BNgd6zrQaaYf6luco3Ry+jGBqkNj8RfiX5CcR8lcdMM+W3oNdadEZgw6/zJif2ll
 onQK5z5RVDW6itAwoTzdwCsmyVw2i9ET9BxdN47icX2YbKlHFcXqlaRqAdnCSLW0uAzD/wzIwKvwm8
 1U1ZbCvj7nw7baGQIpGQqetOlyy7Kd0lqj/mL/vquIQjC4kc8BfFZsnGsa3jN8rydsPd3svqqOftcZ
 CQV9hcc11bFbvxnNUrE13MkuKfTj6KcBelJlzIhN+cIyEBSuBFPy/yrCQfGGhWUuqvZgK2zsVYCEy9
 H3eu4td4aIJyTZGvj+5amiEyrV3kczAfCEhhpOWLhQ4goD9FDPfUVa+3PrXbEVQq0dspD1VLTcdQCZ
 33YqyuGOMFi5z1tTqdfszFCRWujMzgGy1ZOFxjBoTDpGi1gV9FdZnryK9HH2zScsLcLhKMrYaH08hr
 NbowGRcngZ5a8clCm/rprngS/ge9FKZQOK7egSz86321+TqnJt33XPqsehpUhdF2kH0+mMZMcdcM2S
 L3eH0t/jQrP/Y3C93CRS1zWD7GWNSJ718uoIYW93OCtkyIANIqJo9x5CpOhA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,
This patch series adds I2C support for MT8365-EVK board.
The I2C-0 is enabled, it can be used through the board pin header,
as described directly on the PCB.

This series depends to another one which add support for
MT8365 SoC and EVK board. Link [1]

One patch has been cherry-picked from [2], so I've addressed the comment
and kept the trailer.

Regards,
Alex

[1]: https://lore.kernel.org/linux-mediatek/20230101220149.3035048-1-bero@baylibre.com/
[2]: https://lore.kernel.org/all/20220531135026.238475-2-fparent@baylibre.com/

To: Qii Wang <qii.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Fabien Parent <fparent@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v3:
- Rebased to v6.3-rc1.
- Move i2c3 node to be consistent with the SoC address order.
- Link to v2: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com

Changes in v2:
- Drop the patch which do useless change in i2c-mt65xx.c driver.
- Change 2 lines compatible/reg in oneline.
- Link to v1: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com

---
Alexandre Mergnat (2):
      arm64: dts: mediatek: add i2c support for mt8365 SoC
      arm64: dts: mediatek: enable i2c0 for mt8365-evk board

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 19 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi    | 52 +++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
---
base-commit: 5c6b974d24c21a6aa5d8b524067d7d9bc7fcc4f2
change-id: 20221122-mt8365-i2c-support-fc048da261ea

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>
