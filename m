Return-Path: <linux-i2c+bounces-7638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5EF9B3FDF
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 02:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 414331C22103
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 01:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368B916F84F;
	Tue, 29 Oct 2024 01:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="j9VinrGc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167A913C3F6;
	Tue, 29 Oct 2024 01:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730165903; cv=none; b=Rl1lP/kNOk23Zp63qKBRkjK18ldupmN9pflRZM1wz3NMo/O963qDfDjLJLKMdGYNMp63zJT1Eu2C1qR870OZ2MSChAjpjvZefzcteawm3waRbcoD68TrFojB+OqXTZ19HW4+VCbbeTf9Hi1qaSV+YoDrkSYqfvSJAPlJfXCaxmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730165903; c=relaxed/simple;
	bh=iiq8pcF6gzMUjajJygEgzAbEhgkhpc4eAQdhHEt9T5Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K7MkgHlkFVomMuV1BG6MpUokFpSDSfm+4qXM50zF6V0i04v08N/eim/L4uj9FMrXgAZsFb4WOUs+CNT4nzW+l1KxW8wRXVuiHxqySKniHSSYVa++ig3L8HIjPgbgeg0+pBUBzjV3fHUGL58MC29bdkljBvbTDwMqki0LADBU+yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=j9VinrGc; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T06Vqd022024;
	Mon, 28 Oct 2024 21:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=dfRbl
	Gqt1c4ONfMKH8jiRRkP+hHB69/XcSVFec5aFyM=; b=j9VinrGcqRmC69OPskxT7
	URbUEInjvkxh1G6sNjCll6CA5xLzwHxSrjES7dmkuzGaUYaQhPSviU+FUcZbUT18
	ztU5vAcVJ/HksQzomb0DB0jx6OJEhHUhSX8tL40Qxu7SUTEZzvo1cxpXbey5u0ZR
	MlJae52V8R1wZJME68BgxoHXFdYSRv6v6RXamAqTvBXSuwNn2zNGwgEfmWLZ9idi
	jcFnZXE1f4MDQKdc0bao/jrwv52Fki+fdyyyCDxiXr/CdZdKgsnPt9juriNEcDkY
	phOOK+KKRI4zPbmdcYm9xMkUmpJZ8rmmeZtijaOlqcxlNeNt+4GDMPbN4uTn92jZ
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 42jmvfrbpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 21:38:02 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49T1c1YH018887
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Oct 2024 21:38:01 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 28 Oct
 2024 21:38:01 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 28 Oct 2024 21:38:01 -0400
Received: from MTINACO-L03.ad.analog.com (MTINACO-L03.ad.analog.com [10.117.223.14])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49T1bgJP031384;
	Mon, 28 Oct 2024 21:37:55 -0400
From: Mariel Tinaco <Mariel.Tinaco@analog.com>
To: <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare
	<jdelvare@suse.com>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Jonathan
 Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring
	<robh@kernel.org>
Subject: [PATCH 1/3] dt-bindings: hwmon: ltc2978: add support for ltc7841
Date: Tue, 29 Oct 2024 09:37:32 +0800
Message-ID: <20241029013734.293024-2-Mariel.Tinaco@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029013734.293024-1-Mariel.Tinaco@analog.com>
References: <20241029013734.293024-1-Mariel.Tinaco@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: mWEgv9mvtHlG6fSMeOUhJ25pJsLWrIcv
X-Proofpoint-GUID: mWEgv9mvtHlG6fSMeOUhJ25pJsLWrIcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=974
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290011

Add LTC7841 to supported devices of LTC2978. It has similar set of
registers to LTC7880, differing only in number of output channels and
some unimplemented PMBUS status and functionalities.

Signed-off-by: Mariel Tinaco <Mariel.Tinaco@analog.com>
---
 Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
index 1f98da32f3fe..37e1dc9c7dd3 100644
--- a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
@@ -26,6 +26,7 @@ properties:
       - lltc,ltc3886
       - lltc,ltc3887
       - lltc,ltc3889
+      - lltc,ltc7841
       - lltc,ltc7880
       - lltc,ltm2987
       - lltc,ltm4664
@@ -50,6 +51,7 @@ properties:
       * ltc2977, ltc2979, ltc2980, ltm2987 : vout0 - vout7
       * ltc2978 : vout0 - vout7
       * ltc3880, ltc3882, ltc3884, ltc3886, ltc3887, ltc3889 : vout0 - vout1
+      * ltc7841 : vout0
       * ltc7880 : vout0 - vout1
       * ltc3883 : vout0
       * ltm4664 : vout0 - vout1
-- 
2.34.1


