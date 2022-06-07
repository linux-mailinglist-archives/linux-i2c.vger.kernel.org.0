Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 854895403EB
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jun 2022 18:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345106AbiFGQjt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jun 2022 12:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345110AbiFGQjk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jun 2022 12:39:40 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4ABAC8BF1;
        Tue,  7 Jun 2022 09:39:39 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id bo5so15995558pfb.4;
        Tue, 07 Jun 2022 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aawj7hG1Xbc+Qda8TB7Lg5hLA/qmPkKw+fCuOCx3eEw=;
        b=gj0//NcXWdRESh0slbXEmK4UiYABgxbNpk9xMhOaO6vBUgQcZNsX3t6RJtmh3zCpC8
         6FxRO9P5loqq+uRE60xUQMNonjzinITqCrsDh5u1pTwvtjTu38ie4+gCe30Daf6DAFqh
         C299g5Cp9pCnPkJ/aSNCa83Wbo7C5L4oHparszEnh7uGoA2ZRpkUDSvaIizVHuX6h2tJ
         NoK/95kryoWrZ+p43VHqmTJ55zdsq6HmlUqmOx8h8ZIDnqdAD6/hezEbOW+Xp89H0mYA
         GibckzYUxy2ilra+pVO6KanBAi4dglRoKVVoE9WPXDB455lK32vKEw4/wgf+m6UmNoZe
         1Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aawj7hG1Xbc+Qda8TB7Lg5hLA/qmPkKw+fCuOCx3eEw=;
        b=t7uNkv2OUfoqdv89XLR1wX1zStobSy0VflXZJwbVfN15bYB9pd76kpNMElDGE5Nl6q
         elMm1koUBRIunzfUYUvd+s22aLwWAI7XTyVbAzot4kSBzHZGnmRgUBgEvW0Eq59MgQrB
         NnCQEA5bxs5vKeZ+BTaycXmAaj3OhltZIYmiEzkvAQjHyd8SU4TldkB7uET4XJM8Cezk
         Jlp4ytVo6gVO9DK/yKu0MEcxEs2tJ1zaE8kOWWRcdcQt20GdWEKtLnnzd9ySgE9rMFsM
         ogNo+vxSJFLcNJ70MP02//6a/0plftYXRz9xDj2kLNGxCQBEVFnuQsN5s0ABCrPyj6vW
         dzIg==
X-Gm-Message-State: AOAM53023JM9XrmibSurD13E/y4A4kj8oUdLBPyYzQ00SGW3KZmwgdA/
        w4kWtsOV62M9uo0DMhg9aYE=
X-Google-Smtp-Source: ABdhPJw1wLF5PQnn7vw9tzWD7yWUylInWPqMGKa9/YsNsEWJz7DaizG+XWonJpgcLRvbujhgg2s/VQ==
X-Received: by 2002:a65:404c:0:b0:3c6:4018:ffbf with SMTP id h12-20020a65404c000000b003c64018ffbfmr26572041pgp.408.1654619979325;
        Tue, 07 Jun 2022 09:39:39 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id d15-20020aa797af000000b0051bbc198f3fsm12560272pfq.13.2022.06.07.09.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 09:39:39 -0700 (PDT)
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
Subject: [PATCH v3 2/2] dt-bindings: aspeed-i2c: add properties for setting i2c clock duty cycle
Date:   Wed,  8 Jun 2022 00:37:03 +0800
Message-Id: <20220607163703.26355-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220607163703.26355-1-potin.lai.pt@gmail.com>
References: <20220607163703.26355-1-potin.lai.pt@gmail.com>
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

* i2c-clk-duty-cycle-min: a minimum percentage of clock high

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index ea643e6c3ef5..af4c49111cc0 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -49,6 +49,14 @@ properties:
     description:
       states that there is another master active on this bus
 
+  i2c-clk-duty-cycle-min:
+    $ref: /schemas/types.yaml#/definitions/uint32
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

