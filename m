Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC67E8E4A2
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2019 07:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730064AbfHOF4s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Aug 2019 01:56:48 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41106 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfHOF4s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Aug 2019 01:56:48 -0400
Received: by mail-pf1-f195.google.com with SMTP id 196so834640pfz.8
        for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2019 22:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LMv7g9wXHCdpQzNDiezF7Zu3048t1TvKSMzmUt6Iaec=;
        b=Nbj7aAtSyq19UJsmQuc+Ex4Pi5NOVB8mnqUFmpwEm8eZ9pi5djFr4/bEE0w3WfaL9K
         hQ9uhKoXOKr60c2HjGyZ0ktcoCzT2DygcUJDSTnRqWY94Ksa+BCCDO1Y920mHFJG1I6z
         J4nY9X4tI1NiH7Qv8Ss6hsDPuOePW26QTHz3AImMkYQVWda0x25iA+i8X5mzbjQ16SxD
         fhAKhqB7/xzpY2Zscpmb/kHU4bp59TXVFfNwFpjGAUqwHofeYomV5KLaxr3BFn3K1FS2
         aRFUmpZ6cK10pm+Ee3ddQLK5Uv7IPd2AYTWEkYzwIZpW2HRYtEgS70wk6XedQCWDBbB5
         uIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LMv7g9wXHCdpQzNDiezF7Zu3048t1TvKSMzmUt6Iaec=;
        b=tqneql9X9NYA2oYerXGrZ+22eLMeB66k7vkSE95cFtNA3uKdgaxd0XJlLo17ICpAiW
         0S8KFO1qNmOoHusxxBNQ8bqFdshCiiHf2r5eSo4CKfz46rYUnH1Hi1VcVTpxyqkNHhFz
         vJrsKGXjtS6Ys7sRN4Diie+oaCN/QeOWyGuOyb4fX80uNtnNS9JoEEZqN0S/gBsJGIAA
         bXKXTKAtKeDWtuugBwYYU2iMEMglDzvxU6u08J/JE6XbOJnPHW1GtTdKLI13TfvloMM6
         LyfOZkQrjLC2w4bm0hRki4a0cXNmD6MsUMoqG+mYoSB7frc8hJHyvhFRM9IsaYCZSEDo
         1CnQ==
X-Gm-Message-State: APjAAAUB5nTp+PDy7QGcD0QhnU+HL6DG3mKnNOIez97QjxFTO4QkplV3
        ZXmIXSDaIJP0OH1LOJdzL7c=
X-Google-Smtp-Source: APXvYqzsBrzf5Xl1V4jlpLHO/SSF96Xl57QdQQXXo5hn6qm18ElxdHDbhvSpVTol70QI702+E6r+FA==
X-Received: by 2002:a17:90a:9b08:: with SMTP id f8mr771793pjp.103.1565848607504;
        Wed, 14 Aug 2019 22:56:47 -0700 (PDT)
Received: from localhost.localdomain ([110.225.3.176])
        by smtp.gmail.com with ESMTPSA id 185sm2225057pff.54.2019.08.14.22.56.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 22:56:47 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] i2c: iproc: Make bcm_iproc_i2c_quirks constant
Date:   Thu, 15 Aug 2019 11:25:50 +0530
Message-Id: <20190815055550.1588-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Static structure bcm_iproc_i2c_quirks, of type i2c_adapter_quirks, is
only used when being assigned to constant field quirks of a variable
having type i2c_adapter. Hence make bcm_iproc_i2c_quirks constant as
well to prevent it from unintended modification.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index d7fd76baec92..e9f0e5b6eadc 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -805,7 +805,7 @@ static struct i2c_algorithm bcm_iproc_algo = {
 	.unreg_slave = bcm_iproc_i2c_unreg_slave,
 };
 
-static struct i2c_adapter_quirks bcm_iproc_i2c_quirks = {
+static const struct i2c_adapter_quirks bcm_iproc_i2c_quirks = {
 	.max_read_len = M_RX_MAX_READ_LEN,
 };
 
-- 
2.19.1

