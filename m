Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97883E08B8
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Aug 2021 21:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234206AbhHDTZc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Aug 2021 15:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239149AbhHDTZb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Aug 2021 15:25:31 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F8AC0613D5;
        Wed,  4 Aug 2021 12:25:18 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id dw2-20020a17090b0942b0290177cb475142so10277996pjb.2;
        Wed, 04 Aug 2021 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8tScWghgvJJh7qP0I7QtmtkqfDVG51M4clJmbqjqTgQ=;
        b=ZnWDBhWD++BadgftH7K1nhIu2/kbIlPAPqdk+KB6rfYR5zfxlulCtK7SEiI4yDjNZ/
         hbn9YQKl9HZgkfFJ8VbfAUJgDBB6IhSMmEetQSpJeL5L1dMQ6b2+AwGtM/M0CRaAnV4T
         AGh9x8Ar6SXDGXB63J10IWsQqid+kJlau/jM02Qq0Cs8XuPr//0ebtyvHr8uK5mWPMn3
         s32HWGi8uC/baMql3bTwSBk/SQc5C8f4DvjP9NoM1HNnE6XOb5edhNOhUiBFcpX377Ep
         dTbmOvsA0jA5hCcWcYUrTwY/ScM98xdw+oO8nbnMz0YEulseqrDXVwsV3S/XZ4V5g6Pt
         0XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8tScWghgvJJh7qP0I7QtmtkqfDVG51M4clJmbqjqTgQ=;
        b=dZoMfL6RzmNmxMp8sVWDzJU4hWgTjwdh5Ux4i5vyUpn8n9/ZGrKqvCuQ5gl4zPgwmE
         gIVTBI0kEWWA5FUSHIrGiWTv1BRDRQD1FotzEpDCFLtkH9jchPZNr/2iP5ccI9I9/bPW
         us4vDof3iUrf0aU3ri3I2/ahn3QZTlD9ff3OM/mxJYgfMXOrpoJidoNxcoF2MtknYcLu
         AJkDbwqfkS8FAB621K3GJ4IjURddokoxDtU4FbS6OUD206xDJUaDLDwA/yRwTDftbEVk
         gv1ueNTpL2WbGXn6HnDOSMlVAOBNgJeT1YOnMFyVmJOjkpX4E+qUBYXr/YDiJaabc3w5
         p9Bg==
X-Gm-Message-State: AOAM5318yJ70zuhXLeJaYuxjHR9dP9LvcMcDEOcsJFy/y+SvArFzL2lS
        r0jMsZ8fO3Aum0u75z/kpEw=
X-Google-Smtp-Source: ABdhPJx0gs2g+l3cKaYQROekq31B6IDUQtjH2jtMxXo5ZNNWny99f2By5M16OcZlWUQd6Tpg68QEVw==
X-Received: by 2002:a62:54c5:0:b029:3a9:d3d9:4fe8 with SMTP id i188-20020a6254c50000b02903a9d3d94fe8mr1252177pfb.36.1628105118275;
        Wed, 04 Aug 2021 12:25:18 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:2003:b021:6001:8ce1:3e29:705e])
        by smtp.gmail.com with ESMTPSA id e4sm1071027pgt.22.2021.08.04.12.25.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Aug 2021 12:25:18 -0700 (PDT)
From:   Raag Jadav <raagjadav@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Raag Jadav <raagjadav@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: at24: add ON Semi CAT24C04 and CAT24C05
Date:   Thu,  5 Aug 2021 00:54:46 +0530
Message-Id: <1628105086-8172-3-git-send-email-raagjadav@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628105086-8172-1-git-send-email-raagjadav@gmail.com>
References: <1628105086-8172-1-git-send-email-raagjadav@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add bindings for ON Semi CAT24C04 and CAT24C05 eeproms,
which are compatible with Atmel AT24C04.

Signed-off-by: Raag Jadav <raagjadav@gmail.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 914a423..4c5396a 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -98,6 +98,12 @@ properties:
           - const: nxp,se97b
           - const: atmel,24c02
       - items:
+          - const: onnn,cat24c04
+          - const: atmel,24c04
+      - items:
+          - const: onnn,cat24c05
+          - const: atmel,24c04
+      - items:
           - const: renesas,r1ex24002
           - const: atmel,24c02
       - items:
-- 
2.7.4

