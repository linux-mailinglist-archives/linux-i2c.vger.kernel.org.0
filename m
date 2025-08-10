Return-Path: <linux-i2c+bounces-12211-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1300B1FAE7
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 17:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6351B17A5AA
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 15:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5944C272811;
	Sun, 10 Aug 2025 15:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="5CBC/Wrr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E479114AD2D;
	Sun, 10 Aug 2025 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754840815; cv=none; b=nMvsNopwUQ8yiHjW2HNlrHhWFub1PnUWdpjkQ4oBFlzMzEN5GkqMI1Me61ubr0KQItuACDhfF/gS3PaJw3gKjAx7Mc5F4cYVSuGWn7OCxaerN9iEFZEh0O6Nx3D9AXfJNcnpeRCG0n3FcVGRGVRhSfBhxJwi6u05uIL36SkRReE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754840815; c=relaxed/simple;
	bh=CQK4XeRFLu3rcgEvH3wxAT/FTjTzG7XzBZejK6w0RyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sgOypRx5EUAtB+2jrS5OOlzMgNFiMoTedjnosyABcZFrXMyh+rn66zun86btIScVmbMxLu8scZDkrvzO6lo0no6qWaUrBlFo5LLOgsf/t5bEn1+Ul9PVBpHdC27qXW/55F8kmMEJDnJ2yVqhaWom0P3okUiMsOIHcuvQT9h8VwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=5CBC/Wrr; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1754840306; bh=CQK4XeRFLu3rcgEvH3wxAT/FTjTzG7XzBZejK6w0RyA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=5CBC/Wrrr0gyXjGjzv7pD54ma6xaFiEMMzSA2xu3jfUlBe5NuVGBGFROWpcnQ/3pD
	 VzusuvT6D6XH4RMc5WQ3wmhBk8vthun5imE3BG4fhO0N4poB0d2z5fo+HDUVxUom2J
	 lc5yqv8GyvKFSWoMSdqxAgOmV6vtix/efEmWPOzA=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 10 Aug 2025 17:37:54 +0200
Subject: [PATCH 3/7] dt-bindings: eeprom: at24: Add compatible for Belling
 BL24S64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-msm8953-cci-v1-3-e83f104cabfc@lucaweiss.eu>
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
In-Reply-To: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=779; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=CQK4XeRFLu3rcgEvH3wxAT/FTjTzG7XzBZejK6w0RyA=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBomLzs5dRfHSo8cgj/cC5oosNATFcqGL1GJHCP7
 f3Pj66MMv+JAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaJi87AAKCRBy2EO4nU3X
 VqPxD/4pCOy9zoKEUYS70pThizx6O764oUGct4QT4XOmerSnV9bfk2dTylbjI/ofpB267vCzfkd
 2zzhJiEELFZhICYOmZ18IKJnirY1LkDTgLfNpgBYMU7pkdfBQxr1kS2IL/HqjBt7h6fyX/NMcd/
 mICmG+Rrnifbf0i/R5SFSpbYTcR2qALKBt9q2WggLJ100ZJPruhoSYnts6Z4Cq0xvP4N11qBZPM
 piJ6Gs0LkEX97fyyJu7BCmculAVOoYme1IZ0OQXuY0zGpmD8ZxUbCH5qWjhgDTI/SFHA0lbVJnc
 8Ka2U2ueq+4pRNUQzmLwc0pwKc8170JFh68KHt89cw3Wo5kzVue5M3pYX5I3J5UoK3LjyDguuU0
 asRTg54DGPHo+5/Rp6r3vS0VsJbMymFNBjXJ1Hjs4+FYrKpo15fiy2gXZYaiY3DS07zoupf3+s+
 /vwTVKielIwHztW8BDZVTa3gnfsHdYr9c5ZrhCl13avuxEe4wOgt7u5yIUcZSdnAB9QPQQbXOdX
 QxcXAHGc3E1VQHk35u/rFkVhwF9Apzbqy2J0KQCtJv/0ZXLcLX1B199xY5jkNGCdk595kLbZVOn
 ehetoLTHLFGuRv5Q9dRY5HdAuMEsKN02GaKrcTDav0/+nVCrTYIFxyhknoh1l10sXwm6lv8Qhl8
 /OAR/ePNeJM40Fg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the compatible for an 64Kb EEPROM from Belling.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 0ac68646c077790c67c424d0f9157d6ec9b9e331..1e88861674ac8525335edec1b214675c8efa3ffe 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -131,6 +131,7 @@ properties:
           - const: atmel,24c32
       - items:
           - enum:
+              - belling,bl24s64
               - onnn,n24s64b
               - puya,p24c64f
           - const: atmel,24c64

-- 
2.50.1


