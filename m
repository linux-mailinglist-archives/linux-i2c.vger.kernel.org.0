Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0695464C9
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 12:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349152AbiFJK4d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 06:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349153AbiFJK4S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 06:56:18 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEBE30288F;
        Fri, 10 Jun 2022 03:52:54 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id fu3so51223778ejc.7;
        Fri, 10 Jun 2022 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=mzNIu/hJfU64bjzdbz9eCIuBSxxHQFir6w0YjzInoQI=;
        b=Uo2m+Sq9lpnhslhNmuKaT8w9T5xrgYB59/nCxk55tltJ0faqdhoGWYiclga4c+rpll
         ldCwlrImoyYCqZvDr/rgnulEWi5AWG4QDzv/LKtYEKE3TgtLF6IQzWfB9firfjochGoU
         Xh6lbgPnSv9euIst4fqLogICoY+I10bYDx0BIoq4rfF3QlOZWuO1IxhG6glizb7gYRR1
         mZIh70nUMPyelUIYCjMuXJ0WsweODwiZ5P9zPuPQCPbRjOFe0WHRbISqZPOyLCGKemmn
         xNieXDw7RoQnhFmIyEqLCxeat52gC/Ge3ez6inUMIDZB7COg7+BiOeF/XJKOiYtWuPHy
         2yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mzNIu/hJfU64bjzdbz9eCIuBSxxHQFir6w0YjzInoQI=;
        b=T9+K14H49QWnVGeGJcGhLSaMSXhoRPiuS0TPRKbM53Vty+YEAZNr6ow4WZ2pCavtEC
         UoVG0ZEKqjfizSSw5ZpsKx7plycB+tmLGMWr+T/96Vn939Crp3GtniLCgFQKuLE0zpDI
         pvDpMIYaFtzUNmgIS6seH7X9tND6UBRYyvpzvECkry08I2vicHBPkh11Qeax611uw0UZ
         JUCkwSwvSSjiMyNurSSmnnvBtxnKzMZfOapxR0ecIQIE8fZ0swSr4CCVcZUSmk2jSI/I
         XtlOn4LZKeCgmHx3tso3eOUcboFiw96qONM+2t7L3yZdyfJl6VhAwcCdkRIekvEpBsj6
         iOmA==
X-Gm-Message-State: AOAM533MJxvqT8tPiZrwPxmuFYO55EdpTd28C5LInCzUQ6kXsJviv+my
        bZBEsFLpigJp+i8Uj21Zq1k=
X-Google-Smtp-Source: ABdhPJycsiR0DjteXV5+fJA+IKXDppw5/mfo6n9QK5UucCkXyrl+Z5+EpVBkoK2uWAGda/gzp2qWgg==
X-Received: by 2002:a17:907:7202:b0:6fe:fcec:7b7b with SMTP id dr2-20020a170907720200b006fefcec7b7bmr39464058ejc.529.1654858372430;
        Fri, 10 Jun 2022 03:52:52 -0700 (PDT)
Received: from felia.fritz.box (200116b82696b000c87a6777df67efb1.dip.versatel-1u1.de. [2001:16b8:2696:b000:c87a:6777:df67:efb1])
        by smtp.gmail.com with ESMTPSA id y22-20020aa7ca16000000b0042dcbc3f302sm16353114eds.36.2022.06.10.03.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 03:52:51 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Conor Dooley <conor.dooley@microchip.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: Rectify entry for OPENCORES I2C BUS DRIVER
Date:   Fri, 10 Jun 2022 12:51:54 +0200
Message-Id: <20220610105154.2358-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Commit 8ad69f490516 ("dt-bindings: i2c: convert ocores binding to yaml")
converts i2c-ocores.txt to opencores,i2c-ocores.yaml, but then adjust its
reference in MAINTAINERS to a slightly wrong new filename.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this file reference in OPENCORES I2C BUS DRIVER.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Conor, please ack.
Wolfram, please pick this minor non-urgent clean-up patch for your -next tree.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc5b74ad0141..02e91ac4ee04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14920,7 +14920,7 @@ M:	Peter Korsgaard <peter@korsgaard.com>
 M:	Andrew Lunn <andrew@lunn.ch>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
+F:	Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
 F:	Documentation/i2c/busses/i2c-ocores.rst
 F:	drivers/i2c/busses/i2c-ocores.c
 F:	include/linux/platform_data/i2c-ocores.h
-- 
2.17.1

