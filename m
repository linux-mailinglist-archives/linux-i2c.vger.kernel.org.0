Return-Path: <linux-i2c+bounces-14053-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA25FC4D808
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 12:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C192E188D1DA
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 11:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C88B2FCC1D;
	Tue, 11 Nov 2025 11:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfUMWiw9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AB22D97AF
	for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 11:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762861572; cv=none; b=rDrojUZxxtRtv4IinW77KGZLkxSBq3Xgc8J6youjrKB4cIi4kk5V7dXt7SmiL4dh3dtEDgxji9IKswxgiwrAk28Zzew5f8BzkscJ/VkIJetjYM39F3/E4aJ2tE01+cNky1TUqlgj/n7Rpun7Ccfr6egHRKoH+BrVd4G3Om10Ai4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762861572; c=relaxed/simple;
	bh=QLE37qHb16MxJwLfO98cvkKdsqbnXD+8Goev9NBW4lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dh+Y7emZ/fbtvOq1DUxTsb9FEsWKyjQtrznmJsYCC3crk78mUE9Sz9q62MHKQdrop6TUe5gs0iIRss79riWnMbsiTpC3OqKltJ2zV0L5XXueJ925gcPXIt1dXQ6iI7aT9kHfHKztRd9MNyIdr08pa3HHPZajZoonXsS/1QYwE9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfUMWiw9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so7045980a12.2
        for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 03:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762861569; x=1763466369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5PjBGS/A4kqi2mZ597aONLcrFQt1TO2e84Jges2BFw=;
        b=gfUMWiw9sXpsa23MBB5TzMERB5ximkohS3RutksRwiZ3qwCif9fpUZWga1TCBbUiu3
         DPDOyesofNx1UUXwBNcM5gTCacYvfkOMYBjbkmngGwKa9FQZ/0szGvpQ867q0n1lydYF
         ApfVETCwOKieriElVgDY95cUrwXEc0jYyOsjjC5l87l8R6c7p6opXKGpfROvCSvFcVWC
         Sla84tPR8B0nAJgcmgsd85R9g41VMSkfixuV+Yt48LXnkiElSL+/qhp9E9ubIPE/ubs8
         2KRri7m1FAlW0t7KhKAnOVZxr3cMA0EZx/QHsgDhXsf0+B6MUoTeI5BpbAKIh/VO2vrW
         bfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861569; x=1763466369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5PjBGS/A4kqi2mZ597aONLcrFQt1TO2e84Jges2BFw=;
        b=B5u+SH0+R2NmOCGNNsINO1gmuqYSpeTR+AyZX4P6iA7ypl5WZ2HUYNpu0qmQwnJALR
         FRIt7MBh0OwWrfRb0y9f9bOv2Slx56BdXT9RwCPDd52n7WQlrCo64CtOEFUlGi8WrO9b
         2PAcfU4tdJESoPyuvIgWyGr6tCSK146z76GDPh5aGjRgNVspl+8Zx4ChM9ncyxedE/28
         B5/wXLw5s9R2htxApOh8a+ypogZoezfZ9/b9P4IJQ1PCf0YhZq0zVTXTBqIcJgFJVgco
         x+PTNHPCOaZc+fGB/fqvNaVEmFb0x4JfbP3PEROlB1kToeJFJl3DT+VkCtyKjDbOHrB0
         Q8QA==
X-Forwarded-Encrypted: i=1; AJvYcCWXSi9wrwRV33DXuimwWceIoGUPIswL8FZjbFdXyaKhB+IWIELPuCEgab7a5fB4I6vDECMHmla0hTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyCTUirc+NEwGc9MKqs637IOB8M7iRH6DYwpsTpNMpSofZsHwQ
	YW+6gUzKp7OGnYZ/zm0jlFupD8Qzu3Zc2Cg29MQVWu7xH2aLGI2foqsu
X-Gm-Gg: ASbGncsY1eDxeWSJjCLeqpd86ZVZ0+PpWQaf63bk4+mccPoNY40o8w/+IIj4gP8Gtkh
	RmMQCIkxFoFIEsI1eYMoL/PYVLBylPEA155E4n03TkHAuhPtcq1qxmSWgibrqZs8MQ/VHFW/N+W
	pTQFoOa2sKokJxI1ehQOpWNVIj3sygB1HwyPcO/JkO+0fr1m+lOS8WjSlOO71lXCj5Bz0MHQUUC
	lE2+Tc/Q7oa/bg2a1LsSGb+Ybo5OVWAycYmkw2yRnC++N17GlQoeKlRbEoBOoDwNR6mx8g9nAtb
	Io3ALQFB/iG3c+mrc0btjZP/dKqQFE1x11chEfE0c5rdcvgZDSnx/MOnAmlrUJjhDbVb1PeYBPB
	sK+sBXWQMTqTZoG02KNgE8gQ43aejxC47PjRZQeH8HJV+p+CZ1RmY9DB2UV7mr2HY6zQD8UXD59
	5hmx0XyDmHijiIfDOEXw==
X-Google-Smtp-Source: AGHT+IHMw+7YllRho8le91BKAe8wJ90etB++mcoL/7134mHZqS0c5es9GOuXcOqsBUjYOB7fZBdmbA==
X-Received: by 2002:a17:906:600b:b0:b73:278a:a4a4 with SMTP id a640c23a62f3a-b73278aaf46mr100831366b.16.1762861568456;
        Tue, 11 Nov 2025 03:46:08 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72fcde0779sm682374466b.40.2025.11.11.03.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:46:08 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: p.zabel@pengutronix.de
Cc: a.shimko.dev@gmail.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com
Subject: [PATCH v2 1/3] i2c: designware-platdrv: simplify reset control with devm variant
Date: Tue, 11 Nov 2025 14:45:57 +0300
Message-ID: <20251111114559.3188740-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e3c2096459bdd0c1d48c00a837cc7f8c18044631.camel@pengutronix.de>
References: <e3c2096459bdd0c1d48c00a837cc7f8c18044631.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation uses separate calls to acquire and deassert
reset control, requiring manual error handling for the deassertion
operation. This can be simplified using the dedicated devm function that
combines both operations.

Replace devm_reset_control_get_optional_exclusive() with
devm_reset_control_get_optional_exclusive_deasserted(), which handles both
reset acquisition and deassertion in a single call. This eliminates
the need for explicit deassertion and its associated error checking while
maintaining the same functional behavior through automatic resource
management.

Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hi Philip,

That works, thank you.

I also added two more separate commits to improve the driver.

--
Regards,
Artem

ChangeLog:
  v2: Simplify reset control using devm_reset_control_get_optional_exclusive_deasserted()
    * Replace separate reset acquisition and deassertion with combined function
    * Remove explicit reset_control_deassert() call and error handling
    * Maintain same functionality with cleaner code
    * Add devm_add_action_or_reset() to fully automate reset management
    * Remove all manual reset_control_assert() calls from probe and remove
    * Streamline error handling by removing goto exit_probe and using direct cleanup

 drivers/i2c/busses/i2c-designware-platdrv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 34d881572351..c77029e520dc 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -236,11 +236,9 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dev->rst = devm_reset_control_get_optional_exclusive(device, NULL);
+	dev->rst = devm_reset_control_get_optional_exclusive_deasserted(device, NULL);
 	if (IS_ERR(dev->rst))
-		return dev_err_probe(device, PTR_ERR(dev->rst), "failed to acquire reset\n");
-
-	reset_control_deassert(dev->rst);
+		return PTR_ERR(dev->rst);
 
 	ret = i2c_dw_fw_parse_and_configure(dev);
 	if (ret)
-- 
2.43.0


