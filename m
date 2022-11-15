Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79E2A6298E5
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbiKOMbB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiKOMbA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:31:00 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B741C932;
        Tue, 15 Nov 2022 04:30:59 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d9so19285766wrm.13;
        Tue, 15 Nov 2022 04:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=heQF+yUf7OPPJ/81qSJZBOwzAZ7P4r5Gfhl736W/C8g=;
        b=K1O66LkMWAD9+WNZ0lBTjZbkXcOR49TVN2NIpTWnEuiWfpdcEvMtJesFzpvhbdmzT9
         cd483Meg7hspAAedgrkWvcBT2QkaMgGSToQE0ZhrbmcF8cBTNx6RhoE5OjW8023vaSva
         hbWALv4lfXfLIXZohAmtC7py2VpAObOGcZ177fcy5DXv36MtgYKqgWxmQjJ7sedxm9ws
         Ob5cC2sTGU0BmH1vibo4vrpIuGV9o/dkkW6/V2/vGMymnpn+idkHyouRubkum/efn0AK
         U7hyZmpOovEmZ+CPZGU2W0SpaVmw7JPveFBTLEMs1VhMwXK8btAxFqeFT3bL06f1n57k
         ugGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heQF+yUf7OPPJ/81qSJZBOwzAZ7P4r5Gfhl736W/C8g=;
        b=TsjxO7zP+1LCc2+aqC6GuXVgJwdEeRdzK7GjxhdPVSjH29g8l7Q2/dfY5YqzV05V6F
         6CYcXG0GIpZVvX83/QGRTnPsKbdUrJVhngek4hxPn+Ba/f8DHeQ2JPU1m82pjY+cgIyo
         99OJPkH8QhGMWIBOLcRABa7Vwivxg4Mt/OlVmCcasovYt1noXOcvGSCtddG5hXc5VZa+
         g6lKLKjdPWaBjYZFTn79XnBkJcRdafgWvYrl//dT70eRIMtb7yK8Hzng3WxpN+UcYlUc
         fxumlZas9x6R/QleqgPc1O+eCdn0Y5g7bRP9E92tvymUMKx3Tk5q6UXB5qJzIBxKI641
         vNpQ==
X-Gm-Message-State: ANoB5pn5SBvvn9Q+ieVR4x6Nw4iATWi3fz3i/TTfKlI60F/moBVE8/Pt
        651tggodmuYxbBQgPSrfXMowJ06mesyW/w==
X-Google-Smtp-Source: AA0mqf4GuF+RTCpaeuemRjo+R3Hc2FW5+FQYZe5dx99cUQGVlTE3w22izlM+xCGojqtD28L9TirMQA==
X-Received: by 2002:a5d:6407:0:b0:238:238:cae3 with SMTP id z7-20020a5d6407000000b002380238cae3mr10730999wru.685.1668515458233;
        Tue, 15 Nov 2022 04:30:58 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:d94a:6345:c378:e255])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b003c70191f267sm22862614wmn.39.2022.11.15.04.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:30:57 -0800 (PST)
From:   Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/Five SoC
Date:   Tue, 15 Nov 2022 12:30:18 +0000
Message-Id: <20221115123018.1182324-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RIIC block on the RZ/Five SoC is identical to one found on the RZ/G2UL
SoC. "renesas,riic-r9a07g043" compatible string will be used on the
RZ/Five SoC so to make this clear, update the comment to include RZ/Five
SoC.

No driver changes are required as generic compatible string
"renesas,riic-rz" will be used as a fallback on RZ/Five SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index d3c0d5c427ac..2291a7cd619b 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -19,7 +19,7 @@ properties:
       - enum:
           - renesas,riic-r7s72100   # RZ/A1H
           - renesas,riic-r7s9210    # RZ/A2M
-          - renesas,riic-r9a07g043  # RZ/G2UL
+          - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
           - renesas,riic-r9a07g044  # RZ/G2{L,LC}
           - renesas,riic-r9a07g054  # RZ/V2L
       - const: renesas,riic-rz      # RZ/A or RZ/G2L
-- 
2.25.1

