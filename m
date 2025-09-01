Return-Path: <linux-i2c+bounces-12547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 096A9B3EC4A
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 18:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49B874800CF
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 16:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8365E30F7F9;
	Mon,  1 Sep 2025 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/yoFyMp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA4532F763;
	Mon,  1 Sep 2025 16:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756744613; cv=none; b=KiOcsBRuw/8/uH+dQIEjfWobIEk0ueln3Z6OG3kjaVRhAOrHU1UQw6fPYfbc3mx0yDBBFSN4yHM0aUWl9V6iMg9n7Jeq10Fd5g5WMy++KdOogCrWd9ygyELDPEGd4LEvoCme8Pct94yo0o074jCZfLBZzLkmZMdYBJeUdO+MGvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756744613; c=relaxed/simple;
	bh=BAwNG1mjg5VArwgLd6vrN01BuzaiwolqL8RHZQI18Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UPDxH/VCqjXcTyEXkk5CWduT0RdF5MFbx+dVtGcf/pxBhOmOK3NqeUH33s9Iv0qM+9S6f4IqPuNtgT+pCXpjZGF5M4kjEb0cSxKZO4uED2CpDQLZpTDCXE19zNOzPPJFOMaVt9/ZpRrhSv5tMv0DIsCESjhAlZUTtbY7Jr8KGGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/yoFyMp; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-70ba7aa136fso34200406d6.1;
        Mon, 01 Sep 2025 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756744611; x=1757349411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUwBi7xqVdPIr/Y0urjkMdmXq+VS5M9SsZEpHWWC/dw=;
        b=N/yoFyMpvccX0tdSgDWFEBRJKZeUhnMq8tUaERgClU8ak6SRswzuebTonREZgWC1T7
         TVZo6z8cpEVoZ9iO53/t+T5w1mMWnhcedDavZIauJkq6D4/CAu6mkDsvKtIM4EpKrHv6
         g1ieb+iCLz64G4EO4oLzvHgRK5uzZDObw5hoyuKuoe2Hxi3eZflELr6X5NVPOAbWikMu
         l4+tuZ8bFj/TKb0cGS+1UauvMsKN3U1CTCeS5JLQ0xj3Yjox75N478GNHJMBAQrayhee
         iJFumhFHqifxsfxUZY6VKwowcL7cl01srOdxWLf10l0C4X4BlkSZJnFhnylpbAaMUSb0
         Epcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756744611; x=1757349411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUwBi7xqVdPIr/Y0urjkMdmXq+VS5M9SsZEpHWWC/dw=;
        b=SQzHUzDMNxZZLNTTuEEQwvbf6AzGDG4BgDlYRM+b5zkFvkFXrhqpAiCDEf8l9hv0bR
         pP6cKuDt1rtyUj/ygmFh3+8zmSqpx8Gozakd2hHw12QQ302D54CKWbtZPn5xwICFdT98
         V53jla+jAwK4Iu4NiElQMkJmFl2u0yuiTB8YczcIognxV0lR6JmACz0STE7N1qqFIP5R
         VIzsmNVybyie6/0H4GeGVfGg//lvHfKybWDQWW7zUyMvyWeTDk4olw0TdXoS2PMTNFZq
         ijSm8HGyE6eQjJoV/TLdtYskpV2qxV1EIFxrGsvYdTKwLpJs3gSArnI3i1VFVi70bzSy
         XWzw==
X-Forwarded-Encrypted: i=1; AJvYcCU5Mq8ASMprEnn2nVCh8dhBShCDWjr1QKIqWhTZHJubZ5LDKIB0G7MnNS+U2vYEyz+X1cqH3exJwDM3@vger.kernel.org, AJvYcCWofHdRBSawehTDnrvvP5C4BDyU02LqGcyi3cGRmrNDo6IWxuyYc062AB6E/VtyxNMxHh6ZDU68Giv1wAhs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2daIHz1y078vwprhUC2uzFL9vWZCXInD5OW7tHRnvuTO/teaw
	Re5MqEdu4SRqciljXxjUvKDcP35ZfNCstJ6GWusnMtNTKZzjR+7+4ByyzbOrhtKP
X-Gm-Gg: ASbGncv1/oPHyK2lXyP2DfZQyIDI37anhCFpsNz2ipSy593iubcxIq9L0FdDTf90THu
	T4X73NxRgLXTb9SIzFQtRMQHUmOTDzXL/Mqd7AJ7HoIFxeq8Oo7QAJu2YdUubZjAWN5/xN+FoLz
	BZbKe+WzCInS+8zodJBPjWw1+qHCVc/GTo2Zm1PaRFYKghSDZf3Ap0fcRh+9maMfvxpMF6+JwpU
	DO9VbstqL/9fxsq9Id1/mqTssxG1pP4z/gRMKf01Bl9nswPDg6+MrsZHJpumLyW5N647h4Dysk9
	ezzJr0Asp0kdzxy6z0OKS2OqnPGlQI8e5ISyQhsNrrgbysZPpsAEnbYFV9GVNQUw8FUgw3//9RS
	ihBzczzWG9i8CzltG0iToSa+KG7N2sdU8XF9qDRBKjGtAQD6xtG3Lin1byuQQJrksThzLoo79TV
	Wh1jo=
X-Google-Smtp-Source: AGHT+IHN2rd4D3T+3O3EPg8xtIHlpKe+5opmN/ENg/y4+IFmag0QwEoggzaYiqAnCZSq3TVgsb8Kug==
X-Received: by 2002:a05:6214:4107:b0:71d:d902:692b with SMTP id 6a1803df08f44-71dd9027299mr16248756d6.29.1756744610648;
        Mon, 01 Sep 2025 09:36:50 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb25c80c0sm41867436d6.12.2025.09.01.09.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 09:36:50 -0700 (PDT)
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
Subject: [PATCH v3 1/2] device property: Add scoped fwnode child node iterators
Date: Mon,  1 Sep 2025 12:36:44 -0400
Message-ID: <20250901163648.82034-2-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901163648.82034-1-jefflessard3@gmail.com>
References: <20250901163648.82034-1-jefflessard3@gmail.com>
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
__free(fwnode_handle) for automatic resource management, providing a
safer and more convenient interface for drivers iterating over firmware
node children.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---

Notes:
    checkpatch reports false positives that are intentionally ignored:
    COMPLEX_MACRO, MACRO_ARG_REUSE, MACRO_ARG_PRECEDENCE
    This is a standard iterator pattern following kernel conventions.

 include/linux/property.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

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


