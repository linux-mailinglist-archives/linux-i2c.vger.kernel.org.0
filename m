Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6D034D8B1
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 21:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhC2T6c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 15:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbhC2T6F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 15:58:05 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71256C061574;
        Mon, 29 Mar 2021 12:58:05 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u10so17312532lju.7;
        Mon, 29 Mar 2021 12:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RihCMK+8NByceB9QnhsNQY0/lGJnKYNyKEF1OBRbMlk=;
        b=EHyz1zKSBdjjq4bdKEEc59eCxIHWxU5c++UfKeYr8FN2jxClLS5LWQqwejmNs7M0hW
         0uI4HF0rZoS3HQi5eCYWqZyxX1lMn29CdgKMc6JVeHs9J9xiETEb1pC93Spvyelxcyl5
         5Egks1mklw3P9pigMBJfH56aziRltXnvHOtprdz/j90gAlxvlRl+EWmCepqR9WsVj2Wg
         B7VW8I5r3A86FjaaJqEZwKHr1qitmkVwoF4uFU32rhZ1FpxZOKEtfIDKODHQEvhySsPz
         YIhnwtGSkHZVkOqxa6JZUFeOz0YG8bt8uprcWoE/YmB68JdEOro2YvMZ0cLVhyPyd9au
         NcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RihCMK+8NByceB9QnhsNQY0/lGJnKYNyKEF1OBRbMlk=;
        b=YASd/JZN4p5zk/LQsUYFuJqmjfid3KzPeuIVJhCbcUbk26oBD2Nv2Yemq44/LxU6bw
         aFX4LuWawwKLw3PyDyIkfjK7aQCayjTBTlwWRsCuPzds1rN/VuMEHNKc+WUo2rR//MNr
         tu5y5hPbK8l5N49nkdeFEUOeff2c4vHptn3HfZGJM6zdINvUX7df3L+QKBVW+bveB94y
         qz/akl24iZ8Evgli7ApmrdSKJU4mUsGmPDopXJNH8N56lfKeeJ61tKq1OZzAhI2388Ic
         4/t6Epdygr7vhAaJUGRSY9oDD7MVPdvn4XyzPaiBua+tvwKjbHYGEZxPRRUpfDV6eW5a
         6+Lg==
X-Gm-Message-State: AOAM530Pl6kZXeX4zrcU3DDrqXzRrkT3AygHhJ55Ws2b57k8agJOshdX
        Js73dpxnWRDk6qnQ7DicSIM=
X-Google-Smtp-Source: ABdhPJzZ+b2TPU57SwP/qmNym6r44/GtuUafs/6Veu4Jq6HxHV1NRjrUelEU9SBQfDkoa316Op/diw==
X-Received: by 2002:a2e:9757:: with SMTP id f23mr12709021ljj.14.1617047884029;
        Mon, 29 Mar 2021 12:58:04 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id e11sm2542304ljj.59.2021.03.29.12.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:58:03 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: Make i2c_recover_bus() to return -EBUSY if bus recovery unimplemented
Date:   Mon, 29 Mar 2021 22:55:30 +0300
Message-Id: <20210329195530.1053-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c_recover_bus() returns -EOPNOTSUPP if bus recovery isn't wired up
by the bus driver, which the case for Tegra I2C driver for example. This
error code is then propagated to I2C client and might be confusing, thus
make i2c_recover_bus() to return -EBUSY instead.

Suggested-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index f21362355973..7039b8a06f3a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -249,7 +249,7 @@ EXPORT_SYMBOL_GPL(i2c_generic_scl_recovery);
 int i2c_recover_bus(struct i2c_adapter *adap)
 {
 	if (!adap->bus_recovery_info)
-		return -EOPNOTSUPP;
+		return -EBUSY;
 
 	dev_dbg(&adap->dev, "Trying i2c bus recovery\n");
 	return adap->bus_recovery_info->recover_bus(adap);
-- 
2.30.2

