Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D29C3306E0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 05:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234157AbhCHEgT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Mar 2021 23:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234182AbhCHEgQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Mar 2021 23:36:16 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A119EC06175F
        for <linux-i2c@vger.kernel.org>; Sun,  7 Mar 2021 20:36:16 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id lr10-20020a17090b4b8ab02900dd61b95c5eso15840pjb.4
        for <linux-i2c@vger.kernel.org>; Sun, 07 Mar 2021 20:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FHYldnLHVjUCtTPUMHFVsgGiL0sQpC3TJ8ogHG6aen8=;
        b=kf5mR4d+LR5JbmXKw7GBAbezQrJuBbdr23XLj7F4h0q19tZUWG1P3AbEmDtzUGrnZZ
         QIPpIARW/MuIw3pbo79B7vjypi5C1e/tuJuU40TMB7Z3pesGzJWkJjAohZ2KJdLH+7eK
         x5rimKui7iYlNXUZegTL0pvXUDliEdJbc8fIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FHYldnLHVjUCtTPUMHFVsgGiL0sQpC3TJ8ogHG6aen8=;
        b=fqvf/AvYQmL6J4oFaKPiLgOsvdsHwzT31tKY8rIBcF5PPsZNUSHfbteXS6NFTMK8Kv
         ayZxuPu17Aip5zq1Wqm1eE3PET2Ng1nYGaD7G0iGglsBcKvQI65kFaAy38h6J9AiwvnQ
         f7yGbbpq9Nn8YEjEA3DLmu+q+ElNlHyL0cOKvJnMTlw/d86MCMuZkjMqSZ271V2EVNoN
         yQSr5LLndPxLRJHZre1Bk7AjQhkCde7beLEvm5968ilDUUYgo+j1WnXpKGF+hLWGVtqy
         XVtfA2KVj5vw9s0Q8ILFhZViGZzhIszxaNtTJ5xMG09OsJkl/292BhwI7Q5h4FmotHWP
         NHdA==
X-Gm-Message-State: AOAM533z33E+zBwbzCGegtwTN8TTpL5Ax55RG0/kfHF/XP66sGnZzPGC
        3T0H3yI/BuG79CmyzzuTqe0+nQ==
X-Google-Smtp-Source: ABdhPJxfM03eVHY5cSuqb4Q3jnfIMSUxwGHkcMGr83Img4syS9OwBsVqxPVXEldm7tF596anODr1XA==
X-Received: by 2002:a17:90a:d590:: with SMTP id v16mr22232876pju.118.1615178176205;
        Sun, 07 Mar 2021 20:36:16 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:5da1:da1b:5bcf:2d46])
        by smtp.gmail.com with ESMTPSA id q2sm8191562pfu.215.2021.03.07.20.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 20:36:15 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v16 1/2] dt-binding: i2c: add bus-supply property
Date:   Mon,  8 Mar 2021 12:36:06 +0800
Message-Id: <20210308043607.957156-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210308043607.957156-1-hsinyi@chromium.org>
References: <20210308043607.957156-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bibby Hsieh <bibby.hsieh@mediatek.com>

In some platforms, they disable the power-supply of i2c due
to power consumption reduction. This patch add bus-supply property.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/i2c/i2c.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index df41f72afc87..88972bd62ce1 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -130,6 +130,9 @@ wants to support one of the below features, it should adapt these bindings.
 - wakeup-source
 	device can be used as a wakeup source.
 
+- bus-supply
+	phandle to the regulator that provides power to SCL/SDA.
+
 Binding may contain optional "interrupts" property, describing interrupts
 used by the device. I2C core will assign "irq" interrupt (or the very first
 interrupt if not using interrupt names) as primary interrupt for the slave.
-- 
2.30.1.766.gb4fecdf3b7-goog

