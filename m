Return-Path: <linux-i2c+bounces-7655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCF89B58F3
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 02:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FBF3B22A0C
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 01:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D96E86250;
	Wed, 30 Oct 2024 01:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R9llZ6AT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61433C14;
	Wed, 30 Oct 2024 01:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730250479; cv=none; b=J94LI0JxLAt9ofxQSVIY9JN/w3yZbzfUAo8eOFNy2QR7CLmR7MMfzbQkRQsLVAZPS7fY0K+lE/MlIyYD7RwRUJQ2kP/bmOiKBXTk8+KD+nz8GMdnMZlY9U4DHjtbeoyikR1Yz8NfyiREU/WH4OHC7mM1kmE4u2vbeM9NY5XHgxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730250479; c=relaxed/simple;
	bh=ft4XDgKObfVvH/ORChaY+8sasFqA77XcHTdg0Bm6rxo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=feYLXBfcmHh7ravZVXNIV2efoSVUcEX8gEm2Nmit7V7ahxJilSBCq2jaJe3ttHeOBhs+v0B/OV5MYr/LcUJsCOEn7Zm0ecm5qZWdxrROIMzS4aqXJVT0DT6RWLgx3F+ZTt4dCBnUpMkh5OfUyk0DcuBOdf3bOVLGRkWQwKOx6ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R9llZ6AT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TKRPmh012841;
	Wed, 30 Oct 2024 01:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4W4RiRXPI3/u9cd+TQ3a5K
	jFeAh3VtcAoOhqF4AgpK4=; b=R9llZ6ATLzU5aoFlqx0ONbYADA47fkJFTpsuo/
	Nc7+JsUUWuCNXmmkoWE1onpx9MVNOW+GIS5SpQgeGKHlZgnak8bixb2KOhjHrS71
	bQwKKWGXu8T0prAX3JVSbEmnMIbKOOiz5PN9oZmT3Ngw1+LryO42Aw2ehlNxVYJ5
	1Z27oLh6kJzWpyNxeEcpmZdtt4C5oCYBfVdbRzlHjZH/D/wYuwBb+lYyOTJycz94
	ly6b8TuF7POalgiE5UEoVZlhEsCLhwRrCIUHOS7D0EAa/up4J1mJ9toSf5X+w0Bz
	2VoRa+2TnGTD31DXZjF9wJuwl+QQ4o4rUQj7bF5lrbtAqiKA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k6rpgh7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 01:07:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49U17g6H014328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 01:07:42 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Oct 2024 18:07:42 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <swboyd@chromium.org>, <airlied@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <quic_jesszhan@quicinc.com>,
        <lyude@redhat.com>, <simona@ffwll.ch>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH] i2c: skip of_i2c_register_device() for invalid child nodes
Date: Tue, 29 Oct 2024 18:07:22 -0700
Message-ID: <20241030010723.3520941-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aIoafsZEh5UdIL9g_gMRhUSRNXWQyrgE
X-Proofpoint-GUID: aIoafsZEh5UdIL9g_gMRhUSRNXWQyrgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410300007

of_i2c_register_devices() adds all child nodes of a given i2c bus
however in certain device trees of_alias_from_compatible() and
of_property_read_u32() can fail as the child nodes of the device
might not be valid i2c client devices. One such example is the
i2c aux device for the DRM MST toplogy manager which uses the
display controller device node to add the i2c adaptor [1] leading
to an error spam like below

i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
i2c i2c-20: of_i2c: modalias failure on /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
i2c i2c-20: of_i2c: invalid reg on /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table

Add protection against invalid child nodes before trying to register
i2c devices for all child nodes.

[1] : https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/display/drm_dp_mst_topology.c#L5985

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/i2c/i2c-core-of.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index a6c407d36800..62a2603c3092 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -86,6 +86,8 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 {
 	struct device_node *bus, *node;
 	struct i2c_client *client;
+	u32 addr;
+	char temp[16];
 
 	/* Only register child devices if the adapter has a node pointer set */
 	if (!adap->dev.of_node)
@@ -101,6 +103,10 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 		if (of_node_test_and_set_flag(node, OF_POPULATED))
 			continue;
 
+		if (of_property_read_u32(node, "reg", &addr) ||
+		    of_alias_from_compatible(node, temp, sizeof(temp)))
+			continue;
+
 		client = of_i2c_register_device(adap, node);
 		if (IS_ERR(client)) {
 			dev_err(&adap->dev,
-- 
2.34.1


