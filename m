Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11E3673F8B
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 18:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjASRJQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 12:09:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjASRJP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 12:09:15 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609FA10A97
        for <linux-i2c@vger.kernel.org>; Thu, 19 Jan 2023 09:09:13 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id h16so2492062wrz.12
        for <linux-i2c@vger.kernel.org>; Thu, 19 Jan 2023 09:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=QYT16gcL1o7KfqICaZiM4MdP56vwEo0O5K+aSDVlgX0=;
        b=q0jxZIeMEuYrl332d1BulzETciq0OpwH+Re4+yehp2MyiQVJ6a5c+he/CByURVJ8Db
         ZEtRHFljUx/4/UKiVbzpFkP35ksXntqcmjMX5TgeTc3l/q4FQCAgboewOObGmV1aVxve
         vNYfVrwifiIluSJcp/BiPp3AZRC2+bRbKixA/R1yghM1+VADeKmzSk5TQGoQ3tC03oCH
         demGi1QoCyFQ+4palGdUhvaGyDkT2oNP4B7WyEcZRTCes+cW3bU8zcdpVhStFPI/ysY6
         TSBj7Qtd8zOgRAg9+A3ZlhEl4rMOXcdcGFwwG3pJVg0hHWF8xzPaD9arwelQGPWfxCZd
         c/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYT16gcL1o7KfqICaZiM4MdP56vwEo0O5K+aSDVlgX0=;
        b=zOcOIkJeuqkt8arKYdM/9GMsEYcb8xad2sFxCaF74U7cGuq+1enpoZDZnX+aCtP+1Z
         /tbVQuN3V3OGQUT2vSXmTEVjIqCDzuKZdaJXbLn8TlwDr7RNz6A3kZ+2juJEfylUW1bB
         JIFIdtSg/qqYYXP628cj3SXueD0LAzTSdTe9q8vJUnmAkhMAw2/tr+eyBGSCGgUQxYRu
         OrrUEZpbWA0ArEAxZpATF65lwRYjRb+d+Li4cHgBJIgtryoanejlFtvkoEQltwPbfCPf
         XqMc21gf8GzYtnddQptKl+pEA/kTL4X3K5wmhUMdSdp/nT2rLZ4uMgMfF5C9GzVdOZbR
         mHYw==
X-Gm-Message-State: AFqh2koXl6ZBcbfR/M+LGmTItnVQAkm2NP/qC3ycbj/NgJkPymejdBjs
        VnfyGAiVO+80r2p2VCkCxTfFIA==
X-Google-Smtp-Source: AMrXdXtmxB/DZgDBvvy0PG75kWe13EWUcihaGybiFw5w7rS6iLxglHnbI5UcR+qv4uVzp1j3cL4LNQ==
X-Received: by 2002:a5d:66c9:0:b0:2b9:d6ba:21ef with SMTP id k9-20020a5d66c9000000b002b9d6ba21efmr10148494wrw.65.1674148151949;
        Thu, 19 Jan 2023 09:09:11 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id bu9-20020a056000078900b002be1dcb6efbsm8738701wrb.9.2023.01.19.09.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 09:09:11 -0800 (PST)
Subject: [PATCH v2 0/3] Add MediaTek MT8365 I2C support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIACN5yWMC/32NTQqDMBCFryKz7hQz9Y+ueo/SxSRO64Amkqgg4t0beoCuHt+D770DkkSVBPfigC
 ibJg0+A10KcAP7j6D2mYFKImOIcFq6W1OjksO0znOIC75dWXU9U2OEIYuWk6CN7N2QVb+OYy4HTUuI
 ++9oMzmefzc3gyVWLLZ1deWa1j4s76PaKFcXJnid5/kFSlZg9LwAAAA=
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Thu, 19 Jan 2023 18:08:51 +0100
Message-Id: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
To:     Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=iGMc/QCAlaYMz2Z3bGLpxd7Zyz4K9F42xqqJHO2BQ3Q=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjyXk2/8y5TnbVYFX/xMqYnIJmbxIuKJug4yVZiqwY
 lTmE88OJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8l5NgAKCRArRkmdfjHURZflD/
 4+PCkdQHVP2guN6+Ux+98Nm2OddpqGxd5Atb7h81kYrlitQ1Y5BL0yrIP/Yf1AGFzYvdfXPI+t5xhT
 rGIXH0/R1vjh93k45tm+YXeJPKHxPv9Rx9INs18CF4UVmdGmhi6P2sFbC7GFv6wkzfEwhH8gDjveI/
 OPUJfjdVhezJe6/yq77+2jJX/Ogk5z0PTeOZwhCyl/sx0qZNprz1Zk8TMktQs59iJEvsPvX9t1mGol
 sFLfI0wcjyTishtc0dkV/WC5ltirHnP0L2unm3aVmUUtil7vhTB89uEgG1IaqhPEtOKI0asrc5ayoY
 kLTsXzvKzloqUWj4jWhbREppev14Y2LgFKuLUvEnYdo20upsYSl3TGMGyOBe7almFlLnNrvJ+x2saa
 TT+1t1BOeVSUjGfz7bj7lSEM9W6famgNiKmyS3s+vJ5YT7R2pKvMr9088n1gATyAQZeOeFMq/ADNXN
 CQCWroEX3dNfAZg0mhZINS31AcmQ+QQ30O6rlTTrIeKxJqbnp8KnNN04yA2gzJF7og6WIO4TgCQzcp
 Uz9FfCgHW34PkHk5YG6YQhGxPJXRjDxZNAsSVOOIzhz48IxjZ5Kp04XgCh4tqtgltNadE4SL04GGt7
 4ZEd6/fE5V/q+NrnVL7UYIWT6nFOmzZb+kw7KwfqTWCz0TjoQQ+4sPWuXXug==
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
Changes in v2:
- Drop the patch which do useless change in i2c-mt65xx.c driver.
- Change 2 lines compatible/reg in oneline.
- Link to v1: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com

---
Alexandre Mergnat (2):
      arm64: dts: mediatek: add i2c support for mt8365 SoC
      arm64: dts: mediatek: enable i2c0 for mt8365-evk board

Fabien Parent (1):
      dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml        |  4 ++
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 19 ++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 52 ++++++++++++++++++++++
 3 files changed, 75 insertions(+)
---
base-commit: 8b6cfcce3ce939db11166680a57253c39110f07e
change-id: 20221122-mt8365-i2c-support-fc048da261ea

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>
