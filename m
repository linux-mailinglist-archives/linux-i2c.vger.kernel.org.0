Return-Path: <linux-i2c+bounces-12564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE1DB40D8C
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 21:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1D9E1B229DA
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 19:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093C5350D43;
	Tue,  2 Sep 2025 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQwTxJ7Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540D534F476;
	Tue,  2 Sep 2025 19:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756839890; cv=none; b=ITPpOM9UpWNz5hmTbTSNnGJ9pYhbTbGiCQDKk/MU8hJRY3tFrW6Rcy0dpgnkhqbhLsofDKrt0snsunsN5wDdLwRJVAMUFx/AifyWdzhur8qfG4FPAqqLXLotepYCxKXmHbg382q7dk60dF7wYtxa2NdiAb1JzyJh3Msa5fWPo2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756839890; c=relaxed/simple;
	bh=Ro9bL/h3JECoVAbyyLvJ++g9EHdRHXV/HLcI2NUJkc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mwGGaBpVv0EIbY3Ckk7sXlPT7lRiIyMQJ0UGGGz17OJtsP88wHDhGCJyqWvQsbJqBxYRE1G2KengS1oqXmkRZyN9glFZLXBQmJ7ktHC2wrIj+8vWGQEUbRStaxRo9z3nYwXq2uKZ2FB5zraQQejk/19op2we5oQk1up7SJy9TME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQwTxJ7Y; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7f77c66f13bso547575085a.0;
        Tue, 02 Sep 2025 12:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756839888; x=1757444688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aWjS+2is1TGQFCmxYGFdYaTtn7GFz1aeLXf+Ky4DuQ=;
        b=JQwTxJ7Y4pt4behS5AGvANMBwUvpMkCMvvVmIlMCWERQZ6Z78doKWT6EgPX94ma7u+
         VswBwGuFAQgflbVKNUfOnah7qCXxE1HFGTf1BovqsXO7ywQIFEAaQ//3rbeEBCkAhQjZ
         MD6DLQfQxRWJAVKFi/OQSc3qwVgkaR4JTvrOWRIEY3eRGA8HCgON6JD5Sh5Rks875hDs
         yih8eApRVD0v7ycP5P/ksAbCu8j95I+rdDIJuT1ps4ZHF5X318ZWTb2CnxQ/F06O4tpE
         RJPzwGCp6nYJvxu/iRWmIAtG/lTKpNhpjIbram8e8OW3elbDh0PhQDyJk1LT/+nuMT+a
         tHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756839888; x=1757444688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aWjS+2is1TGQFCmxYGFdYaTtn7GFz1aeLXf+Ky4DuQ=;
        b=MXICF2h75Sj223Gwe7p377ZOpl/6Bv2b56aTfFz/1agbwc/gzKIfJN78btTzCkLxch
         dAskddNwVcyAz4mZCDXu6dplmxpdAJftQ0mS4SqpZ3ZuKUgJ/Dbb3CuOxsRfo2rgotbH
         PIjQL2EPVhhvxsonG5xSatgd7+vA34VnAzYs1lkXgsSa2ldpnYgxlUH1+6swsKo7OBjF
         Mys4dZo8yDzjWMcRzo7oNfv5ifqQga9J3dQAfOXBZ2jFIWUuCcPyAwMVN0DG9cLqvmD7
         ZJJF1Oud17AEzE2MjhkTxoYLW3PgUdcCr0mxBc+gQi2E1WX5R9N4ZAQ92vslSkub+wKZ
         zREw==
X-Forwarded-Encrypted: i=1; AJvYcCW0MVA9agYw6iqKZjTmVPVcWTn+lnVGwxWeszwm3qEqyNNo8xDY3h+FQbO7Zu2R5+QNEm5UX/NthCqNUIsP@vger.kernel.org, AJvYcCW75eHUIsGagvSVFCINxW5CrkrWuGy8L1Cv/NWuTghXY7dvAFNVroJA+5rmBAd967e7PNYVvLU8+B0S@vger.kernel.org
X-Gm-Message-State: AOJu0YwE30818FImDk4KBG0XXqqhni5GrP62aA+i6Yl8Y5jZ0uETYb1T
	mwjv4tXt9vkkQDMBr6klEysuARpd3jQMiwCVW2QPy8qQIjJ7FUurUjFd
X-Gm-Gg: ASbGncu/TxL+HhMooEkDMqJGtO0yAbBtretUuEOg9Hu5L853OFY0Y1GWSoKD54unoej
	tBWDksjxVD7FoBvNNK15m2XGGr5MJSvM5vZ/mADP5mdAQ2OrPjAqJ2bN8GKq2flXV4mJoCuGb0w
	m2lx3mCUXh/2LDwIULWhSjRvoCgZKYwc7Ukv6nGE66sd+dI86dcqOJCUrycO96yQ4g/d0/ZDOQY
	aE/wyUQlFALa+/SwPJmbn384Pu72qcr8klULzpYS3yTGz3oiplGRg7zV7zFwOo/z0u5mzMUy2xv
	OH2poFlPQAnFnB5CJx68yjGv43bCTRqTykKtE6Uh+JffBKUtIBpdQ0agRz0nzAU7HP37jwKI2hG
	xTZC+ZlWgHV8qD9t6uYRTdLgJfEvuArHkIaEDB5rLVvGAg95wRFNYcSDel/QWiujWnJsb2SYaU3
	HVf4Y=
X-Google-Smtp-Source: AGHT+IGjRiWZaSnAvm31amjzpgjmLy6bltMNZNb5a2pgY/k0vBuz03HCyZ0uSKYi3Rc9sh/qpQEBEw==
X-Received: by 2002:a05:620a:179e:b0:7fd:50bd:1951 with SMTP id af79cd13be357-7ff26eaabd6mr1386385885a.15.1756839887853;
        Tue, 02 Sep 2025 12:04:47 -0700 (PDT)
Received: from localhost (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8069cb00ca3sm181576085a.47.2025.09.02.12.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 12:04:47 -0700 (PDT)
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
Subject: [PATCH v4 2/2] i2c: core: Use fwnode_for_each_child_node_scoped()
Date: Tue,  2 Sep 2025 15:04:40 -0400
Message-ID: <20250902190443.3252-3-jefflessard3@gmail.com>
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

Replace the manual __free(fwnode_handle) iterator declaration with the
new scoped iterator macro for cleaner, less error-prone code.

This eliminates the need for explicit iterator variable declaration with
the cleanup attribute, making the code more consistent with other scoped
iterator usage patterns in the kernel.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


