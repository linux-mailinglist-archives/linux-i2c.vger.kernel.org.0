Return-Path: <linux-i2c+bounces-4536-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 886AE91E2EA
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 16:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4452C28684E
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 14:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1574816C6B4;
	Mon,  1 Jul 2024 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4busytm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4125A16CD10;
	Mon,  1 Jul 2024 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719845773; cv=none; b=SdvA9G5OYwSb5w4YD6QPrByTixn+Zag93rSGUfJt/J3+ae4NFhO167ZR9eh89uvWQ7VgrlFEQ4b4zxWJ0Iu8lXZwIIw3N3UAQwJVoH6Ym8VCfNVaG4xtRWSSIpYYnKw5/QvNDLjIw8PTG2VySSw2r20sM3q6VpfniMofD/fJBMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719845773; c=relaxed/simple;
	bh=5A/LPrJoCxitojeJt7eBlNk3snz2b7ebrhihpRcHwVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OP/MhX8PNd51jpQ5MaAxQBH279SXHK3teqpfiC/HyUjhR4ibQSOIt/D5FLTaovJgKElNOCVugU30Niz7/SgdIklYm6kdVSLdIkqXbJHZH8dUscxwX+hEktYt7dZ7fZVXl1ZdiB/hUlV1mJWZQ5dc9cW9m4t3iusCEkiclOQ/zgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4busytm; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdbc20faeso4469841e87.1;
        Mon, 01 Jul 2024 07:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719845770; x=1720450570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SI7tOorPKK3iwm2YfS1Q/1Qsuj151Q4jTdztaPUQtFQ=;
        b=T4busytmJoIUhX+u62Febx/BTowS8duq7NXbM6ZRpyf2muUN8N1Hl2MODiyuf4668/
         gplZcKufQ8qmcXXrKgwKVnuppOdZHDS1QrtiKyFqf26t0aaEymhUOZGf9Wa1HsQObMNT
         uQlKngF5Yqk+Enbx7asL79YUyzxe/G0NKI3MsUDpfUetaIJgfUVVt+RpHc6ysb+Ltxaj
         32UDnDjA7MBxlNj0IWharGghIU1OcLflevDA05u5E7WVxQpplkhGR0itppSqUbexpFrS
         ZfTuqs63MJYnB0FCA4qK9q+C5Wbvv/VR8oBL1NIzNlhmSpqJRESvkALhmLg70sW99U3L
         bLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719845770; x=1720450570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SI7tOorPKK3iwm2YfS1Q/1Qsuj151Q4jTdztaPUQtFQ=;
        b=MqP70+0bIjHITrtMS4ncyjqW2W0En/yThCL4uq0lJ1rl7vHfPc2GgsRL/v3JM4uXmX
         61Oh161g3Rr0rgpiKRm43RnBC+EhcFdcJH0p5YpeLOtZ2jpcwFfWtWHUlN+WIqXLv0DZ
         fkJD6h8+KxsyRbMeTMxfqfg7oyoh9Oh7Fddlspie/lTxC9UZglW/zgW8q5nrOOHt185b
         jRdH1M4ptmnl1MrToeRPQLarvd9RXqtJ+CKmbU6ZSIr1psDLaIcpyZAEd/4uGikDkz07
         kqQN3ktW9o6YWe4mAc2g0pQoa8+dya2VmP6E+fuNQVdNjpXy1iWsQzB7gpoBuo1NVgsB
         7Prg==
X-Forwarded-Encrypted: i=1; AJvYcCWb+dz7RI+HuyfTRErzaJO50bvlyl19cKbTRdb7iEIGj7SveKIyOklYJtIjL1sa716R2OH9hDH0trJe2nd59jW3wGQmG33yhAZBdOarFHWq6+EZuctzkEBEngoOj9x9VP5De80uo9LDa8swbzo2XqSAq3QpgGHIKFdmPepkENVzGSfrOALsz6TpCXiXPJbAcuvtErEN+7NUc1Wn0qGVcS8=
X-Gm-Message-State: AOJu0Yzj0ogMguNYJSVzL18i6tF1ME0obV1EL1QYbYVvCN+08UIunolu
	kReIipDyoRRUJxYZtkELMATfcmxmV40k2ZYhDewHddDjTTu+qoEV
X-Google-Smtp-Source: AGHT+IGKrafq/2eu1GHjEdTxJlodhaHfOC1Q+9Av8RE6LGiQk88EuaMm+XlVEKTCfbvl7rteoRk1cQ==
X-Received: by 2002:a05:6512:3b8e:b0:52c:e4cf:4f31 with SMTP id 2adb3069b0e04-52e826fe103mr4254064e87.49.1719845770207;
        Mon, 01 Jul 2024 07:56:10 -0700 (PDT)
Received: from localhost.localdomain ([195.239.203.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b1dbsm1450044e87.253.2024.07.01.07.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 07:56:09 -0700 (PDT)
From: Alex Vdovydchenko <keromvp@gmail.com>
X-Google-Original-From: Alex Vdovydchenko <xzeol@yahoo.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Alex Vdovydchenko <xzeol@yahoo.com>
Subject: [PATCH v3 1/2] dt-bindings: hwmon: Add MPS mp5920
Date: Mon,  1 Jul 2024 17:56:00 +0300
Message-ID: <20240701145603.1507516-2-xzeol@yahoo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701145603.1507516-1-xzeol@yahoo.com>
References: <20240701145603.1507516-1-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for MPS mp5920 controller

Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index ff70f0926..cb2fc26d9 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -296,6 +296,8 @@ properties:
           - mps,mp2975
             # Monolithic Power Systems Inc. multi-phase controller mp2993
           - mps,mp2993
+            # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5920
+          - mps,mp5920
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
           - mps,mp5990
             # Monolithic Power Systems Inc. digital step-down converter mp9941
-- 
2.43.0


