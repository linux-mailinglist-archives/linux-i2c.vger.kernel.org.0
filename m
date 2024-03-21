Return-Path: <linux-i2c+bounces-2469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D380885A8C
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 15:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 176C9281754
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 14:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE5084FC3;
	Thu, 21 Mar 2024 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DmWwiZe/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D9F85264
	for <linux-i2c@vger.kernel.org>; Thu, 21 Mar 2024 14:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711030786; cv=none; b=N7weIshhoUoec2n7Or8dQ2kBMyCM6tKxr97ZwdbdN6SI0RNPeg+4QOyZhBKoIeJ59GSP9/OTAu6426v95KX/DGI7t4tNWfqJOs1l+CRRFI+zGlEu4JZO3gWARPoObGBkzuvH+3wv8isjZPvBAWBYBCCESonb/sikfyWooLEkLrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711030786; c=relaxed/simple;
	bh=E42ll9dERYQeDCitci5NhXmUs/W94JnbCK8poS4Ofx4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BPSsZbElZEPPznC2S6nOOabIYkxG3rU3gSo3uHlZ4BqJbdItjh+fTmNCA/G9QLTsrQMzDOj/BtH2dvPS6huA8yTg+GadAfFxkJ348mHLCOeZ8ZREnrY0Rls1DcWbePVPSeE7BlhUSGQjRvHo/apuclndUZ8M/ofmKr5jgvoOFSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DmWwiZe/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711030783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eqo+fR/qcUeO6cSXAqMCj6s8RG+XUPe+vPrRfJcqycY=;
	b=DmWwiZe/sNVx493aXCxgGi6uHBgbxqBEN56upcLzob/w8WkjWSKRHJP6FTbRXKrtRTajOc
	IgF2X6pENE0P6geX94V1SGmKJ+I/PHTJ3ZaaaYBdwMP/EjGltiSQqur0fqPECLNjpPgv0o
	Wlpp2OnjuJW8kSL17iHp5+ab5+MG1VM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447--R_GO4aHOrWVblsLQcqPuQ-1; Thu,
 21 Mar 2024 10:19:40 -0400
X-MC-Unique: -R_GO4aHOrWVblsLQcqPuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E59A53801FFF;
	Thu, 21 Mar 2024 14:19:39 +0000 (UTC)
Received: from intellaptop.redhat.com (unknown [10.22.32.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9762F3C54;
	Thu, 21 Mar 2024 14:19:39 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-i2c@vger.kernel.org,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH] i2c: i801: Fix a refactoring that broke a touchpad on Lenovo P1
Date: Thu, 21 Mar 2024 10:19:19 -0400
Message-Id: <20240321141919.26844-1-mlevitsk@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Commit 857cc04cdf50 ("i2c: i801: Add helper i801_get_block_len")
introduced a slight functional change: the status variable is now
overwritten with the length of an SMBUS tranasaction,
even in case of success.

This breaks the touchpad on at least my Lenovo P1:

rmi4_physical rmi4-00: Read PDT entry at 0x00e9 failed, code: -6.
rmi4_physical rmi4-00: RMI initial reset failed! Continuing in spite of this.
rmi4_physical rmi4-00: Read PDT entry at 0x00e9 failed, code: -6.
rmi4_physical rmi4-00: IRQ counting failed with code -6.

Fixes: 857cc04cdf50 ("i2c: i801: Add helper i801_get_block_len")

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 drivers/i2c/busses/i2c-i801.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a6861660cb8c..79870dd7a014 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -536,11 +536,12 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 
 	if (read_write == I2C_SMBUS_READ ||
 	    command == I2C_SMBUS_BLOCK_PROC_CALL) {
-		status = i801_get_block_len(priv);
-		if (status < 0)
+		len = i801_get_block_len(priv);
+		if (len < 0) {
+			status = len;
 			goto out;
+		}
 
-		len = status;
 		data->block[0] = len;
 		inb_p(SMBHSTCNT(priv));	/* reset the data buffer index */
 		for (i = 0; i < len; i++)
-- 
2.40.1


