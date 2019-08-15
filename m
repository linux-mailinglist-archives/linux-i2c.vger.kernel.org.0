Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19C0E8E4A9
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2019 07:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfHOF7K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Aug 2019 01:59:10 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37427 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbfHOF7K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Aug 2019 01:59:10 -0400
Received: by mail-pf1-f194.google.com with SMTP id 129so849526pfa.4;
        Wed, 14 Aug 2019 22:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wIN/3e7DmCq2KFrr2GT8E+NTKTLGporkmHFbvr6BdEw=;
        b=ltx3L04WJuOQgF1LYju3dlRn4Cyjnm4+zW2PdzjSOCef1GRhhmpg5YB9ot7HJ0qAX2
         v5UPvV4kcgPEkdP2QisSksYt35mUkjT0ap+xbT+++wFbuXd3iLCedKgZLoMhncCYykx8
         qLi8S9OScvOEQw2uQ3ckPj+nZChss+Sa7PSgOfmWibcvWr65mWWd4Khz7J1FnIr6ZWt3
         NMRusJXN/zBwQpXL3hNc55bSpvg3UUN+AzhQ89RiYQGYL5UwixAHZmbz5i/PPgvdwKBU
         xAr6jneyWsGHPHAfQG5GqDTvgjC3Y7NKMahmlEMwdQEJtj6UuCaMZW27wJ7uOiRua90r
         VYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wIN/3e7DmCq2KFrr2GT8E+NTKTLGporkmHFbvr6BdEw=;
        b=KaiIG0Ip7mJBQ+F9nxLavwRGlxW8SZKuesMBZJu7UhMm7iOQuuOLZDeMMYB1c2fPDQ
         /xNCq0P3lyR11Jia8Weq2MC4Ys6XkNnV6crfAYSIwzg4cHFJQveVvMsl9zZeWJNJAeV0
         i2E6cPtDT7KLrBEPuyckf2oq1TYdIr53nLj3rXwHRNQuBdYjW3oZBdm6hMhaAu4gb4hy
         Ydk6FesRz6KLWuz502Ryi358cYv7isjfWdHy6iIQTvvlNQSUEeGRf4eEZxZyHGSeXNXI
         NkhcFOhByiG+faTFGDLKQdsrYnaVuFB1Je4uUXVuA5VUntOSOgAlKbsG66vebDZxWBZG
         UjcQ==
X-Gm-Message-State: APjAAAXlw7aONWVAEG+7I5UNHOr2m9ES60wL4J/dCmOXHGNwMhLsFSNO
        HptLUDkvLuqvTakb2ZQ7G/A=
X-Google-Smtp-Source: APXvYqwPn7IfU6NrEFx18uQV6dXjBy9Te4NIGALiRj5uKRtJOZxdgllt72zHYP3InxW6dokx9buRiA==
X-Received: by 2002:a63:e48:: with SMTP id 8mr2211940pgo.389.1565848749290;
        Wed, 14 Aug 2019 22:59:09 -0700 (PDT)
Received: from localhost.localdomain ([110.225.3.176])
        by smtp.gmail.com with ESMTPSA id e7sm1760010pfn.72.2019.08.14.22.59.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 22:59:08 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] i2c: stm32f7: Make structure stm32f7_i2c_algo constant
Date:   Thu, 15 Aug 2019 11:28:57 +0530
Message-Id: <20190815055857.1944-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Static structure stm32f7_i2c_algo, of type i2c_algorithm, is used only
when it is assigned to constant field algo of a variable having type
i2c_adapter. As stm32f7_i2c_algo is therefore never modified, make it
const as well to protect it from unintended modification.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 266d1c269b83..d36cf08461f7 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1809,7 +1809,7 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
 		I2C_FUNC_SMBUS_I2C_BLOCK;
 }
 
-static struct i2c_algorithm stm32f7_i2c_algo = {
+static const struct i2c_algorithm stm32f7_i2c_algo = {
 	.master_xfer = stm32f7_i2c_xfer,
 	.smbus_xfer = stm32f7_i2c_smbus_xfer,
 	.functionality = stm32f7_i2c_func,
-- 
2.19.1

