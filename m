Return-Path: <linux-i2c+bounces-9653-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D914CA49D1F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 16:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B3321896980
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 15:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCFE27603E;
	Fri, 28 Feb 2025 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6QGqm/+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE7E2755E5;
	Fri, 28 Feb 2025 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755869; cv=none; b=UoPrDE9rGKDv/awVOBbJymNx4adJtCMDqUDvmn903q+p2fo4YqYE0N0Lhyi940J9AHnQ2CgrL2jIU9RUjlvSItfEmCWm5BGybTT5jeiJ121XC+Xbh7AmlNi8cmbyxZ2KRVCeVoSAZ/xpaD7itVrfV/qJdOp/KCZ9hjyPvlPNkQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755869; c=relaxed/simple;
	bh=/W/QZFcRBnIM9b0Jt8Kw6hZJZD0btW20G7HvSU1nKE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FExhsIRcsDLH1Mk2jdLVV9f1uqIbsJfSCRMKOBSp1VK4maI9aTXeVTY3IboIbbRbsP1OErD1ZerOCw8bz6u4pN50qi7Sq6DRfoSlSD+ycF98OEd8ASAmYAWuG5gOVgjTlwFr/qzC4I8o0dOO43dOVxGY3kbJJdZIP14k/7aAnrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6QGqm/+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-390dd35c78dso1773449f8f.1;
        Fri, 28 Feb 2025 07:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740755866; x=1741360666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTVzPUIvmiDHrwsxbjyL6sD0GFnHJnYahl0LLE8iGaw=;
        b=M6QGqm/+bN9pw+mhZAsAucr3/PsuNxBdduDzi1P7wpOqLwNodoYR+XdMzPjg6rNXOV
         UR8nJhL0UvKRYM6wIc9Z8fXner+O7fByk0loqK5hPN2VsNOSlOpWNIS5NiePfayL6KG6
         41S0rlMzCrfK0MBmXL3YvPQbCgGSipzYvxxDQmWOWPu4rvIGue+zEq+KCQd8bun+GDQ3
         artCZ1A5rg0XvlnMLZeuFF44oXwWDMZ8kU84Bw82fFI/ooSFhujUU7VZuwgjcyAKfMge
         YuqarCp8728npCQWwLANBg9rkf7i9uQL8eR96dlGKKvdWpUVi6SKo5SN+cEpFlBru7BR
         kI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755866; x=1741360666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTVzPUIvmiDHrwsxbjyL6sD0GFnHJnYahl0LLE8iGaw=;
        b=XAjlCM0vC+vxO/V9w8y1HRW1TZV7/9hBREIrf0mld8aiLEStjmqi+B0o5Nhqb3eXMD
         WHY2fpcA/SSHXwupP2xrO/x1nK6wMG/d52NIzVNozCyjp8n/JJxv0uTwcBUBXdg8uPxO
         8UCp0AJ8bBUi+GWwL+7DI3qArqEhl4tC0BV0GPgVc8OM5agkLfzxpprMtc4nTaL11NA7
         e9h7p3C73z5HMEkfQo+miXTIkg3i9y3YbPLMlaYOMFQ9+IcDCe7ZUDP/MZ+GuZJu0CUx
         ON2EiMhIElSbpsB+74Ziyq7dbcrf8Fr0vGfIxVGiJYeu3e2djDhmk7mkCnZMgekRfqOk
         ualQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvpvqmhU1vx/apqMP1ywOcT/8erVe9pY8azzOoAc/sk7KIdPVN+28ZkG5Frt81UnHk5mg96DjUroo=@vger.kernel.org, AJvYcCWUzkL+4mQ4QuSTO/QBB1KF87E+GsXLgVgyGgJeKZfUA7PcGCOPohWmbOqTQlDyVV7oVa2bGGsqHlKn2EO3@vger.kernel.org, AJvYcCX5RrNVjJdojTECwh3bon4GOEwomrvsXlm+FQ1hJhaf5UL8XSn3y4y8dQpX4LPepoh6pmEeyFPdpK2+sU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgMPTmYVDMfEsmKr5WUwQf3J+EKNlbMlUmjCwQOUV1qluwQ36Q
	XHS/SnIT5H1iBIXY/CxQ7pPIaNiO1EI1mGwXBmpvqzONPi61FO0C
X-Gm-Gg: ASbGncsixDxsMKlQAox8/qxne/KVX07bcmvWuM/Sou/dDVOBRFx6NwQgCffoeHnezYC
	V8hooEPTMyjxopWU/8FAPXRAeZua1Tmtnmb8rEdSKaXZk+ypTqEXx4ttERzK7TQv/6TJRccQ5bK
	lOh5/KwDi7iRUek5mTdoOAVYSMWMrAVUv0Lrjjn8QmASAMnrpIFAc8S2okjWtYrF+XukZ5jomU6
	nVjCV28/5O5pxem8nsmxc5N6wB5Dvxnm4FMPd23g5kg1UTD/crOnw3QLf9ANxFlsqQztoWjwzDG
	PIXFYNbi1xb3RZHtsp4fPefwfIro9lP1FrLKNIU=
X-Google-Smtp-Source: AGHT+IHP4tiUoF4VE5t8yqErlXRDEFrKzeoMsISgTFum/RclAe3Oe9nIDZoIagq+j0tO+qyJdJM/YA==
X-Received: by 2002:a05:6000:2a4:b0:38d:d533:d9a2 with SMTP id ffacd0b85a97d-390e168d3demr7509038f8f.13.1740755865717;
        Fri, 28 Feb 2025 07:17:45 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm63096825e9.0.2025.02.28.07.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:17:45 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 6/9] i2c: atr: allow replacing mappings in attach_addr()
Date: Fri, 28 Feb 2025 17:17:23 +0200
Message-ID: <20250228151730.1874916-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228151730.1874916-1-demonsingur@gmail.com>
References: <20250228151730.1874916-1-demonsingur@gmail.com>
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
index b9d63efce8e3..80a76fe4bf51 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -539,6 +539,9 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
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


