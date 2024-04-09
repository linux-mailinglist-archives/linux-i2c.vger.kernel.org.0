Return-Path: <linux-i2c+bounces-2839-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 483A389D1FD
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Apr 2024 07:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8A932861D4
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Apr 2024 05:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F286A8AC;
	Tue,  9 Apr 2024 05:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sWtLPJcs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CE26A8AD
	for <linux-i2c@vger.kernel.org>; Tue,  9 Apr 2024 05:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712641037; cv=none; b=Z19nnd9/xjKa73sbwo/jYo1WIAB5v2LbTFx1nvW8ad4OsPjw39SQhV/HB5o+twGRYtFJ3m3CRiIExh0FLDvh05VHjXven0kii+UxQSWsDqOjJ4RvIlSj7W2JrqJqa7Rjxz/n91UcWG9PLc4Edhwo7DNQ1zkRohocVDgCmmR78qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712641037; c=relaxed/simple;
	bh=UeZnCjsFlLic2qaSZoKNxomMdFYr768316T0wajX8u0=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=mciGVe1JGmR5SABRASGXNMmXuVDpDnku+epdGqOhAXl87afqGBT5RpneGyJ6pEQDU8Eyb7+CI8N6dYRPTcUGYwnjjF3q3q3U8oY3YN0n/qpZhOo+DIBPxDOyKi5o3+AuSxhO0MThUBDrE3xUwneLQOJj0lfU0CHqORvou/c2FLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sWtLPJcs; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-60cd62fa1f9so81252297b3.0
        for <linux-i2c@vger.kernel.org>; Mon, 08 Apr 2024 22:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712641034; x=1713245834; darn=vger.kernel.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHsEtZCKaHOJpKzkmFo1QTaciQX5xyBED5wwHFx24rA=;
        b=sWtLPJcsrRU+YOrqZK01sNtI9pW3V3U7bUI+SItreqz9yVw5Pwkie3jc9UNJSZKhh6
         wnQ2nDy5HdaA1/wWziZ9iHOZHaIVT/DYAvjni4u9hjkpNQb8hDHiDUdYxOnI1bAlExt4
         grwskoA12q+PVBqCs+s/DB+aX52N4MEbM2DP/XQvJS6VsgyykwYKvE5EiWBfo2MIu0p8
         nWP+VZQoFheCXV0FWv3ShqMHRE4lWMutJIEQnZx7tniAsh3Uk2YI9pZmsa+v8sdqpR3Z
         gJd4mDscFaspsczU2XAEWsNPUBahaC8QSvH9ld/+mCuDCPddSc9I27NVAQcoPhW1LWTv
         6bLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712641034; x=1713245834;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHsEtZCKaHOJpKzkmFo1QTaciQX5xyBED5wwHFx24rA=;
        b=eXVRW7GyK7kYecl7e9/OnOkQjbZbZOVEswV/SMiSnqIxNcnhtD87LBmNz+Y9UnM9UD
         MTj2lrp4ADiRKyuZ7VI7Bs5i7FtiLWmJjZEqTXwXJzJmohAXevbJ2ehew4HVSRtNbe2K
         RjXC+q1zFavXLnO2Cb9uA/0WBz/hBqCPQnI3ASuvEe6YGsUhHJt+adjeT19phJ8owfZl
         /aYcGhAmGCIDUSrU2sJkDBgl3BthxKUYY59BUXkqlUVUTCI6QvCRtz/YIP8wRFhmWfON
         2EwSSzTUCZp7ZBKlBLF13eEwwpYpegT1Q+Yd0BvtEkH/Ka7dKAcIbbdxeaCa43mzW2Fl
         5ofA==
X-Forwarded-Encrypted: i=1; AJvYcCVXWsgwP9yHsbSL22tdYKqsuqF1XA0qQvkrFKqJ+Fc03Q1Hj/nr1zSpqYlbsBdoChtBH9aVfztwY1rOZ0IifxjVyVsGk/0NegqU
X-Gm-Message-State: AOJu0Yy06bdUDGkyxR6nJq9lFVQdubL67yMJtNySH7JtoAfUo+fhhoJm
	EvxPiqObA0Qm/xMyTLTXF8xiFb7cjeERH7Ca/BV/BWJs8J1rxGg0oPkoHdBQUzta+AbtamG8KBz
	F2sEiGSIJwJKUPg==
X-Google-Smtp-Source: AGHT+IFVWQRJuqt+RfUsHPn8GX0evGqrx/pn1nt0eRiDqqPwuJeYG8bIxyrI0zUOLfzh2v9qJA48jtkZ7a+SQoA=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:96d3:321a:67f3:5322])
 (user=saravanak job=sendgmr) by 2002:a0d:d983:0:b0:615:dce:e3e with SMTP id
 b125-20020a0dd983000000b006150dce0e3emr2755710ywe.9.1712641034295; Mon, 08
 Apr 2024 22:37:14 -0700 (PDT)
Date: Mon,  8 Apr 2024 22:37:02 -0700
In-Reply-To: <20240409053704.428336-1-saravanak@google.com>
Message-Id: <20240409053704.428336-2-saravanak@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240409053704.428336-1-saravanak@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Subject: [RFC PATCH v2 1/2] Revert "treewide: Fix probing of devices in DT overlays"
From: Saravana Kannan <saravanak@google.com>
To: Herve Codina <herve.codina@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
---
 drivers/bus/imx-weim.c    | 6 ------
 drivers/i2c/i2c-core-of.c | 5 -----
 drivers/of/dynamic.c      | 1 -
 drivers/of/platform.c     | 5 -----
 drivers/spi/spi.c         | 5 -----
 5 files changed, 22 deletions(-)

diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
index 837bf9d51c6e..caaf887e0ccc 100644
--- a/drivers/bus/imx-weim.c
+++ b/drivers/bus/imx-weim.c
@@ -331,12 +331,6 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
 				 "Failed to setup timing for '%pOF'\n", rd->dn);
 
 		if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
-			/*
-			 * Clear the flag before adding the device so that
-			 * fw_devlink doesn't skip adding consumers to this
-			 * device.
-			 */
-			rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 			if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
 				dev_err(&pdev->dev,
 					"Failed to create child device '%pOF'\n",
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index a6c407d36800..a250921bbce0 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -178,11 +178,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 			return NOTIFY_OK;
 		}
 
-		/*
-		 * Clear the flag before adding the device so that fw_devlink
-		 * doesn't skip adding consumers to this device.
-		 */
-		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		client = of_i2c_register_device(adap, rd->dn);
 		if (IS_ERR(client)) {
 			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 4d57a4e34105..19a1a38554f2 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -224,7 +224,6 @@ static void __of_attach_node(struct device_node *np)
 	np->sibling = np->parent->child;
 	np->parent->child = np;
 	of_node_clear_flag(np, OF_DETACHED);
-	np->fwnode.flags |= FWNODE_FLAG_NOT_DEVICE;
 
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 389d4ea6bfc1..efd861fa254f 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -743,11 +743,6 @@ static int of_platform_notify(struct notifier_block *nb,
 		if (of_node_check_flag(rd->dn, OF_POPULATED))
 			return NOTIFY_OK;
 
-		/*
-		 * Clear the flag before adding the device so that fw_devlink
-		 * doesn't skip adding consumers to this device.
-		 */
-		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		/* pdev_parent may be NULL when no bus platform device */
 		pdev_parent = of_find_device_by_node(rd->dn->parent);
 		pdev = of_platform_device_create(rd->dn, NULL,
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index ff75838c1b5d..17cd417f7681 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4761,11 +4761,6 @@ static int of_spi_notify(struct notifier_block *nb, unsigned long action,
 			return NOTIFY_OK;
 		}
 
-		/*
-		 * Clear the flag before adding the device so that fw_devlink
-		 * doesn't skip adding consumers to this device.
-		 */
-		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
 		spi = of_register_spi_device(ctlr, rd->dn);
 		put_device(&ctlr->dev);
 
-- 
2.44.0.478.gd926399ef9-goog


