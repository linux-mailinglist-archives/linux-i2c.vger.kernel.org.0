Return-Path: <linux-i2c+bounces-3824-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB588FD4EE
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 20:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A66828AF29
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 18:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C5115E90;
	Wed,  5 Jun 2024 18:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c1tBtF+y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27527195FC1
	for <linux-i2c@vger.kernel.org>; Wed,  5 Jun 2024 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610436; cv=none; b=rOvU4qxEtoa4gXoe1uJfAfvAyts+DRmzNVTT4EIGHVNlI9AGRbgqTczhLQePLHqNI1uNTHKkacenHhXZic7razcopINTDb7saXbCgw/mP+zOADzffD6zaDyl1+tE4oNMPhX9H14CHjVRe3bbEi+4dDm9lLqZBFR4iKbjR+e6vmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610436; c=relaxed/simple;
	bh=1Nr1idmwpwCu952z8yg01gYhGFCoooIcYkAZZCQGY7A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qTHrQ6eZCH+HoJiJWujLhiR5cHzE9qdIaFH2ffTKAIE2B4Uh39mBaiUhS4ucubYsOkydis2o/M10S1u/b7KtGRA0Q74bpDtxiaos21rCd+zlrrHC5dtmlaCUqoJm3Ugs5aq6naokz4rWw4xj+WUn6t/RMdU1f+I2wPotTtqw7mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c1tBtF+y; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-627dd6a56caso262557b3.3
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jun 2024 11:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610434; x=1718215234; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVw14u+NFBf2FJ7HWAHlLpDDoc6dqDnKHHZFCo9Dzmo=;
        b=c1tBtF+yJ8uoGUqKF3NY2+DNv0U+YbN7XP5vEddV+WJ7paLKxOEOglfOFz182dQWhI
         TpkluWnQxtAvQfp05jLsz4zT9dm3xfsdzDHh1yzr8/nmaSz10c9q8p1TSIS4ycb9XjL4
         +kZT3Co4WBmgkH8T5xB5TRVYwTeQD9Vt+Y49WRFALEILqv0lqjfHvGNKs5cdrawGsQq0
         zlcEIgFN0D27pd2iV8Hc8uPpS6COn5E86LdPT12ToZhOr4ISvKhsf5WLKdzwsRexu4qm
         8nydig+D2wj90/ixelEJDLBX4o3t/wkbBmdzYkGeDePYPMVOnQXT2td5EkySC3qAkgu1
         qPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610434; x=1718215234;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVw14u+NFBf2FJ7HWAHlLpDDoc6dqDnKHHZFCo9Dzmo=;
        b=Qvic2UgznRMfSV0AZtBZYr3mybNTXT/8tglqHRVVdmeztsqugsbhcLNrMA55CLVJHK
         OrptvjL4Qx0koJXHbobSZ6gwsWju2WiDg9uMuXbytvU5cch3yR1CbpyOPfNaS3nkOvuw
         g82uN6bW/c4n/Jji4Njh9TkSVpGUhmK3z2GdYPvCzOIbgDs2q47tc4u1ix0qiAnn9OTc
         K5UGGSSsEQbuFgSkVdMEBveztj4a0nQvsH65+jFmi1q2ABdgicjs/ITbYTiGGquGTqd1
         dhwoMnhJhTmTr61qCW2QDlusPaYuR5Mpi4osHcntYTikHEk3gWaTRIqvdKTCz013l7Hu
         4Zxw==
X-Forwarded-Encrypted: i=1; AJvYcCWksTz9rb0a1QX7XwhQ6XNr9FvI4uKPydZnyyjcYIOPo8dvg9+8398lFoMTeA6j+dTr52hljqNtAX1jeyZrgjayn16L00R+IxmM
X-Gm-Message-State: AOJu0Yy3a1e6gEUeaf5etX/Bbmy/wt3eQm34GtlG1awzO73AcoNIeDVv
	PaPkxKSDC6DtDL/wqXPzMgqH7W3mVxF9/oOdHmsSJL74To3pq8qFNf9DLNUWpCBW7Qql9q+ZFLd
	rSHeZG3HN5g==
X-Google-Smtp-Source: AGHT+IFNKfAUW4OMaL9qXpdep3tJtwg2SPr15+NfVtMPZB9WLEiwmeB7gCF1Z3uW4GFYC8/zL1lL4yiz6W2izA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:39c:b0:627:96bd:b2b with SMTP id
 00721157ae682-62cbb596fc6mr8752147b3.6.1717610434368; Wed, 05 Jun 2024
 11:00:34 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:52 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-9-joychakr@google.com>
Subject: [PATCH v1 08/17] misc: eeprom: 93xx46: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/misc/eeprom/eeprom_93xx46.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/eeprom/eeprom_93xx46.c b/drivers/misc/eeprom/eeprom_93xx46.c
index 45c8ae0db8f9..5d618a13fe5a 100644
--- a/drivers/misc/eeprom/eeprom_93xx46.c
+++ b/drivers/misc/eeprom/eeprom_93xx46.c
@@ -79,10 +79,11 @@ static inline bool has_quirk_extra_read_cycle(struct eeprom_93xx46_dev *edev)
 	return edev->pdata->quirks & EEPROM_93XX46_QUIRK_EXTRA_READ_CYCLE;
 }
 
-static int eeprom_93xx46_read(void *priv, unsigned int off,
-			      void *val, size_t count)
+static ssize_t eeprom_93xx46_read(void *priv, unsigned int off,
+				  void *val, size_t count)
 {
 	struct eeprom_93xx46_dev *edev = priv;
+	size_t bytes_read = count;
 	char *buf = val;
 	int err = 0;
 	int bits;
@@ -158,7 +159,7 @@ static int eeprom_93xx46_read(void *priv, unsigned int off,
 
 	mutex_unlock(&edev->lock);
 
-	return err;
+	return err < 0 ? err : bytes_read;
 }
 
 static int eeprom_93xx46_ew(struct eeprom_93xx46_dev *edev, int is_on)
@@ -258,12 +259,13 @@ eeprom_93xx46_write_word(struct eeprom_93xx46_dev *edev,
 	return ret;
 }
 
-static int eeprom_93xx46_write(void *priv, unsigned int off,
+static ssize_t eeprom_93xx46_write(void *priv, unsigned int off,
 				   void *val, size_t count)
 {
 	struct eeprom_93xx46_dev *edev = priv;
 	char *buf = val;
 	int i, ret, step = 1;
+	size_t bytes_written = count;
 
 	if (unlikely(off >= edev->size))
 		return -EFBIG;
@@ -304,7 +306,7 @@ static int eeprom_93xx46_write(void *priv, unsigned int off,
 
 	/* erase/write disable */
 	eeprom_93xx46_ew(edev, 0);
-	return ret;
+	return ret < 0 ? ret : bytes_written;
 }
 
 static int eeprom_93xx46_eral(struct eeprom_93xx46_dev *edev)
-- 
2.45.1.467.gbab1589fc0-goog


