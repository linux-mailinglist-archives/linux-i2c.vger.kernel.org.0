Return-Path: <linux-i2c+bounces-4391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F13D91A4D2
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 13:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA9C1F21E68
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 11:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB57C14A0A2;
	Thu, 27 Jun 2024 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lYJfzuvK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AEF145B34
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486914; cv=none; b=cGBgF3XKhXIr/XPkuK480Xkea6vk2BIPu4HpuOZzOX563qucaFl5EJa/4EkVHQpkH8YE/t/73yaWZADge4Kz9fqaCzXvOHIcUVgaX/Ooa6+ISx1BV0u0wUwl2nQjnstWScwKN7VGEVJLKfF/5SDlMEMjaKJeiLK2On96FY5p0Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486914; c=relaxed/simple;
	bh=RAbZbjeBtc6a7qu4AxdmmKvnZivhLbCxSUQNFtQiqM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HV/sMtHQxtdGktZh+l+EIMKQju60lbbGLNXyBI5+8SiypF+kGjBxuiC1a58/rBKO9dkT02pyut/D+66ulHaX8+tjjX/DCdYJ+tead7iIajYVE2AA8jGNSL/5mbqDzZhrwfLioW7n/4d6cgsck6lQ1btXTFGCAJTVh2RxTPZzBFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lYJfzuvK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=KluZUpbtf9AhXUF1zfxrw1TrFjuQLu2ulyUBXImrMrA=; b=lYJfzu
	vKdllx0ND0MeXG4Cvb5rcQYYZKk0B0U7KLWUN6KpWlS/YJ6kG29BEQ7Psdm+nJ49
	hixcyY4AywFTlpbJXhO67uzYggOpZEPga3fHyJEEZxTTPf0FjYUjX7+mMjJn6pe8
	Vq0bISRWTkjJQQ8zlAbt9qaQ549FrFyqhKgydyE+Sz9UKV5Qb8rrWYKpRfnabqih
	LXzohesDzE+iLXMf/gX/46vDN3dauzEtYNcSlYyIZO/utzIC2XCYxLBKVQc3jLA+
	58udCzZjqpqckq/Efzmr8/Gzy5cELejBPNVuRd2u6TiZiBgtyyL15iyDQktV9VIi
	hAxtHSzRhJbYHHXA==
Received: (qmail 884566 invoked from network); 27 Jun 2024 13:15:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2024 13:15:02 +0200
X-UD-Smtp-Session: l3s3148p1@NUn7Pd0b5MMgAwDPXys0AFWnEn9dr4bp
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] i2c: testunit: don't erase registers after STOP
Date: Thu, 27 Jun 2024 13:14:47 +0200
Message-ID: <20240627111445.29751-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627111445.29751-4-wsa+renesas@sang-engineering.com>
References: <20240627111445.29751-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

STOP fallsthrough to WRITE_REQUESTED but this became problematic when
clearing the testunit registers was added to the latter. Actually, there
is no reason to clear the testunit state after STOP. Doing it when a new
WRITE_REQUESTED arrives is enough. So, no need to fallthrough, at all.

Fixes: b39ab96aa894 ("i2c: testunit: add support for block process calls")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-slave-testunit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index a49642bbae4b..a5dcbc3c2c14 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -118,7 +118,7 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 			queue_delayed_work(system_long_wq, &tu->worker,
 					   msecs_to_jiffies(10 * tu->regs[TU_REG_DELAY]));
 		}
-		fallthrough;
+		break;
 
 	case I2C_SLAVE_WRITE_REQUESTED:
 		memset(tu->regs, 0, TU_NUM_REGS);
-- 
2.43.0


