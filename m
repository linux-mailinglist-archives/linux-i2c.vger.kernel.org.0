Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B79FC8AF3D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 08:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfHMGJ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 02:09:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34763 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfHMGJ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Aug 2019 02:09:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id 31so106641214wrm.1;
        Mon, 12 Aug 2019 23:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YA4Nao3CX1fWeDuXBXZMsed4Ax1EKZZZUUVFq21RxTM=;
        b=hiH/090lKXhju5H9ZeZecTQynxMpdTMz0lJu5AlIhZ87gs0K6O+OvWwhnM9oeviv2C
         DuimiTTMhhPSSGttC6aLtKWejLHEK4Z0iOw3zV5McHoSBVJUv4+x1fA+LxuCQ5Fn9FOo
         8FVBshsyYZ3yPIyuOJVUopNRDiLOQZO7KvX1Dud/Kwbw+v7ZDdQnP/V/pXIqnFu/ZmLH
         jOaPA+GXR4pUkjIjg5qWyVsgHyemCaBb0EnxlBwtAyMwEUss9RGGdq2svVwOmdHsXmCd
         j8CIEZNEjW5Hu258/MK3cGOjb1JPtHs76h5KR3QfaH1zfruuXRoBfJlzrDJZqVzEgDUA
         oKfQ==
X-Gm-Message-State: APjAAAVVcaCUaDwdLEsCoGd2Mbndemjy5HZ9XDIAX7tBKy3W0PIC1Edq
        hi82LfuNu6b0YRDm223GbmViWfx4/Uk=
X-Google-Smtp-Source: APXvYqx7zH9PZV/EvHIbsrWE76a0PabiDf+8U6bwPZ9R+2tDhRRIGsxkhp7PZnrVNmDoQ1WJU/iU4g==
X-Received: by 2002:adf:8bd8:: with SMTP id w24mr19789685wra.273.1565676565372;
        Mon, 12 Aug 2019 23:09:25 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.googlemail.com with ESMTPSA id m7sm491793wmi.18.2019.08.12.23.09.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 23:09:24 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     linux-kernel@vger.kernel.org
Cc:     Denis Efremov <efremov@linux.com>, joe@perches.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH] MAINTAINERS: i2c mv64xxx: Update documentation path
Date:   Tue, 13 Aug 2019 09:09:13 +0300
Message-Id: <20190813060913.14722-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update MAINTAINERS record to reflect the file move
from i2c-mv64xxx.txt to marvell,mv64xxx-i2c.yaml.

Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: linux-i2c@vger.kernel.org
Fixes: f8bbde72ef44 ("dt-bindings: i2c: mv64xxx: Add YAML schemas")
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 87ac0378186c..590dcebe627f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7505,7 +7505,7 @@ I2C MV64XXX MARVELL AND ALLWINNER DRIVER
 M:	Gregory CLEMENT <gregory.clement@bootlin.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt
+F:	Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
 F:	drivers/i2c/busses/i2c-mv64xxx.c
 
 I2C OVER PARALLEL PORT
-- 
2.21.0

