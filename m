Return-Path: <linux-i2c+bounces-14288-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B3FC8B51B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 18:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 955793B89A8
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 17:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0F933B6EC;
	Wed, 26 Nov 2025 17:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="F2w8F6PU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5610433BBC4;
	Wed, 26 Nov 2025 17:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178706; cv=none; b=qy19ZCzLQCJp8CVZ7c7NqpxM6KYn6O2COz6B7r5LFyTCfPJxafnBGSU442pr1JGMQHO3glbLzNL81SPaaXrBGejdaVVIEw2D4+G4cX53B0sUKNmgPzIipIMlAc0oALJtu5Ojc73/DyzQPToH7BuKUot+bx3pkvHTkNe1DL9RIFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178706; c=relaxed/simple;
	bh=hC4XQasOE7YoRhPK/FYwvCvLI4flmqo59fEi109hg7c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pe+2qOEhfPCyrbnjAElyZUYbLVF99fd+n6wvfQfv247338bKruvIpv2oBV51oH+VyLGFE0hHK6t6IKOpGXERA65DFYvxlr2u6md1wylw9hZ1H2FApBZYsq66TVwzIQAmfO3dFRbDbmHdWZILvg0g+2/X4+frz10MceNrAPTVf20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=F2w8F6PU; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0425989.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQFdwPS1463603;
	Wed, 26 Nov 2025 11:09:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=qOp1PXRqW8miaOjHt43zYAIZpCc
	eiWdCXqTGx7xk8z8=; b=F2w8F6PUCI7wI/LmpRw19Vl5ebVg58K3j/qBbwJBY5i
	6BnUOj22aI9uinEBxmGp4scqOwNhs2/b2PQDzxINQqGg4ldtxGkHPFMkmuXi5gkY
	4NfKHfJTs8yCaURzrqZhldNqXIwuliRCtUQ9M1lAYft30wGIJ0ezKHWlyJcpCPAX
	C0qm6R0y7+sqIYA4LKnKDYQYrlJjiwmb9GrZcM6PwM69+SGl+fEh+AOZ2R9JdDUC
	tvSGAgtHWuKIA/rhOIJIsInhgRfPe8w0tIKzcpmRflf8zEYE2OwVyDanNl7gN4b9
	waOcXBfz5u7Kldb4PLpaUb7yucPpNWi8RSDw4wRPxIg==
Received: from intranet-smtp.plexus.com ([64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 4ap4cp8592-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 11:09:18 -0600 (CST)
Received: from LNDCL34533.neenah.na.plexus.com (unknown [10.255.48.203])
	by intranet-smtp.plexus.com (Postfix) with ESMTP id B9A213C84B;
	Wed, 26 Nov 2025 11:09:17 -0600 (CST)
From: Danny Kaehn <danny.kaehn@plexus.com>
Subject: [PATCH v12 0/3] Firmware Support for USB-HID Devices and CP2112
Date: Wed, 26 Nov 2025 11:05:23 -0600
Message-Id: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFMzJ2kC/23OQQ6DIBAF0KsY1sUABZWueo/GBYGhkLZgwBqN8
 e5FN+2iyz/z8/JXlCF5yOhSrSjB5LOPoQTKThXSToU7YG/KATHCOGmIwHpglDJsRtxqo6XgvIN
 OodIfElg/H9itL9mm+MKjS6C+AiOCtkQyUsszlxIXSIWw1A8FLlyHJ8zvXOv42j3n8xjTcmybK
 N3ZfzPKCxNshLDESi5Uw36dftu2D9wKVlzmAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764176728; l=4172;
 i=danny.kaehn@plexus.com; s=20251118; h=from:subject:message-id;
 bh=hC4XQasOE7YoRhPK/FYwvCvLI4flmqo59fEi109hg7c=;
 b=CJEer4Ba+zjMcxrtX8Tohr3zoc05QS9ynij0ZvbMhQ04pJ6KQYGD4FYjGpj+F+wRUfU43kaAz
 trV3waKxZapDsSa3AaXzWMWoD3QYh7j3LQ5fKz9Gh6S54rqsF3FSfdA
X-Developer-Key: i=danny.kaehn@plexus.com; a=ed25519;
 pk=br2sOmMe9QhpVp1uJw6IxgSNRKZO5khHotS2b+/bX14=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: mZKWyLKvjzV30Cw60-QvsAYlXQTxurKn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0MCBTYWx0ZWRfX6udsEhwl0JcA
 X9Wtkfbn6Gsyzi/YICiOdbpFZj81lquxPC4TpE+V+XTcRGCKmy7ZxpXPldJFpWoMmyBr+H7uSXg
 8IXynMqCisladEunJSq4jHDxEmTK9xvd0bgBypycx3XLZW/EnotY1THE5pJaEv5fIc1DVfE8N75
 J/Z0dajIG+vyyXU9yXeeP/qtAoVu+GVOy21IABMBlvlHkee7Qp+usRl5N50O9y4u0DXoMR3qPlS
 0Ki4ojh1zawBiFFNFZ9l2aXtsI2qyjGAD0rr28b7ATdIjsoIUD7/ghamCXvCZaN9KWjHjFAGECo
 Xb42trgWKRBevqOGuykaVigG8aJ0Lky+DXQHLNaPTcJQ8CMAYHHM5MGmfyAJXnc87Gw4OhB7hNV
 GnXaePYcDrzY7V28hKUmVyrJ6fWLyA==
X-Authority-Analysis: v=2.4 cv=IbmKmGqa c=1 sm=1 tr=0 ts=6927343e cx=c_pps
 a=356DXeqjepxy6lyVU6o3hA==:117 a=356DXeqjepxy6lyVU6o3hA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Y_joWELsAAAA:8 a=hxW2N2rBQJarcxKsw-IA:9 a=QEXdDO2ut3YA:10
 a=g_BQsM8wYJVSTWLOHH1t:22
X-Proofpoint-GUID: b8X1TgFvt2YG3jk63wtBEntht4F54e20
X-Proofpoint-Spam-Reason: orgsafe

This patchset allows USB-HID devices to have Firmware bindings through sharing
the USB fwnode with the HID driver, and adds such a binding and driver
implementation for the CP2112 USB to SMBus Bridge (which necessitated the
USB-HID change). This change allows a CP2112 permanently attached in hardware to
be described in DT and ACPI and interoperate with other drivers.

Changes in v12:
- dt-binding changes:
  - Drop "on the host controller" from top-level description based on
      comment from Rob H.
  - Correct "Properties must precede subnodes" dt_binding_check error by
      moving gpio_chip-related properties above the i2c subnode in the
      binding and in the example.
  - Include `interrupt-controller` property in the example
- Modify hid-cp2112.c to support separate schemas for DT vs. ACPI - DT
  combines gpio subnode with the CP2112's node, but will have an I2C
  subnode; while ACPI will maintain separate child nodes for the GPIO
  I2C devices

Changes in v11:
- Eliminate 'gpio' subnode for DT and ACPI for the CP2112 per comment
    from Rob H.
- Edit hid-cp2112.c to match for ACPI index and fall back to matching by
    name (instead of the other way around)
- Separate CP2112 I2C bus speed configuration into a separate patch

Changes in v10:
- Define an enumeration and mapping for CP2112 ACPI _ADRs and devicetree
    child node names, and use these in the scanning of child nodes
- Address other miscellaneous

Changes in v9:
- Add _ADR-based ACPI binding of child nodes (I2C is _ADR Zero, GPIO is _ADR One)
- Use a loop-based approach for assigning child nodes within probe().
    As a consequence, hid-cp2112.c no longer maintains references to the
    child fwnodes during the lifetime of the device. (plese correct if this
    is actually needed for this use-case)

Changes in v8:
- Apply Review tags retroactively to patches previously reviewed

Changes in v7:
- Use dev_fwnode when calling fwnod_handle_put in i2c_adapter in hid-cp2112.c
- Capitalize I2C and GPIO in commit message for patch 0003

Changes in v6:
- Fix fwnode_handle reference leaks in hid-cp21112.c
- Simplify hog node pattern in silabs,cp2112.yaml

Changes in v5:
 - Use fwnode API instead of of_node api in hid-core.c and hid-cp2112.c
 - Include sda-gpios and scl-gpios in silabs,cp2112.yaml
 - Additional fixups to silabs,cp2112.yaml to address comments
   - Remove ngpios property
   - Constrain the hog pattern to a single naming scheme
   - Remove unneeded properties from the gpio hog which are provided by
       the parent schema
 - Submit threaded interrupt bugfix separately from this patchset, as requested

Changes in v4:
 - Moved silabs,cp2112.yaml to /Documentation/devicetree/bindings/i2c

Changes in v3:
 - Additional fixups to silabs,cp2112.yaml to address comments

Changes in v2:
 - Added more detail to silabs,cp2112.yaml dt-binding
 - Moved silabs,cp2112.yaml to /Documentation/devicetree/bindings/input
 - Added support for setting smbus clock-frequency from DT in hid-cp2112.c
 - Added freeing of of_nodes on error paths of _probe in hid-cp2112.c

Danny Kaehn (3):
  dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
  HID: usbhid: Share USB device firmware node with child HID device
  HID: cp2112: Fwnode Support

 .../bindings/i2c/silabs,cp2112.yaml           | 113 ++++++++++++++++++
 drivers/hid/hid-cp2112.c                      |  50 ++++++++
 drivers/hid/usbhid/hid-core.c                 |   2 +
 3 files changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml

--
2.25.1

---
Danny Kaehn (3):
      dt-bindings: i2c: Add CP2112 HID USB to SMBus Bridge
      HID: cp2112: Fwnode Support
      HID: cp2112: Configure I2C Bus Speed from Firmware

 .../devicetree/bindings/i2c/silabs,cp2112.yaml     | 107 +++++++++++++++++++++
 drivers/hid/hid-cp2112.c                           |  36 +++++++
 2 files changed, 143 insertions(+)
---
base-commit: 1c772200c9dcb23a304f84a9334fe2e0d9529ab0
change-id: 20240605-cp2112-dt-7cdc95448e8a

Best regards,
-- 
Danny Kaehn <danny.kaehn@plexus.com>


