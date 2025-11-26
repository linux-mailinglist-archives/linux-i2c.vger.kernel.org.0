Return-Path: <linux-i2c+bounces-14286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4798BC8B51E
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 18:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E6D63BBDCA
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 17:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA98306486;
	Wed, 26 Nov 2025 17:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="NJm30bmM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17136313534;
	Wed, 26 Nov 2025 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178703; cv=none; b=IxUVsbMN3h+WcEmStB5rJO0Wv57qwg2fIXZT+v9up5mjUo0L+A7bY1yreYc/shnrDLXhS2WIFnhYK25kesNfjk/qgAxuc8gqdATYLt9tXgScgwOoAXlneo+I+/3s6gfM9qAA9rrv1Qxlo92I+vHQKQWQ+nq3/T2JjFyCiANmhB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178703; c=relaxed/simple;
	bh=gsyNbq2B3XGClE1K3VOnUs1PbaCF6eos3UvTrdx8nxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gq0C848NYtMM8D6AEvFov4Fi43Hxt5V0nu/eSw9TVmOSztONXAocNzoAvwAQT2+jtNtMh3D2i4WE+j+loVSchWu+3JwUyzI/5bLLp6qM0CPuKd1HlPsiCo1nMM3mbUMKZ+z76i0LLxm3MAqa3mnwnVSKqdwowzSfSV4IP3X0LrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=NJm30bmM; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0425991.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ45UAE251347;
	Wed, 26 Nov 2025 11:09:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=43rzL
	uZz/EbI+/ZiVJh+WEBQravA7urDgrNbx3ckJVg=; b=NJm30bmMYL1FmzRM8XIQx
	MnXp9DnbAqW6g6byi3UeQ6eEuP/8FEqyIXjd4FpcxUsqES5JFixYD8PuzIKnyA5j
	mDWaOBNPXrM+/t4op2km4ZHP4GQ0/vLfGwmEujQzCWLgfvHlavtnnK8YnTbeopAE
	b/gU/zU/SzwAjHtnPrO50rqsHSaGHufzI/bwfwiBAyB9+CK9sxxh6E0M4jVRV0/n
	2GqV0uBprRYR7CIipvxqLfoZZGRFUUDINE5Jbz5cDwbi3R5z1gSbN0niN3Euz80d
	dtPkadZ2s0+R+T80RCq5pj7lBcnhORzft5JUIPxLxZpEI6XkenUVk5aDsGH2HrLk
	g==
Received: from intranet-smtp.plexus.com ([64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 4ant7as5wq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 11:09:18 -0600 (CST)
Received: from LNDCL34533.neenah.na.plexus.com (unknown [10.255.48.203])
	by intranet-smtp.plexus.com (Postfix) with ESMTP id D46EC3C8B8;
	Wed, 26 Nov 2025 11:09:17 -0600 (CST)
From: Danny Kaehn <danny.kaehn@plexus.com>
Date: Wed, 26 Nov 2025 11:05:26 -0600
Subject: [PATCH v12 3/3] HID: cp2112: Configure I2C Bus Speed from Firmware
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-cp2112-dt-v12-3-2cdba6481db3@plexus.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764176728; l=1081;
 i=danny.kaehn@plexus.com; s=20251118; h=from:subject:message-id;
 bh=gsyNbq2B3XGClE1K3VOnUs1PbaCF6eos3UvTrdx8nxQ=;
 b=kht4Cqh1OZVd3gYVdQFwn9naXfnEoiY2Y8fBvZVXVINsj0J0igYsSdaaR9YI/0L9lqAHzkkGn
 OQGGzH3ZgqcAYC6GKGUsaLQBCbp2g8MXb2uqSM86DXVKK3M4YBFgEEv
X-Developer-Key: i=danny.kaehn@plexus.com; a=ed25519;
 pk=br2sOmMe9QhpVp1uJw6IxgSNRKZO5khHotS2b+/bX14=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0MCBTYWx0ZWRfX35rlfaX+Sjdn
 SwP920A7SLTA9M2C+Y0Xiw5L5gRYvwKxkiAYkPWtsjPZdXtn4UYybY9AY76tOURmZFLzbw8CMyq
 Cu5sbHyEd4+pmI66TzCSS2Xfi8CkUWLesDGMN3PYI8IM5uq5T6/vDOBa4H8Nwg3f7UHK7BVSnEO
 z2e8s5K3zYJcnEzHJqfNtWD189ZL+UJ8iJrwWX8EIZAZrG2PaXRqIDsuZBQ9Z+79Xswm4iJh0jp
 kSF9VwZuKYCx0LyznGjmExBEuY/ATyl09O9Teby4WZpGvS1G1lwMpPSlWT7awl1qVg2QDDzPmqb
 SYQTHPrlevTtaP+TcAbeIIjSS0HMn10maIVWpBPYM6dofQCWAOOHIvE/v+AyV9b3L8UXUkoWsbC
 U5Mb67vcpWrUSMwQWu+TsOn5CGB0XA==
X-Proofpoint-ORIG-GUID: CrDDBZxl-eYhUa3eAsLA3RlEk9ywaRLY
X-Authority-Analysis: v=2.4 cv=BouQAIX5 c=1 sm=1 tr=0 ts=6927343f cx=c_pps
 a=356DXeqjepxy6lyVU6o3hA==:117 a=356DXeqjepxy6lyVU6o3hA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Y_joWELsAAAA:8 a=B4QkrQ5K2Q0oYPUHz0oA:9 a=QEXdDO2ut3YA:10
 a=g_BQsM8wYJVSTWLOHH1t:22
X-Proofpoint-GUID: HzGEIQjWvmaPWXxmcxP8h6AOtU9Gc2Tv
X-Proofpoint-Spam-Reason: orgsafe

Now that the I2C adapter on the CP2112 can have an associated firmware
node, set the bus speed based on firmware configuration

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
---
 drivers/hid/hid-cp2112.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index fb301c27c712..801fe3ccad5e 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1220,6 +1220,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct cp2112_smbus_config_report config;
 	struct fwnode_handle *child;
 	struct gpio_irq_chip *girq;
+	struct i2c_timings timings;
 	u32 addr;
 	int ret;
 
@@ -1303,6 +1304,9 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err_power_normal;
 	}
 
+	i2c_parse_fw_timings(&dev->adap.dev, &timings, true);
+
+	config.clock_speed = cpu_to_be32(timings.bus_freq_hz);
 	config.retry_time = cpu_to_be16(1);
 
 	ret = cp2112_hid_output(hdev, (u8 *)&config, sizeof(config),

-- 
2.25.1


