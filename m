Return-Path: <linux-i2c+bounces-8884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A22A00855
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 192627A1021
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 11:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DD91F9F46;
	Fri,  3 Jan 2025 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EuvVQut6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDC1F9ED5
	for <linux-i2c@vger.kernel.org>; Fri,  3 Jan 2025 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902728; cv=none; b=d4EZLg9gX34tcxL9y2I5A/RExm/IBAuCzR9zVj5CF/OIgq6XuDEfBAqFHm0UQl8/XshIXsezHeialdPUym1bdDU2NRoJiGzYU4PunPoigeRD5N/BeuB3XL7ZQPPE/xCyJWvI7Dwdmbxu0ufEock+zjj5hWllfd9yobNXO9OX9ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902728; c=relaxed/simple;
	bh=k/+Dav64Dj1AsO7AF4e4/71hUuQR84tXM9wYoKmRizs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJHAkThi0+8WQ8UGSVb8wiwhp7XchF1tDN74r5kCzp8nrBoEmvwgibLJsHnfqq4M7iRK0gSV1ZZquWf2E7N6k2KybD5NZnNW8UiEwIEFWXz0hrYFpxiiRXW3f25+YX44wyoMmzBaYfwgKd0mepwRgVAxbjX5+MQhRTanPMD/ems=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EuvVQut6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaeecbb7309so1315559866b.0
        for <linux-i2c@vger.kernel.org>; Fri, 03 Jan 2025 03:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902723; x=1736507523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GFCGdANYwwTIqvFtakmQcQllvWKcLMcYfzvoNYCAks=;
        b=EuvVQut6OEwRSXzGBNQhIXLG3M1ppZ6s1hVyQTk58JE3023kiXQw1VEXUEKZBM+rDQ
         Wdwo2Wf5LGFXKmuxzo8RAqCBLarxFq+orjrQbPmjJMvlYDNeSg1fWTys2Q35M5gWuBgB
         FppIKw29pH6aXIszwt8QjEvA1zEc1cHfM1dc1OXGIYRm5lrkCqP11KeeVXCwQN1LAp8M
         m8HmMdF8Eym9cnxjlzZvLdyu6B6JMIOFoFsY1J1cjaJS9u7KECgqz6/VM2owcU1D7sB3
         NY+CcCgKKpSHwADMwBNLuMo9Iq4wUjbP83LzRKo0wtXtQD1W4o/cFiZK7Z5EwkzyRVqz
         dq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902723; x=1736507523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GFCGdANYwwTIqvFtakmQcQllvWKcLMcYfzvoNYCAks=;
        b=Rhaie8K7kp8+P0Ws9KcLUdJegkZpXLWApAKO6A98YE2n/jYx+g+t2tylWeQudytIBM
         mUV1V8gHiujlLJj1awlKNXFnDGIv7AzDdXqcoKkgesF2cva7R9YPAw1I4c9b6E6w8WO9
         K97AshD5bO0qgpYD+2ZXcSWuECIiUCYudHN28nMFjZs929OXqJ1xjl0woEDXxqsuyz2S
         U16x+MSMSMswL4P8pMxvHhukqOmxgcbLcICznV/lZyTEQQ17Rs9hdOhQumFh78TkmDey
         Ik9+Ig3APj0O/0SaMAsytUCExa/4y7/C5YYI92RD09sH5B57hkXDDr23KWZdi6OXOH5l
         4XEA==
X-Forwarded-Encrypted: i=1; AJvYcCX5vxH3tlL1QqkEzqz1ZSOui6i70VlUlXX8/AJiqh4xqiXl9IaCCFssrICE26isJFgvHD1YrpWgptE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPri3LQ33dXCsWz3A3Z90MGgwbWzPO7Y+qjZk5lCPjRdfyxe8U
	VYeyJC91JlHyvuKZj0vLaq2Oll+CDe1BsjoR6Cp2YipXZtFBVfgi5UV84ZcIQck=
X-Gm-Gg: ASbGncvqE5EYdF94b9VWdtBYtj/FuebIjhdhsnmcjCfjEausJz9tLVKwEbzjpV8jVmf
	iq0AGx6nK7mJRlMn3vWuDGo5XgZaTvuPvJ9g6k5MHZU9bhp5XGlIOkBXCAcJE1JCPCsLqGV20ZZ
	dOS6SBEZ6ESY3JBV5vmCnAAfl4t0hh44YAajSyF/Jo28TXDkwzO7W2etU1/cRTaJ7q/P+scQmLc
	PKfq3Ddod9KCD1Sac/mEhgCytVcjPwK/yp5ndb4AiGgQeZ2pJWguoPuYcFOTFOnMsIJb8K/QPqN
	e/EvVExk3eq7CUh6OiOEpzLLFw==
X-Google-Smtp-Source: AGHT+IGxXhlOWbNK7IyXotx6Xt07xXCLWDYVJCz7UEJajTpXBFKX/Nmbz6mqm9dh5HVCwWU2AoE16w==
X-Received: by 2002:a17:907:c10:b0:aa6:74a9:ce6e with SMTP id a640c23a62f3a-aac2ad7fa23mr4318970566b.16.1735902723018;
        Fri, 03 Jan 2025 03:12:03 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:12:02 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 12:11:59 +0100
Subject: [PATCH 3/5] dt-bindings: eeprom: at24: Add compatible for Puya
 P24C256C
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fp5-cam-eeprom-v1-3-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the compatible for an 256Kb EEPROM from Puya.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index a2970c7c8f27600ad0d495a7e14875a3be611c03..c9e4afbdc44809c21fe4c073f1a2494e899dfe0f 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -138,6 +138,10 @@ properties:
               - renesas,r1ex24128
               - samsung,s524ad0xd1
           - const: atmel,24c128
+      - items:
+          - enum:
+              - puya,p24c256c
+          - const: atmel,24c256
       - items:
           - const: microchip,24aa025e48
       - items:

-- 
2.47.1


