Return-Path: <linux-i2c+bounces-12548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17223B3EC4D
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 18:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBBA8480036
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 16:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAEA3064AF;
	Mon,  1 Sep 2025 16:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWBepS+g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FBA30F540;
	Mon,  1 Sep 2025 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756744615; cv=none; b=QeOUielV5RJ4I08J6JrHXVOmSlxiMQzD8fueB3dFekTRqL8A7H7r51FQMLb+Zwu2f09delDDmg8s5FZhaOutUX9i/HL4NOTnoZcGZIc6NNMdsCYuc9bakMqnx+gM7xOYC0cG/k2mR0Prtj3vwcm8rmohN0NL5VE4RJvrUuKBmIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756744615; c=relaxed/simple;
	bh=rpdWU0Y+HpvWfPb7kLxSsyEOrhd6J8mzlok0N0JGp0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VkQQq8Dfd4mbEVxHtmf2+r8Z732IB3RIPWF9qaJePTRDQez+jGOby+r5k8pJql8UExWhKS6ymUCuhX7JbAfttbpUerqfiwytqQmrSwRNxQW2+HIMzJRTFRubDWCb9D4PU2ZqKqHFOmTJr4Pzju/EX5Jr1cTB/o+5B3gE94XtWYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWBepS+g; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7f901afc2fbso368957985a.0;
        Mon, 01 Sep 2025 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756744612; x=1757349412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOiCkmF9N5LECqor0q7iHAbxr8Qh+oAsx+T89PFjoPA=;
        b=HWBepS+gRcPD3Jls3xHjQHVEE51wVAz0X3Y246uKPrbEwNNbbLkKB29xyO+7RxYM3p
         1C0W9z0Gc5/tHSKKvC8cbIk/Rj3A5SELDXmGouSSUxSxxC60yqgAzFYXdtO9cXjqS3kk
         kOAsrOpvcA9icuGLj/LAJUmaHdFMFwupUP/jtW9aDuX9XomyjoS/JIGAgi6NUY5B+hlH
         F+oHdZswbIBmCYyGa4rHs0PChC2XTRB7+mRZh6Rl5dtbfOXHpXZ2g+qrEXTi5L0uScUk
         MIhs3moLpDKg6es3kZynzySUGwSfm5ZuZxaEs5JJUAtY4UuJsq05WZONSGSDxmavWa4s
         F64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756744612; x=1757349412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOiCkmF9N5LECqor0q7iHAbxr8Qh+oAsx+T89PFjoPA=;
        b=JV5PYG1sGCqAIOhy4vqbnbo6Ef3LiedagRecufuBHIU9fMI7xLZPMf8EPsuSW/3cFx
         19eSJOe6MyoZz7bKZ7+1c2txKpXycSrvp0B6lmscAaKs7cgYc6h28lLgO1jeDRJH0H48
         xM82UJRlWA5gVbVdwc7XwRxyf/kwEjFHQxvaMDLbePNn7Q5xCCUOYRZJrYQPlTeLB0v5
         VjyL/Ims90bgmg4DP9YLPr51BjmeJtcAKHKBwksxB21v7Ply2Av1JJQCY4Q6e6/CWJvj
         efM0aGzyx+U/QoNyPHuRWUedfNJ6SA8rczA4bfysRYhJpeoQo1Acci2IanWYXx2nY3RJ
         XmwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPGCWHe3OI3FdanqbqmQHAZkrZopDLu1VQw7hxzfj0jmQQKBX+AJITUBurT3+hQEC0/A7GYwXTMNl1@vger.kernel.org, AJvYcCUWZUC1FToCGYU7hZIq/klQukZZEnQmKOh2vXsf2l7yyOzKKQQSVqo07KqvjKFSElDNyJqzlYlIOi4laPeR@vger.kernel.org
X-Gm-Message-State: AOJu0YwsNZoeGboLgSIyniQAt5rXPh8Q7pbiSw6nfBnq/D8+Du3Sn77P
	nhwXDAJvjnBYkryy2zHBJOGXD8g7twFHgBcDGxFdX9rPqtuiZWEmJmNpunkP2Z8C
X-Gm-Gg: ASbGnct5DRhBj1milD+wpmK5uPgtU9+rhdG2k6LR2okBn9X5xv6Qdv0HYeUelbq/16w
	/dIy0+9pYGcSTAXg/iqi4LhX82BI3U4iKcaGxGdygTSbO0et9kUpLqFXpY4XgWnpxmu6oGF//MT
	ohcZJ0LM8LYC6Xv96Fb7vySvOA3SXedb5Pd0nvhBuE9Vc9KUCbnjUvwPZO/pSwJY4D6aippfhIB
	a3Bl1HXwBHeBEK1PYsdI5aQD+rWobt6KazMXQ+LeFF3xOLrGUFh2oW1G6L9jc+BtjnEHhPut2DN
	H21J2wKcg8Mmhf/sTQnTn+imWMR1zTEGBGL7fZlMzrCuQ4rP9tP5UMqhSrs9n9OEW6agkwyfT/C
	sWnqqow3AqJaQvNRNSfp8ogawDZVw60zTPIlX1GP5R3Pncxwfyr8UMmYyy7GtTM4IguBRZrBBS0
	CEYv4=
X-Google-Smtp-Source: AGHT+IGDGC3z573zGrSVFG9fkTdEDkxBT9CzwsK0yzkNtG1aUWzv50ulRj2+jnctgOq9XmmzeOb/rw==
X-Received: by 2002:a05:620a:4515:b0:805:ca22:7d66 with SMTP id af79cd13be357-805ca31c4damr152071085a.37.1756744612072;
        Mon, 01 Sep 2025 09:36:52 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc0ecbaf36sm684887585a.25.2025.09.01.09.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 09:36:51 -0700 (PDT)
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
Subject: [PATCH v3 2/2] i2c: core: Use fwnode_for_each_child_node_scoped()
Date: Mon,  1 Sep 2025 12:36:45 -0400
Message-ID: <20250901163648.82034-3-jefflessard3@gmail.com>
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

Replace the manual __free(fwnode_handle) iterator declaration with the
new scoped iterator macro for cleaner, less error-prone code.

This eliminates the need for explicit iterator variable declaration with
the cleanup attribute, making the code more consistent with other scoped
iterator usage patterns in the kernel.

Signed-off-by: Jean-François Lessard <jefflessard3@gmail.com>
---
 drivers/i2c/i2c-core-slave.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
-- 
2.43.0


