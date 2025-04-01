Return-Path: <linux-i2c+bounces-10073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F2CA775E8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 10:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A34D13A99B4
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 08:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8DD1E9B29;
	Tue,  1 Apr 2025 08:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JhwsZLh8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E32B132103;
	Tue,  1 Apr 2025 08:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495062; cv=none; b=esyUqqXdhkzZBGH71ng4PWQTt8P3UNIVx9XzYz5FbpTgRYVp+m10CLyBesqHeGOg1pe+pNiwOfPMK9mgc8BSvGRkvPpxdZAo91wqbpdFsQw0Ty7ir86QpzEnX7vpfn3V+j5mT9/wywdBilF1LM73vy+2PAieHg/9XTvVPbm9HnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495062; c=relaxed/simple;
	bh=BAOOCyDh7128Gf6xKr/E8pz3C5wmnjftErUM/zHUJPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eG1Jh4Rua3AR3GFMpkn7GRKztkOLsbz8STskyPXtbPWGyyJyWOCNysdh9sWHzmG/6A2Wou1ibD0HGOThG05Fo08k27MQnOsoPEplxTqLlcA1vrnJIOsB/kOESkuLMvKDn4pFjEatE0iAncQFfTOw/B2msuHIcq5oGW/W+09zMiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JhwsZLh8; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 16BE5433F1;
	Tue,  1 Apr 2025 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743495052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PRCHZq5QRln/HfzZm2RI8VZaUdthL6BYmvZIMg3bZ7g=;
	b=JhwsZLh8tjVeKmy4hx5iZ52Irb+c2Nd9NamhkJOEDXHP1BURrGqObazEOHDROMbqxzbOJI
	lnLTdv2RyzBop3+VRtcGJ9azkuL3/nOxnXZBmxaSxuhvqCBIp7bVEArriosOTR8tBMMTO0
	LsY+seS/Cgml2RLiMXVTby8YsSKmh8r82tDrvU2dCCTvP48f7FB+r+GOUHHF/VwLSIpeo4
	hoOH9v6KKX2v73SCNJ1uxEYEOvmYML81+7O5XhwkD79p4Ns+08vbXjvRuNp0gwWdZLreX9
	zRP0aV8f9n30ZjmQMdJyP4sFsx/dOnY54l32mQFkNtac9T3VmWAa+FH1MMBPvQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 0/2] i2c: Introduce I2C bus extensions
Date: Tue,  1 Apr 2025 10:10:38 +0200
Message-ID: <20250401081041.114333-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelteduffeltddvtdffgedugfejffeggeekheejiefggfeivefhkeffheehheeiueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhos
 ghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

Hi,

An I2C bus can be wired to the connector and allows an add-on board to
connect additional I2C devices to this bus.

Those additional I2C devices could be described as sub-nodes of the I2C
bus controller node however for hotplug connectors described via device
tree overlays there is additional level of indirection, which is needed
to decouple the overlay and the base tree.

This decoupling is performed thanks to the I2C bus extension feature
which is introduced and detailed in patch 2 of this series.

The implementation related to I2C bus extension has been already
proposed as an RFC in Linux [0]. The missing part in this RFC was the
binding.

This binding related to I2C controller is not available in the Linux
repository but in dt-schema repository and so, this series update the
I2C controller binding to introduce the feature:
  - Patch 1 is a fix avoid a wrong matching I2C bus node name.
  - Patch 2 is the I2C bus extension itself.

[0] https://lore.kernel.org/all/20250205173918.600037-1-herve.codina@bootlin.com/

Best regards,
Hervé Codina

Herve Codina (2):
  schemas: i2c: Avoid extra characters in i2c nodename pattern
  schemas: i2c: Introduce I2C bus extensions

 dtschema/schemas/i2c/i2c-controller.yaml | 69 +++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

-- 
2.49.0


