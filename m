Return-Path: <linux-i2c+bounces-1447-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 706DA83B1D0
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jan 2024 20:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44171C212F0
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jan 2024 19:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A06133420;
	Wed, 24 Jan 2024 19:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ton5xh4y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED197133419;
	Wed, 24 Jan 2024 19:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706123164; cv=none; b=f7MiBbsprjzEryg0c1JjwFeFBM5weyDQEnvyPyyhgGxRu+NtegyiUK1jcp8sM0IA89LYZWsLYxBZlKHoR5IZ123kAogzVQWdiyYDsAv4fyz7FiVEqQkughCQhHkw9lHA7cCzeU25zoh2SN0ZnIfXwHjYifMhT2zWF90ug7QtIH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706123164; c=relaxed/simple;
	bh=kV3NuM/ThI2ctlYG96NqZpX0dOEPgAX+5rJlxXkagyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUZXfz5vLvPCnvDybqhzjUIO07QTEcs2DLNdQcXUdfLUWZLljlhsR8srreTIptYAB1ITIJUSgMgiNBuZLbBRRu9DUmrkeyEcz/JbAmoehDGWZuc2+283NF4dhWFhWsz0kfBZ+POQcjqepj5EGEfeyCozWrCB+ooLJnIeKJaBjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ton5xh4y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F5EC433F1;
	Wed, 24 Jan 2024 19:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706123163;
	bh=kV3NuM/ThI2ctlYG96NqZpX0dOEPgAX+5rJlxXkagyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ton5xh4yaVGx8UA2icp9+gasMr7pCs47dGdFHCtq8ObBbtRRmoLsLZDiYa3rVWTQd
	 vK4z8JqS3o6yhmMxflih2fv9tm2olSMHh5Mbq74In1EQxmxHBe9/YQ5hcqua+zZGpH
	 8udn0UQ0NvXipmQ66lSIBqUXywKm7E1TONNp8l6aWOUwmu1ZZSOVwikqBt/xr1N3tp
	 Jw+jo966NMtGeuo6iISogVNhJcl37ckuw4CkNxzGjJwfzHLYc1sPpdfQX+krJg9thm
	 uEOj75v+3jVg7AV9VnoyyQw6ZeTpfZMcrjm9eMu4X0pMn/S+/nGviDD7KwZyePHMmQ
	 9LTABCuY/c81w==
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: i2c: mux: i2c-demux-pinctrl: Define "i2c-parent" constraints
Date: Wed, 24 Jan 2024 13:05:51 -0600
Message-ID: <20240124190552.1551929-2-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124190552.1551929-1-robh@kernel.org>
References: <20240124190552.1551929-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'phandle-array' type is a bit ambiguous. It can be either just an
array of phandles or an array of phandles plus args. "i2c-parent" is
the former and needs to constrain each entry to a single phandle value.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
index dd3d24212551..b813f6d4810c 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
@@ -40,6 +40,8 @@ properties:
 
   i2c-parent:
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      maxItems: 1
     description:
       List of phandles of I2C masters available for selection.  The first one
       will be used as default.
-- 
2.43.0


