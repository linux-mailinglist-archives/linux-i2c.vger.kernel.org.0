Return-Path: <linux-i2c+bounces-3947-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42009902446
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 16:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3BCD281DE7
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 14:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C61A13C3E6;
	Mon, 10 Jun 2024 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlBp9qKB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4A213774A;
	Mon, 10 Jun 2024 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718030473; cv=none; b=rFLIXBO57ZLkQRaOZzPX6leyDqteZWyScfmPapM+fpOXYH2leiC37dmE8rODWRQlip8mUktS6re97E0HPJiwfd34E+zOJPMKEDtH7GtLPtbvzrxF4XTmhc1SEKsO9m6GDBztl9UWPltcroACWSkkQBVyr2DFlywOUK90RP7odA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718030473; c=relaxed/simple;
	bh=zjeFdMfEWi9lRnjxPzFnJQqsm0kXpfPxDwStso/WHBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J8AnZom15pUDCW7xdNECtDrRj/Tv4FsnPksUhAt4yHrQWpXSHTDi0UQU43Vx9ACsvsPxIlP1k9bQ490SGYuqbKC8WqDNGETG8ASjJKW0ylS5xLAhK6LBO01sefztukgS6e43hn8/24OvxATWuw3jHQnmd2p5xgohquP34bcIKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlBp9qKB; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7041f4553ccso2345544b3a.1;
        Mon, 10 Jun 2024 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718030470; x=1718635270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiQRZCJ4lRKdCOsidmp5fsupiblBLEugjBHIkO/u9wM=;
        b=WlBp9qKBukPxhnriymvYtGsEKujc+XRo5/OeeAcrw6p2HZi/aU7y25Pk0kobYFxpYR
         GbHPAmbb7HJnT5THwqReJj3OMkg58+jt169UBql8/hsvCINqSbzTKdmMBkB+LgldOyTK
         bqeSbVhEG6lV1gruRuDe1vnix9Wb8UbfxteFkjOufq49mTT8p7+9MVyUli/U9vHzfXtd
         dqJZ67LdNC+P02D2K2wG3ABkEIFTgCbEj38h4lArmR8m1cjPqABmRDvHTN+Fy38wZ4zG
         YqMDe3fpcc3v1RRBXffaAjZTLUMDoWbzP0LRRYUxLE00NB8GWBfsh0v6vM7yUOUCgrHS
         cBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718030470; x=1718635270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xiQRZCJ4lRKdCOsidmp5fsupiblBLEugjBHIkO/u9wM=;
        b=V85AgZgylsEiTk0r2zPmC21eqFhGnS6bZk4lXyDnJ24j/Bgj20zzjcE3H+O2pgYD4e
         xpbYu0PjvUlsa0LuAWVfkwz6SE2TAwsij5xmYLCdZoLfpjSnmi/BRmZWB83LqfQ0daPW
         i8CZ2mcMEXKMtISujJ5GLbpTNCfUuDR8dJvTzRECPaJAIUuUJoSvNvRaYB/LpjzDL6NP
         7Q4zUj55CWYmBeTKrbTw9Z9ZxMWGgOSpTHJZrt60aQmPf5lZNJzpRH2vKOYz8JQaPnKq
         pGQnoFD6Yi+W7NLlPGRPOxCTlDtbpQpptWKIQ8LcBeYoIG1wiZz+iHo7+3aHrv15pRh0
         HrgA==
X-Forwarded-Encrypted: i=1; AJvYcCX1XG7umfJDijPOiUMahB6u7wBrXVWfqJ0e1lfkA8qoJGHRMP7htbWR2a3gE2jMS1dP/NcbKIkD51U34OqMaDscZ9HTHJx7W8CRKbhoGXzTp00molaqDv0OW0VaqZXQTQJwNq9Hmdy2yw==
X-Gm-Message-State: AOJu0Yy7131l7Wd7QkAFJIHGRaDBesuPh0CMS2H6NsGGoJ102Ve5h6dy
	r1pBSTdWhWkDYIz6uegErvtEOJ0oLriiFiTcctfo3OHpsv6e6A/4LgWpUw==
X-Google-Smtp-Source: AGHT+IG7jn0w4AwOM1WM0D3Y4KA1sYQNLSEjiwsIH3RfZa9Awd4mWYUvTSmeQUMQ8vDE7C2yIvQwVQ==
X-Received: by 2002:a05:6a20:1592:b0:1b6:cd8e:4a5 with SMTP id adf61e73a8af0-1b6cd8e0845mr4653885637.19.1718030470580;
        Mon, 10 Jun 2024 07:41:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7042eba77e2sm3311157b3a.104.2024.06.10.07.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 07:41:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Ren=C3=A9=20Rebe?= <rene@exactcode.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Armin Wolf <W_Armin@gmx.de>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/6] dt-bindings: trivial-devices: Add jedec,spd5118
Date: Mon, 10 Jun 2024 07:40:58 -0700
Message-Id: <20240610144103.1970359-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610144103.1970359-1-linux@roeck-us.net>
References: <20240610144103.1970359-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the SPD hub present in DDR5 modules.
(https://www.jedec.org/standards-documents/docs/jesd300-5b01).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v5: Unchanged

v4: Add Krzysztof's Acked-by:

v3: Drop explicit bindings file; add binding to trivial devices
    instead

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 0a419453d183..1d19e67de2a1 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -168,6 +168,8 @@ properties:
           - isil,isl69269
             # Intersil ISL76682 Ambient Light Sensor
           - isil,isl76682
+            # JEDEC JESD300 (SPD5118) Hub and Serial Presence Detect
+          - jedec,spd5118
             # Linear Technology LTC2488
           - lineartechnology,ltc2488
             # 5 Bit Programmable, Pulse-Width Modulator
-- 
2.39.2


