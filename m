Return-Path: <linux-i2c+bounces-7332-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D6D999C52
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 07:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1857B2355F
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 05:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667D4209677;
	Fri, 11 Oct 2024 05:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ey9465Bx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C634B20966D;
	Fri, 11 Oct 2024 05:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728625978; cv=none; b=dZ+SOz/mkGgA/RnzGScyh8SO6JXc+Ch/P29a25ReC0v6fsSnPG5qAACwQDrl9d0QazB9gEbZHVxXWEM820enrcV/48zOLpGw4tSR82QMyKs/vADT6JqimWfm3LJCOTStP+4n21IK1m1ktn4fdTUvxc0bxHxUBUXZgNlbCxLNNA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728625978; c=relaxed/simple;
	bh=wTrTGsvHKaRi3isg1DxlJPE/oiDwQ/kN77hKZJke7Ro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=XD+XEadbJttkHZBb2mA+D+tI8c7PjSVrmihgbZ5mpiSyBBspY3KO9dIRu2m4MOcZNnd0i9T6OL0kqBemuwLhj+7JTk13KocfXNB3Fn0bkcsyv63auOSPjohzGYposUruxqXC4aNOSn5Gu6nsTBzcsWNZwCNheBKvt0ZXBXeBFAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ey9465Bx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-207115e3056so13507705ad.2;
        Thu, 10 Oct 2024 22:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728625976; x=1729230776; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=an4kJkObmODiz76Q4UVu1DA+oIFDSnR7hQ7Vqq3zxdA=;
        b=ey9465BxSENjozBJ71iFmgPCOKK8bAy3Vo6da5hWRwk7m5wQ703Vr4oUPi03/fKAEg
         DedqOj+hXeb6JEqj0Hm1Iyki3p6F/bGM+Ie19jkUzqcU06JQmuBpiNl4PSV1yOR+7HKR
         6AhwE4Y2TknXAxVhwZnJxgj8fUE1Cy1E9RIgDaHyLaUnGZXUVMk/dIzvtqe1fF1jlPDa
         QS+2r9tXvrQvBi5hv9qDWYel+bWazmM+wJnAZ7dyZq3QiBhq4YtxSE6TXm5wcVAcKV/Z
         hrIFW9SsmWlg9B7CEvfebM5gLjBzc/YfAGA+WTCBbfa3siGupFaEo+g6AHVe07vu8nVx
         4vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728625976; x=1729230776;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=an4kJkObmODiz76Q4UVu1DA+oIFDSnR7hQ7Vqq3zxdA=;
        b=TAGxdrcGznokrIuwjpCb5GUw7oB+jvDnDSnWC8BKfIJoJ9TX7IIT0t9ILsiEFUuy9B
         veT6oo0+oVU0XWrn5Btr/PVGdgYLK6akYfHpOl+6wRKoLSbp047DJCKmn+S/a+MZsUwL
         l6LrnQqrdzg17Sr7M/bnuqlPlbuUsSFWlsrEe4bK9u673oZ4lHUGBqPMUg3fT3LEVHl2
         p+XK/R2nSTH+SkkomiQx4FaV3wc3pXYlkbvj76M1eDfgl6pOQMgvj+i8k4GU9j+hB7XT
         HwTeQtJFsaXQXp56ZbwFQ1pd3IJMOZg7uZZtJwnq2RW3RTgq6kuWO0zIF37OMn47iV4U
         QD2w==
X-Forwarded-Encrypted: i=1; AJvYcCWTSC9CyV9ZtobMfGvbC3a9+EZG05Pijx7mTN7UAvTNQDVL8C529IVMeWDpM7/rP+eth6L7NQwv1EQ=@vger.kernel.org, AJvYcCWxiCdGzewkCeyZIqZa550+edXfnE9j3SA46jIWQz6JCjLgYJdn3I5akaNDLqiftqVUg/ek41abIxFfdZsb@vger.kernel.org
X-Gm-Message-State: AOJu0YylWTTPgDDZgw7mtRPckWtZFRfp2JWCB6lLEdES3DROsIdNhuPQ
	bbp3yAvcPlqeKYgB8zu7Yvgin80tIAfBCJNvFWK84Nxi2hG8Hdc=
X-Google-Smtp-Source: AGHT+IFtD2PAQaGCcS0aatXtbrM9Qrv/jGG0koL0ZE3kSwlOkv9I/91XaMLJiU2fAyxNUYLV22uZCw==
X-Received: by 2002:a17:903:2b07:b0:207:13a3:a896 with SMTP id d9443c01a7336-20ca1466468mr20257185ad.23.1728625975936;
        Thu, 10 Oct 2024 22:52:55 -0700 (PDT)
Received: from localhost (2001-b400-e38a-6880-f424-8486-7476-9f9d.emome-ip6.hinet.net. [2001:b400:e38a:6880:f424:8486:7476:9f9d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc13394sm17764775ad.108.2024.10.10.22.52.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 22:52:55 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Boyer <Charles.Boyer@fii-usa.com>,
	Vivekanand Veeracholan <vveerach@google.com>
Subject: [PATCH v6 4/4] i2c: npcm: Enable slave in eob interrupt
Date: Fri, 11 Oct 2024 13:52:31 +0800
Message-Id: <20241011055231.9826-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241011055231.9826-1-kfting@nuvoton.com>
References: <20241011055231.9826-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Charles Boyer <Charles.Boyer@fii-usa.com>

Nuvoton slave enable was in user space API call master_xfer, so it is
subject to delays from the OS scheduler. If the BMC is not enabled for
slave mode in time for master to send response, then it will NAK the
address match. Then the PLDM request timeout occurs.

If the slave enable is moved to the EOB interrupt service routine, then
the BMC can be ready in slave mode by the time it needs to receive a
response.

Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>
Signed-off-by: Vivekanand Veeracholan <vveerach@google.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index fcecb098298f..55348308b992 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1925,6 +1925,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
 		       ioread8(bus->reg + NPCM_I2CCST3)))) {
 		npcm_i2c_irq_handle_eob(bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/* reenable slave if it was enabled */
+		if (bus->slave)
+			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
+				 bus->reg + NPCM_I2CADDR1);
+#endif
 		return 0;
 	}
 
-- 
2.34.1


