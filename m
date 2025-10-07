Return-Path: <linux-i2c+bounces-13398-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8037BC1521
	for <lists+linux-i2c@lfdr.de>; Tue, 07 Oct 2025 14:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6105C3C65A1
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Oct 2025 12:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCAB2DE6FB;
	Tue,  7 Oct 2025 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="TyuceOus"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7EF2DCF61
	for <linux-i2c@vger.kernel.org>; Tue,  7 Oct 2025 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759839068; cv=pass; b=LXxlwEegkX8PQLvPbAEMLz9jhrWGJ2+lYrQa/nXN4ZizDIdQc8jihj9XQRDKWmX53p1HIl8dOmzaWQeYblSnNKqqAXN/qMotl5Yujiu9Jf6q1IAHI2ja/I5SA4Hmtedy3Xd+hrCyctuqc3ntpAq9ZlDEBpMgS261GYgPCLYY4mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759839068; c=relaxed/simple;
	bh=k42zL3JTM7BE3x6dKMZ2jKfGQCJubStuzW5boFB9jvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsRlbQDN+vpgJ4HePDATQ38x1uIKEjfDKDkklTDUmLRHa6LIHjAvEdm9l0NMkLA8+/n4UqmPLb6T99iagasAPwI5Le/qApY6PHs7dQFgSDLiZOJUsex/oDIq5x5tD/vkPUaSJhUOsz4g48/LDFPVl6FqYZ0ePoCqlIIaq6LiUtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=TyuceOus; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=YRNQG6F3jarHI4ENArdLBZZ+Hm3muMDeZmbNRaGdu7g=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1759839006;
 b=mEd7bf+sUptnkJ5pyXJn5jpwwzSw4wFfOdv6P1WhoHkaMdYZ5d2fZHnDZczv2+oOUINC4dzm
 agrbknS0xKKwxwBgmxr3mDss8CVqjEHUES25IKdtjWFXLZGupCZdOz0B99L2ljv32bwyeM4Ix5v
 RI4n+UOK8BX6gU7m+MKTHC60GxdiBnXnnB6a4g8o2/wOxvrC5uGLac0Ec9EbSRbhTw/JResTBql
 TWbPcURVNgsCBohaetdbacyyILfSy4jGdjb42IkVDhn4/bUYfWr5K2eCHSyQNgmf/6I1ST3eMJ3
 Wg0tB3MDu3kx6OkPrHIx1jvSpzLXGR1ky2EZ8fY0S9s/w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1759839006;
 b=fZWGEKSVPi9cg/7lFdGR3rNeLX/admRdE9RWiGqU7pAG+iqCkrVhdIRKD8P7b/R4eArpvfct
 8vuIfRA9hdsMPTlCHYv4WSeLCpcB24aR/8rwv5Uieyv3Fwsi7Minj+FTJJL/KMAsWX8D11PAOcO
 V/wXMyp5PTvsrBXsNhIFtqJSZfHMjhDHXlJQJOjL1vyYI/xqQZpe99CGArZHPQLuh4nwTNrgDws
 az4daTBtNXBsEY0NDZaITQUD1RZaKOWKnm7hjiXVTMqb0sMSMWx3F0YVO04v+FJbzJowlMllGYH
 5rqhBvHsVe4cORfnbLAQ448Or+lNxXlLjO6QCSEs9PtcA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Tue, 07 Oct 2025 14:10:06 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5C7EBCC0E50;
	Tue,  7 Oct 2025 14:09:57 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 2/2] i2c: ocores: respect adapter timeout in IRQ mode
Date: Tue,  7 Oct 2025 14:09:25 +0200
Message-ID: <9be9d4bef9fd6d0b66534a3731b4bc6b86cc79ab.1759838476.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <1eb320b6b7d3a12e62785893ea68c4d16aa2560d.1759838476.git.matthias.schiffer@ew.tq-group.com>
References: <1eb320b6b7d3a12e62785893ea68c4d16aa2560d.1759838476.git.matthias.schiffer@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4cgw1d6HSqz1kKP2P
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:748d84c8fdd2790a6e1d6e662b8d81e2
X-cloud-security:scantime:2.114
DKIM-Signature: a=rsa-sha256;
 bh=YRNQG6F3jarHI4ENArdLBZZ+Hm3muMDeZmbNRaGdu7g=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1759839006; v=1;
 b=TyuceOusG/REeHmB+RLK37OjnMUd8/nnwqlvAUxS7JEFFqIfrsC4R3yrfZzMmszzEnU6ZMns
 kUqoTV2yKPVnQV+CDUyGF09hwqL2EClUfVVi0r8Hadvq/KeARAEBIl60vR42aT4fX/evSxUCgFi
 Vt7+wha6aaaT6U8Nub8OgCTVd9HKivjTprwnf9CQKvsrQsDnmGKYtpTUTY7fLmxcta2KWu0u1Bc
 H6TGskUK/+ejcPZg7QlqZBpXaswFAcNF9HQtWYfLpRKEe9/N67j5VSg6eryukQTuODh/u82cyEs
 g3m9HZG6VHCJk8xna/yDHaYlSGLlbgXHfFRXNSaVVLc/g==

While the timeout field of the i2c_adapter defaults to 1s, it can be
changed, for example using the I2C_TIMEOUT ioctl. Change the ocores
driver to use this timeout instead of hardcoding 1s, also making it
consistent with polling mode.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/i2c/busses/i2c-ocores.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 1746c8821a149..518e4cf821a7a 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -380,7 +380,8 @@ static int ocores_xfer_core(struct ocores_i2c *i2c,
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


