Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAA438AE1A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 14:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233350AbhETMZV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 08:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232736AbhETMZP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 08:25:15 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A25C0AE13E
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 04:21:11 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id f75-20020a1c1f4e0000b0290171001e7329so4983501wmf.1
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 04:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=higKOj1p3ok/7nI+zj6z0ZvfY1Ko1k+VC4e6gD2otWI=;
        b=g9Gf1u+Jbh6DYBX9q1rzo3cTRkf5wxluU18iBxD2nboZn34JD7rYfLeuZoHtyfYMzh
         qmvDsnXmCTLcXkhlwtqpztHAaQCf2lFm9PimRUibqmVi5VMJzEZYmu/Qo6dfE49VCGs7
         W1cpAhTo7DBJs4uGujD87YIezUZ6ONMo1DJGshzIs9/RIfi3iAoFBkMNL80jdTLWwNwp
         4Oi8pnkc8qQlkFicJH5U0hHMJATrgl94UKJ7oKAdy3kx1AU9NZElD+zzl4ZlSkBai3gq
         ykXgJ52Detsa640Mx2ru4rjRDvBFB7PWYFQOeqB8O5KzwjWyECGnzc3/byDIUkDLV70E
         36XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=higKOj1p3ok/7nI+zj6z0ZvfY1Ko1k+VC4e6gD2otWI=;
        b=firCLyosgpU08tAQx8mATX9xG6dxZ32QvdiOs0TU/lFRsUU/BIw5LVpK2UVvAspRPp
         x1DGCiv6D4FeBQ7tG+O4DzTzh/rFmYizTj4D5wwcrIopihnoVXgtCOgZJ/1nMGAeA3KA
         oNwtHXMK1hfMHnC1145clcEaJPdVn9ShZqQgsYu/bB2iAXxuXc2PIzf6dzixCp2alO7I
         aeY9tiB1rrtcHrx+i28vxQB3CbSwqTUfy8++ZD2+F/FZrSqHkdVy8Uxedz2kGyEpX6ny
         wGXpfmk1rf4U0lpp2V0FWq/+cbRnECV3HHq9OyGH6Kai35v1tmsBBg/pzrUlz+nazO+t
         4uJg==
X-Gm-Message-State: AOAM531aHkWAlEex3a7JSkAt9vYRzn0OvBdYz1QFSoJnHhN1faO+UMJp
        FkpeXrxIK9wZfj1zvCeQZLpNNA==
X-Google-Smtp-Source: ABdhPJxVIvEDcoDggTJiB4vSdqTDuOsOwbvvKHhNoweVKBATxb0UMt/Jt655qWVNCHb7uHZpTP29TQ==
X-Received: by 2002:a1c:b646:: with SMTP id g67mr3075568wmf.117.1621509670493;
        Thu, 20 May 2021 04:21:10 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id o11sm2756646wrq.93.2021.05.20.04.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 04:21:10 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>
Cc:     mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: i2c: i2c-mt65xx: add binding for MT8365 SoC
Date:   Thu, 20 May 2021 13:21:03 +0200
Message-Id: <20210520112106.77190-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520112106.77190-1-fparent@baylibre.com>
References: <20210520112106.77190-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add binding documentation for the MT8365 I2C controllers.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---

v2: No change

 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 41cedb4930de..2c437368532e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8173-i2c
           - mediatek,mt8183-i2c
           - mediatek,mt8192-i2c
+          - mediatek,mt8365-i2c
       - items:
           - enum:
               - mediatek,mt2701-i2c
-- 
2.31.1

