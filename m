Return-Path: <linux-i2c+bounces-1956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB39862405
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 11:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F21201C21070
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 10:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC9A1B96E;
	Sat, 24 Feb 2024 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oWqXmKtm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B414B800
	for <linux-i2c@vger.kernel.org>; Sat, 24 Feb 2024 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708769710; cv=none; b=BRg/eLzaeBu7orqxUr5YgwVk34piD0juOM0hY5Uoi69M7S2VfMRFCBAj8tMwDzaVbWNb51f48DgGy/c+kTMVYyjS60GI0vuNqW74+csafXvUaIJnRE+nS+RbzM9FWyUKqa6qFkAYM/Sn+QhNc78dFd5BP4jaYN4Tq0RRkUosXSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708769710; c=relaxed/simple;
	bh=wxgwou9w+FdjJwrbt11EK4RuPyOdoJUL/mi29WqoTcA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZhWpHdKOeCHkhrhjMAX8LScI1wg0XkxGYNKv5gYM6OCXc2OYP+9oqmRsHt1dMEuFRNonxqRIMPEttuxicIJRWUqq/y3N3YvRaotR57Q8E9UJVjHt6m2J7eAqmJTcTPvFR3T5CN5UOcrBTs4OuEY/Po+XQKqnhZwqR7sXhu/Pj4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oWqXmKtm; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-565a33537b4so404989a12.3
        for <linux-i2c@vger.kernel.org>; Sat, 24 Feb 2024 02:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708769707; x=1709374507; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WSNnZRsK3HCrrwRYblwYuv7iBpiYI+/sP4b1qB6XFC0=;
        b=oWqXmKtmurW/kgvsAIJtrl8pcQx4brlSzfjLd/XBpnwXbegZ648cXhAbE77h9p7mCN
         IJmqGPsqn9z6fTe4XVPpdtRw/vB0PwQ9dHneQG9wX+k4CKs+NXV4fFhLB3zjUcRFsqJE
         1FwCZ0i4Wy6nO4HDRN9BcZR1lBa5/8xvzy6n6evKT27yodjPcdmMZoSLXcuBpuY7VpLF
         uxOEPgVW7AAcrpAkuEExuTBNw3aRkVPta8yWWfZHKxWHA8ultOhn2BwZiCGTaTpDPAmv
         8eBnyxWcVjG/a48Z4plQWx1NkSb/vhr2HxxpjoV8tjexXFzClg2Qnm1SXwu4vb8wZEH3
         ZI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708769707; x=1709374507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSNnZRsK3HCrrwRYblwYuv7iBpiYI+/sP4b1qB6XFC0=;
        b=pnN1GklfD7TY/+cFXsLiGTS9MD4eVdEuqV8bHvJYImb/ld4dgEJBXsJ/QAA8vP/ou7
         nODjBEycB6zxgOOZ7bPWmpbk++hvlJINMT5CIIYJhmmAsgdeyE6+JJ1TCSf8oadlII7Z
         KwHxmG/Dh2tSM81OEkt/aHpjMbiGCgOb3S1Io5EzC5pi3eAOdsc20a1YxbA5U3weXb4q
         9iCiEaE9fS9WaC4I8q26fHjmJVSqlVlE3FNyU032Az3Q5XX2J1JFyE90V78NN1AS3jia
         ISspOc+Eat3FGkyiuKuy41wWZa3T1Msar0zOVa72nCMkr1s5XalosIpyZs835z4WZRqu
         zwQw==
X-Forwarded-Encrypted: i=1; AJvYcCVMm5rv3UfdOCE4QgaZtPgjMG0UfhaEV6bEsZoTlCzncCIbqabZoOmHAnxdOt5rJUZSviqWnzI49bxVSIKX7cLtmjnLNdeBAV5D
X-Gm-Message-State: AOJu0YyE3xBVy2XQNh5W6Jcg5U+UBI8MKY1yelf2wMNkYEAzaS3VPONM
	rYWzoJspecHDYC626f778Q57OjybJeRfgt9DbJH3EJYgnR0XaWbTCBEW2fo8sV4=
X-Google-Smtp-Source: AGHT+IH7O/8+WVHEQcHOsWdHtw5pzT8tZ5N9ztXmlI3KoW/rCJ5PeD1l89vtFH4HS3q16C8RPMA9iA==
X-Received: by 2002:a17:906:f847:b0:a3e:8cb8:d819 with SMTP id ks7-20020a170906f84700b00a3e8cb8d819mr1728399ejb.51.1708769707524;
        Sat, 24 Feb 2024 02:15:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id p10-20020a170906140a00b00a3fb4d11809sm446545ejc.204.2024.02.24.02.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 02:15:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/5] dt-bindings: hwmon: common schema
Date: Sat, 24 Feb 2024 11:14:49 +0100
Message-Id: <20240224-dt-bindings-hwmon-common-v2-0-b446eecf5480@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJnB2WUC/42NQQqDMBBFryKz7pRkFK1d9R7FhcYkDtREErEtk
 rs3eoKuPu/Df3+HqAPrCPdih6A3juxdBroUoKbeWY08ZgYSVAmSNY4rDuxGdjbi9J69Q+XnI25
 t0zZiKNvSEOT5ErThz6l+dpknjqsP3/Npk0f7h3STKLBUpKgyRlItHi92ffBXHyx0KaUfjw759
 MEAAAA=
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Luka Perkov <luka.perkov@sartura.hr>, Zev Weiss <zev@bewilderbeest.net>, 
 Eric Tremblay <etremblay@distech-controls.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-i2c@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wxgwou9w+FdjJwrbt11EK4RuPyOdoJUL/mi29WqoTcA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl2cGgchA7nFEl8BI7R099rn45tf8inXNMpTTh3
 MmPj9F3BbOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZdnBoAAKCRDBN2bmhouD
 1yOlD/wIwJX1z9SM0kcRZoStce1zxLealAzlLCwZEXrbHo3ZOAwBOYiIzi/boC3/3yLNOfFhmgW
 6XU9051bnFVHXHlDKn0XViDjBwLHo9DX8vPTg2WFDr7A62epwunrIh1yOH8pl/l+ChjRnjzTVn1
 6EZ7+/gwkhHcwEoGSCMS5WDucvVLBQpG0d+M5aDCVyAoxqEuApTKj2JymdqusRmd7w3FStcBb4v
 Mq9+c50xzA8FkpCqBJnyxbTOlhSmOmELKjTvxslCIDY969lxir0SKjOsTYF36/rXvzUzyLVB05N
 eifiAf/1vOYWla213lTu9mLMUl/pL9em8gcQ4WwX+aj6ZWV45FpLHO3UJ4X6bvqpnY1OLmGFvbH
 0y8Zrd2rZAPpBkAWtq4k4UZU+fcFd38D+rk1MsyumszcmSi1X/JlXq8HWuuOECW1iWBYZjzSCJn
 N4wJQdQR7Qj0QGMWgaHJOEC1fclB6xw0xoWzh6Nmd5D2fUGn+4OdG3DFFawdKxaiiVd50nZ6BLp
 JT7+bR/SoYi+LsfR9wqsNALDTvS1GJGu1sO3NcQSAGh0M3p/SNr4uKEgKb+Sf6GB48VAiOG4vY4
 W1JhOSaS1HMnh1376/t433x8LBfswSeJFh+cwo5LGsj6wG6Jhbaw8P/JPQoFJlSikTuSHXZT+7P
 zzAH4VkcdzA1KVQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Add acks.
- Patch #1: add also shunt-resistor-micro-ohms.
- New patches #3, #4 and #5.
- Link to v1: https://lore.kernel.org/r/20240216-dt-bindings-hwmon-common-v1-0-3c2c24ff1260@linaro.org

All device bindings could soon get a label like:
https://lore.kernel.org/all/20240215-mbly-i2c-v1-3-19a336e91dca@bootlin.com/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      dt-bindings: hwmon: add common properties
      dt-bindings: hwmon: ti,ina2xx: use common hwmon schema
      dt-bindings: hwmon: adi,adm1275: use common hwmon schema
      dt-bindings: hwmon: lltc,ltc4286: use common hwmon schema
      dt-bindings: hwmon: reference common hwmon schema

 .../devicetree/bindings/hwmon/adi,adm1177.yaml        |  5 ++++-
 .../devicetree/bindings/hwmon/adi,adm1275.yaml        |  7 ++-----
 .../devicetree/bindings/hwmon/adi,ltc2945.yaml        |  5 ++++-
 .../devicetree/bindings/hwmon/hwmon-common.yaml       | 19 +++++++++++++++++++
 .../devicetree/bindings/hwmon/lltc,ltc4151.yaml       |  5 ++++-
 .../devicetree/bindings/hwmon/lltc,ltc4286.yaml       |  9 ++++-----
 .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml   |  5 ++++-
 .../devicetree/bindings/hwmon/ti,ina2xx.yaml          |  8 ++++----
 .../devicetree/bindings/hwmon/ti,tmp513.yaml          |  5 ++++-
 .../devicetree/bindings/hwmon/ti,tps23861.yaml        |  5 ++++-
 10 files changed, 53 insertions(+), 20 deletions(-)
---
base-commit: 1fbb328e461df47b19df1f72e96fb6d7d017c28e
change-id: 20240216-dt-bindings-hwmon-common-897970b393f2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


