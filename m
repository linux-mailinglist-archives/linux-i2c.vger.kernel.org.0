Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4C3422B2F
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 16:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234636AbhJEOkB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Oct 2021 10:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234084AbhJEOkB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Oct 2021 10:40:01 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EAAC061749
        for <linux-i2c@vger.kernel.org>; Tue,  5 Oct 2021 07:38:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r19so4516084lfe.10
        for <linux-i2c@vger.kernel.org>; Tue, 05 Oct 2021 07:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msJiBzyUeKV8FpoS/TYzjgGtnwD3uWYer6ogIVTmynQ=;
        b=A9uNkZL1Zeuo7Tspc6oQR2fBKHxSVRHx+WgNkJwJfw83LPMlNQQjYSsYKu6+1NGJ8O
         NB2CeH19fARPh9GsfBeEH/spe+gxRk3cY9v2/C+vlB4S4nEvS1XhNbMTMskxuATQrB5C
         U07yEvNOLUjOYFkrynNrUwD0iRyAOydH56W+ZvnHPe960sqryoPlAH3D81I71O4iGbOh
         c/8EkoNjOn1xAsDtaWTwSoxm9ya4RsuhlfokputHxqq1Aef21AepJiG+xFCCblgHEZ4C
         3Bv1uCy7CsYQNmCRngk4/PcoMYBF42wAZRtgAJbaRhxNsc42FMIM5ALwp/+8UsEtUZRA
         2/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msJiBzyUeKV8FpoS/TYzjgGtnwD3uWYer6ogIVTmynQ=;
        b=XdXSRUCK4qNq89NFKJjgo7HS/6Zix6togyxz7BO0orvegAzLmyyoLTW+S0gmGjXV3z
         q05Y+IKVvmVBOvbJKcZJ0Ph9QdlL5H9I4oEEQFZ4EFPk5wGho4e2tj/BsP933aK4BU4a
         OS/g49MMhfD2xA98x0YZ6AqvbQQ7ncnUm5bvGtZnfHOExWOfd9sobsFkdSNQ6X6jfiqV
         wv2+avn7171Kq9IcATjTBORXRwH+WyDkeVxnU2+AIGDghRi3G0Sq7zyAFvhyDhB87w7u
         ZIkNQLbVplH6cOJtqLSKLLSBZlp/DfLohQcFYuDwn6lyH0nIBjGMjdYsP41xUjnSuuuM
         qELg==
X-Gm-Message-State: AOAM530psrYvmVvVUscE8RQRtRLw56Qj6eeqHjLoaATwmyn2LvvZMgHG
        nhMKuS50z+X9/19PE4mv88fDNw==
X-Google-Smtp-Source: ABdhPJwjHFt3CH4sjkux3RohVRrB59RZWeObwoAjO4ak37gG3wQ/jeQOUiIaNRGdJyngodBj+RX0UQ==
X-Received: by 2002:a05:6512:3501:: with SMTP id h1mr3770923lfs.446.1633444688364;
        Tue, 05 Oct 2021 07:38:08 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id u25sm1973835lfc.176.2021.10.05.07.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:38:08 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Add support for the Mercury+ AA1 module
Date:   Tue,  5 Oct 2021 16:37:44 +0200
Message-Id: <20211005143748.2471647-1-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The following patches add support for the Mercury+ AA1 with an
Arria 10 SoCFPGA.

This version differs from the previous one by removing the spi
flash node, renaming the memory and mdio nodes, adding gpio nodes,
and adding a bus number property to Synopsys DesignWare i2c
controller node.

Paweł Anikiel (4):
  i2c: check bus number property in DesignWare I2C Controller
  dt-bindings: add bus number property
  reset: socfpga: add empty driver allowing consumers to probe
  dts: socfpga: Add Mercury+ AA1 devicetree

 .../bindings/i2c/snps,designware-i2c.yaml     |  5 +
 arch/arm/boot/dts/Makefile                    |  1 +
 .../boot/dts/socfpga_arria10_mercury_aa1.dts  | 99 +++++++++++++++++++
 drivers/i2c/busses/i2c-designware-platdrv.c   |  3 +-
 drivers/reset/reset-socfpga.c                 | 26 +++++
 5 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dts

-- 
2.25.1

