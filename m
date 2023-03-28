Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AACB16CBA02
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Mar 2023 11:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbjC1JFF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Mar 2023 05:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjC1JFE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Mar 2023 05:05:04 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E5549F6
        for <linux-i2c@vger.kernel.org>; Tue, 28 Mar 2023 02:05:02 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id q19so8273348wrc.5
        for <linux-i2c@vger.kernel.org>; Tue, 28 Mar 2023 02:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679994301;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j2oNGFQ2BoJD5dwllsw51gKBnxPyzKrs4LFa7DNm8gk=;
        b=vwEhAhfSTnuopZUdA5Om9A6AtbAo0YNO/7p2/Y4a8XW+z4vE7bqGzKbusWFwd9nlq2
         iE05SQpagXgf4Xfrq+njamVdlxS69++U5xVZ8Jg7rWW/j894/Q8HqlrHQMCQZpcbTPtz
         OevR5Q9sw52Hwp1Wr3g/dIo5weNt8eyZAL5JdaDJ7UWNjjMqfJYcFyQ6A9ZJzkQ3TDRd
         YH0UM/4d1N6scR7DdCqsjsHSYLuIn1AxklJ5JshwANxyaL6nlazk3eaCgHFyoD7HWbPe
         GNEDKZ1pL2ivSSrcIIEo7esgltl6YSqEEIKMwYiNvZtUuknDTBImG9obAqHwPA/kgMTV
         dTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679994301;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2oNGFQ2BoJD5dwllsw51gKBnxPyzKrs4LFa7DNm8gk=;
        b=tYjXrV2duKZzT4iElsWToxJvulOffUY+EtKXPKY0zOXJ4rbf42cQaeH8N6tPa4EFOE
         OuTJDgVarw7XceqW/NIH2lEB36YF6EsHTNWxiy0VgNothT18JTwv5tp5vNW4mcILW7aC
         S4mRnMY1OqITxHbzdWFN4iC1oVT99YRgnknhvUV1Fnj9hyDo2vk4gDYbUXL85ssBb3sJ
         pO+Fevlhh3fsA6lQ5uWkG2W9LAL9myGQYcmO2F5VCSaTfuOtCLz4Al8ryj6TyJivFhwA
         QN9LpLDkSvqQc2oSUNkHG/rZ+cvL82L43EurOVg0cnfuRdBlipceI6lPvU1sHGpNntSz
         YkDQ==
X-Gm-Message-State: AAQBX9ehdWkDOqRX2KkkVCXkX8thDS33/ikoyJPqGb8nbmQFaIeQwMBG
        1C4SrErnAy9qwZAdoZiwLV1qXpKOVWQoQMLzIec=
X-Google-Smtp-Source: AKy350azCOA7fwX8l4rSyWTzgWYMc373wMZa0OufmM2erc4tEtqeB5XFEQoAZ/WpU2LArl6MEOsRbQ==
X-Received: by 2002:a5d:4e10:0:b0:2ce:9877:84ae with SMTP id p16-20020a5d4e10000000b002ce987784aemr11104150wrt.16.1679994300882;
        Tue, 28 Mar 2023 02:05:00 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j10-20020adff00a000000b002d1bfe3269esm27102109wro.59.2023.03.28.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:05:00 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v6 0/2] Add MediaTek MT8365 I2C support
Date:   Tue, 28 Mar 2023 11:04:46 +0200
Message-Id: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+tImQC/4XOTYrDMAwF4KsUr+vB/3a76j1KF7KtNIY0KXYaK
 CV3r5jthMlKPMH7pA9rWAs2dj58WMWltDKNFNzxwFIP4x15yZSZEkpJqRR/zEE7y4tKvL2ez6n
 OvEvChAzKSQRGxQgNeawwpp6q42sYaNmXNk/1/XtokTSu/5qL5IIbwOiTNcn5eInwHkqs+JOmB
 7uRuKh9RZGCJhEiDfogNxS9r2hSIJ9ilMK77LsNxewrhpQQLGSthcwWNhS7r1hSHJpOR2tO+s8
 v67p+Abje57XUAQAA
To:     Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Qd8ErcwczvQ5zIjdmraFPn2SInm+jrQhAhyoMs7216I=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkIq27YnGWAX7xbAlgtqxGLvuwp8Qvu7n4mqAV47sL
 +pGTzneJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCKtuwAKCRArRkmdfjHURdIvD/
 9XcR6zlzDTKLoo3D/zMqrEcMcOmMeeNzYCrl96gGy4TfxjmJ5YUHLUT6kGoBHjUMIetyAo01Bv69KC
 iFLTYH9xtCpLnrNU85r23khpJplZxv+HQcoOr7V1sVZJlZt5MZSudRquFN2ssXfgAwbYz6ECCzPT/V
 H6nqHIosB3zlav6OMffCyT/mAldrq0cQgzhZ0W8a1V5xrXdxg3SOSY0ksrWObrDYv6JFqJeFHRVVrS
 3CNF/gobjumw3ZKJSslSeYtipBlSF6SokT8j651D30sKDF6dv1gk8Pn9dLqWKkXR1JaxhnPSLhvBAX
 qOJgUXThqIJ60d7HwXhZStIf8APTznrfrsEQnwHJ0XG29z4yEvFRl5VG9I1XcXStf74So9iRQSSHG0
 OM9Cfasglhtpcyevq3Vwa/DvNGrWZ+B8Uwmb4ebYMMi74w6CRjyZMA/mu9EOu96Y6zFqE8Q66MlpR6
 Kwe3EJLuejFDOyOmMVpUxO20nkM1EUbzgoi9vBm38L6SAkz4dyiKZLsgpUcEXJpWwqPeiZ71FR/jAj
 FuforHdrHETiysyuD60DjSzG5XwJgYmP0jLy4QVdrUIDec4GdB6UWHTR5kpxcpw16X18gIrloyPdAL
 Ty78fflnlRXuD7oSjG7gz+uRfBjoZWFHAsUMkRUSCeiUAuB+FiknHTTZrDlQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
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
This dependancy has been applied by Matthias Brugger [3]

One patch has been cherry-picked from [2], so I've addressed the comment
and kept the trailer.

Regards,
Alex

[1]: https://lore.kernel.org/linux-mediatek/20230101220149.3035048-1-bero@baylibre.com/
[2]: https://lore.kernel.org/all/20220531135026.238475-2-fparent@baylibre.com/
[3]: https://lore.kernel.org/all/ed1f9faf-cb4f-9ff1-ab6b-813035a051bd@gmail.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v6:
- Remove mediatek,pull-up-adv which is a deprecated pin-control property.
- Link to v5: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v5-0-6e4f3b54937f@baylibre.com

Changes in v5:
- Remove mediatek,drive-strength-adv which is a deprecated pin-control property.
- Link to v4: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v4-0-885ad3301d5a@baylibre.com

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

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 15 +++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi    | 48 +++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)
---
base-commit: 5c6b974d24c21a6aa5d8b524067d7d9bc7fcc4f2
change-id: 20221122-mt8365-i2c-support-fc048da261ea

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

