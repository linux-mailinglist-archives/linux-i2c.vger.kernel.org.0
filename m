Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF4A422B33
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 16:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235518AbhJEOkH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Oct 2021 10:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234084AbhJEOkH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Oct 2021 10:40:07 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60006C061755
        for <linux-i2c@vger.kernel.org>; Tue,  5 Oct 2021 07:38:16 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id i4so88027499lfv.4
        for <linux-i2c@vger.kernel.org>; Tue, 05 Oct 2021 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z8yJ3pPZ9+WPMdAHGwCAtozfSgkyhJMEnQnMA+Z0TQI=;
        b=0CE3XJmx7D6euF5qrA2Opsb+C3uYz+egZm36W2sRX5c0XlTlmxj9meTCHFzWx4P+kC
         cj7WYKZkaziTQJItkQNcG7FDbGdy2qByNwUkZpr+z6QaJP7FXZoBHmna27omLi+1F+Pc
         Zy/BR3dISsxo34DCfGR0fF5qio1t59z8jfvYWCErYDjplgL/HQK99Rmtx8zEVqSLWCjN
         lR+icNyvVSyx2f6juS3dvQ5LpJQFDiQk0mchttG5xqk73hhNfin+cpSLYVsaljqYgc+j
         1yUACMgYpNoGKLAihzOuQ8bgVHvsppCKtWcDD40kSsbV+A8y9AhDFawtDfZWWIgmOdNr
         ZLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z8yJ3pPZ9+WPMdAHGwCAtozfSgkyhJMEnQnMA+Z0TQI=;
        b=qF9rgCBD2djuI/EXiHtnMuspYDLftpdB5qDyiRkixl4Xp3SM/yoiDnveYmnt5TFjon
         TjJ/67Rf8n8J8QgCuRlx0oKSdsjBZKKyQhsSfZp39uGLYuB7UIonXX0yrQrGahBBtCXr
         aIc+0mHZG1QvcKLtFlTbFaOtIeoHbjTuCkvYUqxZAQANNFRLvxChqy/fyaASAdEPafZI
         HQKZc5qtCQpWSMNxLebOBEixrw24r0K5Bbw1CWUV++NPdk1JhJ/6A6jtolRr8079cTa3
         fJhcvFkJdhfxDXIJBloAOVU6eqeuNxFmj8c4NQeLYm0jp+l7SHHFE1KQPKvf/Fam6OcA
         tBTA==
X-Gm-Message-State: AOAM533ctCosh82ewDe7ZBEv/Q6aOHcdPyA8ki659ErtqcF4wBxJ9nBw
        XMnGKKsdC70Tr6vOdBEtFYwGrg==
X-Google-Smtp-Source: ABdhPJzaxO4ySi1hxPEHc55AKtXS0CtE0M+NBzHPCG+qdRxgDm6cu0AbkYqr8+G8n3cVtkEUfe7g0g==
X-Received: by 2002:a19:4802:: with SMTP id v2mr3839955lfa.49.1633444694743;
        Tue, 05 Oct 2021 07:38:14 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id u25sm1973835lfc.176.2021.10.05.07.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:38:14 -0700 (PDT)
From:   =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        p.zabel@pengutronix.de, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, dinguyen@kernel.org, p.yadav@ti.com,
        Tudor.Ambarus@microchip.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        alexandre.belloni@bootlin.com, sre@kernel.org,
        thunder.leizhen@huawei.com, Jonathan.Cameron@huawei.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        ka@semihalf.com, tn@semihalf.com, jam@semihalf.com,
        amstan@google.com,
        =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v2 2/4] dt-bindings: add bus number property
Date:   Tue,  5 Oct 2021 16:37:46 +0200
Message-Id: <20211005143748.2471647-3-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005143748.2471647-1-pan@semihalf.com>
References: <20211005143748.2471647-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On SoCFPGA systems, it's desireable to have fixed numbering for
i2c busses, while being able to enable/disable them (e.g. have i2c1
be mapped to /dev/i2c-1, even though i2c0 is disabled). This can also
be achieved using devicetree aliases (see i2c_add_adapter). However,
having the driver be self-contained without relying on aliases is more
robust.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 .../devicetree/bindings/i2c/snps,designware-i2c.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index d9293c57f573..1e02ddcbd690 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -93,6 +93,11 @@ properties:
       - const: tx
       - const: rx
 
+  busno:
+    description: |
+      The property should contain the desired bus number (as opposed to
+      being assigned automatically)
+
 unevaluatedProperties: false
 
 required:
-- 
2.25.1

