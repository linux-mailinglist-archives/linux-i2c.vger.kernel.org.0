Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3482157F172
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Jul 2022 22:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237033AbiGWUo7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Jul 2022 16:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbiGWUo6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Jul 2022 16:44:58 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC681BE85
        for <linux-i2c@vger.kernel.org>; Sat, 23 Jul 2022 13:44:58 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id r186so7104211pgr.2
        for <linux-i2c@vger.kernel.org>; Sat, 23 Jul 2022 13:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7eM4jUkfktuT5M1WMi6xPgusq5fBgvijCriihADNRlU=;
        b=XNgux7NibW6l+k+soMUxRk1449I89tQesJuUCeKUQyJ9eyRDLcaRW5BjqBcvmqJ/Ea
         8lwgjQqckmmQAWN1s+Nuz5vhOOPdH8VypcPyHmn6hWt2XxeRzVYEsUVBKRhDPe8QxB0Q
         cQx2ymo910wmu/NY/mM8ddsIWd8z5t3Q0lNeWmhwn60DsNfOVS/CgafaIBkrULMZmcXY
         1AE9cfi+Q0TX46sI+I1pwBxwU79FAqJU2LmiVkOFoikciOYF4/WOPX5WpSlU0vNZxh+2
         dXnwczfChXp7IPzCBXTEJIo02xOP8WUGeyEsN8ccVVFpEMZHm6zHa1tjvonnyomgCkQo
         Nwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7eM4jUkfktuT5M1WMi6xPgusq5fBgvijCriihADNRlU=;
        b=FoHgvR9XRidn0QtfpqCEYkhb/BtEjz6D9Mn+bK+huC1D32lS5wT1zuoaJ/sBE2N6F3
         g5taWYVBTQnsBtrhA56ftsCUbk1br98+maWrwTrPEZXCI8eQ/iFq9RxcKyLhiC1Z9IbD
         Vyzqy7HVRLiPb11kQQ2dfaqFwqAA2dHkya1bLYRTL3aHxlTpXxlqHwJ6UpBajmKbxCiN
         i+NGZqxPxWUW1bp4cewLPdXNZNDW/Io1x5euE87/Xao+76ohMWUhomvPHSlVFAN72Aqu
         wXuNL4V9G/j3BQgldcJr+biGMREkhgrW/BkpXHm0CVgBQ1XkMJgKIoNwyQ0ZbzrOkzrC
         KWsw==
X-Gm-Message-State: AJIora8IbOj3YGg8cyBRDLUOF4CXvRYs8WajxmUYsadGsl+8Pc8bfJlm
        zZlFfJsd/nq0GKsvI16w8hoOzw==
X-Google-Smtp-Source: AGRyM1ueXm2pxfwiKc+qxbMnUUopd/zRMsPaSqHr6H9jJQXOsji2e/Lzx82z/R7NeBX661YP0niB/w==
X-Received: by 2002:a05:6a00:b4d:b0:52b:1eb1:218e with SMTP id p13-20020a056a000b4d00b0052b1eb1218emr6027702pfo.33.1658609097752;
        Sat, 23 Jul 2022 13:44:57 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:a406:cc30:f4ec:f10a])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e80e00b0016a6caacaefsm6187950plg.103.2022.07.23.13.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 13:44:57 -0700 (PDT)
From:   Jagan Teki <jagan@edgeble.ai>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-i2c@vger.kernel.org
Subject: [PATCH 13/22] dt-bindings: i2c: i2c-rk3x: Document Rockchip RV1126
Date:   Sun, 24 Jul 2022 02:13:26 +0530
Message-Id: <20220723204335.750095-14-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220723204335.750095-1-jagan@edgeble.ai>
References: <20220723204335.750095-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document compatible string for Rockchip RV1126 SoC.

Cc: linux-i2c@vger.kernel.org
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 5339dd4fc370..f350b7a0b991 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -37,6 +37,7 @@ properties:
               - rockchip,rk3308-i2c
               - rockchip,rk3328-i2c
               - rockchip,rk3568-i2c
+              - rockchip,rv1126-i2c
           - const: rockchip,rk3399-i2c
 
   reg:
-- 
2.25.1

