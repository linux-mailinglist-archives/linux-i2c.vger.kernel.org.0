Return-Path: <linux-i2c+bounces-3906-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7461C9001F2
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 13:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 280921F24E7F
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 11:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FD418FC7C;
	Fri,  7 Jun 2024 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eLN3H23S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F789196C8C
	for <linux-i2c@vger.kernel.org>; Fri,  7 Jun 2024 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717759060; cv=none; b=AUWt1hb2xG7WvBe+bteWx1IuPqxjYyLAauLQeZ3I4rbRy8K8tElDywMdQyBx9Fgw1K1uXEc6Ey1FUsg/z1qbhGRCWrbxe1CgLCDoewSi2xcYulA08V/SlHs64miwCarQV92/wlg2YII64nZiKrKbK7YGoRjEEoKesAzrHfGLOIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717759060; c=relaxed/simple;
	bh=BefAR8t35TqFRlwXEg2HNAvi7yn3amNjWLNgYW5TM9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SaQPpadyupHi7NmvtlrWqSAM3WQCc4hU3UWM+Lp9t7FQLrOPCoiJlmVWy4J8QF9amxEpZpQd5tHBex01LPkkf9K2EliI1nQTG1mq/kEe7+BM9enZzMgloCPwlG+D8dXwYixURKVIedRklEBF94f6167voRRFhoReN1+Z9jjAalI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eLN3H23S; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding; s=k1; bh=+O6g8T/iVkSnZSMvXHKUt/Yc6Dd
	vkc3cdyY0Gd3hc8A=; b=eLN3H23Sw1Q7krMRJFb00LhT8Fjud5qVN7jl5mYtBoQ
	Y8dchjnTwCyE5OC/vTNxKGgQHDJWUADh/Dpz/nee63yMNNrgcJknLt3uSfXF15z7
	8wKjmh9nozZucHXMlQDp7/HqN6CvQQF8FKhCXKqBRhIfJ0CNJFRYkm/4cZzIxubf
	w4KazBh9mb0+TvxflHMwSQRoRA0HixRuUKM+qW/peMg5SetwjLKFOB+twlVffW/3
	SBD9yVR69kQqBphDMphP1NEEcUi09qA4SagdnigIegRwEiGjdpkYcsNlwR61LVCx
	Ld7bBrlJfTnehVtIBLt9UEpn5mfiYcx3nVi8P+kb+7Q==
Received: (qmail 3292197 invoked from network); 7 Jun 2024 13:17:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jun 2024 13:17:34 +0200
X-UD-Smtp-Session: l3s3148p1@WFs18koaELAgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-doc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] docs: i2c: summary: update I2C specification link
Date: Fri,  7 Jun 2024 13:17:21 +0200
Message-ID: <20240607111726.12678-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
References: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Luckily, the specs are directly downloadable again, so update the link.
Also update its title to the original name "I²C".

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/summary.rst | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index 28ff80a2302b..e3ab1d414014 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -11,11 +11,9 @@ systems. Some systems use variants that don't meet branding requirements,
 and so are not advertised as being I2C but come under different names,
 e.g. TWI (Two Wire Interface), IIC.
 
-The latest official I2C specification is the `"I2C-bus specification and user
-manual" (UM10204) <https://www.nxp.com/webapp/Download?colCode=UM10204>`_
-published by NXP Semiconductors. However, you need to log-in to the site to
-access the PDF. An older version of the specification (revision 6) is archived
-`here <https://web.archive.org/web/20210813122132/https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_.
+The latest official I2C specification is the `"I²C-bus specification and user
+manual" (UM10204) <https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_
+published by NXP Semiconductors, version 7 as of this writing.
 
 SMBus (System Management Bus) is based on the I2C protocol, and is mostly
 a subset of I2C protocols and signaling. Many I2C devices will work on an
-- 
2.43.0


