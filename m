Return-Path: <linux-i2c+bounces-2938-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BE68A512A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 15:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA975B2391C
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 13:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA817F465;
	Mon, 15 Apr 2024 13:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyxomfaO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A8D6FE0D;
	Mon, 15 Apr 2024 13:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186682; cv=none; b=QFmJchkg0D/K0VJUsZWLRxtkxbubLJ5mSUrrjlRSlox1uIs3cWDBnlOnwxk3GbEOEDNd7p/2b4Nf+4IJtrebG2mE8N8MLpfUZ4wc/CRdO1hxMUyc5e6pcYTIoTUiJTUVsOm5HFwyur2mJZRz3zsy+WcKZ3YhUzeDw4rcKosljrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186682; c=relaxed/simple;
	bh=ncGh+t4xmi5GVWUdHHtJGEdjbtmWOCqArQu2Lu0BqM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QKNToaaBceo3JYgIMp+4Kq6QySu//j9ekSPB5kjt9xPz7NByFw2kZVn0kpZvsIkQWz9k13MqefdCQCahq0YIDbB+Z7miZMQhr+MMyEYYI84/4ij8VjcO0sS7HAhtC4bV/D/hetFrm0aLfbwBF6LbdgB/tfV0OhRTFRR73G+TGtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyxomfaO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5ED3C113CC;
	Mon, 15 Apr 2024 13:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713186682;
	bh=ncGh+t4xmi5GVWUdHHtJGEdjbtmWOCqArQu2Lu0BqM8=;
	h=From:To:Cc:Subject:Date:From;
	b=gyxomfaOzOtUSxkGZxTpBLqUJN1GpMbQ24yINQLR+a3+C6iZyKaJbT5gE+bnt8es7
	 E2SvB0qcUr3fuOm2GMcmAH/rmkZZRZwvJ3ApaR3eM9s8bfiA3WjiXpg7yWNUgts+4l
	 sXFgLl5x6e8KzbNqMdMXi4L2BFgntB/H6UQY+qEm40l213bIAMc7XAzw+OeYLnpdfe
	 Ybflh03IdYVd9CWsBQCcOo9qv4f6zMj1fCDM9stVoYhNMMD/AhADINM4AS27wkptrr
	 AVUmWe7ZSVNApVD1fNcYBvJOlT22qTyItyfoCxGHXFDJQ9AKXIElfOpCfAwJh3P0Jg
	 GhqEhLjFPKkCw==
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: eeprom: at24: Fix ST M24C64-D compatible schema
Date: Mon, 15 Apr 2024 08:11:03 -0500
Message-ID: <20240415131104.2807041-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The schema for the ST M24C64-D compatible string doesn't work.
Validation fails as the 'd-wl' suffix is not added to the preceeding
schema which defines the entries and vendors. The actual users are
incorrect as well because the vendor is listed as Atmel whereas the
part is made by ST.

As this part doesn't appear to have multiple vendors, move it to its own
entry.

Fixes: 0997ff1fc143 ("dt-bindings: at24: add ST M24C64-D Additional Write lockable page")
Fixes: c761068f484c ("dt-bindings: at24: add ST M24C32-D Additional Write lockable page")
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 1812ef31d5f1..3c36cd0510de 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -68,14 +68,10 @@ properties:
                   pattern: cs16$
               - items:
                   pattern: c32$
-              - items:
-                  pattern: c32d-wl$
               - items:
                   pattern: cs32$
               - items:
                   pattern: c64$
-              - items:
-                  pattern: c64d-wl$
               - items:
                   pattern: cs64$
               - items:
@@ -136,6 +132,7 @@ properties:
               - renesas,r1ex24128
               - samsung,s524ad0xd1
           - const: atmel,24c128
+      - pattern: '^atmel,24c(32|64)d-wl$' # Actual vendor is st
 
   label:
     description: Descriptive name of the EEPROM.
-- 
2.43.0


