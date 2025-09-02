Return-Path: <linux-i2c+bounces-12563-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE43B40D89
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 21:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 062073A4622
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 19:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73611350821;
	Tue,  2 Sep 2025 19:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmIeU/3w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C90326D4A;
	Tue,  2 Sep 2025 19:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756839889; cv=none; b=bvuM+1cynvwtHeoyF0iNWfxoMlliGPK+YFuzA/fx0E+doZezYygez02uRbnmw1/e5MfYwWoSrLreu4Wx/mMpzIfEQl5JNvKr5LTn+FuUjnh2U+LFjPhGHceMk6NwIPFYyFoglhshwDWXAPb2wqPYYM0DCalYyD8QHtXUTVaXDS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756839889; c=relaxed/simple;
	bh=OBA5/qS90gZbqoJ8US40ABfPjflCrthTFScrxnQA9Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dH/ssoFV3U1B7ipYsd3gNT7fmF8gxo5fGRg7UisQMg6QmkvsVt3dE9T83zx8HDNcIURe9nKqFQWpz5b/a6Kl5nKuP9YNH5Nyp8YaURJtUHJsfCWtPoMbET0Q1rH7PLiWKHE/hGM3MRXB8OE6HdQSxeYozr8MKJEMnEKT+q66wd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmIeU/3w; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-7220d7dea27so4812966d6.1;
        Tue, 02 Sep 2025 12:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756839887; x=1757444687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJvvsdiGeIBZ7n8NIzEjfrsZgmKN1e5bRQ1o1wqAxR4=;
        b=MmIeU/3wnEbY46O+scv5YhTwNctMgavmPEe/qUe5ihmyCHb/dGgEl2XiEDvQh5ZaMq
         aDzJmCASUaXdJgxU5FVGAxKSZcyppoQp4p2NAKuXJuoXFP7HFDC8C2Z0Gmd2ZLPPC60j
         FasfePbqxbP9Gv2Rvfuhoy5VtLj3IJyBpkgWgO9wvwX5Zt75eP7qT14MyRzFrCRtRQtJ
         PgE+0bDspG4uSIrVaa/5Me9FRufJphV2aq4m5KQewmeKCGHnUwak8DTzdPUlzx+PXhpo
         jZahYKJWNratHBrIMnV8snEBXbcAs0Ku2U2ZXnM2WqAsqLkiTBDvtnCAya69QmUIreft
         wCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756839887; x=1757444687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJvvsdiGeIBZ7n8NIzEjfrsZgmKN1e5bRQ1o1wqAxR4=;
        b=n2fwusyL3c368sXXbg/HgDzBih3gdopZJ7dOVF7/u2gmYvuLZSAIRSUyRU1G0Gwmhd
         HICwBeI40r/c4A7x9Zk9F7GvSKGTXp/U0dlW+qjcGL8C2Wsd2F9bHhEhnoU9rC2FOu7Y
         BliYwisvtxDbJUfhErJUbeTuij7HzRw6qXbUjcBPea1ytdl7msFm0kyEFYkhteOKCw9h
         TnLb4qap4DM+qkG5+yh4Vsg3erdBJy4htJ+n5eyHcRiFM1ar1adr9NdNUEIER5EPjDi/
         k4VcuZzmW9IWVmiVZ87ktbXqNrQzCUIJwlyAvp4IRp2OiFlEgyUMf+YMf8A20I4yAY42
         MYxg==
X-Forwarded-Encrypted: i=1; AJvYcCUjU7EQ3PC6HSVZQ1gFZsLMStHajlhfI8/0tHoe7+OT9kJgZEWPgZnZ+guniRi+soWrKt01d79KpF/W@vger.kernel.org, AJvYcCXvORzYJca+5yRKsx0q3cH/5GuoPfGQpJ2JBG6yzYJQ47jf337ejLTRYwTlfkc5s6n7mfPnTJjc8Dw3ysZW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+eAiYZxeHCXmbxMhYOxeQMSfeWM1EdaOjNTPI8z1HE0aA6WdV
	cN5ke4Nx44eEVWlNlz77lwPQ8bmCsBi8R4tLI1IRwxkHMOMze2aCJDDe
X-Gm-Gg: ASbGncvwc+MAe3/UcRFAPFNVBeAgrnOejoQZM1K7hFglEQcwRCT3bU4q2eDyAsW7N5A
	Lx9SCCtnaItfW0jeOSeEIl4XQeAhrtOHjhBSxVn/Nxd9+y/0WKQX65pG5X+ZXwn8ZsORBAppEFv
	vdDQHe29mxQLIZg0v5tGiZ8IPeXxE+Z1fmLawQdye7ixP7HRNVAZozICc37bhIopPAL3B4f+X6O
	mwQ9hldNpGJEd6YM0OEGarVYGzYCC/L/fqDx8UKkSMju8B25J0sD/yGcnLgXBhwYFecR2wGM4/W
	forTZQFktaMUFyHKXTZCJaK+27gt6mouauwfAg1vlc2xLYqmfUtlXspZ/+UuaK8BjIvQ7EGOoUV
	GF/BNB3Q04I2nqmj4Z88Uq3q5oQJp9Ys/2AyZdWYvDzNSXjAMwAmg9vxLVPtGUroNcfYkwH4qxV
	ty8ca4r9X+lolGYw==
X-Google-Smtp-Source: AGHT+IEvnA5g3H02GlkgySU1cObOh0moDx5rrLr3spVyG43e9BSWGnKfXx4rzmVgi9zRu6jpgmPbsw==
X-Received: by 2002:a05:6214:246f:b0:70d:e473:807 with SMTP id 6a1803df08f44-70fac883cd5mr150225986d6.39.1756839886373;
        Tue, 02 Sep 2025 12:04:46 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b5b9c7e1sm16127096d6.58.2025.09.02.12.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:04:46 -0700 (PDT)
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
Subject: [PATCH v4 1/2] device property: Add scoped fwnode child node iterators
Date: Tue,  2 Sep 2025 15:04:39 -0400
Message-ID: <20250902190443.3252-2-jefflessard3@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902190443.3252-1-jefflessard3@gmail.com>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
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
    MACRO_ARG_REUSE, MACRO_ARG_PRECEDENCE
    This is a standard iterator pattern following kernel conventions.

 include/linux/property.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/property.h b/include/linux/property.h
index 82f0cb3ab..862e20813 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -176,6 +176,16 @@ struct fwnode_handle *fwnode_get_next_available_child_node(
 	for (child = fwnode_get_next_available_child_node(fwnode, NULL); child;\
 	     child = fwnode_get_next_available_child_node(fwnode, child))
 
+#define fwnode_for_each_child_node_scoped(fwnode, child)		\
+	for (struct fwnode_handle *child __free(fwnode_handle) =	\
+		fwnode_get_next_child_node(fwnode, NULL);		\
+	     child; child = fwnode_get_next_child_node(fwnode, child))
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


