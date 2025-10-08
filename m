Return-Path: <linux-i2c+bounces-13415-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2999BBC68A1
	for <lists+linux-i2c@lfdr.de>; Wed, 08 Oct 2025 22:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6DB13AD745
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Oct 2025 20:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEEB277CAB;
	Wed,  8 Oct 2025 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kael-k.io header.i=@kael-k.io header.b="pw6A5n5F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE0C1339A4;
	Wed,  8 Oct 2025 20:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953968; cv=none; b=CSck1M6WxA4kb1FMOQmJmO7k1JxtB7d0Yz6ViiYPoRPd6f6QpfGNERFXxTIESjvSfK2GV0zF2dfQE5fsohyV5J/2f1xrgTA7LoeWV20ZoVnQn3tlR3b/B1m60t5LsCT+3tviIjUN2tZ2XJo57fXro040l37FtS3JmHmdHvWh76s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953968; c=relaxed/simple;
	bh=pdU1RlcVUpYkwATsqzgb3h9/A3NwKlJGBSZ9KzBPDtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXSCGIqlS6+Dww3zVqa1pEEXUgrpLEV/y+DlIqtvUASo9nGAPSaaORiCSLnKJq0sXOABFibvBqe+jWjuVcDuWed4D/B4Nxvr5pxOHIg8Pg4udGa9ny1Q5MtpNccmRJ/Nbj7UPArVHjM8hQYM9z5LQ+YIe+zFP7niKoUd9ger8OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kael-k.io; spf=pass smtp.mailfrom=kael-k.io; dkim=pass (2048-bit key) header.d=kael-k.io header.i=@kael-k.io header.b=pw6A5n5F; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kael-k.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kael-k.io
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4chkXH3ZXHz9tmC;
	Wed,  8 Oct 2025 22:05:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kael-k.io; s=MBO0001;
	t=1759953951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIbij9z0dC3IRW6XjmDR3VsDwV4PJMJLpy/NIUF3SVM=;
	b=pw6A5n5FylBGIpHAkL/uoYoQ83OKORLRxT7B48Xj6H2pqQlZeGO3K/laD1nQxDbKgCPdyP
	6HgCCXy2YMnVjvO5Ni5t+XghS0+V+XrjqAxaV2ZCTfDTtQl9JGnP356D6vl42cBAIog/s0
	nJBYPAqSM2utwKnKsb4KRBDQa/lkR1M4Hdg2U/xPKs8I3CKwSEXhFU79yKXjAR1uk93B0t
	N6JlsSWs9PSekFqLznSHP3oXfsAPT3jJuLcy8j8kul52HKfYQKepL0/s6tJyrZlVLw9GNd
	EyDgO/0mRkrYqiAtHjCnbq4YyQxhDk4fJMRi1DQdAGbCnsHXMEvegqUFEAbfEQ==
From: Kael D'Alcamo <dev@kael-k.io>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Yan <sledge.yanwei@huawei.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] dt-bindings: i2c: hisilicon,hix5hd2-i2c convert to DT schema
Date: Wed,  8 Oct 2025 22:04:26 +0200
Message-ID: <20251008200535.17464-1-dev@kael-k.io>
In-Reply-To: <c2e81faf-4d2c-40e7-bdf0-e0d41fc76d9c@kernel.org>
References: <c2e81faf-4d2c-40e7-bdf0-e0d41fc76d9c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks everybody for your feedback, here is the updated patch.

Changelog v1 -> v2:
* removed redundant "#address-cells" and "#size-cells" properties

Kael D'Alcamo (1):
  dt-bindings: i2c: hisilicon,hix5hd2-i2c convert to DT schema

 .../bindings/i2c/hisilicon,hix5hd2-i2c.yaml   | 51 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-hix5hd2.txt   | 24 ---------
 2 files changed, 51 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,hix5hd2-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-hix5hd2.txt

-- 
2.51.0


