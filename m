Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDDD9545BD8
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 07:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346259AbiFJFuQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 01:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244606AbiFJFuN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 01:50:13 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C3EFDF;
        Thu,  9 Jun 2022 22:50:12 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id r1so4736978plo.10;
        Thu, 09 Jun 2022 22:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vxvhQQF+LpnzG0OPsmcVTfh7ByjAVce/l+wkGfbGArM=;
        b=NFhMzn0s/mJDv488GyWPSpoax0GndAHUQ1lTrr53AfkaSRRVfSB19b1pQe9qZcGlph
         HISGTAlCzuB5ypUwqn9PXtK6bTIjTkIjj8i6gajhvoEsZ20bIoe4EqHQTAhXB4Xva4x5
         Y0To4bWkuYWyDB4wg2Bm9x8IaltNwBIO4C54IP6rRFCFvnQ7sCHNm3d51rLmcv29GGK6
         /kORDTpu2OX/aG9DhftPTvXJwRVPffZrotk+qKkUJA83yqx5Qtabw+inyY914l0UbhCU
         L2fLXbOQqlWrlaTfnNOGSQFqf1VyiN2UKVOxJsTYw3i31eV2ZLf5OxWzLaYNboxtsIZV
         ILUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vxvhQQF+LpnzG0OPsmcVTfh7ByjAVce/l+wkGfbGArM=;
        b=BjPa20Rm9JK42prGCVZJYqHjOcJDMCFyphkFHqdMnr10nQZ/iw/IN3EyuQT0CfrH3S
         CyLVwuCIL1/x8Vq1+epsg9ZG7A2xqKL4kCOXE4waNLHUxtElLATUx3SRKKZaxhPKLSEe
         KfppoRNZzWlbVTygHq9KLfor44qa3UrWU0bdC1eEShzrCInaOMKCmH41QovnTPj74J54
         S7UECE14xAJZhz8szrnSwA1FhQuGR4WJ/0s/peGYSDH95HacwR86qKAxW8ewQ/pzEagK
         KWbp4YCaU4vK7oNt7Lz9QOs5XuerphqQwAsIbB6hCqD7gRfQMM21Xxkhms2jKoCiYiA/
         mZHg==
X-Gm-Message-State: AOAM532wXF1g+BJ12gvEoe4wkZR0Me9mF5YN3I9RW0bnXRZ8gDDmLdn6
        cu+gr32BSk1yoCns0cw3xUA=
X-Google-Smtp-Source: ABdhPJzBLjFomAJHOI1wYcMswzoSAaZrTfsNtpQw5h6hCKVRFVtrsXsNryoAb7uiNieoVMJhTXserw==
X-Received: by 2002:a17:903:2452:b0:166:4b6c:affb with SMTP id l18-20020a170903245200b001664b6caffbmr38070654pls.68.1654840212476;
        Thu, 09 Jun 2022 22:50:12 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id f11-20020aa7968b000000b0051b90ac6c15sm18553977pfk.125.2022.06.09.22.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 22:50:12 -0700 (PDT)
From:   Potin Lai <potin.lai.pt@gmail.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>
Cc:     Patrick Williams <patrick@stwcx.xyz>,
        Potin Lai <potin.lai@quantatw.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v4 2/2] dt-bindings: aspeed-i2c: add properties for setting i2c clock duty cycle
Date:   Fri, 10 Jun 2022 13:47:22 +0800
Message-Id: <20220610054722.32229-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220610054722.32229-1-potin.lai.pt@gmail.com>
References: <20220610054722.32229-1-potin.lai.pt@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Introduce a new property for setting a minimum duty cycle for clock high.

* i2c-clk-high-min-percent: a minimum percentage of clock high

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index ea643e6c3ef5..4ea6a112f299 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -49,6 +49,13 @@ properties:
     description:
       states that there is another master active on this bus
 
+  i2c-clk-high-min-percent:
+    minimum: 1
+    maximum: 100
+    default: 50
+    description:
+      a minimum percentage of clock high
+
 required:
   - reg
   - compatible
-- 
2.17.1

