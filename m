Return-Path: <linux-i2c+bounces-9573-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6536DA43DF4
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7402E19C7C0F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B02C268C77;
	Tue, 25 Feb 2025 11:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGQn/djF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6E8268C42;
	Tue, 25 Feb 2025 11:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483600; cv=none; b=raWg/gBZr5tJJtNys42jare95iiUNAExW/ly7vPWD4lsw6LU0qTxEoO9C8mbpnk54mOVhnXMcJ/kTaQi8q9dK/9mvnyDW8FzGbRH2ZRisnhlsJ7LdoDeI5xflcish33opGOPTpDKaLmR6ze+hFNJAMCyzPvBiZiuQt1epr7i270=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483600; c=relaxed/simple;
	bh=FH5pABemfdyBTd81fPkLUCkcaMB13Gtpt950QuGWACU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPMi/ujhJ1My3x2dHrf55cGwtozWPduD2DTZ0Es7RK6nGIIUPLNbdFI+feVn7HSD+1zn0gdcSiqXIHKPC/uu4XlVzzXaFQs/TN0KQhk6T/64kCois0OUxLiZOH4mSkk61T3U/L9iTEuRJBW1XCe8KYFvhthfOf8Bli2O8o+hcNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGQn/djF; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so8477274a12.0;
        Tue, 25 Feb 2025 03:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740483597; x=1741088397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHavu49N7UrC0j4N/STFuWdZClinsRdO2TF0wU7/E3g=;
        b=kGQn/djFP1XPsIETaAOLauVrSHHg2VHdtyRf5dbHe/O31RCN7vcfInwXcynbhiC8zi
         FYOmR+85LMUUZomgNk0Reu6VlwMZ2UrHqgih84o+qT5582nyDOZ1r/0Nfl1T89ybplGU
         CnTy5tjmTVVXTqOzOCNjTXoeC07lPRP9To9YJd0apeoPIzNoR40K8pViQQ/4mNkVzXxz
         Q/3dniCunN71ZO4aMeEgB2SPQoU/zaKkmcGC/ChQUPvxDwKzS1dmREIP0dBwcXmpRP7q
         XE4/KkQsyYpQKTp25NWJ7OlAnXW0vwj+B3AmviB90mSfcdNG2px3ezKPH8HWlGINDyJJ
         mFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483597; x=1741088397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHavu49N7UrC0j4N/STFuWdZClinsRdO2TF0wU7/E3g=;
        b=uMxB75QdyizbVJRDcqzslgQTVN2OVDHx1NeJw6UyP0THuDncCr+TYft9s6i3byXGmp
         AkpqCOHcIV1lujSc/c/t9GL+Yd5ufoWaEuFZSVk+EcDL+eoYEFTdPtVwza9vL4IqiJ4x
         5J+QpbdtWxZKISCfqXtUzrF/XPaqoLBk1QaeZ9ziZbbA6KzTmLitNbjX/iisfJgiw3wL
         mTBgJmobVjIWOpIDSWYzAZWypSjRXX4cVadObqLq1ReYVYWiw12lnQtQmSxaxOXmhcIM
         GyXhScdUgbb8dUQV2Zeh13FLHg7g/uHzpxMQZAzU79VwfZq8q13Jb40WCFCJQtdrFBiW
         paXw==
X-Forwarded-Encrypted: i=1; AJvYcCVDuSzzI86OMqxMnndMlRumPRAf8jwKjy4OdX+rnpGupk1TFq92MNL4XNa0v+GUwkTMdBwG9Dz4194=@vger.kernel.org, AJvYcCWGbj+mKT+IovdhVigibYq6Evv4iXNEoDOVdBsNvpFjPSoamH/JnMUgDJOijt2JQLEP6OA+MRtrxU+Po8Fk@vger.kernel.org
X-Gm-Message-State: AOJu0YyKPzNFsT+HnXlVfesUpKIpjq8jfA2KOcPHchivk5q8/+ddWNsd
	SnxRyGKkKOAJ4tcxAP+NANcznY6Q4JVBU3VKB5kK61aVNG6lomAS
X-Gm-Gg: ASbGncsNKMdahSgLOlcHmfO7vg0bWACgTxlgmDD6tOSnx00jtVTXO8qR9O0p7Fm3ydr
	SHb9SsKZ1/LucsDV644ef0dVq4LAZVeRN+h72AvJTC/kc6RmtFe2kj/yNurEdyK8pXA7uNuu4em
	ARZ1NMnF/4XLucSltbzt+QqOUPE/W+/lKgIW6NJaVyq71c3MTru2L0nbFbsIGMLYr7hOuEfS8az
	W2asWul+HQfSqr3xzYDS4leLPI3VI9M/Nl5cIri6bcs6CZOmNeOBBF8tA2VFgYEeBjvNY9aF0pv
	atdnPLZXG1wsxhQxfccoLRZk5JIyC474URl9XUM=
X-Google-Smtp-Source: AGHT+IGkBLXTNXrNxdESWi9oEK4A+zL2ej0qhVSYmjq4CJmFZxPOFwAIz0IQBFMzAmvz5M9odyi81Q==
X-Received: by 2002:a17:907:6d27:b0:ab7:e567:4fe8 with SMTP id a640c23a62f3a-abed0d60b6fmr301892766b.25.1740483596798;
        Tue, 25 Feb 2025 03:39:56 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201231dsm125510166b.115.2025.02.25.03.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:39:56 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 7/9] i2c: atr: allow replacing mappings in attach_addr()
Date: Tue, 25 Feb 2025 13:39:35 +0200
Message-ID: <20250225113939.49811-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225113939.49811-1-demonsingur@gmail.com>
References: <20250225113939.49811-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible for aliases to be exhausted while we are still attaching
children.

Allow replacing mapping on attach by calling
i2c_atr_replace_mapping_by_addr() if i2c_atr_create_mapping_by_addr()
fails.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 5b53eaee0408..d8748d71ae15 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -543,6 +543,9 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 	mutex_lock(&chan->alias_pairs_lock);
 
 	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
+	if (!c2a)
+		c2a = i2c_atr_replace_mapping_by_addr(chan, addr);
+
 	if (!c2a) {
 		dev_err(atr->dev, "failed to find a free alias\n");
 		ret = -EBUSY;
-- 
2.48.1


