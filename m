Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D3C66D89D
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 09:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236177AbjAQIt7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 03:49:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236219AbjAQIt4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 03:49:56 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F95CDEA
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 00:49:53 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id g10so21643789wmo.1
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 00:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=xEPydhr2aJe8xzx6UgSq+GSHo/q8fq5XeTbPFG+Ef1E=;
        b=D0itoJxIvbRfYUK3B5ms/XaDaAgZnGY5zgdjySULjRRJ6vYM/x0RiUColU4unA0VaN
         ByhXyO5UQK2La4ZNt8CRrFelaZ8rvunJmOOVwXHvh3m4ENM34qNqN6cmjNm14zdHu5Va
         wsQD5iSq0PRJNzqN/SdAooWVP7PicxCSzeiWTP4Qnvva4UvxmPcpG0ujokKFsj4X94YT
         2KMCY4+6ht5GkA35kKaxCp7EdOOmaT10k8kDAvRT+MHtud+c9cSY+y/4CJWloNZbbPlh
         xDDlr6W3AYeZm2ZrMnEnWChN7hhdZeyNVLd5fTgWrFT5xbQzLkA8225TqpXHnHdQPOct
         Jj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEPydhr2aJe8xzx6UgSq+GSHo/q8fq5XeTbPFG+Ef1E=;
        b=OFFIKQTTbzgzvjDYIUv/4k1yXDRDX7j1TvxslwlCfObOzxcCTEHqxS0nYxw1dHWtTi
         F0etXYMgTXgJNWr5OIo94WDN+kv8yQhEhvujne+4HjcE8hKRUtPP3AteLbAbCbaWmTWv
         2QLl/jCZYGJrCDHJgHDAepprs/G6TXodm7RsEjh9mYLQ4d+VCnkDiOOLabJ+0aCzwjgX
         ZWvhJlZBotrYUsnwgIOblmzKZIurflFwbn72xO/riTvQxA+cODKNcPNRetV3gLyJxjMe
         VGZrdPWa8B8LDAv8wnKStZa7UZiPKHDFzKqm9bWtTfBFLymOerE+xpvDY4jdfZvfdQKn
         aC9g==
X-Gm-Message-State: AFqh2kq3vsOklQG16L+FbSsdFXrwapthzWoP/Fvrmb8egTu8C6tj47/3
        Q2kpZpFkCuoWW+338JFUNxi2//BVSvOvqx3f
X-Google-Smtp-Source: AMrXdXsth0t2XE+9x1CH+zP8XAEApd4py8h+Yh7T/kJ3qNhyBeE1ef1KJaTQ34ye/3/idqEeBZBLqw==
X-Received: by 2002:a05:600c:510d:b0:3da:f719:50cd with SMTP id o13-20020a05600c510d00b003daf71950cdmr2191897wms.18.1673945392066;
        Tue, 17 Jan 2023 00:49:52 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a05600c354e00b003d1d5a83b2esm45040928wmq.35.2023.01.17.00.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 00:49:51 -0800 (PST)
Subject: [PATCH 0/4] Add MediaTek MT8365 I2C support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIACJhxmMC/w3LOwqAMAwA0KtIZgM2fhBvE2vUgNbSVBfx7nZ8w3vBJKkYTNULSR41vUKBqyvwO4
 dNUJdioIbIOSI889gOPSp5tDvGK2VcfdONC9PghKHEmU1wThz8Xmq4j+P7fvHsOjlpAAAA
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 17 Jan 2023 09:49:38 +0100
Message-Id: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
To:     Rob Herring <robh+dt@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1865; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ZoJ6rFEEnxpa0J0RlavE7BjLWGiNdDKCFRMWyH2/oXo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjxmEuo0/5O0tijs4XtUwu7qjPT93h9gaGCUQJLBYC
 0i1KUJSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8ZhLgAKCRArRkmdfjHURXnbEA
 C6WBFcTFNKOgskrR1zywVwx4DgxxlM+D3fnWhJS2FBR6Oxh/jffkrs4Lot/UYQLPC3e4d5o9u+lPnm
 LHzxa8DhULC3qnZflArXOx7nntaGEvC87HJtYslq5rh8KWgN8Oc+32CUxhi/LfzJ9JLxScEUwFHAQc
 p0SSHYITj9hFPZg0ZHbW32lOUoStOih9SRloS/EzEwjYjSpYyuiuQUJpECsH23i+UfVcl5XIQi+nkV
 Pv6mH/Q0TFRDElRt9oN/uOE9zJPX/R+IicRCabRDj0APkq3XFOMJI3ArnvaL0r1J2E22ybjPBoDjYE
 SYNSQRwfT+ZLSbp2MJfGeOmMLviEzFlVFDMf1KFenaGHXGeB/G9joeHDGH+Ys9KYW8ypc4O7mgmSgN
 w8Xli6MPi1RcE+eytXECEL10k3sQ2Whs3ljJEnBQ0s1qymV2jkRunIynL8WVtR+HuCw02mrgw8i3x/
 9Zk/lo59vZJw4LrW/yEAi9635fA9XYJWcUguMxZiNu9Psb61eDusrAPMxfGeLaaX1zAUcw7VcWnZCr
 2qZfh1PQyCxqh0ISFxG1Wo9zVBeeFO3b9Zni88ZLRN85GP7yN9RzSCcJbsIcPYebI021SshlglZPR7
 vwrSYCJOsHQyFY8UcSSfxfZqIuHjPCCrKoyxvjkWaFnxhR9jfJnNOaLi39Rg==
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
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

---
Alexandre Mergnat (2):
      arm64: dts: mediatek: add i2c support for mt8365 SoC
      arm64: dts: mediatek: enable i2c0 for mt8365-evk board

Fabien Parent (2):
      dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
      i2c: i2c-mt65xx: add MT8365 SoC support

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml        |  4 ++
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 19 +++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 60 ++++++++++++++++++++++
 drivers/i2c/busses/i2c-mt65xx.c                    | 14 +++++
 4 files changed, 97 insertions(+)
---
base-commit: 8b6cfcce3ce939db11166680a57253c39110f07e
change-id: 20221122-mt8365-i2c-support-fc048da261ea

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>
