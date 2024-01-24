Return-Path: <linux-i2c+bounces-1446-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2AF83B1E4
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jan 2024 20:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C49FBB22D08
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Jan 2024 19:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346C5131E51;
	Wed, 24 Jan 2024 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vn3Jl+i1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44E713175F;
	Wed, 24 Jan 2024 19:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706123160; cv=none; b=jBOY6l5jhz3psSNF7AFiz1aCwH0g6o/K3d3NWnH846SH58zb9I3ax2hRxJjC9Fdh/BLnRxWyBSbSVaOTVGYVAMY6z31TrHZXbY2wWSNLq5/zQMLkOUEHyvsToZM8PAn3298COXghVndD0gQGCscStn7qTjIvv/ldrlkyidyw3vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706123160; c=relaxed/simple;
	bh=imucOcIYJoDxBoguCA9kKtfF8C6b6OBmEsZ9isDRAcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJakCngAYI2OmFmisIs5VriFsviSmLLzKfgnli1RLoND8kdS6Q4C9WBBP+9NbjMwtM+KlXP2tAK8jn5JSzlzmrZLf2f7GeUqvhUzz8C8m8A7xnFs/5hD0mof4CD+tpzG2IrABUeMkBnIceIvr/1efVfc+9lUE2Lq0CLHMLJFOG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vn3Jl+i1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4871AC43390;
	Wed, 24 Jan 2024 19:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706123159;
	bh=imucOcIYJoDxBoguCA9kKtfF8C6b6OBmEsZ9isDRAcU=;
	h=From:To:Cc:Subject:Date:From;
	b=Vn3Jl+i1E0EO7I2lys9SH2ZRpWyGeXaCqr0rSCqBbjE/BNKyjS9mZTECFV1vubUes
	 bCo5nuQhw3oGNZ1pZxHkInoQTlRLTqAW3hR/NFxa/WVm3IazDlx0Q5McosukLlzvob
	 L2hGBo9mU0AR5qbCyEBc04xecf8ocv/L2Kgn4rIuZpRIq4wu2OWc74eqgB2tl86d4B
	 AZgxus53bUc6h/9TSURvg+AyzZW87O3Rs7V7wTOWenhkzlek/xmCU5tOuSxmG8H9dw
	 C5x8Of/kaLoSnLsxwxH0/TACDLSYozLl5IfPP64vMSR4aGMvXRKeA37ijFyAjaVRO3
	 byFsEvnWIrUVw==
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: i2c: mux: i2c-demux-pinctrl: Drop i2c-mux.yaml reference
Date: Wed, 24 Jan 2024 13:05:50 -0600
Message-ID: <20240124190552.1551929-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C de-mux is different than an I2C mux, so i2c-mux.yaml is not
relevant and shouldn't be referenced.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
index 2c08f2a7cf1e..dd3d24212551 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
@@ -32,7 +32,6 @@ description: |
       +-------------------------------+
 
 allOf:
-  - $ref: i2c-mux.yaml
   - $ref: /schemas/i2c/i2c-controller.yaml#
 
 properties:
-- 
2.43.0


