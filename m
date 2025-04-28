Return-Path: <linux-i2c+bounces-10656-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65006A9EDDD
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 12:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 923311895FE5
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 10:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1280266F0F;
	Mon, 28 Apr 2025 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/fXyNrp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7848266B51;
	Mon, 28 Apr 2025 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835937; cv=none; b=riJzlBr3HLRPaN3qSxyrJof2ww5lLhsQnhBkBLlgzUE63oCH/RztaAgGxgWrMS8JXbjSZzgBEAZzLb0Be3IHmpJ9fSQP7g5moz63O/oas4OcwKfSSxlPF/N0GwzyvR72yH2dX/4RoK2lk94NLrlAexojE7KjI/uvcjLRgy0A4Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835937; c=relaxed/simple;
	bh=lwACmgXhQD+tzgJ0hc6gipEhe/kru3W3qwZuI/ILClo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnJRrMfyB3NWsv8Z9IsSFMPibQYJvHPOrkXcr3/V7imFp+D2IuHQL+R0NbkLqs0olwAQBtU0pXbfG0/E6kFdcfAWfsNP96hPavDhdCujKTRkdoUKchN8ZewFJSx1rLdNvXBloi0HyyMLji8rKl6q/STzRrseJZ88wjKtCFMznAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/fXyNrp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-440685d6afcso45486235e9.0;
        Mon, 28 Apr 2025 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745835934; x=1746440734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbTF6ua32Y722MNUPKroCHG5m/IpTQogIDHP4rO2RZw=;
        b=M/fXyNrpNG5nojuqINyfPCjUJLGjs3kas4+M3/cJFdGXu0xFqktnB3uxBeXPKonm4d
         xIlHzATy9WboLQYCdO5VRL+rUi13MM5jbfe+XmvX/glj0nLslq/U0D++3gxqdO/pWE76
         uf1S1B8o73q9ugEZvh8t0kf2srG9zsq8l2OzuJ9XIqXdTorAPChxZTESYw78OrHle8gP
         MBu3mTLJJ8X8lZVYCE4xGn6ByPAccnEHVqPduPs8EzWV/rPGAfPw9SyTcdJAvlQpIn6w
         OsCCZmy4DodqeWT2Fxp8tM8dQM7JKfMs17ir1yZFMetlWoPDvq7GeM7B/3XV62h6pVwl
         WGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835934; x=1746440734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbTF6ua32Y722MNUPKroCHG5m/IpTQogIDHP4rO2RZw=;
        b=Z9AJ7/0H+6hqqZZHpE4QDbQKCFaK1KppehRBw/m+1dlAu0sYVIJQs67HLJ4A2q9s4S
         g8knMyM0dowi0t+WsH2po4XIZXFgbsdCq8pLzWVJ9+mvCrEl9KUuoqWWAcSZAsEA74Oj
         IHW1lWficLGOcF+YmBGLjV+h9nSrHnjreUtSHlU74dhgp5CJO3VBMYz/Ou3U9/D5Pt30
         Syv+sbUIWBdMlmKXWZcG3N9ru0N8MzjMN0fFqy/PwJhlVN7zVpDXwfn9FVpGsZ3j7UFz
         PYrLcOkDEkgpo21t8ppHTC7XLL01A5b/4BLCJgM4epRu8NS/5QBIB0rTBngfSKHdwbzu
         OKRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrO5XN7FTQbCLdR5FIoHiiBmsQ68TNjjg9PByACIe0kLCWuUaREYS5qwTiTmecUIQPmZ3wyIf2NGc9nT4=@vger.kernel.org, AJvYcCUu85x7jEheUkQcvW59Wq8lS+DbwKgtgck1s2qM+2NIKYutlB8Dx1xuMGzPZTNVaYVkcaJHDAEg3Pk=@vger.kernel.org, AJvYcCWhN9dPr3ODb5shseX0TTO/BCSK1Z+80cKXvJE+BhzS3SmGjHMIBQpCwqrw6p99BKBUQFpCdZFXBwK01dfV@vger.kernel.org
X-Gm-Message-State: AOJu0YwdrhRoLjlogoVG610xnbufTmFdQJB01cfPgM3VGTs75I/8vChN
	oL5JyYDf7EhFt0AYp8jKIs8wny5D4/s161g6ji1+RRPLveEMvchh
X-Gm-Gg: ASbGncsXxfUHyTnaHTrzehnr9biFbc3u+X8bmy1HHs9zSixbo+7BiN79rdLwD5ui5sq
	+5IY4HpFnGV3na+jgUH6+49WvhvMwmZqSj38xzpszzsknar20mCIeMkQsvoAIUgTNATuwf2v1J4
	CYmMabgUXIX1nEeMsug/TKPS7RVj6ZAagspxqIfAzSNhmddeB6aOdTWNUQ0MMFBfvRPsdeq3mO2
	+zfjfde21kJ1/uwiR8ioFdjtd21UY7qpGN/o+ClEGkRSQ860sqwvN6N38TaJZ3bqcDowFDFMkT5
	RSHu7CYb+610VXPjuQyhpLWR4TzIdc5cACpeVZPrlKu5tZz33ffj
X-Google-Smtp-Source: AGHT+IFEAJ/VB+ejxYIPdRRIC1nA3G1qjQfI79CFFUukorfMXL1K4EJe/ml/69E45V+o8vhZOPPJMA==
X-Received: by 2002:a05:600c:4590:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-440ab87d118mr63426845e9.33.1745835934049;
        Mon, 28 Apr 2025 03:25:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm118825295e9.21.2025.04.28.03.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:25:33 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 6/9] i2c: atr: allow replacing mappings in attach_addr()
Date: Mon, 28 Apr 2025 13:25:11 +0300
Message-ID: <20250428102516.933571-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428102516.933571-1-demonsingur@gmail.com>
References: <20250428102516.933571-1-demonsingur@gmail.com>
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
index bf7b2ac5e9cf..7214a59ddf15 100644
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
2.49.0


