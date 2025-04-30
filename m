Return-Path: <linux-i2c+bounces-10702-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E718AA5017
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 17:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A36C1BA3164
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 15:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7497F2609D4;
	Wed, 30 Apr 2025 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Qg4TMXnz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555B42609CA;
	Wed, 30 Apr 2025 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026548; cv=none; b=ImYWGRrh0u3Xl5QGWUCm3WmCrh8s/8gTZZb4BEU+Mt9B0lH8gKA7iYeAuHyWhUTtV6koa/AVwf6Wr2RqO1SAZitaukXBcOY5a8+fIckIvjeEDcRi8Es1vNfyh02RLpmQqZRyaeIiEtMCCkte/iXzMhfZUmZcmscOrCqClwx88IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026548; c=relaxed/simple;
	bh=VKuEaIg3eVwIU3BaXeGQLqDYSPns85A8B7LcaoFnV0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VPLH1KNuyX2Wba0zXzBJ8h196TAzImOU0cVSdPyrHDlJRtGh0c8VIkBzXi95/G34KfPT5Lp9zQoQhZ7wEKZJPnO8YDA4slXbF4JPWNewizfJjreLzJEHMhAOjx4+XPrcm9ChVexB9sE6GF6dhKWNAfBeKgzhHu+TtcbytdFH9oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Qg4TMXnz; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 9D8BA439AD;
	Wed, 30 Apr 2025 15:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746026543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F33WqpNOkRaqBMt655CiK5gkDQMST10A7zqgnSsmFXA=;
	b=Qg4TMXnz9yGIYzVAAmNqdaETaQq7Eb9lTtbjEGXQoTuAyeVwOnUQ6maOTG8J2bErkmccru
	k6DcVlXEA2U/4GQDkkOiJ4T3ypKlQfOKntzGBx9szise4PDZI0F1EEHr0+POU55bsZF9ja
	nFZPdX69MyuD6HdxIQBcmQWbrWKdEDz2qP15lgrHJt1u5cj0KHYRwDJWxXfdM17valm9Rv
	p3XTtJ2zAsCDKBBOVhNXSCnoDo4l+D14KMMiHGkNL14dSzJOzFqeHkCxJn0FC+2B1tcDjm
	BYOpg41DQKtAGxvNX7yPyyWVOPsnPh0qzwDNukfYahw1G9a9+1c1wKQV/pQYBQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Subject: [PATCH v2 0/1] i2c: Introduce I2C bus extensions
Date: Wed, 30 Apr 2025 17:21:59 +0200
Message-ID: <20250430152201.209797-1-herve.codina@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelteduffeltddvtdffgedugfejffeggeekheejiefggfeivefhkeffheehheeiueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopegrhihushhhsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com

Hi,

This is a resend of the series in order to continue discussion started
previously. In this resend, patch 2 previously available has been
removed (already applied).

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

Compare to the previous iteration, patch 1 available in v1 has been
removed (already applied). No other modification has been done excep
adding a reviewed-by tag. Indeed conclusions were not reached in the
previous iteration discussion.

As a reminder, topics started in the v1 series discussion were the
following:
 - i2c-bus-extension@0: usage of a subnode with unit address
 - Presence of phandles in both direction (double linked list)

Best regards,
Hervé Codina

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


