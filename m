Return-Path: <linux-i2c+bounces-10371-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B02A8A6E5
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CABE3BD6AB
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 18:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162B722128A;
	Tue, 15 Apr 2025 18:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSTblXXM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7AA22256C
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742156; cv=none; b=bROI/Uuw//rKCAIoe3C1zAz9ger6379IMoTcaW41BYSvJpuihoyOsJ8b28acojAspI+y7iCiplxpgj0+NxjcZayybxwvFR8dwKnly+YWkxcI4FmJbk3gbankIpn6NJAOv8Sp9EQQ+YmZdqm0lGqRQVXsefPLhwRJuxP96+w/rtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742156; c=relaxed/simple;
	bh=/tJ9D8GYIduoMXrjYR8EsTcRPQ1LwBvXEzL51rJUHj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvc5S+wgF0DL12vHvqUUDY63qn7ZlmSY6Z+kDYF2PyBvsmWaa83c+8H7MkvgmmLkBjJkaESftpEKU6iAf2Vw0s+xIPVY4HCV9zdHIaiuQU2NAbDMdv1MOEXG1+Jvn6GZ7pXAX1sStfR8MD0mgGjZKO+Qtl1Yct+pRDdQiRnJf8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSTblXXM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac29fd22163so945776266b.3
        for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 11:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742153; x=1745346953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTi67/6dmxqMBvEYnApsNKxoInxyPoaa+WYLOfehCLk=;
        b=FSTblXXM07tFbSaGu+xrUh52AGarQ5Tl/+3TavoWyfmXwn6UP4T/Lh8YkLgEnMD44g
         rscASHmON4AR/hT5u7czlxi9rTrA4V1d/6Ush2xksVqcqbp1i/NSd/xrXoqqHQJN740d
         wkou+op9ySLBzDXJOwsystF9sZidqAIh9nMe4EEgCi4JV+JEkXaFZXJiPWjbwjo7Gutd
         LjUD7gv1L37QM1lmaCXWIpPI2IL7GGr7/M+zcZgiPKzArPVFC0R0PkHyC4g5i/yEo9VM
         gZnwtq4VS/HJDTAXATQ2PJv/cu24MXJ9yz0ApmqchwOeXMjIVn7cMXAIo/eAia+4YgE8
         zXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742153; x=1745346953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTi67/6dmxqMBvEYnApsNKxoInxyPoaa+WYLOfehCLk=;
        b=sBjTjlfIYxeHXbyPNs4USVxXLAlsydIWBLguxGBE2mdXqXQuIL+JpP/uKBvEakb5SK
         eBh9cms2pzS1uth42vv7Grbj5VD972fTbua5vZMjiOvmRG1KTFwWgkFRqkAiL2eG48fT
         c3JxkHGWbWNSkb7lJnSMfTuA/32S4hiqJANItLP/khqRp+T5vSJ7OH5sxxrlSFjOhNiu
         Rejupz8o2TfFb8Xon8s0qpzN7wCKkeNSbcmxI5c5uQaAWUhgIQZeItXhTaQLGTxsra0I
         G2Fni/LR0QWElI2ITwU3vW8UOX7YNGoecW4GeOKM18sUo6LW5D5qrFNFJqV9vNX0eZQJ
         etDw==
X-Gm-Message-State: AOJu0Yw2Wk59tR6XgspKstpkJHfM7D2Yj35p7crdPqX3GBwYItmaav8M
	8+72VDcwGZj5gatumi7VSfMlVOBfLxP5UNZag4VGmh6MzyXbUfEo+96jHbN0QVE=
X-Gm-Gg: ASbGncvkbjURzfzJ49a/kseoNS3LqyxUS8tBwVansB5lWB+uoCNcjpeVS3VznzpL5L9
	3WW2GBCAcM7JM/VLvzh7R/rN2jIBX3uthVr9HQWy2uTiWCZsWDEeDa6ufUhsblhPArcf59l9vbH
	M4kuWIG1HNFzLMJz0XAgE1j1BI36HbJAD62mIW9Ul/c6KpRcQ2goTvk0FNSngiJfCFif7mtC0jd
	va48nh+LxO7rNeYVccHLjLkPsdE93p9xP4ceDKfSu8qj/iw7MeOQGWHcRY2ZNAQDiiEBr3vM9JO
	82EO33GKg149OAwbMRC43hTab4femuymhxODCWRXkm/o/ohHGTjcMyQov7zwZ8gEn4MCKRQ=
X-Google-Smtp-Source: AGHT+IFUYUEAp7a75i7XyWmMV2dJHpCM4Afodbb6OjiOcB8oLRw5NMd3jenRfO4s15xshVMtz+QO0g==
X-Received: by 2002:a17:907:9693:b0:ac3:f1dc:f3db with SMTP id a640c23a62f3a-acb3822b8fcmr10905766b.13.1744742153227;
        Tue, 15 Apr 2025 11:35:53 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-83.cgn.sunrise.net. [194.230.145.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1adsm1148844266b.145.2025.04.15.11.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:35:52 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 07/10] i2c: virtio: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 15 Apr 2025 20:34:44 +0200
Message-ID: <20250415183447.396277-8-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415183447.396277-1-e.zanda1@gmail.com>
References: <20250415183447.396277-1-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
---
 drivers/i2c/busses/i2c-virtio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index 2a351f961b89..9b05ff53d3d7 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -192,10 +192,9 @@ static int virtio_i2c_probe(struct virtio_device *vdev)
 	struct virtio_i2c *vi;
 	int ret;
 
-	if (!virtio_has_feature(vdev, VIRTIO_I2C_F_ZERO_LENGTH_REQUEST)) {
-		dev_err(&vdev->dev, "Zero-length request feature is mandatory\n");
-		return -EINVAL;
-	}
+	if (!virtio_has_feature(vdev, VIRTIO_I2C_F_ZERO_LENGTH_REQUEST))
+		return dev_err_probe(&vdev->dev, -EINVAL,
+				     "Zero-length request feature is mandatory\n");
 
 	vi = devm_kzalloc(&vdev->dev, sizeof(*vi), GFP_KERNEL);
 	if (!vi)
-- 
2.43.0


