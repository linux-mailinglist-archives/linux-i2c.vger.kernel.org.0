Return-Path: <linux-i2c+bounces-1590-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5682D845737
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 13:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AB8C28245F
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 12:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0890115DBA9;
	Thu,  1 Feb 2024 12:18:57 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9A015D5D6
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706789936; cv=none; b=etz/mkTaaYahVMRzldbgMp95tpQ6i/PPmxibXkxbXL1I+aX1GOURY+aOwhHFR2VoZwXZJoxmM/+o70H1iqzvVM6PasrxlZVb+yK41bBKNF/Q6DL+CePsQSxhzju6q1CYamY9eXscDwqOMsMtj/UvmMY4L5LoSAwss29ZNai1wTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706789936; c=relaxed/simple;
	bh=ojvLa6J2vNEPaRm4aUv3bqIyo8KqCp2WnapouUryAPY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YAjIw6TDEWqhRNjmiidxzc3Se8aBUGsJ5iMuopaqKGtuwMNEOVPhFO+WhAWJVbRiVtWhhVa7XfuOorD0pYhp9JRpZvqkafVQtWBUW7UwD5U5007bTct27SpBKCOQUt7x9SqXYx6Ej9EgnBHjgC/gs0hRCVxYvUb+dsNIrNkViuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by laurent.telenet-ops.be with bizsmtp
	id hoJt2B0074efzLr01oJtGc; Thu, 01 Feb 2024 13:18:53 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVW12-00GutF-8c;
	Thu, 01 Feb 2024 13:18:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVW1t-00ARmo-73;
	Thu, 01 Feb 2024 13:18:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: i2c: renesas,rcar-i2c: Add r8a779h0 support
Date: Thu,  1 Feb 2024 13:18:51 +0100
Message-Id: <b83a745334b0aea8bffae5a41db2543100ad5e30.1706789816.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for the I2C Bus Interfaces in the Renesas R-Car V4M
(R8A779H0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
index c4ace5585e1e22d3..51b220da461b068d 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
@@ -53,6 +53,7 @@ properties:
               - renesas,i2c-r8a779a0     # R-Car V3U
               - renesas,i2c-r8a779f0     # R-Car S4-8
               - renesas,i2c-r8a779g0     # R-Car V4H
+              - renesas,i2c-r8a779h0     # R-Car V4M
           - const: renesas,rcar-gen4-i2c # R-Car Gen4
 
   reg:
-- 
2.34.1


