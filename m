Return-Path: <linux-i2c+bounces-12399-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 925C2B32F85
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 13:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3020A2A08B7
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 11:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08062D9EF5;
	Sun, 24 Aug 2025 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMQje+U0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586A2D94A7;
	Sun, 24 Aug 2025 11:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035279; cv=none; b=JvFg+/gOhueGgPSVem7ResWFnUcSO+2AJtvuPUT8qQdjZtJ41+upEr7+PL8XIejduLwyfttpCzvy85oic386CnDN0L7997rhn8nmw7rlcVf/zO+8lohNnm+1TQkSkQV0B5yyPBrdHfSpq/JJ5GZ5ZVWx1YZ4ak1QwkFfgY68Y98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035279; c=relaxed/simple;
	bh=uXOQzsvisidMTejvI94J0qvQEiJkNo3pjmJXqyu0+Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeHuLu3Rt8H7pyEzv8kJOnuqghRkykNu6/tKMk8Lo1Q/zaNGKOlNGOSiIVDAG4DxS+AnIj0Mo670Efl8pFNiI2zrM7p0KOqJcZMdihj48zaHn4Yq7rrDA4MnyNLSbkW68Sb2+TVJMM+pMqsM+WJO181F9tkN+/tyAiMaWV4UNr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMQje+U0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3c68ac7e1c4so742141f8f.2;
        Sun, 24 Aug 2025 04:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756035276; x=1756640076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXInjrAUVFtdJ7jdGX5n89+iobAWzmPRxkVQU5xCijk=;
        b=TMQje+U0kMbJE2PkxAHzGdwSTGyVscoGp+nOy8z5E5MJqdd/lxgiPpMhUXOqRc/BDW
         okOqthqmxZ62+3YfYMcpnI/AFQJk0Hp7nNrRQrWa40rH7lBZ9pw87jnilaHEiMlrjgLK
         Vy73Zl2d3/mRXkhA0vVG/CCQ4wj39+cHzgQdWJEwlk3s0rTaK6t8oC1IDTG67VTmK4ai
         pd4a+SGJPPjRKwcJmSH1o/J+6PG4Ifs56/+8JrNPPg9GQxN98w0H5sEda/smN4A3e9WY
         lBwQ70C/r93Hjew2TO6IcseMwv4v8CRZq2TSihhf5rxUxF8nT/HMIi9l+fgJLApaMgNc
         deNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756035276; x=1756640076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXInjrAUVFtdJ7jdGX5n89+iobAWzmPRxkVQU5xCijk=;
        b=B97LhjaR2DY+IBgmkfzQUrrH/L9ROABwOu+TB38S1doIlmtQWkVWsvKcdxR1FC3hDI
         PbzTPD9qqhPpeJmESI/l5ke91EQuFeZm2qbBL4ntuHUBPGcq8DguLR6jgHV1Crxulp/D
         CIaXFd79EFr1JM48LlqIV5ehuZDCJcnL3DDQoEPL6O6X0Y1ZHh9B8V6ikOdLrFAkKAw+
         i7YzLf5lC7vkcIRYnCNg7eWYFLGQjWq9tAk0qysjBwIn6chEe6PlmyqPda8oPBO0HXp3
         uLiOm24DBjTfkocgPfGp5XqjSUduNmqvYWHcUnXcqcv2V4iqYfjXwWvmQCsguXiB0JeR
         DZEw==
X-Forwarded-Encrypted: i=1; AJvYcCVs1YfulWSPu9zK1gujW5GTE5VZuxaIExTFtdy0VJdYbpU/4vYIKZxmmrBxIQpb6o0T789xd7co4Ed4@vger.kernel.org, AJvYcCW5C6JMdSFmTkyxNPsH4NfmE6QFsZRvXAxF2zsJKZ15su9iMWLCcNwsDQHh7jQSMk6vo9zmJlsjJlIc5r8N@vger.kernel.org
X-Gm-Message-State: AOJu0YypoVZkY4BjIcN5Wsl2Sk8v4WSEtvvkN5YhwEpCkFwh6kIHFypT
	nm94eggV+OqkIxR1pkUx8s4PZ3LambVP+GdWhirjwDUQ99e0iZYzl2Qy
X-Gm-Gg: ASbGncuIXOYttm3Em0dqxhepmXJdNnuRIDTYhW15mhRo03dcIuxIUlgZ7IsB/bdlpKO
	wy0Gq65UCje5WZVH1d8mQPrborPirGmkKbw6Y/6n14weOKXQgFfUMEwEC+2VZyxepPlSCpLThx9
	1ZigsK20g5eLTCxF9A9ZgqRmKAwAzawn0bI9NOqlDXB+qk1FYlp8Ns8N0AsejDbczaUIwnjJUtk
	G3chM7bS6hUJ4zH2tK0aw7go0imInseKn3RfwAFbQKdeAMPtZqLT8Fc7MbSsocVveMti1ToG7zZ
	EBFYb2NMHxnRvyxcD2p64FEMCGwtl/p4qaXfhCy6T0rzdCkzYySbvNaPeA0NwNIsgj6UWkioN6M
	UorDbBy3fzS9F2i7vrTtShMQfbe15Kap9TeMQMI6xUkrda1XNI+rSPrE=
X-Google-Smtp-Source: AGHT+IHQmalW3s3vLdIFJfWQvnDjSiL7qp9Bpr+YNwRc5jN9UdWNNROhlZ/hg0D9NYlBLZGIn0VhXw==
X-Received: by 2002:a5d:5f8b:0:b0:3c7:9b1b:e294 with SMTP id ffacd0b85a97d-3c79b1be60bmr3532012f8f.58.1756035276077;
        Sun, 24 Aug 2025 04:34:36 -0700 (PDT)
Received: from builder.. (197-10-142-46.pool.kielnet.net. [46.142.10.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm66470895e9.14.2025.08.24.04.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:34:35 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v6 08/12] i2c: rtl9300: do not set read mode on every transfer
Date: Sun, 24 Aug 2025 11:33:44 +0000
Message-ID: <20250824113348.263475-9-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824113348.263475-1-jelonek.jonas@gmail.com>
References: <20250824113348.263475-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the operation to set the read mode from config_xfer to probe.

The I2C controller of RTL9300 and RTL9310 support a legacy message mode
for READs with 'Read Address Data' instead of the standard format 'Write
Address ; Read Data'. There is no way to pass that via smbus_xfer, thus
there is no point in supported this in the driver and moreover no point
in setting this on every transaction. Setting this once in the probe
call is sufficient.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/i2c/busses/i2c-rtl9300.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 4177cfb77094..9e3517b09b3d 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -130,11 +130,7 @@ static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_c
 	if (ret)
 		return ret;
 
-	ret = regmap_field_write(i2c->fields[F_DATA_WIDTH], (len - 1) & 0xf);
-	if (ret)
-		return ret;
-
-	return regmap_field_write(i2c->fields[F_RD_MODE], 0);
+	return regmap_field_write(i2c->fields[F_DATA_WIDTH], (len - 1) & 0xf);
 }
 
 static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, int len)
@@ -455,6 +451,11 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	}
 	i2c->sda_num = 0xff;
 
+	/* only use standard read format */
+	ret = regmap_field_write(i2c->fields[F_RD_MODE], 0);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.48.1


