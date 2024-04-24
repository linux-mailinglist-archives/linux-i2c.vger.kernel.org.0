Return-Path: <linux-i2c+bounces-3098-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EA78B06AF
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 11:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 822101F23EBF
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 09:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0F215ADBA;
	Wed, 24 Apr 2024 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGdQPbdi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2812E159219;
	Wed, 24 Apr 2024 09:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713952591; cv=none; b=JbofiibQGez4JQKYXS9QTiMzZF3mctlsQqObqkc89/2lZ4b5w37yNNo3XT9iarm8KWLrVDjKBzSAjAGBgVC3NbNjaArA7R/Mntm5RUblw9puLfVVbH4aIp8CJSq/T0fAzU6Q55ker9IeUeNPcG/D+Oc6xhLtFZnp8Hq/VgRJF80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713952591; c=relaxed/simple;
	bh=GR8A7c005nMUANFMAbqCEmqGtDL0serin5bnFniQPOo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SEBy+e2RxPCaENfaf9u0l4QKFj8vRxOzkN/DEaJDw+Ui1UomacqBRDjdMW2Yci4GSm0s3f80vJsHfqp1HQ2RzZ5uDJ/n2mKcNA4SUwvKMK9H1BJyzyDt1PLy9jIJ88RXont3D83+HMZBamJ4XJqJDhvwrO64UNthjEvhFJFO2Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGdQPbdi; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f043f9e6d7so6982622b3a.3;
        Wed, 24 Apr 2024 02:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713952589; x=1714557389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yN9ZYDD/GHZL9HeYNNtcwFkCjAa5nvHWIU9QFcJoOPI=;
        b=HGdQPbdiKcMr6ZEuEQwynP3LW4utID2QkeIBuD9KsVdMNSotjCgMVxG7KA1mtS63Kh
         YHD9szMTMRHDqBSI36L3SupxWA+ZoNe09uFimmNXauPjO2wvQ6OUsMrGP2RhLsmSQxiL
         7P8MEb1ppKiKVZrWM5Cpj+xIhiwcKkc5mexpda6MuuBjSv1BgsV4JdMeJUoNv023Ny44
         Wg00SKMxYt9ibhYlByfFjxiOlUsQcal2V0O3usCQ9395SyVWqWM1sWrBwPdvUxUWlonL
         MriuGg1gdfa1T/TeABUb7nMuQ2hZxKTaEMENQprPOTQSfiF/oy8Fth9i6Oo0ZcutZ07U
         CNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713952589; x=1714557389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yN9ZYDD/GHZL9HeYNNtcwFkCjAa5nvHWIU9QFcJoOPI=;
        b=MExn7Pt00mj74G5VXke1nZygCKa1nvCYd2Yu2fyDgrwP7+faMq4PPyVqen+m6V/AaX
         VAV44kA1Sd/XDHf87KBdpSu8syKsLgnt5cV55lsr1DyIgkbq0/iOn4/eGkgQzz3bFG/C
         zEoKDkfIM1pMeLi2rAOk/XmFtthGBH6VK8md6d1H+Ze6/DnQOlpV1/gO4L74ifJsRoR7
         MpAKpS7q44Ws9S+TnXpeLVbZIsWx7bJXWTYUf3SYakHRT8VNg3b8UHbTKjrp0QxuU0zv
         ptbGCqbuZB+jYn/8cGMyhsYt7OWz36twaCe15l80F0DoxC9ZnWSLriYMQuxBQOOczn6O
         rsMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXadpdcy/icz1MSflWMHHKKlPicF6aMiOkRe86uhyLZlgzjPrl49cS6YaJlWh9ztd7c8gfgpwuTEH91UgbLozw0OmtfnPIRzDw4j8fTLiYiyaGZ+8DMLPQAR/eCX3xomkz2iDe0JzAs2gGHzxfmmAcMVK9TkD5r+gvfgLjkutvUwsC/cFtWMPmN1kWkAMQJxmGQ1FA7e01kQg80VSpqdaz0WOWS4RtnN1TSO3dv8wmkDmnxtHJIY+oTUiXm
X-Gm-Message-State: AOJu0YyI3dHKeAzmLcHy/qXJfKmBfLsXE0Hoxh9AtwL5fyc5GL/fCyf/
	wyUGaGiODGtGrl4KYuyfVx+z0L7Kv4VJjBOT1fqfxwSZ0tHSBdTP
X-Google-Smtp-Source: AGHT+IHqENdYJgDrTUiyFBAYDEfP2zIyky+sERTOkTbpoL6wOvHxSc59L8kaSHDYhBV3FJbCcF44SA==
X-Received: by 2002:a05:6a20:96d0:b0:1ac:f796:963c with SMTP id hq16-20020a056a2096d000b001acf796963cmr1552398pzc.56.1713952589509;
        Wed, 24 Apr 2024 02:56:29 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e380-6057-c341-626e-0f0b-b82d.emome-ip6.hinet.net. [2001:b400:e380:6057:c341:626e:f0b:b82d])
        by smtp.gmail.com with ESMTPSA id b19-20020a056a000a9300b006eae3aac040sm11042932pfl.31.2024.04.24.02.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 02:56:29 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Andre Werner <andre.werner@systec-electronic.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: hwmon: Add infineon xdp710 driver bindings
Date: Wed, 24 Apr 2024 17:55:58 +0800
Message-Id: <20240424095604.3425857-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424095604.3425857-1-peteryin.openbmc@gmail.com>
References: <20240424095604.3425857-1-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree bindings for xdp710 device

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index e07be7bf8395..f982de168c4c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -134,6 +134,8 @@ properties:
           - infineon,irps5401
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
+            # Infineon Hot-swap controller xdp710
+          - infineon,xdp710
             # Infineon Multi-phase Digital VR Controller xdpe11280
           - infineon,xdpe11280
             # Infineon Multi-phase Digital VR Controller xdpe12254
-- 
2.25.1


