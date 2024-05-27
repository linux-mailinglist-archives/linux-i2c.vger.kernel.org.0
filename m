Return-Path: <linux-i2c+bounces-3678-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ADF8CFF2A
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2024 13:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A87A31C21933
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2024 11:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CD615DBBA;
	Mon, 27 May 2024 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="djJ5GFy2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887A15D5C3;
	Mon, 27 May 2024 11:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716809962; cv=none; b=DYNG4n2eAtjJgiA2nNwj2OiBOyWIV5oLHKgfGTcI/u+Tog6YoNKRM7cpiTGeO9JHodW0lKXGC5MzaGNxgM2HDaEsYvN8YJY7M2oP9V34UixqUp0w+WyMnSLpkCFG7CLG2qzz4O6iX/VTB00xGw13zXs6czi1CgnJVIXZB+C9Juc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716809962; c=relaxed/simple;
	bh=jp4l2cKZ3kPzx+YzlZn5iKXhCwveluRmsHImkFLgtQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vj5JN6+KR9afp/TUpD35+A5YitzBbavIRaMvQKNGnd7005Z3nk2lHEEwgcGh6REMZSPxFqEqZSQBKZXzGZZ8oXwioxSwTNe3hLa7u3DTlJ40kZocjdkmFdDA0T8rw/6YvGjlJdg7666Da38bwcXuLdkZTj6Io8FfkRtQ6+EgKgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=djJ5GFy2; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id C10351C0005;
	Mon, 27 May 2024 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716809953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1VSbn3scxBR7pISeAAMOGeMfLewlqMDPKt8ZoFX66cY=;
	b=djJ5GFy2WSmb6BNkKYzu7J2APQ70qxENMuLTwg9ghag15vXSTbFwLoaOjsjdfuM8AfYQLG
	mvXoyQBTOEHMUjp4chAsfthZslpBB8kGjpvvJQ51iMUOnslu3YpsyqWGwOXp68FqTUL+t4
	R7iOspku0Rv5TDxUf2rdMpBr4VT2Xw7WSzfVvT0lpzrTO6Z9vJbz6gnvOoT3m4cAkFDcqJ
	btPBU+XACApiHzREgsm9CHEuSgxcB0j9KUkHoJiOAmwai20NwOzVCqzK9S7Dpxr/taS/W4
	Qy9VjNmaYCvmZ0cJzjcoA0rm2AGKScp6Ghggh6GptNtEjxiKvfNiMTj/VJZ9Ag==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Peter Rosin <peda@axentia.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 1/3] dt-bindings: i2c: gpio: Add 'transition-delay-ms' property
Date: Mon, 27 May 2024 13:39:06 +0200
Message-ID: <20240527113908.127893-2-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527113908.127893-1-bastien.curutchet@bootlin.com>
References: <20240527113908.127893-1-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com

The i2c-gpio-mux can be used to describe a multiplexer built upon
several i2c isolators having an enable pin (such as LTC4310). These
isolators can need some time between their enable pin's assertion and
the first i2c transfer.

Add a 'transition-delay-ms' property that indicates the delay to be
respected before doing the first i2c transfer.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
index f34cc7ad5a00..5bca58b78359 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
@@ -57,6 +57,9 @@ properties:
       last value used.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  transition-delay-ms:
+    description: Delay to wait before doing any transfer when a new bus gets selected.
+
 allOf:
   - $ref: i2c-mux.yaml
 
-- 
2.44.0


