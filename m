Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537A935F9D8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 19:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350799AbhDNRaF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 13:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350396AbhDNR3x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 13:29:53 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0D5C06175F
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 10:29:31 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id m18so8310727plc.13
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plmO0AdMl820K1E1EewPUIFFIYm0UYQ8GWMNCMfiNMs=;
        b=LWWkG7tf2pAAxOYa62M6wF4DR6wuiuWheoc5zSNFuwA0w62Prt2SPX7h0tg3QF4d2V
         44nkwDeNFfIzGlhxsD0/euzgJwjZy8/voyo4Fri/H5W/ug6v0hmlUPQH+WHtMo0TjM9m
         zGTvuXagrcNpxaxXK+HoZoVJQf5Z62gbvDiKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plmO0AdMl820K1E1EewPUIFFIYm0UYQ8GWMNCMfiNMs=;
        b=LBDyZw9rvRZ9D8/HAEYDcoZL4YUsT0QRkzJ5ShL3g3KqAQk1XFxx1icXQ501agsR1C
         qwuT6F3J1E228WBlXqt9Nvr9kat5SkpWQPUZvrKb4RAsqFKpnSIUgwd70mT7Xsw7GKLK
         5s3tnfN04yARgt305phmkK+M+jk82gHeBoUS46VYgH7wj01DtQi/R3+Us4E3Uw94Lcrh
         nzBEz49KTHo22t1cZBu6bsAVlT5kZHsc1D6KFKiYeYbBrxX8XpmoIAgXY4saE5mGv6Xp
         OIjX8oV0wFFwKt4VVl9yAkd3MQYQjAII1rEjlRyX0s5UPVkVgyr9O+FzAZDRuvqM+P+M
         6IeQ==
X-Gm-Message-State: AOAM53176+CkvhivD7TkP+28L1ZAPxKFRvRNGoMw1+eB/zGijjXlVzs/
        zVaFdh+v9su3FwTAxwaLMvVF0w==
X-Google-Smtp-Source: ABdhPJzqi2vvW8j/Szl8iVKwjP6K0nUzELS0dvdFZgmCztvcUb4kX2kyyJdsJNS5/ctFp046mYN23w==
X-Received: by 2002:a17:902:fe91:b029:eb:ad8:c5f with SMTP id x17-20020a170902fe91b02900eb0ad80c5fmr15248007plm.63.1618421371078;
        Wed, 14 Apr 2021 10:29:31 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:bae3:4af0:9792:1539])
        by smtp.gmail.com with ESMTPSA id e31sm63460pjk.4.2021.04.14.10.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 10:29:30 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH v19 3/6] i2c: mediatek: mt65xx: add optional vbus-supply
Date:   Thu, 15 Apr 2021 01:29:13 +0800
Message-Id: <20210414172916.2689361-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414172916.2689361-1-hsinyi@chromium.org>
References: <20210414172916.2689361-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add vbus-supply which provides power to SCL/SDA. Pass this regulator
into core so it can be turned on/off for low power mode support.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 2ffd2f354d0a..82f2b6716005 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1215,6 +1215,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	i2c->adap.quirks = i2c->dev_comp->quirks;
 	i2c->adap.timeout = 2 * HZ;
 	i2c->adap.retries = 1;
+	i2c->adap.bus_regulator = devm_regulator_get_optional(&pdev->dev, "vbus");
+	if (IS_ERR(i2c->adap.bus_regulator)) {
+		if (PTR_ERR(i2c->adap.bus_regulator) == -ENODEV)
+			i2c->adap.bus_regulator = NULL;
+		else
+			return PTR_ERR(i2c->adap.bus_regulator);
+	}
 
 	ret = mtk_i2c_parse_dt(pdev->dev.of_node, i2c);
 	if (ret)
-- 
2.31.1.295.g9ea45b61b8-goog

