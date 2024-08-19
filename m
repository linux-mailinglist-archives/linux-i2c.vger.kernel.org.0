Return-Path: <linux-i2c+bounces-5554-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3969575E8
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9902B22917
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976D3156C5F;
	Mon, 19 Aug 2024 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="T3YlUx+t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB68515E96
	for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 20:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724100705; cv=none; b=YWw92ceGQIkYCg0mB7SQ+3pEpw7v/y0KFzwiJMFCOoHU8ml9zhDriEXyzrQvHwplBcQLoZz3XlnUBLwddTYr/hohz4f3lPl+s5OaM2930lVc4x/Mc2PsXKc+u3sMRy9p79bzK8WYnw1i0rsZUZXPcdGd46H+QPtq1L8GLJvbJzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724100705; c=relaxed/simple;
	bh=7papm/ncz5DtBVkXWxuPDjMAnp2JHZupr9tn5JLb3Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r0fSrplgCl/hDdkZOLLUvv+ZsEyOnZ2gMTZZhW3zhw080oQZ/RuxRzkbKb2gJYFj5heZg8X9XMgFGtzyf92gamxTdM7YPsQixDTrA+8bX/81FTDKKV3UasCQJDx/xqMcUzXJ/ib9sCAndLOSKmpXvWpRer//DNgDEwYljt4cWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=T3YlUx+t; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2021aeee5e4so13085285ad.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 13:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1724100703; x=1724705503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2G0BlDQX2BP5LrBSVzTu3lq9EROMDDvEST6/TJJP3fo=;
        b=T3YlUx+tuPCHL3qTn968oTWGN5y3FpCXWamE5vCZLNpe4/7Q1n3vt9eLiBxwJ9/z8L
         s7ioC9L1Q2dwofq/JhjIWnsVHYWHlZqD/3QmzCebi2jTLJBR8Sr3CzsOuLE+cJB0OH5f
         dMxAeCMNTauRMWBWOD4v/enj7+5QEP0hxPObZMOWCWbdPj055jD5bX57+QtgXmIwaBAW
         jpvR9W9hlYjNJuyffC3TtmQVoNgka+PIiCG++xd55oj+Kl5ozDPHCrGeXcBEEuLzTxTl
         S7DCv6no9CL0F1hSuQ2d4fA8nicO59uJcPPts8kCjuP2/87PJilGPJaGPF/ta2LCYAnH
         fiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724100703; x=1724705503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2G0BlDQX2BP5LrBSVzTu3lq9EROMDDvEST6/TJJP3fo=;
        b=cTBbWhNPD4xSwQsA0ZYbuLqwl3y/r7Mw57+WclkrJUspBvHUSZHYJnayDx/TFEiNEk
         3cPczXrk8n+Murvh8sSR7SRS5gMeIqXtdCHvz4E1mtq6UTZtKUBRT0l30PJHAXysR32M
         RldhhR7GerAMOC6dolv1chLfqOlUYccNl5Sg1xHVtySdUq6fA/83HKOtJVl69NxtmjG2
         eCIpxevacaN3iOXvk/exB2qo9T+852DTzt4xlp2gc+D2u0JsH6FtG3OKNylST5fYH8Io
         7QK3QjeoxIYsqBqRJJAfwaUATr7EiF29akNqcvKhZDDt3UXcEWrzZMe3bNFgF+G/PFVA
         0cdg==
X-Forwarded-Encrypted: i=1; AJvYcCUfL3mh9SKjEsVM8RQhWH8RgS6Jp/YHiTAgoYrLSV9PLOCNc4lNdl+RZ9zEBv/81miQsgiYhTW1U+upUA1LgtrEYObOfXAG3UPZ
X-Gm-Message-State: AOJu0YyMt0W4QjngwA5iOhZXx3/Ml6UFxmEM8qPMRf7asJGYkJehlOFL
	+JPiJ2I4ifMf+bMJ7TWecdbx/HgokJtya9DOozf/3ABeqOwmjyfXRHVDdQXQAA==
X-Google-Smtp-Source: AGHT+IFrFHCSqWHcu4Z8LDTRZvobn1L1Rvr4vbhhohOOJ0K9ILHv9DA+m26gbXUkQGlIbbzwJ83AuA==
X-Received: by 2002:a17:902:e84b:b0:202:18de:b419 with SMTP id d9443c01a7336-20218deb7a8mr88897145ad.63.1724100702925;
        Mon, 19 Aug 2024 13:51:42 -0700 (PDT)
Received: from localhost.localdomain ([2604:3d08:7780:1ca9:d173:3faf:522f:33b9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f039ef11sm66606405ad.248.2024.08.19.13.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 13:51:42 -0700 (PDT)
From: Vasily Khoruzhick <vasilykh@arista.com>
To: Seth Heasley <seth.heasley@intel.com>,
	Neil Horman <nhorman@tuxdriver.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: Vasily Khoruzhick <vasilykh@arista.com>
Subject: [PATCH] i2c: ismt: kill transaction in hardware on timeout
Date: Mon, 19 Aug 2024 13:51:04 -0700
Message-ID: <20240819205125.92358-1-vasilykh@arista.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Intel Denverton SoC ismt controller may enter weird state when
transaction gets stuck. It times out in the driver, but unless
transaction is explicitly killed in the controller, it won't be able to
perform new transactions anymore.

The issue is extremely difficult to reproduce and may take weeks of non-
stop smbus traffic.

Numerous hours with logic analyzer didn't yield any useful results, it
looks like the controller stops toggling SCK line, i.e. the issue is
likely in the controller, since device doesn't do clock stretching, so
nothing is driving SCK except the host.

Explicitly kill transaction on timeout to recover the controller from
this state.

Signed-off-by: Vasily Khoruzhick <vasilykh@arista.com>
---
 drivers/i2c/busses/i2c-ismt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index 655b5d851c48..c93c02aa6ac8 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -381,6 +381,15 @@ static int ismt_process_desc(const struct ismt_desc *desc,
 	return -EIO;
 }
 
+/**
+ * ismt_kill_transaction() - kill current transaction
+ * @priv: iSMT private data
+ */
+static void ismt_kill_transaction(struct ismt_priv *priv)
+{
+	writel(ISMT_GCTRL_KILL, priv->smba + ISMT_GR_GCTRL);
+}
+
 /**
  * ismt_access() - process an SMBus command
  * @adap: the i2c host adapter
@@ -623,6 +632,7 @@ static int ismt_access(struct i2c_adapter *adap, u16 addr,
 		dma_unmap_single(dev, dma_addr, dma_size, dma_direction);
 
 	if (unlikely(!time_left)) {
+		ismt_kill_transaction(priv);
 		ret = -ETIMEDOUT;
 		goto out;
 	}
-- 
2.46.0


