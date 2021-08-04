Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73423E08B3
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Aug 2021 21:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235816AbhHDTZY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Aug 2021 15:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234768AbhHDTZY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Aug 2021 15:25:24 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94A1C0613D5;
        Wed,  4 Aug 2021 12:25:10 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso5040114pjo.1;
        Wed, 04 Aug 2021 12:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mmVK1hU7ZU/h7aq3Lyk6d21CcR1cot/6rqNgdGojQEo=;
        b=eMgoj0phLST6KaNi7uHV4hXhFPw9AJSo0znp96nYIoqEPUye2l6VVCh44AL42ePOf+
         BKLToqmPy6Ri7rjoiHXi5ZNSpUp2ccXdgBZKB8q+IPczD/2OTMPtLYSA8AYwtaUtTH3l
         FE+FHTT4qG503EPMrgl1zxlV0hxWaLtx8+nOlEKBRJBx7qdRqGU5YwnhtUS4wEC+SiFB
         8UveYif6zn9SaawppS6j69omFRbSQVxgh7sM2igFoCSyP3c1QzQn34LZ2vmqe8LWOgaI
         QfWHLssfA4nyefsyGlTRgsEKu5VjIzPMRmYJW4Ek3cUdtKslooGRRFoVZZsFcihuLfJC
         FE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mmVK1hU7ZU/h7aq3Lyk6d21CcR1cot/6rqNgdGojQEo=;
        b=KRdBOlSNE5Od/GZYRGUNnvNldg9x4YUCx8wLr7Lbe0XKPdqtMKCXmoRj8O9iv7EZnE
         GToimTbBY9WfA30MD/iy3xRidZUjjS+tdr0N+XszwDKRv3ZHpXZZF++wjqSp5Umi+BuP
         iV4JI+pLUl7Wq7iXSuWgu54XC9aFVIr1AXNSqv33ienMuC8HAOGILOwdtdU2rN9JHmxg
         6NsjRmPWLat0vI/UJB9cIHqPFaAWHikvZCu1h42HBa7BTm08+IqyNjV/AhDnFQzExqGR
         iETprkKHfh9/mRZWDc122xWvzr6j2FWZeBqKhXMIxGolk/ufGkx13TJv+ngbUvQ4drd6
         8D6Q==
X-Gm-Message-State: AOAM532RFIux/BSRX7mLJ0F4VMeh3RTm5h0q6KXEsGmzwp50ZgQOhJfe
        jvtfTzgSPcgRjlU2qFviXq0=
X-Google-Smtp-Source: ABdhPJxZMYsswEp1xvIL2WUoc69Rn6pdqH894miPQ4DxWkM4nibuMvzAq8T/h0fnLsn3mY58CBbfxQ==
X-Received: by 2002:a63:494:: with SMTP id 142mr127287pge.242.1628105110352;
        Wed, 04 Aug 2021 12:25:10 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:2003:b021:6001:8ce1:3e29:705e])
        by smtp.gmail.com with ESMTPSA id e4sm1071027pgt.22.2021.08.04.12.25.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Aug 2021 12:25:10 -0700 (PDT)
From:   Raag Jadav <raagjadav@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Raag Jadav <raagjadav@gmail.com>
Subject: [PATCH v2 0/2] fix eeprom entries for ls1046afrwy and ls1046ardb
Date:   Thu,  5 Aug 2021 00:54:44 +0530
Message-Id: <1628105086-8172-1-git-send-email-raagjadav@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series fixes eeprom entries for ls1046afrwy and ls1046ardb boards.

Changes since v1:
- Update patch description.
- Add bindings for ON Semi CAT24C04 and CAT24C05 eeproms.

Raag Jadav (2):
  arm64: dts: ls1046a: fix eeprom entries
  dt-bindings: at24: add ON Semi CAT24C04 and CAT24C05

 Documentation/devicetree/bindings/eeprom/at24.yaml | 6 ++++++
 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts | 8 +-------
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  | 7 +------
 3 files changed, 8 insertions(+), 13 deletions(-)

-- 
2.7.4

