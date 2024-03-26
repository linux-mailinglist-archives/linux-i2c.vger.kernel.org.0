Return-Path: <linux-i2c+bounces-2620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB0388CECB
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 21:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECF89B2922C
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B15714290D;
	Tue, 26 Mar 2024 20:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u5qpCE3z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D361422DB
	for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 20:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484680; cv=none; b=M50oq2nntSQSZH4gcnnoufr/eLwouoNZvHO1RV/KtXMek2+eG33AVXJTOLETkgRdpeHP7GflBYfG3LbkDIBneibI7SQzW6OzUazIE7Adp2NqxOIZitpklqCZWMZZjB0YeWs6Vg+E9+wyDOMwmPUjiMwRL/+R87+aqU2ZuGtzQRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484680; c=relaxed/simple;
	bh=INljxUCSw+yVREcFpthVyGE5rYMeWITztmBOHKglJhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThNkN1Y9075NrAYJryhsySB+WDPwavfEB3GZrUtZgq7vvqPzJFwnxgM+kMdBH3gIphzehj6a+qMShn3l4hjQouTD9x3u6y7bG0bg65ngsi6cICwi5LQRgsw/gLBv9V/IUELjCPis+jPyBmgZnySxcFaLmokCLzNL9K2pM9ok0ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u5qpCE3z; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a4dfb8bc3a6so83763866b.0
        for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 13:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484677; x=1712089477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwMQZ0nF23w//xAHnzD/oAWHiNTRM8AzxRIOUkQer54=;
        b=u5qpCE3zBOYX64htzdaWtvaQ+5lf9AFcQXwAiI/rrBpfSZVes5SEcs9ZZXegrbu1J0
         dDg3gb/HgXRipG/K68wZDvDux04Vqj/iybJ86c2BT+kbnCMFdHY8rtcGABZRTopmp2Ln
         8F+878m8MhgOAGxvASzfk4ZR6f4ukjImfiHeIv7Iz9siR9/XzBKtCsiewuUeFlJQBpxz
         w/rzslA6LmAtC1JC1YjmoMhEC56tgm46osnac3Bk+O8lrMjuCfamMuRn+aGERdt5wNrZ
         X1xHI3j7a4g7NA1lHNKbBNAyaKpKHAZm2iZJqKmk2E0oTeqxrlDS3xYto2NLYN7zBl+I
         b+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484677; x=1712089477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwMQZ0nF23w//xAHnzD/oAWHiNTRM8AzxRIOUkQer54=;
        b=USVrXwMAbHcVZNJCyRnPlgOjNr5P/lpt2urwusoYqwFF3BKgG0OIFpJvcRmlOkF8gm
         kbZjpSQwr1ht8I5CWRlRK19yZy7sPx7ams0tT8+7Vbw0VwiJEjjbKordT5eBdQx1aFgR
         0FRLtER3KPIoxWACJoYgU2rXOIhdjh90UloMcG8XgfJpExWNf2QavCjEXxt3dYvuqE9i
         puOJ5eai6miuxIi7hRInNWxrWecCIhko/cHjxHyXUz+dVZP47ER8WCG3zTPpwANMt38T
         iZ9PIE9SqVxLsuTumBiqHgKkJSfvF4Pue/O3gmJ42yKUhxt1psPbYkqwvd1TphTmVlBC
         OEMw==
X-Forwarded-Encrypted: i=1; AJvYcCUezD7y4OFIOGq9kmSo5/yuNzQDH7E0fv8FyoMBuD8CtfOpAl0DZgP448f3SZL2QD8igy16ohMVuFNQRdi8OEUyOA1CC3wRKdpc
X-Gm-Message-State: AOJu0Yx2UNWhCYDiI2DSLSCyefgVXPXDDMSsGaqJTwUBfcydVuevlswe
	XFt3JA1KQBdvnkJUf/OVThsbxTeEuqFkLpmU29Jq9aRRVEjZ+o8ehF81kegHie4=
X-Google-Smtp-Source: AGHT+IFS7eYAhT+0AUpcj5ewpNo7OFKsTCoZ3JxCFeHwDILA0YZF9b4V+IaNGjXTAqigOEH5hMb4FA==
X-Received: by 2002:a17:907:a42:b0:a47:7795:db82 with SMTP id be2-20020a1709070a4200b00a477795db82mr7398894ejc.34.1711484676683;
        Tue, 26 Mar 2024 13:24:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:24:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:48 +0100
Subject: [PATCH 18/19] memory: pl353-smc: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-module-owner-amba-v1-18-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-input@vger.kernel.org, kvm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=711;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=INljxUCSw+yVREcFpthVyGE5rYMeWITztmBOHKglJhs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7bfvePYsjxBuLD9vY3zAenH82u7tT/SAlQL
 Z3EnQYXLHCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu2wAKCRDBN2bmhouD
 11byD/wPpXiOrbOF/vSfkJBrTVrF0LZH7r75M7Vz/+aPxzvKY8FKsSOw2SmV92MkLf4QuOdFOdd
 IMhZX1fpOObZ/FD21xlOjv+QFmb7DExusNcalkxdRxZKYEpCCvzYR0byulPTkfd/PDoCr4R5RF3
 bWRSvd16bNGp3ourlRN+o1Cki1isMO2ab6YQUCXal2ZYM3uWqp8uFBEAtGq0i4KErceJYGTDk0K
 yU+bGCWdUCDmVBIXQktl1gdxTJJeIshTNLGc0VbYhdQ5/144yeDXYpj9JxZj+kEd0MhBSgeyL+y
 qnx8vkit6hx7qw7DwYQbpqqsjvf89L401ck2ZHokDx5WQF/O6gUuXqJj1lkj95RKuAUY9iMAgEK
 wpayvepNRgr3xnMEhn8g8/BQllMQBHmg04Men8h09jhg5TSmEJzO6lkQpzd4wAIpwYWe4pGd22q
 QUnRxrhNWRj/GsSaPG5T8QJsROjVv+a/6Qt+0+KRsJCWt/uMricJD+r6L/VL2THandxryixg5yg
 qRL2e3R3i8BvYEj+k76Goc5dxAzDMCylHnG0Ksya2oTV74WPS8ZCSvY1wLAhBD/F0pL6M0MRWTg
 hAo/aTuE/uXOEvWCV88JCz9nnTmGnOYhJmVG2P0xSnLg2K7iNg0jYh1qiVA2Scb5rSklBBc3z7Q
 6WZIljKIBnSxNMg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

As memory controllers maintainer: this has my Ack. :)

Depends on first amba patch.
---
 drivers/memory/pl353-smc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
index 48540817e046..56e51737c81f 100644
--- a/drivers/memory/pl353-smc.c
+++ b/drivers/memory/pl353-smc.c
@@ -154,7 +154,6 @@ MODULE_DEVICE_TABLE(amba, pl353_ids);
 
 static struct amba_driver pl353_smc_driver = {
 	.drv = {
-		.owner = THIS_MODULE,
 		.name = "pl353-smc",
 		.pm = &pl353_smc_dev_pm_ops,
 	},

-- 
2.34.1


