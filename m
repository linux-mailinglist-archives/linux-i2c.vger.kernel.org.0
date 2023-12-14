Return-Path: <linux-i2c+bounces-785-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54127812DC2
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 11:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F36461F21254
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 10:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED317405CC;
	Thu, 14 Dec 2023 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FV+DjVE8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014FAD4C
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 02:53:04 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c60dfa5bfso7644375e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 02:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702551183; x=1703155983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iA5vpao/nlkM+BgS1JES9JQXKEWnmeNI0auTBLc7cY=;
        b=FV+DjVE8H70sTQH6kRDVqJ3wExPAVdqrMa24gJvMtraeUJisUsqEL1EDAs6Mp2JBDH
         wokxdMyYpkFz5aI0NdfEdywYYHonlNu5elwoHncMnf7w6VxUXoVfSYUji70EyjLIIC9X
         5s4ejiA4GXYwzSIlaoNWQxqldQdyL3gZMvq3J/2G9V1BVl0nupXxbO5O6We3VB8zVuTM
         mp436UXfkCZYP3ZzoHkwwtju0tPsM615UA2EJQLiTWgxvfBbxPjhXVg//UIu49VIdCi0
         EHNTL2oqGrGKHILl5FrCUHRbHP3NyyGck1KdsJrQ5EAPdv4Suxy+8cvISAKrzyu5Z0H9
         8wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702551183; x=1703155983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iA5vpao/nlkM+BgS1JES9JQXKEWnmeNI0auTBLc7cY=;
        b=RL/stC0I9MsLfKSz/L8H/TtMx4yO20gc5E3CsKhOYujjtu0vZgAWlKdfD6BqTybFym
         XDzWUtGyxg08WfZW+EIyrKbCFE7UiX+R4lyIjrF1Oi2Tq+OkVUA6xykyEOU5RoG7K8jq
         ZuAuLUK+mST/1VtT3ZZX4JB1LkVI5G7sWOkZsNCgMTml5qpccyEUArfqi2p09AzL1BAr
         /IzDJEzvrlqpoTD9QJpmjGTiv2XszYBbKBvBWmZbb/LAYFitd3PUHje3d+/Bqd/mIW/j
         svoZ63DMzq0ZZlLqOUY4rZVZtVlxxW5a9my9bmmS/G/Zc6BmkMksNfDwuD6Ku9ix8aZL
         zUzQ==
X-Gm-Message-State: AOJu0Yz+fWMd8U3N4je9p88M7GbIz08kA8kmsSXjqm+l/2s9s2XhGeUN
	vNCrBKFVTgaEOBumx55I6q5XkQ==
X-Google-Smtp-Source: AGHT+IFhXWtaTCFsSRB/rCN50lEOB2f4DScvINgysd4f+wNUqjxRfR1ruqRktKeZe3CB7TSMb14q8Q==
X-Received: by 2002:a05:600c:4d0e:b0:40b:5e1e:cf1 with SMTP id u14-20020a05600c4d0e00b0040b5e1e0cf1mr4741397wmp.44.1702551183507;
        Thu, 14 Dec 2023 02:53:03 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b0040c420eda48sm17614854wmo.22.2023.12.14.02.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:53:02 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	arnd@arndb.de,
	semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 13/13] arm64: defconfig: make at24 eeprom builtin
Date: Thu, 14 Dec 2023 10:52:43 +0000
Message-ID: <20231214105243.3707730-14-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gs101-oriole populates an at24 eeprom on the battery connector.
Make EEPROM_AT24 builtin.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 09fb467303ba..19c1d61382f6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -276,7 +276,7 @@ CONFIG_QCOM_COINCELL=m
 CONFIG_QCOM_FASTRPC=m
 CONFIG_SRAM=y
 CONFIG_PCI_ENDPOINT_TEST=m
-CONFIG_EEPROM_AT24=m
+CONFIG_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=m
 CONFIG_UACCE=m
 # CONFIG_SCSI_PROC_FS is not set
-- 
2.43.0.472.g3155946c3a-goog


