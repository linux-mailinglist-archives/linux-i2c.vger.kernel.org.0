Return-Path: <linux-i2c+bounces-1859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E42CA85A396
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 13:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B1E81F2142F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Feb 2024 12:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DB62E834;
	Mon, 19 Feb 2024 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="YA5tGM3r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF92E832;
	Mon, 19 Feb 2024 12:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708346286; cv=none; b=teJgpTgs9WysG8wnSsBlxsayi1u00rBmiaWIyHD/nhY21gTginflizjiu5N15SZWuaoR0DODr+Is7BSCBPP2mZtGG4fhg+pHvpngUae48ZgjU837r6PbDwe3qlRcU7pMOnmbFe+id2u/nfVPKyCx49gTVVFT7bxvKv7gMm+iL74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708346286; c=relaxed/simple;
	bh=6/81RtxYBimTDWQThH/Y5fPpJCQlgo9epDoNinWZNu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O9RDynnzRr9Y+jBA5KAB1qxfjygVDfcqWudYhUs4pjYiJhFU/6VH1/817Gq6PCKF31iCJppMn/9SSDcZJJthcqVgQrl75/e/R9rMdrCMtTBf3zNRceW5j34XuURGMkQ7vNlUpab34ZjJqYPN+3F6HBgpEFQ3E9nFV2//grPQwyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=YA5tGM3r; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1da0cd9c0e5so38549245ad.0;
        Mon, 19 Feb 2024 04:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708346284; x=1708951084;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMHtbRDXeAYpdr62NPPyFG8YmPyz8fxfbQ4i+nYhDHU=;
        b=SB8Pb3Q2l8ZblSF2dOfzpSCwPLhSyRxCpS8czh087itg3DV5jgZ5YwctZ/PZlu5vMS
         8Caksxf3/GHvGb502ReKXCu9DpYL104gkmOeb5ASmh7r+AdvP9OIW9KS2UYmzbDh4NjH
         OLA3n23LVHC4/Vfaw71lp+SSu03hk0UoSfXhgayKzPhTXMNZ2gv/JvVQfJav/50W6D5j
         Uy8B+1ZjFMDQMyrF8cX4p4E+C9vBDq7zaFbSf25OdfPdxSNv76PPcXfkU+gqBqDSP3vP
         DyA8ejoZ3u73cHy7Sf91asrLv4mvbW7vMD+Ik01yGu7s/zddgd7vNxJtZy/CmrqTzWts
         g+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMn3qqA6/o+vOSgqBn+uDF5FnllH0pHVle65LZUQl04URveT85BPR8XCysOq7xgnRmudQHiT7WEEmcjeHUuXDXt1JZJ8+Pu9I6WvhE
X-Gm-Message-State: AOJu0Yw6UspO03PzM+M0OWIpvvJ0WHe9CmTxXpIAwV3fBvS8Ksk+AjSk
	sUiPxxnHvl0+HvKC1xA9TrPwmxFlPDjO/Z1/HTCQ3lUinqA71ii+EKWkeTyfbKFqjg==
X-Google-Smtp-Source: AGHT+IH6zq27iEs4PnVeIJhhXLzSSSGRm1DwoUMnzhtFBw/uyKrFV6MpAKf7rDeuLBC1QTD7P+WTvA==
X-Received: by 2002:a17:903:1209:b0:1d9:907f:636d with SMTP id l9-20020a170903120900b001d9907f636dmr24035241plh.10.1708346283986;
        Mon, 19 Feb 2024 04:38:03 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902ee5300b001d91b80876dsm4278250plo.245.2024.02.19.04.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:38:03 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1708346282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PMHtbRDXeAYpdr62NPPyFG8YmPyz8fxfbQ4i+nYhDHU=;
	b=YA5tGM3rWUiG0Tp0bZcxwsPvv/U+zEMoKq6DyNxHFOTH+pSsG4dRHOOnJVG3flpIR3+/n0
	wBt2CyEH0uPeC17hPSBhTJZxkFbFtL75RzcAh2qH3fCSAZc9NMfW0G6sv2voRalDWDMMoP
	XSfolZvbPFn0dVQpyb/Bo2nDXrZK/rlxoN9nq3EBrFb/CkGzBzj4dKQF9Qd3oLRM/c1YK6
	ydq4U5SsVasVIVDhrjdDhqB7H3MudGuYLZrhwwmTw94gQuR16V0Mjq+vNXElzjQqOEaX+N
	qA9P0htB+G6T5XONZ79LPLXSCAUue6AUQjzSET9gG0Lf45vfEWhSiLeiw7TTAg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Mon, 19 Feb 2024 09:38:47 -0300
Subject: [PATCH] i2c: constify the struct device_type usage
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-device_cleanup-i2c-v1-1-1fc5a8749c6f@marliere.net>
X-B4-Tracking: v=1; b=H4sIANZL02UC/x2MQQqAIBAAvyJ7TlBTsL4SEaJbLYSJUgTS35OOA
 zNToWAmLDCyChlvKnTGBrJj4HcXN+QUGoMSSgslBx6a5HHxB7p4JU7Kc+NMH1yvjbQWWpgyrvT
 802l+3w9m8jvtZAAAAA==
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=6/81RtxYBimTDWQThH/Y5fPpJCQlgo9epDoNinWZNu0=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl00vYRIftInhn8axwMBV1e8e77qqKkr+O8RKV+
 USVKAj58g+JAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZdNL2AAKCRDJC4p8Y4ZY
 pnkxD/sFWpPmd9MbWMLrPy7K/yyrxu6obuo1f62YiQU+dnXP/lw2bG17LyAAhKFxeajVcVvapKJ
 xeZovNdE8p1scrnOE6YEaZt6YbmsR4/YMJ57ye0lcgnmetLA7Y5XAMh8XvRsD7uXfoHdJJ9d8tU
 Sq3jcsH5vJ9Kigiu4LCA2yH8Ktfa3VFtk8NG+I/W4gZOLZ20aJBZqwRBMgStoRqcC4XASHj/c3h
 9J44uegRlQ/fEKQdS9QH9iIP8A0EEr/vWKbdK1jeYw4oSDcD2NtOcO92zkODkW1gPKHVW7XdRGK
 MQLyl2/BNL4UvyTajkC79DNVTr8UJSaUGcX+PkFcbdruDwYUnTWFXmsx9IjFWT4pAKBMgW8WNji
 Gfw6May0vbpX3pL6LbKdURG0VFm5ZaY1k7Z/VUtqPwbKJYGZSYLZfubVaqQu9B4C40o9g/BhDM3
 wyQ4bJ2XoV15nASFK7BhZsI5zWuDVTVmlD5XdX9S08i4a74Nw+QM4kzo1/vjdbb5Es4xn3q8t3x
 h9AxWPXH5mVKgF009NC4LCBfvbSLcJ/fZRWDduCTzKy1OBV7XrXBdjJdCJbSDpfpL5pz98U+g+7
 w5lRKzRYr/IzvG5hfMlMkVTfx8nnKVe93xoXF93qblxekqJBfFNJSYYFBQVllqGDwzIeEwwWGuh
 cIhnGzgn/lIHCjg==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6

Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
core can properly handle constant struct device_type. Move the
i2c_adapter_type and i2c_client_type variables to be constant structures as
well, placing it into read-only memory which can not be modified at
runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/i2c/i2c-core-base.c | 4 ++--
 include/linux/i2c.h         | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 3bd48d4b6318..ff5c486a1dbb 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -701,7 +701,7 @@ const struct bus_type i2c_bus_type = {
 };
 EXPORT_SYMBOL_GPL(i2c_bus_type);
 
-struct device_type i2c_client_type = {
+const struct device_type i2c_client_type = {
 	.groups		= i2c_dev_groups,
 	.uevent		= i2c_device_uevent,
 	.release	= i2c_client_dev_release,
@@ -1343,7 +1343,7 @@ static struct attribute *i2c_adapter_attrs[] = {
 };
 ATTRIBUTE_GROUPS(i2c_adapter);
 
-struct device_type i2c_adapter_type = {
+const struct device_type i2c_adapter_type = {
 	.groups		= i2c_adapter_groups,
 	.release	= i2c_adapter_dev_release,
 };
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 652ecb7abeda..ff93ff8b257c 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -24,8 +24,8 @@
 #include <uapi/linux/i2c.h>
 
 extern const struct bus_type i2c_bus_type;
-extern struct device_type i2c_adapter_type;
-extern struct device_type i2c_client_type;
+extern const struct device_type i2c_adapter_type;
+extern const struct device_type i2c_client_type;
 
 /* --- General options ------------------------------------------------	*/
 

---
base-commit: 67ec505fae32419354f4172c06c853def2541300
change-id: 20240219-device_cleanup-i2c-5a53da345188

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>


