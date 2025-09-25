Return-Path: <linux-i2c+bounces-13171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D615BA010B
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 16:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DCE6321A35
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 14:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95112E0935;
	Thu, 25 Sep 2025 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5noPqRD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ECE2E0925
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758811655; cv=none; b=O+97iH60PRiupVBQlf2/gJ5rf/6LbYwlaXFq0jpuLi6+H88Ab6a6YhbRF1GH6USayjPbhJwZxg2Ssx/zcIWCuiIycWv7Q7kd8xfxInmNHCl4KsguDtH4eT6dVKarPh42lklZzTTf0qsbdNqwzHz5RT4EhMwSqXJd7Tqg9HIfWqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758811655; c=relaxed/simple;
	bh=NPHmdmr9WXxx2j5cqelWY2NBJ/Qv0Fo41Tyr4O1RDIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqvr6DK+R7oRzv29kPekZMHA8cu+Z1LdvnrWw6siIpTYty8H7h+wDRp9gNsWNiaPMxKchMT2YvGallkRGjl6JTh7oFfDY0tSHmIT+SsCdEAwSHtrR7Su01WWc0DZrZj8guS+TF+DR1xU6kVkXARE9YoW7lp+UqLMrLuU+CTXDb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5noPqRD; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b523fb676efso1079483a12.3
        for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 07:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758811653; x=1759416453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1oHUYWoSsgwp/73d4+uKBbB5Hy3Q2zhhkDL+XK7R24I=;
        b=e5noPqRDFHDO3GrzpmwQhurQ60a6uYquIPbtKt/Mbczqvsx51L4jrCipFB3XBYtq4h
         gLW6MWYv/9vadziPmBw9Lyer5P2YXGeKP34OiNZZ75jpUqRY6mVQHgs4L6tyMabMlsy+
         4oh8lEYNiP5QDd6dNrBiCOMSR3gJw24MzhW2srsC8j1eB+6lUHRgzayBL6fhGwNRa1ED
         e9ININisklE8pe3d/kzraKGvsV3oRTGxvoAmAoJ5crLvDQqN2Fh9m8VcWndYwUlaT9uD
         VjjMTyfl86aDLHsaxNYWGsgmUWD2d9pI/EksrIFT5kdeg97jevRPQPTrbWerYWGvu5Fv
         xUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758811653; x=1759416453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oHUYWoSsgwp/73d4+uKBbB5Hy3Q2zhhkDL+XK7R24I=;
        b=O9T+b7LruVF0U9RRBnOsmdGKeGoLVkWU+EjhGVkFvUx4DW7zpIxO13y+h4jD1lcAeZ
         RrFAGe2ajIcwyqp4sjB+5WHBqgJg6vnadFYnMEKLbI01+yugqrFZDFpTmnV0Da0cDckn
         IeA/NLMuk8OP6VrlJN4NJoMHNpG4CDths3OOl1v0WbriqAQZjgj+6feo8PP0CR+KrqsW
         d1S/MqQbGV/AVtQ5eov/WrED9FxIJ69YdWNAdXkYGHTX3LcbLptICvhfmG5FgAYIFhnE
         qA5OREHLr/CvJcPnX7bFIqckcE2DygNmZ14cTkV8C7vQakHyKpjz62PFfsHH3N2/+7br
         nlAg==
X-Forwarded-Encrypted: i=1; AJvYcCVAjUXZTizBdNbpKCKDp5SD5Hc7R5KY54FRC+bgvul/1Ri2DW55FzmOdlTSBdi0oj3S0agCYuHXoDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrI8ibxlnW3sPTPyj+bpKCnb+wZEWde/ktM5beW9ezHZgqi/XD
	E1WoiwD/fgXlmOqGrubvOHgzCfHJx4IZEYyTDGKFcGgl6FoTs2qEoagP
X-Gm-Gg: ASbGnct6GlDg9WbMboQPldQ4mYOEvMfUR43c/yEZw9zXYz6w9f6cxsEUWgjqdYxK+gk
	lV+hW9+OUCT6IC50U3JnZkyJ2X5MEZ2xSv/6HIaUW8KC7SQzE3VVbt92avdKwqPB9B/HY3JSmq6
	81H6BrwsELo+GqLPXljuUuHD9XRIpQ/RbfB5AsKEyrZqHXPxD6Zhaau8DTJo0QsG31TLEgBkANN
	Pabw/gM3oqNDD0R23FvhzD+X3qPRSgkVVJgyiOsXtAmjm0tgHSLdQPO0M3ZGtzA/rYAVR6nQru/
	uHlkfqfVjU2JC9NSI2PGF8xUHJPNJbfqLo2VRxsUNoFD5ZILxjw0FGPc3vOyyGnL7KZyTzfj/I7
	QFfe3JW/d2GgEQpxY52sWuv0h
X-Google-Smtp-Source: AGHT+IFhsrm6W1qDEFArC6COve7CvO+nybyERmn6hMVXloLi66XB6XJ+N/inLkG65WOI3SwGkOjeGA==
X-Received: by 2002:a17:903:3bc4:b0:25c:abb3:9bae with SMTP id d9443c01a7336-27ed4a474ffmr39028155ad.48.1758811653400;
        Thu, 25 Sep 2025 07:47:33 -0700 (PDT)
Received: from lgs.. ([2408:8418:1100:9530:90e2:695d:8bcf:653c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69be13fsm26358495ad.119.2025.09.25.07.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 07:47:32 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: microchip: pci1xxxx: bound-check SMBus block read length
Date: Thu, 25 Sep 2025 22:47:12 +0800
Message-ID: <20250925144712.1930205-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SMBus block read path trusts the device-provided count byte and
copies that many bytes from the master buffer:

    buf[0] = readb(p3);
    read_count = buf[0];
    memcpy_fromio(&buf[1], p3 + 1, read_count);

Without validating 'read_count', a malicious or misbehaving device can
cause an out-of-bounds write to the caller's buffer and may also trigger
out-of-range MMIO reads beyond the controller's buffer window.

SMBus Block Read returns up to 32 data bytes as per the kernel
documentation, so clamp the length to [1, I2C_SMBUS_BLOCK_MAX], verify
the caller's buffer has at least 'read_count + 1' bytes available, and
defensively ensure it does not exceed the controller buffer. Also break
out of the chunking loop after a successful SMBus read.

Return -EPROTO for invalid counts and -EMSGSIZE when the provided buffer
is too small.

Fixes: 361693697249 ("i2c: microchip: pci1xxxx: Add driver for I2C host controller in multifunction endpoint of pci1xxxx switch")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index 5ef136c3ecb1..2307c8ec2dc7 100644
--- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -880,7 +880,22 @@ static int pci1xxxx_i2c_read(struct pci1xxxx_i2c *i2c, u8 slaveaddr,
 		}
 
 		if (i2c->flags & I2C_FLAGS_SMB_BLK_READ) {
-			buf[0] = readb(p3);
+			u8 cnt = readb(p3);
+
+			if (!cnt || cnt > I2C_SMBUS_BLOCK_MAX) {
+				retval = -EPROTO;
+				goto cleanup;
+			}
+			if (cnt > total_len - 1) {
+				retval = -EMSGSIZE;
+				goto cleanup;
+			}
+			if (cnt > (SMBUS_BUF_MAX_SIZE - 1)) {
+				retval = -EOVERFLOW;
+				goto cleanup;
+			}
+
+			buf[0] = cnt;
 			read_count = buf[0];
 			memcpy_fromio(&buf[1], p3 + 1, read_count);
 		} else {
-- 
2.43.0


