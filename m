Return-Path: <linux-i2c+bounces-2058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BEC86C78E
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 11:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FC502894A1
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 10:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25287B3C7;
	Thu, 29 Feb 2024 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TU+poaOL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD7C7A726
	for <linux-i2c@vger.kernel.org>; Thu, 29 Feb 2024 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709204327; cv=none; b=k5sw2XAp3W8qGoYRMfAKsFfODRa6simsENpIE45fhuFKtGrR5u5LT+FEp0J/gVGYbOYpk59RvAYFnbHKh90Jsjv1KHwOGvv1CxtY1z7afo0Ib3nM4NpgkqdbyFAIhGMq7QX2K4ZfcLW6hGmPhrmcED3PIbz1cSnI1KUPs2MswHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709204327; c=relaxed/simple;
	bh=ypB18cvDIlCIsSmF6zKYeaKlmXg3SfaECOqvrBqx9ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1xoMq6DCMFUIoEIt3iLA6BvlPfkHA8JMct3GPY8vfsPk+qozodXAb4JS8wivQR55PvPRmxJuKK0KpE1B3sSfcvmB4tow1gk6HnPfz0/pIVnAT8qRXWlut1LUBYMuk1LwXixznisQMoHbqWHMmaQXRTPVynJjPNmp1kmHnJ3I0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TU+poaOL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=z37VTRXr0vDwhzB8Sw2WVBzeh5raFPoJsqa47G+4y4U=; b=TU+poa
	OLBhE0Ghy6pW+xA8Q5AuN1hvI7aWq6Tw6UVDY1QSw6hiK2CdQW4J5/rCV8SVXtas
	ePZp4JE3c7jwM2NkNokAVraIj2ax1T24rsoSimy0Mvj2OPkODLf8pwVmsCW6Mu8N
	64fYj8Yak6eygKp3pGY5dgbknJP0JtCkc0HE2eBkuj6bqNoQYKqczqjyLNe+NxPX
	GB6EtuivnxAyQJ19sS44GK14k6GLGyZJ3h4dwfbVeNRGVgIJ8rc5zVzc4RZ+Glez
	2XZTSw1sBZVc+K1mzkkw+2puv0GkFeUrddNZYmzA4lOABAaMS6IDaKb3wRpXpM4P
	4vSea2+XbK6UAwcQ==
Received: (qmail 2278007 invoked from network); 29 Feb 2024 11:58:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Feb 2024 11:58:41 +0100
X-UD-Smtp-Session: l3s3148p1@chpmJIMSrQ9tKPFZ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Rob Herring <robh+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT 1/3] dt-bindings: i2c: mpc: use proper binding for transfer timeouts
Date: Thu, 29 Feb 2024 11:58:11 +0100
Message-ID: <20240229105810.29220-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229105810.29220-5-wsa+renesas@sang-engineering.com>
References: <20240229105810.29220-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"i2c-scl-clk-low-timeout-us" has flaws in itself and the usage here is
all wrong. The driver doesn't use it as a maximum time for clock
stretching but the maximum time for a total transfer. We already have
a binding for the latter. Convert the wrong binding from examples.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
index 70fb69b923c4..b1d7d14c0be4 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
@@ -96,6 +96,6 @@ examples:
         interrupts = <43 2>;
         interrupt-parent = <&mpic>;
         clock-frequency = <400000>;
-        i2c-scl-clk-low-timeout-us = <10000>;
+        i2c-transfer-timeout-us = <10000>;
     };
 ...
-- 
2.43.0


