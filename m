Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 619616ADEF3
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Mar 2023 13:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjCGMlY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Mar 2023 07:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjCGMlU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Mar 2023 07:41:20 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298947B135
        for <linux-i2c@vger.kernel.org>; Tue,  7 Mar 2023 04:41:17 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id v16so12033767wrn.0
        for <linux-i2c@vger.kernel.org>; Tue, 07 Mar 2023 04:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678192875;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=GzFpHewBbWomyUEZaNFYjKbbfeAnvvHjKQLmFN5JziA=;
        b=pWFdX7+c5EOEOwB2Sus+3hAhRmLvU+gopv2ej+x3B89Rr5abFSju2fpdvdfF1olE/H
         saEbdPxxjh2MN8qTSMqGIQ31qe2pns/O+l1w+0R2vaEOFikuZu95X8hjc2p6RIQNmPfG
         tR+y4rmArhNxEqCQ8G5HUXCmTNEcQlnENDIIMLB6Y7CRiH6yJKhZzdikTaQCE1ubEV06
         q0TI2zzSwCuxHHPo83aNIXT4snctKLaPQMZqKMbrTnDLfAFWpJ3AIyuKymmZ72gac8Jx
         KBlN8mj6SKdWGCXaDLTfU1iu+5ZGamjKWPXHUpQel60qCT+DHcGb59QfRr+Lrr2ONE5p
         tPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678192875;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzFpHewBbWomyUEZaNFYjKbbfeAnvvHjKQLmFN5JziA=;
        b=8Gg/EJrvAP+UiCti/7HiPw/57iU9JCKhWe6oSaBgFZ1kRJCwvPnmXMK2OY/6KfIDH4
         1XzR0Wnc+zzyFGN9TBMiNCsdCqeF7s8Ci4X1rjkwL8iVkj8lNTTkFYj3f34nCJW3Raa2
         M1sBHEvQCVfGwTvbz6gQgQO3yiMdsu76u+aSB6qVm62FWNISwUNVyR7mnN4xzhVRMh4J
         OLsrjTmDlOL8dkoyhxUA1IqxWObi01oe+PUOP3G3lXYIVzZWQy/4b3xkbd/YgCTnJPbd
         LaNQUybqeWtj48NsPHV8Qy/khtcaKIQo2xQ90pj1AP2bHL7o3gNTgzy6ZMAP8JX7Kf3q
         tlCQ==
X-Gm-Message-State: AO0yUKXj0oP44kxDEJRcdseLn6xqwILZYAC5p0geOCeLdGh9GYOwFuuD
        idN+Az+MA7JuMbvjhz4T7E6iUg==
X-Google-Smtp-Source: AK7set+yUbubaUWq+tSIIrRxwkXYsBygdFKRFVCS2GRN5jvwg7NHL688RW9y5lE7d9soVel3pj1V/g==
X-Received: by 2002:a05:6000:149:b0:2cb:3deb:c014 with SMTP id r9-20020a056000014900b002cb3debc014mr8783527wrx.28.1678192875604;
        Tue, 07 Mar 2023 04:41:15 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id w9-20020a05600018c900b002c5a1bd5280sm12434670wrq.95.2023.03.07.04.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:41:15 -0800 (PST)
Subject: [PATCH v4 0/2] Add MediaTek MT8365 I2C support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAOIwB2QC/4XNQQqDMBAF0KuUrJuSjDGxXfUepYskjjWgRhIVRLx7hy5Lqavhf/hvNpYxBczsdt
 pYwiXkEAcK6nxivrXDC3moKTMQAFIC8H6qCl3yAJ7neRxjmnjjhapqC1qiZTR0NiN3yQ6+pekwdx2V
 bchTTOvn0SLpPP6ai+SCK4vO+FJ5bdzd2bULLuHFx549SVzgWAFSUHlCpEJTyR9KcawUpNj66pwURt em+VL2fX8DtbpxSEgBAAA=
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 07 Mar 2023 13:41:06 +0100
Message-Id: <20221122-mt8365-i2c-support-v4-0-885ad3301d5a@baylibre.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ngJR3lDpq2gN4aGwVDBwin795hLgOGEZuPdchMq4YZ0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzDqxV1g5ocgwAedExTzYHgfPI4QlFkE4r5Faz6e
 TS5VfdCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAcw6gAKCRArRkmdfjHURZBXD/
 9ph7eGz7u8HMJ+qKPI1mu8b6Hg4hhgoUdPrn5VchtVJAOJxKJi9L5ODgDmvPMYuP8pzEUB4E+qAz7O
 vxZQK+YoM0vYdQNWwFlZP4LPzRuG0dXvvB5s3J4xSicSMiPHylBAFb0GnDq3/bu1vWcBRWj+MExsRT
 GKMIkVhAHM8AcWGtBy82Fh02qWXGx5IVr56fVDc5/ZszzwpJHVJstuE9hii1vGmPxkIeIpn4wyNoy5
 r0wG7zEioS+r9BbIIJQmED/ixkbzyIR0a3p245nYHxtAmxn6ojVp7WJI4oCIm3w7+o1jSuXSBPXgs/
 WjceUhk8vyNMpTu/6I4NMppqDfIhJvzlh6fH+kAt5nlbUv4ftt/fC+qRmuAKII1Fij8a4EvoWaQaxK
 QU7CAwYlIF8fVXoX6lTFcYJRDEi85hoQjpZiRWAM6xiN4H77EyXygAEHckMqv/DBOCWqr3vKE4IKeJ
 VhUwXoJJ0GGxlbmL54ef1W2EwlHM07S6/wlbfv0WwM1Y3Wy2m75aGRGRcFWTHxkrnIrWaL0oGGGlbe
 PS6SoYax/vjtX9yqV5U8x28J/5ZHqeAca9gBdQOoZFFLX+ZazmQnDR+i1Jsr4jh+hzAOQ5GWDa/r4h
 os3c4rQ0WIT3iZltM/6KsmQuaFliKt6+ADoICS5wBN5iSPkULW3KUSD85OKA==
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
Changes in v4:
- Fix some properties order.
- Remove the useless properties.
- Link to v3: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v3-0-ad9bb1076d7f@baylibre.com

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

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 17 ++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi    | 48 +++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)
---
base-commit: 5c6b974d24c21a6aa5d8b524067d7d9bc7fcc4f2
change-id: 20221122-mt8365-i2c-support-fc048da261ea

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>
