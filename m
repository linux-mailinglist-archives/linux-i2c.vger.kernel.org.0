Return-Path: <linux-i2c+bounces-8126-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B16B79D53B0
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 20:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A8D42815A5
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 19:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951C21D63D5;
	Thu, 21 Nov 2024 19:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GUPxfl1z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3881C9B68
	for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2024 19:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732219094; cv=none; b=byMXzxk98qKCkDLwYHAh2BiadvfGWi8r/+IBrMDqPEffkB3jB4Q7Mv3PGcnzCK9wr2/k9FyUy7yONGChsmN2lu2oimpO3VZgzw8m9KagTsTQ+8cRvKeolsivaywH/AvEURGtAVJQMXsYF784fySYwMloFIC9JBBCu9JHb7RtEUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732219094; c=relaxed/simple;
	bh=Ci5rgaKMcbABvz0Hq2okBdlgbreLxrd9dmDVHdg4jHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F0irK8u+RJVj/bQclQbECseOldI442HUGJeysk9DlYUVmiCId+mfgCcibbNeFm0fW56YinuZ/cg/wxav/cHmNPTOcHeNuiDLQlVHnf8RIyIijL6kphKvHR4QK3JFtv4wEcuVcfr+a5t33py9klJlLuXGD2SFOGxkrD9BpD/yViY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GUPxfl1z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732219091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=juFFITBwgxbTeEGzKvrIeAZUrlzxGf1mZ1vezYeX2J0=;
	b=GUPxfl1zuiFQr15cdNjC2JcEg7ucj1QPWLVr6zskV5gW2o3WCU4o9BJqCUNYoRkjPb4jQg
	/uPEyLqALQ5/3ph+4wwKDhNt6T5nw8tHNrp205jT7/2yL1lqhZRlR/+VYGKIfnb1RI03Yz
	NwIg7OnSV9K9XcbpsRiiKNn4NadwJu0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-0m4g3IDvPyOPHRFPcdl2WA-1; Thu, 21 Nov 2024 14:58:08 -0500
X-MC-Unique: 0m4g3IDvPyOPHRFPcdl2WA-1
X-Mimecast-MFC-AGG-ID: 0m4g3IDvPyOPHRFPcdl2WA
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ff13df3766so10579121fa.3
        for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2024 11:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732219086; x=1732823886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juFFITBwgxbTeEGzKvrIeAZUrlzxGf1mZ1vezYeX2J0=;
        b=sWpChuY/DWDsRqNT7RXV/c6NaTg5xbRAEihljiFAQQsilQEnz0TfIGMtjFnpNBgBsA
         djaCe8FRiVDy0qIy5vu8FzdVc6HOMU+QabGz5OYZk5kUPoAQWkcyyxp+xczkTQHvExY2
         qX51s1SE9qieeq9bm6v1E3KIBqCzIJSA/I1eNwZR5aJ1iGOaNitesZf/7hQmROpqpRst
         AcHVCnaPIyNh3J+1bOUEoBqp4QyLhoQ5ulT5BcwEmNys803oYYZfxD7Fj+WCEDyhsPbr
         Fn44gR/J3z46R+EFjkQP8U+8UP+INGannzJR8VUVFK3pS/wsADd3AHJllW0FBrkf+kxY
         7xxA==
X-Gm-Message-State: AOJu0Yy4inRSbOQz7cadJsiPaRRBro2ueM02dnIu473QaQOOCEe1+Ihj
	i40RiZrlcJYTHjdC1LZ8HuNiiyQPYKjH3n1vVNlu8j7RTnIOrmlT027K5eHrabne8qS9zQyOedW
	q9ruEV76TNNE9bsp+DiaT0KxADVZIuO4lFvB21xZklsxFTWYhqJNu1UgHQj4fnzIMyA==
X-Gm-Gg: ASbGncvdnn1gSFukd9pwsDMotmprqHyLDH6rFE8DVNLgKBHhs2lgtOU2iXeL6jJMAyG
	pBtq/EBaIqTW5rkMFjCl7uDFgqogILRZxSdMbDEAumq1zBB+tkzoRvqJevcvwJKK2GIXH/bgZ33
	SkKNaESsJhWQNvKaLmWkVysPGjh4mTSIIUf/rBSZLj+C4cXWrO5GNftRO1GgcT30lZtekxQui99
	oBp+2199aHqPrdJ5dbNLqg6adBlIdSH7cKBEy1rbOkpsnnM87aABNK2m32/Elc=
X-Received: by 2002:a05:651c:2106:b0:2fa:c014:4b6b with SMTP id 38308e7fff4ca-2ff8dcfeeeamr43367241fa.41.1732219086563;
        Thu, 21 Nov 2024 11:58:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHld/7g4KDxVVzct+EU5FiZIyFo1DaNYX143LVFTQdBZBW+2hhFCe7EG9OaPHgNPlxajfp9pg==
X-Received: by 2002:a05:651c:2106:b0:2fa:c014:4b6b with SMTP id 38308e7fff4ca-2ff8dcfeeeamr43367091fa.41.1732219086170;
        Thu, 21 Nov 2024 11:58:06 -0800 (PST)
Received: from eisenberg.fritz.box ([2001:16b8:3db7:3400:37d7:1f36:6e6a:3d66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d401f64sm119592a12.70.2024.11.21.11.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 11:58:05 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH] i2c: i801: Remove unnecessary PCI function call
Date: Thu, 21 Nov 2024 20:56:25 +0100
Message-ID: <20241121195624.144839-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the changes in

	commit f748a07a0b64 ("PCI: Remove legacy pcim_release()")

all pcim_enable_device() does is set up a callback that disables the
device from being disabled from driver detach. The function
pcim_pin_device() prevents said disabling. pcim_enable_device(),
therefore, sets up an action that is removed immediately afterwards by
pcim_pin_device().

Replace pcim_enable_device() with pci_enable_device() and remove the
unnecessary call to pcim_pin_device().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/i2c/busses/i2c-i801.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 299fe9d3afab..514d3f8277cf 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1676,13 +1676,16 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (!(priv->features & FEATURE_BLOCK_BUFFER))
 		priv->features &= ~FEATURE_BLOCK_PROC;
 
-	err = pcim_enable_device(dev);
+	/*
+	 * Do not call pcim_enable_device(), because the device has to remain
+	 * enabled on driver detach. See i801_remove() for the reasoning.
+	 */
+	err = pci_enable_device(dev);
 	if (err) {
 		dev_err(&dev->dev, "Failed to enable SMBus PCI device (%d)\n",
 			err);
 		return err;
 	}
-	pcim_pin_device(dev);
 
 	/* Determine the address of the SMBus area */
 	priv->smba = pci_resource_start(dev, SMBBAR);
-- 
2.47.0


