Return-Path: <linux-i2c+bounces-981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C694081D62E
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 20:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 243BA282E10
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 19:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965E520320;
	Sat, 23 Dec 2023 19:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yd1OQr+z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2630320310;
	Sat, 23 Dec 2023 19:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-28beb1d946fso2274869a91.0;
        Sat, 23 Dec 2023 11:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703358723; x=1703963523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y4pzyN944tMgsUdo0/fVxnKFBqDFkjcWL3Qdyx8hsEE=;
        b=Yd1OQr+zLXa736p2ufHsm2fEA/2bIVekzSfRy7kS94Ur1bA4Qg/PZRYat3r+JuqFGm
         hnZfNU4VJhfVuJ8uzFwlrdlEWUDJ7w4DJ0xr0ATTLqD102/trE1mOI2wQhfEk1V94KiD
         zS/7hqZQmvtxFYOdxvflZovqe5q9dp1cZ4utElQNLVU6xZloRw3DYDK0utD2PTWeTDFe
         AiDovetVX52XtKd3Iwd0CuyFwIe9TALzRsRPCRoY9JfSaZOKFvxas0MH1Vub17BOYvnv
         NeEtVIG7Om+Bd72X6tesOHgdfDTwYUlczxeWj+SUxvnpfViVMF91KaDDxT9VlUhBh5xc
         9lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703358723; x=1703963523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4pzyN944tMgsUdo0/fVxnKFBqDFkjcWL3Qdyx8hsEE=;
        b=OLI/fnRqoGXYM5ZhusVDO2ahJNP5ekLXEy6HKu0HsQMxUDmzEgWEwzPf6fnyklTjg+
         zrwVW2YRqMlnRnsBc07YIP3gwvIXonMhb41YAKWjIkDC8ovPmv7/b7NunMc3LrgXcW6g
         3K6qPbu0KhLXQJrq9dq7FawcI09kzc6nvdcw89UXOa9rE8oIA+hGB8iukgd7y0sQn+JF
         OgUgCnSEWtG9CQ6SQI6OIv+jM0v4Ii4ucLKUBYsnrmU/1fDPKgRYxrcR51wOVaKHN4JX
         llC0E4yyU2ux66PUB+kts0yRzsr/P05eMxL0XHSyptAsBl8/KTgRSXKVAUL+fxgfvqRi
         gv9Q==
X-Gm-Message-State: AOJu0Yxscdr5e0ofqUUjiUKROQDaE31CiIEdODcAiqHjKxCqE+3t8165
	ouDobmv+l+uKt+mRlnXR7Ak=
X-Google-Smtp-Source: AGHT+IHmixcKdl0lA1Ct/3u5qYBe7W7f24qTu04G3SA9qn6gkHBjIm/NQWD4XmcTgRUhkN9e/lbYvw==
X-Received: by 2002:a17:902:f7c1:b0:1d3:5fc4:f4cc with SMTP id h1-20020a170902f7c100b001d35fc4f4ccmr3523921plw.29.1703358723287;
        Sat, 23 Dec 2023 11:12:03 -0800 (PST)
Received: from attreyee-HP-Pavilion-Laptop-14-ec0xxx.. ([27.5.150.118])
        by smtp.gmail.com with ESMTPSA id m5-20020a170902db8500b001d04c097d32sm5402100pld.270.2023.12.23.11.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 11:12:02 -0800 (PST)
From: attreyee-muk <tintinm2017@gmail.com>
To: wsa@kernel.org
Cc: attreyee-muk <tintinm2017@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/i2c: fix spelling error in i2c-address-translators i2c-address-translators
Date: Sun, 24 Dec 2023 00:38:53 +0530
Message-Id: <20231223190852.27108-1-tintinm2017@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct to "stretched" from "streched" in "keeps clock streched on bus A
waiting for reply"

Signed-off-by: Attreyee Mukherjee <tintinm2017@gmail.com>
---
 Documentation/i2c/i2c-address-translators.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/i2c-address-translators.rst b/Documentation/i2c/i2c-address-translators.rst
index b22ce9f41ecf..6845c114e472 100644
--- a/Documentation/i2c/i2c-address-translators.rst
+++ b/Documentation/i2c/i2c-address-translators.rst
@@ -71,7 +71,7 @@ Transaction:
  - Physical I2C transaction on bus A, slave address 0x20
  - ATR chip detects transaction on address 0x20, finds it in table,
    propagates transaction on bus B with address translated to 0x10,
-   keeps clock streched on bus A waiting for reply
+   keeps clock stretched on bus A waiting for reply
  - Slave X chip (on bus B) detects transaction at its own physical
    address 0x10 and replies normally
  - ATR chip stops clock stretching and forwards reply on bus A,
-- 
2.34.1


