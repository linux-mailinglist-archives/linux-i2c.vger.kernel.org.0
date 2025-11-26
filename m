Return-Path: <linux-i2c+bounces-14289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1C4C8B52D
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 18:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AAC73BC2BA
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 17:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B24934A3A2;
	Wed, 26 Nov 2025 17:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="hIEYUvEt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6004F33EAE9;
	Wed, 26 Nov 2025 17:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178708; cv=none; b=XdqcWPCa0K+WEXNMaH77WjHaAx7ZgVloDLEax43mGhpAIw+fwDA2DvgH6/QhOLgfimKubxHNPiWEMKhKzf1eFCjRCCqubN4gw3m0yy+Ob9Yo46vZrvmz6mHM2ZN4OQaV2s5Lgr6vVxvfvJ5BM/jJXkdIL5rNHKKlDFogoV8dnWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178708; c=relaxed/simple;
	bh=0IRL/KZKIkCUzko0p+KHG0Dpw0ySQ73NnN9NN9WR1Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUbt6znghfiC9VQXdGNCGugcYUjgL7b56HUkR+v4cySboywWK+/nA6CtOhFNlorNaNpIP4CsDIr3wDy8Q1SmI3vB59A/JO9ewjMZc5XIdjOLOOVE01JJu1zlgyPmgNsleovtZKp0BtDDakayfqS2eUfDc7KvwhdJCHWKIp7Nmbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=hIEYUvEt; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341554.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQE1a85021314;
	Wed, 26 Nov 2025 11:09:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=zjPHr
	QUxOOypAqLuK9n8ZhvUnMRLW2qZBpJn384T9dU=; b=hIEYUvEtVM5Gar4AOlXt7
	pAYvhOKzejWnPcP3r7PTEcQed9T/w+8GdGQu82ffBXDB+b4RKfdgLthFAI88NYCr
	wm2VUdOAVYf2ocXmVdES+zJH1DTBetUtvSf2Wd8iRGitZrG89ok+rz88ffEbZxlm
	KQ36+ruikS1vhLymLOxqRTlqCqtqCcdu2Mav/c5MSz6NMK4pL+CBOBnMUmLw3hRY
	56Iz3DGCen8EAT/MRMCgYHq/yHQyYGBlt478oZ0wC4TFArZuCPDTxgnjD0u05G6G
	On+706Rdd7jiWopSlN3O5ScCg0INYEpmrTXOQ0W4aIHTxNxnbb5mRZep8vFCrbzk
	A==
Received: from intranet-smtp.plexus.com ([64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 4ap2xyg9tu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 11:09:28 -0600 (CST)
Received: from LNDCL34533.neenah.na.plexus.com (unknown [10.255.48.203])
	by intranet-smtp.plexus.com (Postfix) with ESMTP id CBCB43C8BC;
	Wed, 26 Nov 2025 11:09:17 -0600 (CST)
From: Danny Kaehn <danny.kaehn@plexus.com>
Date: Wed, 26 Nov 2025 11:05:25 -0600
Subject: [PATCH v12 2/3] HID: cp2112: Fwnode Support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-cp2112-dt-v12-2-2cdba6481db3@plexus.com>
References: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
In-Reply-To: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Danny Kaehn <danny.kaehn@plexus.com>,
        Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ethan Twardy <ethan.twardy@plexus.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Leo Huang <leohu@nvidia.com>,
        Arun D Patil <arundp@nvidia.com>, Willie Thai <wthai@nvidia.com>,
        Ting-Kai Chen <tingkaic@nvidia.com>
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764176728; l=2302;
 i=danny.kaehn@plexus.com; s=20251118; h=from:subject:message-id;
 bh=0IRL/KZKIkCUzko0p+KHG0Dpw0ySQ73NnN9NN9WR1Qg=;
 b=GsLW7NB+s5hC0D6uqsMxBidFqs35NMD9b7cN/ECWSE4/Q8nmM/9u8+yePB4SupReByKJBRjoX
 0k3kIhXJGTxAbvsYBJylRWRy2cxiQE50s+880U4eJxx3JZBi9Zjl5qL
X-Developer-Key: i=danny.kaehn@plexus.com; a=ed25519;
 pk=br2sOmMe9QhpVp1uJw6IxgSNRKZO5khHotS2b+/bX14=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: huGVKRwXk-MVYTYgZJEwmkSwi6MDYbD4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0MCBTYWx0ZWRfX/ztTRW1ycnK7
 S4AlpotJuqq4S9JHHetp6ies2EPlt5URl6zI+Ph1AebXriNm6h+hLmXuJVw1tuNc5hUlLfRxyGi
 TKWSrmElmVOjFA/HGF5rqQox2tDGqILKM1ocSQRJVUKpcOxPQdDfeOQEeH4x0Jy/RkSru5Fyfp2
 cRm1RsBwe9sF0g2xCiMSkzUnbJZOe9TmX995zJvT3NzANzl3jHZVBjN9r9HlPcnhlxMAEIx07h/
 WZj+pFm1WhmS2EmO+a6BFjcraBNRKBtgZHKKwYt4l2cz8bhfQGWdgDMVPIFU7LphZHlOTRkF6mv
 gynKHCRqaevpmBTkjE3BPFCITYHq6MU79ofIJkaQb5acJOzMqbWzDRqyhDIOQ4yQWt4314atImr
 5ETy274J+2Rk+f9qz2VVKUmnWGxMuA==
X-Proofpoint-GUID: iA_526lU68Rvr7yAXR0fJvoS-a7ayUn4
X-Authority-Analysis: v=2.4 cv=HZsZjyE8 c=1 sm=1 tr=0 ts=69273449 cx=c_pps
 a=356DXeqjepxy6lyVU6o3hA==:117 a=356DXeqjepxy6lyVU6o3hA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Y_joWELsAAAA:8 a=pVqXFfmJREZmDo3ecgYA:9 a=QEXdDO2ut3YA:10
 a=g_BQsM8wYJVSTWLOHH1t:22
X-Proofpoint-Spam-Reason: orgsafe

Support describing the CP2112's I2C and GPIO interfaces in firmware.

Bindings between the firmware nodes and the functions of the device
are distinct between ACPI and DeviceTree.

For ACPI, the i2c_adapter will use the child with _ADR Zero and the
gpio_chip will use the child with _ADR One. For DeviceTree, the
i2c_adapter will use the child with name "i2c", but the gpio_chip
will share a firmware node with the CP2112.

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
---
 drivers/hid/hid-cp2112.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 803b883ae875..fb301c27c712 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -29,6 +29,16 @@
 #include <linux/usb/ch9.h>
 #include "hid-ids.h"
 
+/**
+ * enum cp2112_child_acpi_cell_addrs - Child ACPI addresses for CP2112 sub-functions
+ * @CP2112_I2C_ADR: Address for I2C node
+ * @CP2112_GPIO_ADR: Address for GPIO node
+ */
+enum cp2112_child_acpi_cell_addrs {
+	CP2112_I2C_ADR = 0,
+	CP2112_GPIO_ADR = 1,
+};
+
 #define CP2112_REPORT_MAX_LENGTH		64
 #define CP2112_GPIO_CONFIG_LENGTH		5
 #define CP2112_GPIO_GET_LENGTH			2
@@ -1208,7 +1218,9 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct cp2112_device *dev;
 	u8 buf[3];
 	struct cp2112_smbus_config_report config;
+	struct fwnode_handle *child;
 	struct gpio_irq_chip *girq;
+	u32 addr;
 	int ret;
 
 	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -1226,6 +1238,26 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
+	if (is_acpi_device_node(hdev->dev.fwnode)) {
+		device_for_each_child_node(&hdev->dev, child) {
+			ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
+			if (ret)
+				continue;
+
+			switch (addr) {
+			case CP2112_I2C_ADR:
+				device_set_node(&dev->adap.dev, child);
+				break;
+			case CP2112_GPIO_ADR:
+				dev->gc.fwnode = child;
+				break;
+			}
+		}
+	} else {
+		device_set_node(&dev->adap.dev,
+			device_get_named_child_node(&hdev->dev, "i2c"));
+	}
+
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");

-- 
2.25.1


