Return-Path: <linux-i2c+bounces-11513-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C48ADE56E
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jun 2025 10:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1C0D167887
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jun 2025 08:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0308C27E7EF;
	Wed, 18 Jun 2025 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iHtcDGmA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A2A35963;
	Wed, 18 Jun 2025 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750235006; cv=none; b=LlSR0Dt20CxCnq0nAkuh9qbR3XOtwhalZQv2oSBb3zKFaoU6rn7qHPwyinKuM6SLuXO1TiAKjsxx37Z5WXUpfKzH0SHxyRMR3QrhGXkZja2WJ2xMwxx4rhbMBe7HHE/b9tPPQ5L00h+5liIfAEAMT5Hks+Yh3C/5Hdf93atPc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750235006; c=relaxed/simple;
	bh=9NU+gif1VqKOoeefRSIou7mERw+AySrXW0V17R4PjiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KU3L9cPwbrW4HJpwQXAbTwrqkNEdEYHw5mZJGSj6kxo4F1SGATN5wLXWwdJ+RcGnucQRydg5Axo5xiQ3bd+sE3d9cSpl32/iFunnVQJLl4Wfus8y9v6Ar1jbB+YZ/ztLhoFo/RIpUBV2yWpBVYstotm2MOXFIHBNSupIUHKwaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iHtcDGmA; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 5D01144341;
	Wed, 18 Jun 2025 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750235002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cu2vOEx28B8Wk475wybPa3ZO6D0NFJUiHtOoTWhsPg8=;
	b=iHtcDGmAY4bG/DzaTKk0YUyiaNUfc+ucIu7nHF9tUHehPAs1Soymo/ZJK2qiVN0CPiY4TB
	SsjOV3QN4nFhON6jsQjhupymqtIM07OaqgCtLSY2nB4DD4qTivvjgCcRaseyCapItFrlzY
	SZYtPi+r2jzKgvW5qZTdCpYec4yWRZlEUOJCu5r+FMcD5aHTnxHMxsFNYz/z4Xe4mcslRy
	q6GdlL+nNnh0k2fm96IpymKRPF9iF1yH4SP4FfGxL5XnjjHbFd6ekPOhQ1pTvDHW8W8NCm
	a/FQK2iGVulYgQ7MmoddNnPTPx/nVWsE9Sf9Fyt1cfNxIVcceEjdcPRYLOTryA==
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 0/1] i2c: Introduce I2C bus extensions
Date: Wed, 18 Jun 2025 10:23:11 +0200
Message-ID: <20250618082313.549140-1-herve.codina@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelteduffeltddvtdffgedugfejffeggeekheejiefggfeivefhkeffheehheeiueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
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
I2C controller binding to introduce the feature.

Compare to the previous iteration, example has been fixed. No
other modification has been done except adding a reviewed-by tag.

In the v1 series review, discussion started but conclusions were not
reached. As a reminder, topics started in the v1 series discussion were
the following:
 - i2c-bus-extension@0: usage of a subnode with unit address
 - Presence of phandles in both direction (double linked list)

[0] https://lore.kernel.org/all/20250205173918.600037-1-herve.codina@bootlin.com/

Best regards,
Hervé Codina

Changes v2 -> v3
  v2: https://lore.kernel.org/all/20250430152201.209797-1-herve.codina@bootlin.com/

  Patch 1:
  Fix the example provided in the commit log.
  Add 'Reviewed-by: Luca Ceresoli'

Changes v1 -> v2
  v1: https://lore.kernel.org/all/20250401081041.114333-1-herve.codina@bootlin.com/

  Patch 1 in v1:
  Removed (already applied)

  Patch 1 (2 in v1):
  Add 'Reviewed-by: Ayush Singh <ayush@beagleboard.org>'

Herve Codina (1):
  schemas: i2c: Introduce I2C bus extensions

 dtschema/schemas/i2c/i2c-controller.yaml | 67 ++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

-- 
2.49.0


