Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03954D1154
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Mar 2022 08:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237159AbiCHHz0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Mar 2022 02:55:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbiCHHz0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Mar 2022 02:55:26 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F2B73CFD7;
        Mon,  7 Mar 2022 23:54:30 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id u10so25426509wra.9;
        Mon, 07 Mar 2022 23:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=W/L+r+/fCB4l9p33UVukPXEu1m+B4kpeTuPR2wNzOHU=;
        b=b5LX5LPNmCMY06SaJ5mLXQxyzWLUfiF1g9SL7sppq1S1FDvcn/iBvEGfe3yuQRrQx4
         5tVNZazKaD27iGOCp1oy+29lxfRymkC/t5sWWSAuD7qgcAY7YBv2aWt8bUiCJaiqIvLp
         5ODvI0ArQoNTIm4c5kTupzpjIP/mgm4w2AiQBh2JjgQ4osHshF6fa1an9wwzUfOPAxfK
         9GpBjthGPseaRb2YWY+2LBpKdETJX28FsYFjGSvfCscMkTVYuhoLoLX1Rvhq6LCx0KMi
         rlUdAyQUrTPBuKcG3UVxOMz6G01u8Veh7A33fbFgF63mLaJTChQTZIew9+LZ0hkNxZVm
         23AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=W/L+r+/fCB4l9p33UVukPXEu1m+B4kpeTuPR2wNzOHU=;
        b=zOIKgPXFbfwcn1oXdQpPEC9LXj1nd9GRQuKIyAmxuj60UOW/56MQtwQlGmyxfEU0NF
         m5njyF+QdTfwrf3hNMoWkEpfDrYdfuleghNXsc7gP1e2s+5tHZVhBzozQyuJWoqvlRMx
         qYTy/mt/VBqflLr/ryIxMjCg/JBQqlw9cCrCj0piEF+R2TGBpFn8iwI6ciDsTIv4SCj2
         YMw3ix8qfy8q1i+fpYnhAje+plA9V7g8L8IlCQ0Nt0z3DU95NZCYFb17lTEBwMYSX5Ul
         v1kT9mvapbupi1ZZEMvSvZJGepKNOIe88J5TRl1UGPJ91SePJap/rNYvzOqarFXT85xH
         W3sw==
X-Gm-Message-State: AOAM533SQ/OxfDzBOnrSMm4FdlSyj676uG7jm0e9TJ2HVXg62j9hhLme
        s6N30mw8bhtpo8R/4s9sy4k=
X-Google-Smtp-Source: ABdhPJx2i/m1TJ34EsrMs3DcWt3NZKdOkhFTyD0itWRUKEpWHEAee5Qkm/gFAx5RO6V6Uujm8GEh/Q==
X-Received: by 2002:adf:8bd4:0:b0:1ed:c1f8:3473 with SMTP id w20-20020adf8bd4000000b001edc1f83473mr11904148wra.435.1646726068479;
        Mon, 07 Mar 2022 23:54:28 -0800 (PST)
Received: from felia.fritz.box (200116b82626c9000cc91df728b27ead.dip.versatel-1u1.de. [2001:16b8:2626:c900:cc9:1df7:28b2:7ead])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d590f000000b001f04b96f9a9sm12929673wrd.42.2022.03.07.23.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 23:54:28 -0800 (PST)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Cc:     George Cherian <gcherian@marvell.com>,
        Rob Herring <robh@kernel.org>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: adjust XLP9XX I2C DRIVER after removing the devicetree binding
Date:   Tue,  8 Mar 2022 08:54:14 +0100
Message-Id: <20220308075414.30026-1-lukas.bulwahn@gmail.com>
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

Commit 0e5f897708e8 ("dt-bindings: Remove Netlogic bindings") removes the
devicetree binding i2c-xlp9xx.txt, but misses to adjust the reference in
MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Remove the file reference to i2c-xlp9xx.txt in XLP9XX I2C DRIVER.

As commit ef99066c7ded ("i2c: Remove Netlogic XLP variant") explains, the
i2c-xlp9xx driver is still used by the Cavium ThunderX2 platform. So, keep
the XLP9XX I2C DRIVER section in MAINTAINERS with its reference to
drivers/i2c/busses/i2c-xlp9xx.c.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Wolfram, please pick this minor non-urgent clean-up patch. Thanks.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e567236146f..dc984c050086 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21305,7 +21305,6 @@ M:	George Cherian <gcherian@marvell.com>
 L:	linux-i2c@vger.kernel.org
 S:	Supported
 W:	http://www.marvell.com
-F:	Documentation/devicetree/bindings/i2c/i2c-xlp9xx.txt
 F:	drivers/i2c/busses/i2c-xlp9xx.c
 
 XRA1403 GPIO EXPANDER
-- 
2.17.1

