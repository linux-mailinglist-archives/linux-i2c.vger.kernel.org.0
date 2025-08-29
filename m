Return-Path: <linux-i2c+bounces-12512-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CC1B3BBD0
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Aug 2025 15:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D58E188E286
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Aug 2025 13:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A07B19DF5F;
	Fri, 29 Aug 2025 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHgfC15G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E1714B08A;
	Fri, 29 Aug 2025 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756472415; cv=none; b=KJcZijw37thUJuefgVGAztSrDuV+Xy6IcJvaIpgIVX0mCVgARozoSsuVYVDis8oAbuu6F95t5WX3XHXKYXX1VZLhumzwWVMwcAsjgmSIiYMAp4nVgiRblPeu48oDefpAJxGSJJaHrpvhV1+/pmgiWM7HRseQ9EAzrZbRuxIjbpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756472415; c=relaxed/simple;
	bh=l3ftba9duJqWTCR1mNWvfLSGHT9IJ3o0PvZ2r1+fOaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=se0IkUvhlMzHvTtd+1XkTZ0l6UxCtGClTN+q9drRML3dZtXH2vivMz/UPRCfVacYMIzY7LakXI1Idy+qNAKPynJp8te9AP7SySRd71TkkgTpAuiot2OtCuzMR8GivYzJ/TO15llp3GRK0vI9Yr8Oc+2MNxlvoWKrvF/zm+BmHF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHgfC15G; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b109c4af9eso16823091cf.3;
        Fri, 29 Aug 2025 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756472412; x=1757077212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M3DXXRGKtXBXGU3/Pg0qvsIiljazBIVvz3rdg4K4anQ=;
        b=lHgfC15GNynkYkl09oAfmbvg8qympM0pTTrC7nnXg5a7Yb4hZUTllK8FO2M7sXIErh
         mtzmdmt+BZLI8iV6Z3GwXlEdfa1EPMRjsNdY6fy2Ijlkmc5wgR1Lt+n7ua1WIQGcRrPt
         1zycLdI8YG61REzx5U6NZ58BRrt1TRhzbv71c1xGd9xW1VldJ2G94CEmSWQyVKmHjGBT
         f9gIkYqjMFq9TLPHj/x1m/hPLcntdljSijfDknlAF2wKJZJUuD+bjHkYsr+ZKoAPIF3C
         xW/hDU8NiPnRH/B8qa4+T3oyyMJxiKy+o9npOnNJ1gTV0syiRB1jQqbFfOL/HZDLTuzg
         64Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756472412; x=1757077212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3DXXRGKtXBXGU3/Pg0qvsIiljazBIVvz3rdg4K4anQ=;
        b=mJayUfDKmfscCYC0YeJ88+wxEjXM8gqO+ErxfEStYUzWytcD99gI/BDXrp2FlyZ9yb
         RofIihusjrlzpSHFK1oVeraRTm3mSelLVTE4ZdjuKbTenozOIQ5iR5iRjXfPad+gf91K
         rfp5GNRdDeuP02gvQ4dN8Um9Jz2fXIU0OyEW244fSCMH4dNckrb+Na8XuMKDODO8dThZ
         ytCO6A93l2HKM9nu3uX0YeNP8uA3SuEhWelFkczlejewc8ok54I3i0Dob4SVMjg4jtac
         lqj5ScTAsz/4NxOyHecAONQgKQ8N/OiJHfephS62LLexf/4okAey0rSidxUCs5CT+Kj5
         PHgw==
X-Forwarded-Encrypted: i=1; AJvYcCUFZcmkXMlZmhveM8SLFkmhCha4t3jnQ/jnkRAsBpB3rytx8L9YBWdfgAySn0UxJgHd+VqUVMLGkaC6@vger.kernel.org, AJvYcCX1elXYYopkF8Yi9rWXaOAf2uXDjTsPkIxP5SpBJO7xvtU1Sj8sYDZSfLJLrgZE6Xx2+uupkJFq96dNC7fa@vger.kernel.org
X-Gm-Message-State: AOJu0YwZd/bLtQJez1uz1zmW0YrBQxpTF3qoumHlZbc/hGkuXWIzbejx
	VnneyyeLf1WT2KgeL4/eFbb0Rgcut/Ovx23eZGe0n4cgQ93hxDUYfGWE
X-Gm-Gg: ASbGncv0bewhFPXjOq7c3/+ZmNCQOyshJa3nhpmBTW38mVsOQjFoWOiDrnuXxDBFpNK
	BSM1QhilhuHyUyXjJmrILdXTJfhva5LRywa4L4XQ5qnVT3AuQvnV4hMuICcDXAXYqSuL6oDqqhq
	uDfJLTzbmlm2CrIwfURl5vR2svK1Rkp9hbXq+pOliGo4BI5zKEftuHEUFS67CVpGDw0zBzFfbZa
	OD2x3ZtgEgtBTiHan66OOYHPTfMPvF/xBAjPUlwyK55U9uZPmGZICQysYdbH8M8KaoaxR94Be87
	tVYtR4PyyTURoxDX8hsuK/LZY0jyFHPLSR7M+IqLt8IJ/aX7bpZ7ywRyvD96ne7+vHSYOQBZQqW
	xspIKmasUEU+JHI5b2OiI3G+O7iWol8DfMPIg/7BVHnEdwbYmOc8FkvZwtCi+am55wvyajipVJL
	AhJu0=
X-Google-Smtp-Source: AGHT+IHgQDwp+Xmcx52kZ5tVMjh3dLUhHCuJJykye5EYsyHWMH/aTR3kc6E9PYCeEvwNrdOg0cdPlg==
X-Received: by 2002:ad4:5c4a:0:b0:70d:a91c:ca74 with SMTP id 6a1803df08f44-70da91cd135mr236255446d6.20.1756472411972;
        Fri, 29 Aug 2025 06:00:11 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6250cc5dsm14656496d6.54.2025.08.29.06.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 06:00:11 -0700 (PDT)
From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Lessard?= <jefflessard3@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2] device property: Add scoped fwnode child node iterators
Date: Fri, 29 Aug 2025 09:00:08 -0400
Message-ID: <20250829130010.12959-1-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add scoped versions of fwnode child node iterators that automatically
handle reference counting cleanup using the __free() attribute:

- fwnode_for_each_child_node_scoped()
- fwnode_for_each_named_child_node_scoped()
- fwnode_for_each_available_child_node_scoped()

These macros follow the same pattern as existing scoped iterators in the
kernel, ensuring fwnode references are automatically released when the
iterator variable goes out of scope. This prevents resource leaks and
eliminates the need for manual cleanup in error paths.

The implementation mirrors the non-scoped variants but uses
__free(fwnode_handle) for automatic resource management, providing a safer
and more convenient interface for drivers iterating over firmware node
children.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---

Notes:
    checkpatch reports false positives that are intentionally ignored:
    COMPLEX_MACRO, MACRO_ARG_REUSE, MACRO_ARG_PRECEDENCE
    This is a standard iterator pattern following kernel conventions.
    
v2 changelog:
- replace manual __free(fwnode_handle) of i2c-core-slave.c with
  fwnode_for_each_child_node_scoped

 drivers/i2c/i2c-core-slave.c |  3 +--
 include/linux/property.h     | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-slave.c b/drivers/i2c/i2c-core-slave.c
index 7ee6b992b..02ca55c22 100644
--- a/drivers/i2c/i2c-core-slave.c
+++ b/drivers/i2c/i2c-core-slave.c
@@ -112,10 +112,9 @@ bool i2c_detect_slave_mode(struct device *dev)
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 
 	if (is_of_node(fwnode)) {
-		struct fwnode_handle *child __free(fwnode_handle) = NULL;
 		u32 reg;
 
-		fwnode_for_each_child_node(fwnode, child) {
+		fwnode_for_each_child_node_scoped(fwnode, child) {
 			fwnode_property_read_u32(child, "reg", &reg);
 			if (reg & I2C_OWN_SLAVE_ADDRESS)
 				return true;
diff --git a/include/linux/property.h b/include/linux/property.h
index 82f0cb3ab..279c244db 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -176,6 +176,20 @@ struct fwnode_handle *fwnode_get_next_available_child_node(
 	for (child = fwnode_get_next_available_child_node(fwnode, NULL); child;\
 	     child = fwnode_get_next_available_child_node(fwnode, child))
 
+#define fwnode_for_each_child_node_scoped(fwnode, child)		\
+	for (struct fwnode_handle *child __free(fwnode_handle) =	\
+		fwnode_get_next_child_node(fwnode, NULL);		\
+	     child; child = fwnode_get_next_child_node(fwnode, child))
+
+#define fwnode_for_each_named_child_node_scoped(fwnode, child, name)	\
+	fwnode_for_each_child_node_scoped(fwnode, child)		\
+		for_each_if(fwnode_name_eq(child, name))
+
+#define fwnode_for_each_available_child_node_scoped(fwnode, child)	\
+	for (struct fwnode_handle *child __free(fwnode_handle) =	\
+		fwnode_get_next_available_child_node(fwnode, NULL);	\
+	     child; child = fwnode_get_next_available_child_node(fwnode, child))
+
 struct fwnode_handle *device_get_next_child_node(const struct device *dev,
 						 struct fwnode_handle *child);
 
-- 
2.43.0


