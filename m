Return-Path: <linux-i2c+bounces-7792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1789BD3E0
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 18:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4325E284004
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 17:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328971E766A;
	Tue,  5 Nov 2024 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="thW1ggpa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ADA1E5727
	for <linux-i2c@vger.kernel.org>; Tue,  5 Nov 2024 17:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730829549; cv=none; b=hR7WsYqdM2S5I8hPOopn4BrgNx68NYt2bEYi1wESgwEa1DoWkT05WKCI5c/H8HVmI+ptKH6KtrVsoDulmA6X0RHDk5Kvi6JdyoK+9KB6DoAJ57Yq/U8A8eHvw9RDzbFNoaPms1fmaSW8PIhZc2PKXHBuGv259bTPMU5JgFs3mYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730829549; c=relaxed/simple;
	bh=ktW0GKrYRwS/MWSHyPsz9MtYv3cVuAnNYT/fHajylvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VcPsUeGT5eKqNq1HFUrX9bYJZFmuMfrV92b76dHdrHMSah3Q7eH5osjWZNYKNj/KL8oUGptDDdazAtfSsyNdAbeju3qujMYo/1gZoIYN5N7gQu1s/SGeB5Y3gJFad+f9UHkNeFXAd0ytlyvijtpBNmkmNhCHzHtvBaLx1jItmr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=thW1ggpa; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d447de11dso4460913f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 05 Nov 2024 09:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730829546; x=1731434346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQOF7ULLSSCvm8fW5y6GOnkdNjq0wbdWw4lgdHQeMiE=;
        b=thW1ggpa8q7pBFB4F0WZ8vRgkn4hIc3yNHmUfk6aPYvLzRJ4S+bBko1oc+gn6MQvLm
         vxkjh6E7s3tnJJ5oknxZPdjBrkCMI12d9eHbuNqQhWmk7qYkyiTrYmI2DgL60eOJ0iyU
         gfo5mUoNPWf6y5kcOPslOmRP6Ne+xNiybUNjnJH7g+7M7gfMmrxrE1Cg/FHTXcV4oi2x
         4zGe8/Jd5rfKKjuyhcltwyx3y1YAosDQByH6assb2PxF4QxBNExlrEDzRT44YvX0OpvE
         fmaWUOY3HCIWGuFkpYAe3crxBfFDJz7EVUVXoo8yxAMERtrdOS0XPiRCZhWAO9m9IZ5k
         klMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829546; x=1731434346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQOF7ULLSSCvm8fW5y6GOnkdNjq0wbdWw4lgdHQeMiE=;
        b=F/VaRDT8AOKkGFXXuFyk3+ksHAjToKqsHgKnj60UASO1/j+VCYtl0VahYhSaeGX2Lr
         EJpjMyxxO5wNOUn7WnpvYICI0WbfAT5br3GMLIIROBDq+12LhvGW2WmMkgPsK3KIKk4I
         i1x2ux4VsxQ37ERXG24qOn0rSKu4j/uxRr2EQt14oSvLHubeVSg9BwqLyoY42YzFu+O6
         VVALN/zcfQxhy/p1MsYSACqA0JfvdlokKPa6pURhi0fl3uVA/r64TvGBP/nGnnfqkUhH
         AwQcPsWxTrpGNm6j7LV8EFG/v2W/mZzs7r9n/W3197PLDJs1ig6Hc64AibBy3n8g9AcS
         sTsw==
X-Forwarded-Encrypted: i=1; AJvYcCVlUGW9cFYDmcF/oo0mG3RfGs9ViH+z//SK4mzaztakiNc3pVUXVt+XtwtrTmoa794++ZOvCc72KQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZHqIE2FMRBYPe1l6Imu8n/rTPjrRwYJZcV1FJ3BOQt0gaIjAU
	ATDcZMBx1EAJfPTOGGQkX9OwI0QP24EWLG5f5xxsISHBDRHOaRk4XO3rrdSDgAQ=
X-Google-Smtp-Source: AGHT+IFiXg+Pk7NwIRN/jmZgmoFna52TL4VngHOo1/Xg+wnm0k2K8RU347YgH7g7hKinh//u0MjnxQ==
X-Received: by 2002:a05:6000:1842:b0:37c:cd38:c51e with SMTP id ffacd0b85a97d-381be7adf74mr14978203f8f.1.1730829545960;
        Tue, 05 Nov 2024 09:59:05 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5b9b:df02:2761:7a57])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381c113dd7fsm16959481f8f.70.2024.11.05.09.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 09:59:05 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 05 Nov 2024 18:58:38 +0100
Subject: [PATCH v4 1/7] hwmon: (pmbus) add documentation for existing flags
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-tps25990-v4-1-0e312ac70b62@baylibre.com>
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
In-Reply-To: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ktW0GKrYRwS/MWSHyPsz9MtYv3cVuAnNYT/fHajylvw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnKlzhvQPxtedOYvOHyn1+qAaTyZ4JJnw30qwln
 EmtnD0is7CJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZypc4QAKCRDm/A8cN/La
 hfpJD/0cVfc7WiZKYsK62JOY8LNupfGVTbpzODKb8RJB3dN+fxSu0tW+glVc5ZdarEcN9f0BS49
 U7GG9gt1rMeoFIb0LIF79IJhyqxoMWrI+QLnzv1jdOxBvymUEo0Ws1ZbH5Nx0XwGjL+VWHNdhgp
 /xihJLmUkjlvF0GKw5txxoxIEqS9ZvlISyt765OEHkHo1bsmolevYUxadEeixFRWvPw5/XDTBOq
 f7Hz+B+RmWjySaFqfzcW9/e3vfOBm70VMjGIXvP8narC6s3iLHBFZdCGR0yDTvc2lgJeo7MuvzO
 8g/N8NRP+ChPbmCQocpJvgi/q36kJCeZFOBEWNzwSPm60KCO/XpAFHNJWTtsYWRgFFgOu0taJ5P
 GgeywGDVnqQH4lO5EEGdEeJ5lC+ch3J4OBRNzks5zkJtIpUsupcrHp1RvYoj3tn/K87AEaEBsTS
 SvXDJOY2NPwVtKrQMHto36BkOI5kRmA1iXTYhl7UtJGy/5DexI10W81OVqp8kcl9uHPiepLpSwD
 1I5iIP4cYL6G2MQJLXO8XvXxqwQYTsAK6k67F2xtheisQQtQ/rgTXsdFZf2hx437FmM9AE7RXJt
 Xj/7X6AZ8UEfF6CXXKFafLSlGK6blMq6nZT72oubMkEfc/ZkjvmS+gB9X3WrIobuKEtrpjltd0Y
 JVf8QuYTYDWop2g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

PMBUS_NO_WRITE_PROTECT and PMBUS_USE_COEFFICIENTS_CMD flags have been added
to pmbus, but the corresponding documentation was not updated.

Update the documentation before adding new flags

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/hwmon/pmbus-core.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/hwmon/pmbus-core.rst b/Documentation/hwmon/pmbus-core.rst
index 1eaf2b0158376812eaff1786d01b0f330c85eab8..686a00265bf71231c684afad6df41d6266303919 100644
--- a/Documentation/hwmon/pmbus-core.rst
+++ b/Documentation/hwmon/pmbus-core.rst
@@ -308,6 +308,10 @@ currently provides a flags field with four bits used::
 
 	#define PMBUS_READ_STATUS_AFTER_FAILED_CHECK	BIT(3)
 
+	#define PMBUS_NO_WRITE_PROTECT			BIT(4)
+
+	#define PMBUS_USE_COEFFICIENTS_CMD		BIT(5)
+
 	struct pmbus_platform_data {
 		u32 flags;              /* Device specific flags */
 
@@ -358,3 +362,14 @@ This can be done by reading a known register. By setting this flag the
 driver will try to read the STATUS register after each failed
 register check. This read may fail, but it will put the chip into a
 known state.
+
+PMBUS_NO_WRITE_PROTECT
+
+Some PMBus chips respond with invalid data when reading the WRITE_PROTECT
+register. For such chips, this flag should be set so that the PMBus core
+driver doesn't use the WRITE_PROTECT command to determine its behavior.
+
+PMBUS_USE_COEFFICIENTS_CMD
+
+When this flag is set the PMBus core driver will use the COEFFICIENTS
+register to initialize the coefficients for the direct mode format.

-- 
2.45.2


