Return-Path: <linux-i2c+bounces-13424-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA3BC8473
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 11:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 959573533FE
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 09:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3BF2D6400;
	Thu,  9 Oct 2025 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="iy9PI2Rh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay02-hz2.antispameurope.com (mx-relay02-hz2.antispameurope.com [83.246.65.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8EB2D5940
	for <linux-i2c@vger.kernel.org>; Thu,  9 Oct 2025 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760001727; cv=pass; b=MFd7ZEMHzfOVsEr/BBqNdKN0CL2QrKJxvXMncQ4QSmNYho2MuETHEKTNEbAb+D2/cKIqDnTQ6TIqYXMv0fCA+mB6V8qNnP1mQ5wOPYvBIz0m/Io61zJo4KzKx48beTi8WW9BueK4fF+YmEg/atBLqCB6lCZqTHsj/nd8vRRJ4zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760001727; c=relaxed/simple;
	bh=vfVoUbsJPxjF9vK6+vSGFd9S12aVkH4YrhnG7Hat7Tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IEd20rHTnhGFNSrBfbeYIjS6nt9wnZ1Syr6taqTkweyPc4DNNBAMbXZTFPEKaUD75hxo0l+ST+fRqCM97YUiyweNCCVyz3tkVXIjEJggMra78zaTZMTR1X8Dt22cpu3zlGBej0mFAZtWWAXZiVhYtdmhqTAkNagFhQ0QAL8ufc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=iy9PI2Rh; arc=pass smtp.client-ip=83.246.65.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate02-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=j2KTnFVX0/Ht3bAv3F0U0EBuYjoq5BsfMsWeElo5MCQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760001651;
 b=NoBgYatppEcN7VGIg0umKV5ENEjkI0wDlWryr0cc/iPu0lsBviJsjyAKwTKmwYje7Zn8t5Ny
 CsQNoVZs1g1ns37R9tV7JnG7yWVxnYK2p6L/LMEJbqy5uwS+n6p3fiKxnNG7tASDZcrOhlJYEAC
 fryOlb1AQ2Liqj+sgAFgGJ4KByzuQTycGSWiCoTkETBJXkScuY9MH14g3JRps+km2fciQmZlZgn
 8aTVWrkUUZLdK0ELY2l4Qsu8YljxpabhDwQ5qPYxV5Ga0syAA8eR5A9RyyiPpktKa+J41KfDZ4n
 qmcoSmIIaSBepYqqxN5JF4r4J3WWN0aE95Odiv3AtihkA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760001651;
 b=AsGx6QlNq+elteKXm+OyupASfntxIDvg5NsW2FQzyp0A3ohJ3Z+TOGCvr2Ey1orzDUZYmbZs
 m+zvEk4b8Ous5djrXN78x62JJbdEiXZz7banr/nLgCX37uYnbJO9NI1fO7OpXqRZqwuNqmx1iy0
 ZlRG4XEKOKQQwZgGPf3D94NbEoNZC3vRlnUM2SQOxfaahtL6/HCQdvkWSbEwg/v4tM+oQHESim/
 PfizIAGtxP04su7IUI1kxgsfgIGARPCqBdye3TZi6Xfo2xLhU354hjYBqM6Z9XNAzCOm88S7ru2
 b3iOpMMiB9t+1fVE7NNBlHufpV6D4UIheT90EXmyVKq3A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay02-hz2.antispameurope.com;
 Thu, 09 Oct 2025 11:20:51 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1D4642203F0;
	Thu,  9 Oct 2025 11:20:40 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 2/2] i2c: ocores: respect adapter timeout in IRQ mode
Date: Thu,  9 Oct 2025 11:19:50 +0200
Message-ID: <96e4ef171bc710abde215c50dd5dd4fffa98a2b2.1760000254.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <51a72ceca0154d7be85c3cc67722e7dd0b364a2e.1760000254.git.matthias.schiffer@ew.tq-group.com>
References: <51a72ceca0154d7be85c3cc67722e7dd0b364a2e.1760000254.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient:linux-i2c@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay02-hz2.antispameurope.com with 4cj49N4YBhz2gY89
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:54112139bb7784269948007813f8417d
X-cloud-security:scantime:2.393
DKIM-Signature: a=rsa-sha256;
 bh=j2KTnFVX0/Ht3bAv3F0U0EBuYjoq5BsfMsWeElo5MCQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760001650; v=1;
 b=iy9PI2RhUGahqtZyKReKnk2CmjcDJSkLBdlhmdowZrPMfMSMGhpaFPQgtGM1Qgu5A795WcDr
 dSfJ8SpyQrk4JkLwzaRZLHC8Rv0cRYOmBuF1v/AVzVBro15/FTMeCj7vwsef5GTtKIgz+QEmmlk
 I/1OB6H5cMiZIoU3SGKeD3KCNdRZVuNew0xVK3cWpBJ5kHAa7uzBwadBl6i7WcL58OUEextg9aB
 ZbKVDCrlGlSGRNThdM9m3v36AWatsQfZPD5SjSyvphnmmETd8GfJrYODZkEijm2UyXXgOozlOKu
 5yfIVfP3mesu1uerL+VVp0St+gR97rRZCvxP3GW13ioww==

While the timeout field of the i2c_adapter defaults to 1s, it can be
changed, for example using the I2C_TIMEOUT ioctl. Change the ocores
driver to use this timeout instead of hardcoding 1s, also making it
consistent with polling mode.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Acked-by: Peter Korsgaard <peter@korsgaard.com>
---

v2: collect acked-by

 drivers/i2c/busses/i2c-ocores.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index c4587194d46be..4a8ce167a3d9f 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -383,7 +383,8 @@ static int ocores_xfer_core(struct ocores_i2c *i2c,
 	} else {
 		if (wait_event_timeout(i2c->wait,
 				       (i2c->state == STATE_ERROR) ||
-				       (i2c->state == STATE_DONE), HZ) == 0)
+				       (i2c->state == STATE_DONE),
+				       i2c->adap.timeout) == 0)
 			ret = -ETIMEDOUT;
 	}
 	if (ret) {
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


