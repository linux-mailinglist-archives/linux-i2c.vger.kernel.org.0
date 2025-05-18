Return-Path: <linux-i2c+bounces-11010-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E336ABB209
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 00:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D2C8174720
	for <lists+linux-i2c@lfdr.de>; Sun, 18 May 2025 22:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF1020F081;
	Sun, 18 May 2025 22:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="OoXkov6u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B0620E034
	for <linux-i2c@vger.kernel.org>; Sun, 18 May 2025 22:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747606070; cv=none; b=MWdlR+wta9plH1oS07KSqFntTQbQknW2JhGNJ34/sAMyOrbtITJ/9dLTlLoVHiHY4xF+Ww3Gkc9/v8rSeSG3yCXikYiX6yFDzbeu8AmhIQzMuzYxWo2X30dncTbTw1bufvzo+d2PLMrkQ2/5fTOFZRpWrFD+gG8c4UYp9PYjtNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747606070; c=relaxed/simple;
	bh=9curmiG4YbpPUmNJzaDKpDzEW84OyLQg40Vqsed5nNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WU8e7Kwou/8OFZ3IL1Zd6zUV4U+fzmLys++EYGIthATlUtik47AoJtwgXxKGJ8pX+WLTk3JI4P8eK81aAmflm6x1y/4eJa2at6TEKW0xqPkTrdAnc4Q+NM/jZ9MhP4gla0wbAJ6/8cPG8UQdHMOXX0Tbk7HKSmUgFmriLksLfRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=OoXkov6u; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747606068; bh=ngOKSl6OG/tW+9Rxzp2cYqj7UrWaCYxSd5FvuPjMg/M=;
 b=OoXkov6u+ZJei49Rixj5/mqZwpBnEJu/OyVuusoUV9ZpgyiClEYfY/LZtJVr2tu3tU9TBrCKN
 FAogJ0E/C5vPzhHrj9zM2XxOAKSDaRIyz+ixTtXdjiKeFIuWRsbvQTYN8ZUARSC24gG6g0YGgCc
 RApz8qfopsU6AFPgsZxZDzSRb0k8kkzqwj9U7R5doxoj3+Jm001YSPo6Jhf/VcWLiNy1itDR5Ib
 ZiEnCotjAUmun7YQaIutqZ9xoq1IoWiIXvkV2niua4Py6Ndoo1q9kTXDaIZiZ5VURY2Y+suEOo7
 ID93EUSzKT/ukVwlhbmDHb1UM6+XD9wJMVabtV50Hgrw==
X-Forward-Email-ID: 682a5a2e78cae75fbd8d4704
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] dt-bindings: i2c: i2c-rk3x: Allow use of a power-domain
Date: Sun, 18 May 2025 22:06:54 +0000
Message-ID: <20250518220707.669515-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518220707.669515-1-jonas@kwiboo.se>
References: <20250518220707.669515-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C controllers in most Rockchip SoCs are part or power domains that
are always powered on, i.e. PD_BUS or PD_PMU.

On RK3528 the I2C controllers are spread out among the PD_RKVENC, PD_VO
and PD_VPU power domains.

Add support to describe power-domains for the I2C controllers.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 2f1e97969c3f..4ac5a40a3886 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -105,6 +105,9 @@ properties:
       (t(f) in the I2C specification). If not specified we will use the SCL
       value since they are the same in nearly all cases.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.49.0


