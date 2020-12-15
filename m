Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275A92DB3D3
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Dec 2020 19:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731330AbgLOSfX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Dec 2020 13:35:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38986 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730597AbgLOSfT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Dec 2020 13:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608057233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=MU6D99Po4do4q0kWzkpF8SHX/QWTqPhjdse3XM9YpKA=;
        b=Q2fS7bjX3D7x4Ln87/irbd7PMC+gRxD3vw8G1L+mCoVILYNdU4PXLzUcv6ttwb7OgMKghU
        DSAdI2W2KMmcl96+FTFU9BrM3YRaZJ8hPw3KYVTunzbGDKF5yodbaSzLnmAkrGuFjUiDr3
        gAfait10TGegc11hoH7UUjNYL9ZZNCo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-EZBwzAP1O2GRrGKj_WcfDA-1; Tue, 15 Dec 2020 13:33:51 -0500
X-MC-Unique: EZBwzAP1O2GRrGKj_WcfDA-1
Received: by mail-qv1-f70.google.com with SMTP id i2so14838082qvb.2
        for <linux-i2c@vger.kernel.org>; Tue, 15 Dec 2020 10:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MU6D99Po4do4q0kWzkpF8SHX/QWTqPhjdse3XM9YpKA=;
        b=Isu8AcKTp2PdE8gkO4RYErKU+JIvj45e6TZFm43iZhWYxMPl3QTqSgFx4BIaDoXLRy
         1T1onlSz7fWhxLOvWFPdA1lQvPgAEEnCHZF9ucQ8rDvEItrnLdgOmKmKoKumuVxqlYsn
         BZfEV/uKZbHDBp0UA0xGHLPtYH5v0dCSIwt1BEyk3NxUZj1+hD5v9/HrEZYhglNiVOx0
         C5UPSMbLFXVOB2Am1iONLTP+BW4PO5GXW0JIkSMESf8l8GWr/Sa0yvLPPSCScIa8vSPe
         1xXoJL1uqKmeJm1FQBifnL2fwPa5/WRXMJrMkNKCxNaQyi6OgfvEC2XzAMnX71MjT6mb
         bLHQ==
X-Gm-Message-State: AOAM531S/h0LvMbo4fpU//xJsv/8nQKhnOCra1/dlE0Fpt2pb7tBQrBt
        XtUui5lTIuQADWl1owerhNO+EJI9oE4ao9ttzlpzexae25Zs3Tpww98Y/1liZ7sL+zORZt+qh/P
        1WoIPEYg8inR/gZsNh0os
X-Received: by 2002:a37:5185:: with SMTP id f127mr42217508qkb.196.1608057230868;
        Tue, 15 Dec 2020 10:33:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgHuxfITXPCHKNnXBtm44EoPzpq/kqYz7yr/GnKA7JpXbrOuzHHZLIKpRZvPjd9P15Veko0Q==
X-Received: by 2002:a37:5185:: with SMTP id f127mr42217493qkb.196.1608057230697;
        Tue, 15 Dec 2020 10:33:50 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id f134sm16604159qke.23.2020.12.15.10.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 10:33:50 -0800 (PST)
From:   trix@redhat.com
To:     wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] i2c: remove h from printk format specifier
Date:   Tue, 15 Dec 2020 10:33:27 -0800
Message-Id: <20201215183327.2072052-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tom Rix <trix@redhat.com>

See Documentation/core-api/printk-formats.rst.
h should no longer be used in the format specifier for printk.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/i2c/i2c-smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index d3d06e3b4f3b..5cd2cf84659e 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -396,7 +396,7 @@ void i2c_register_spd(struct i2c_adapter *adap)
 
 		if (!IS_ERR(i2c_new_scanned_device(adap, &info, addr_list, NULL))) {
 			dev_info(&adap->dev,
-				 "Successfully instantiated SPD at 0x%hx\n",
+				 "Successfully instantiated SPD at 0x%x\n",
 				 addr_list[0]);
 			dimm_count--;
 		}
-- 
2.27.0

