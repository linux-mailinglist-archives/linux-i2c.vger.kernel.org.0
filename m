Return-Path: <linux-i2c+bounces-15285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E07D3C3DC
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EFD5966A7E2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8918C3E9F71;
	Tue, 20 Jan 2026 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="q6fD+OKt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFB63D7D8B
	for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901311; cv=none; b=L51yB/Tt50DymgSNw6DrZmcqPaaK13sSzT22sTkU2Ojc9pNxg80dvUWFOXs7DcD3jHrTuUNPnbw14gYQrRUFlBMqDbWUSZf495XD4gFxbK2q1CXF16i9RXxIllLmqRk986B8KY6GKvtKELsBDwPtL3vKlpsdV4p/8ryQlkgidlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901311; c=relaxed/simple;
	bh=PVjM2PNzXGXwoYiSLYJT3sWx9HO/aEYFc1+gwEBuGe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kMFs5b6fhNXCmGhLYKlmjHOueuWvEk3tZvZ5/e9GIVr0SeUS+XwPrkUyMWSoMiXmVk22R7ICB24pOoCUGHD3CdmPlNBgowidbIedwxTzrZunx0W+l8zKIUQCN2c4Er4ZoP+4roXUAXqUkpnVkGZREvDvfmMFrRMdpSj39Oyo0YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=q6fD+OKt; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AC9841A295B;
	Tue, 20 Jan 2026 09:28:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81052606AB;
	Tue, 20 Jan 2026 09:28:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5425F10B6B33B;
	Tue, 20 Jan 2026 10:28:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768901306; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VRA9vpqgY5ftQq8JWOqSr8fWfVsmED17ACQSBqKGVlY=;
	b=q6fD+OKtVoDjdR01g/HeINntblYokHPqJ/Akd9NQzo4Y3pgCT2VXO1KaaSjciKBzR/VKCu
	vGar8Gchv4TlpDzeqTWUpSn/aDruYvbelFx6Qq5+40l7MaC0n0/yQNmQT7eux+sYONrNPE
	u+sQFISobo/879jwOdKWMCcnmdUYRQ/jC5Tz1f+aAwQHpHcNXpG5DvnNQoRQxY/jwo1hmX
	LNC0muGohnHAKJHbQMJS1z57n5ZHveE2Nozo5jjvy6zSFqUaybKihQ6hfCT5Tn335Tpugv
	amz5v5cX0HE6Pq0wKIGArYY199UXsPtjuRf9wkOuLaNg5pEdjQzOD9PPHHNuUA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 20 Jan 2026 10:28:05 +0100
Subject: [PATCH v5 5/6] i2c: designware: Use runtime PM macro for
 auto-cleanup
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260120-i2c-dw-v5-5-0e34d6d9455c@bootlin.com>
References: <20260120-i2c-dw-v5-0-0e34d6d9455c@bootlin.com>
In-Reply-To: <20260120-i2c-dw-v5-0-0e34d6d9455c@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Simplify runtime PM handling in i2c_dw_xfer() by using the
pm_runtime_active_auto_try guard. This adds the proper handling for
runtime PM resume errors and allows us to get rid of the done and
done_nolock labels.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index a0ff0e2db065..ebebd8e0409c 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -912,11 +912,13 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
 	dev_dbg(dev->dev, "msgs: %d\n", num);
 
-	pm_runtime_get_sync(dev->dev);
+	ACQUIRE(pm_runtime_active_auto_try, pm)(dev->dev);
+	if (ACQUIRE_ERR(pm_runtime_active_auto_try, &pm))
+		return -ENXIO;
 
 	ret = i2c_dw_acquire_lock(dev);
 	if (ret)
-		goto done_nolock;
+		return ret;
 
 	/*
 	 * If the I2C_M_STOP is present in some the messages,
@@ -930,13 +932,15 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		for (cnt = 1; ; cnt++) {
 			if (!i2c_dw_msg_is_valid(dev, msgs_part, cnt - 1)) {
 				ret = -EINVAL;
-				goto done;
+				break;
 			}
 
 			if ((msgs_part[cnt - 1].flags & I2C_M_STOP) ||
 			    (msgs_part + cnt == msgs + num))
 				break;
 		}
+		if (ret < 0)
+			break;
 
 		/* transfer one part up to a STOP */
 		ret = __i2c_dw_xfer_one_part(dev, msgs_part, cnt);
@@ -944,12 +948,8 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 			break;
 	}
 
-done:
 	i2c_dw_release_lock(dev);
 
-done_nolock:
-	pm_runtime_put_autosuspend(dev->dev);
-
 	if (ret < 0)
 		return ret;
 	return num;

-- 
2.52.0


