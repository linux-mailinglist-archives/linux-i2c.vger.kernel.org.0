Return-Path: <linux-i2c+bounces-5498-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9B8956859
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27D90283579
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551DA161911;
	Mon, 19 Aug 2024 10:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bj46Ioii"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E864166309
	for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724063053; cv=none; b=QdutmurBvqSZDjJNGRGTS7dhk4bE9nR7Chl40oCbKm46d8yErtL2o9hNJTo1NxTbxk8VAaRyH1AXPikWOWfrl2Y9EMzub3RTaSprMc9u5fHt2D5r5MjRF0arlIkZAjOfnWBdr6IF5TqIsGWPx7K9mz3u3+eRZ79MqyTdFilv8U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724063053; c=relaxed/simple;
	bh=iuui/HPIsvJlBttBbi1K8qw454aF9AjMuFqri9PZOtM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eW3mSwLaI8ECxWK4rbn8V0jDU+pa/ozWEigJOe+n5yPGaBcVAvw3mEAv3bTzI0kfSDL0hROUzJ3ceurmf/EDmCRwVCoZN20kZwledXkJ5v+Jh6+q9KOTza5RxvVmkKC5cE5k/a9qJw12Nn6tCw6bDJKvwLzfLsIWuv3+6Sv19N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bj46Ioii; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f01993090so4871320e87.2
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 03:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724063049; x=1724667849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJAAHX/Rm3TAMRb2o60KMuYQ9YFxv++1+My4+7vhVCo=;
        b=bj46IoiiWam0g3KwRLvZIFAcp4Z+ZRxIFrwKpj4Bhk9ep7bH3PvUivnfDSMDcCVjB5
         /69ONMH1DKo5Dy0k7yWQWsmSbCYrXT7G7rsOSv7OpTisaqF/aTEf8OUnT+aSvBPERFbh
         uVMFdCD5+Aw5kN005WQsUZ0HYpUnzVIpVXadGDvHjF4NE0O2bJqkHYyj8UFEa84BPBUO
         +oqSOpZdpMB3OXwN3XXJIUTHkeqC+ElDWh1CkPKXCVssUur3M/941deV6O1vNatEt4YB
         de5mN0pH4m21ajZwdXNp1dC5qvgfvqM52l505z8fR/M6KGPVyLrn+ptAx+M5ANkBXKPg
         zGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063049; x=1724667849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJAAHX/Rm3TAMRb2o60KMuYQ9YFxv++1+My4+7vhVCo=;
        b=jAMdmUueVkyz3Qwn8u3u0+iCFGPjh9U/dEg69UMUBVEGUx6hYT8vKytALZSM37TJbd
         vO0werK5ORFvu+wowzbSL7Vdjg72QAFw8S34Wv/OKMrtrIjaQsjsCguxXPsKMZjPHoPh
         mEoWWhRdGoDnHHbTmKQWhSI8FV3DB9wR27/7MmqyvUyfI4DckhivFKXV1GsN8se168av
         Qm1WrvbcGc83VCmQd/uUIhwRPeeWBfvyo585dBG442vsjSRPwQhv7dXiOAt0HD/ksUAm
         2ZJ5Wa6RtWr8bYE1a7ngQDe2N1qDeDnzGmv8c/tK8xj3lWaYbKzFZ0xIpf+h7A6aXMpE
         60rw==
X-Forwarded-Encrypted: i=1; AJvYcCVBTkkzpAnPl63u2eTp+aUsRgHRQKnEvFsTXhLpzBg6XluAwyDM47Ds4AhNK1S6PSA+S2H3tuKbwv1QCSwWyCh4SuK3LJzAmJOe
X-Gm-Message-State: AOJu0YzUehT1h+9unE3jO9nVTxELS1mVhdFk3O3R1Y3RF8p1vQyrYtAg
	Jlb/6kQEuXA53bjno5gZfOsn+LXnKfv94F9Az8LqyEN+0P9eTAf9jcptjxlRMN0=
X-Google-Smtp-Source: AGHT+IF6YLoU4+bdX/oi9H4050Ee34mAfR7HKwspOjdSdAdR1SgAGVkn5mx2EKeRNfJfEy9Yw0Tn7Q==
X-Received: by 2002:a05:6512:128b:b0:52e:9ecd:3465 with SMTP id 2adb3069b0e04-5331c6e4635mr6348525e87.57.1724063049174;
        Mon, 19 Aug 2024 03:24:09 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650402sm106690275e9.11.2024.08.19.03.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 03:24:08 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 04/11] i2c: riic: Enable runtime PM autosuspend support
Date: Mon, 19 Aug 2024 13:23:41 +0300
Message-Id: <20240819102348.1592171-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable runtime PM autosuspend support for the RIIC driver. With this, in
case there are consecutive xfer requests the device wouldn't be runtime
enabled/disabled after each consecutive xfer but after the
the delay configured by user. With this, we can avoid touching hardware
registers involved in runtime PM suspend/resume saving in this way some
cycles. The default chosen autosuspend delay is zero to keep the
previous driver behavior.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags
- added a comment on top of pm_runtime_set_autosuspend_delay()

Changes in v3:
- none

Changes in v2:
- none

 drivers/i2c/busses/i2c-riic.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 6fc41bde2ec2..ec854a525a0b 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -171,7 +171,8 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	}
 
  out:
-	pm_runtime_put(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return riic->err ?: num;
 }
@@ -399,7 +400,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
-	pm_runtime_put(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 	return 0;
 }
 
@@ -479,6 +481,9 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 	i2c_parse_fw_timings(dev, &i2c_t, true);
 
+	/* Default 0 to save power. Can be overridden via sysfs for lower latency. */
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	ret = riic_init_hw(riic, &i2c_t);
@@ -496,6 +501,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 out:
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	return ret;
 }
 
@@ -512,6 +518,7 @@ static void riic_i2c_remove(struct platform_device *pdev)
 	}
 	i2c_del_adapter(&riic->adapter);
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 }
 
 static const struct riic_of_data riic_rz_a_info = {
-- 
2.39.2


