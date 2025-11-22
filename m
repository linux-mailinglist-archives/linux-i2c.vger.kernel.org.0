Return-Path: <linux-i2c+bounces-14217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2BEC7C72F
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 06:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B01893A76C9
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 05:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EDB2BE03D;
	Sat, 22 Nov 2025 05:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jtx8FVeM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bk5dVVa/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE372BD5AD
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787644; cv=none; b=WL+Up/bcm5UuGpaH+PVd9+jPQAlzaJxLz0P7CHZFvh7mFnp5I+qP1nW3lDcRN1ybonsWCHSiwtLT+vjc4Gikc9a9DY9cOBbFnxiB+hWgBZrZC1eXcfOr8mat0CgqVDk5m9BfHX+iaV47EHeQT0CCN2EDKG3PSTaJUWGtsbKa9Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787644; c=relaxed/simple;
	bh=cwIEc0HF5caawSt6gOxOI+pMExQY63TqviBqzRA+S28=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ejkMevqmKxu+Q+xTdR7Ahg3AuID7RnuvHr8XAGfNhftucep8C50y77VvVOGXjJs470EFn1SYc40xBVxgd4aAv8nUCZMqNL+wrZsqsqy8YxVhXVLRmI2+6SMcdmwTGvrplusYudnP+dFrgtd/AlT4yWzcH0KthUlIzvZFN6jkbg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jtx8FVeM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bk5dVVa/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4WxOw1509957
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OykaP3QXAEq
	G4yI9kL9Noaj3OcsMMG9dgRdTlVS4bzE=; b=Jtx8FVeM4gSL3KVXYJA7rVkDVUX
	4ovtx7+yA/0WZBL5xT4EuLcSQNCh8ChwYzfb16fpQjWE5RL6VJIH6x8SvPFgju7v
	cy/fxdGQVka/nHNME1A0L2XkCN+nMUeXVjes6VzCxgYIdQZyk3GOUGtsgi9JaXD4
	XfRuo9bhe/T5Xp3Scqi87Gjy39J48Rcvx25+gRPxSrNvqStRadBuZsmXSJ3/Tk0i
	wu5galeIkVLy/clHi3PoFgL1jzwNJW4PFBjZyhKNtuSUbS3vmu9NBPQOw51m4zQh
	6fkKZwuSPU0jmCoovmFwwionx0Y+fHOVbwDYbL+ubLi84pwhUPrm87Xuu0g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak68dr196-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:00:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-299d221b749so70746045ad.3
        for <linux-i2c@vger.kernel.org>; Fri, 21 Nov 2025 21:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787641; x=1764392441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OykaP3QXAEqG4yI9kL9Noaj3OcsMMG9dgRdTlVS4bzE=;
        b=bk5dVVa/30F7K3qseNbgR69ybf5b8CLgH/ZaZ/T3+d3Tchaw2FeJHlNZtoSaCfTqrG
         37XCdaR1nsKnqyUJcHymSk9frnmI9C4ocq/vStGbCFHjRRC8nfcyXx9r4I+aO+OdQwlp
         +A7z+YW5CgKB7dGHmPILulEkIlpO7ul3hC0AGnZBNR6uSp7qipBj+VylrKIvJ5UqTbHr
         60Ao/TcVKCToE82lEIS8540e1aNrBJVAATJh93+H5D8RAVqqT3PwZ8etjCK6yO2TNdHd
         YTjbWKf5RBVApoqw/WUkOYkPQzNmoOuBUvWXr0Q9FBKuiseoEtbFOJSvB/lJUpJfXY0P
         14MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787641; x=1764392441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OykaP3QXAEqG4yI9kL9Noaj3OcsMMG9dgRdTlVS4bzE=;
        b=ZEHewrLxt0RxIwaLFZjz9nGmrYsdo3kV5RPKjWSrRvxjKrNzsJWRDORRlDIAnijwpS
         FlVngqj52qoFwOwF2Rsf66eMxqbJaRT1nbz4kobhDrsBXCB/pmFMAOp9ANeS4YRwRK5B
         Pk9jBWUSaqGth2KPKakozMjW23E7vbhFib3KXTx54o8EfdNYwksa37TM7p07Kw2bInXx
         JTBdkGQ+x4e0wT9CZ7EUcl4QVu1qcnm6lNfgOCDF6VViismDCKtPTYU99HgPWw6fcknQ
         7Z45nVecEmmbQrQRapEpbND5gdFUJilYXnv24bgWqLAnOxyaIFz8jT5MWpwEiIXPxrAV
         v0eA==
X-Forwarded-Encrypted: i=1; AJvYcCUkot6gWgtYzg5xLnQbkqZT7p2pistRJRPHposvh3x+x1DlOP2BpriGYznA0h9jsA/qjfUYUr1S4FE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAm4XoCrJ69a1rBHT+kzDKpn5XHKBfQA/MXmXU8as3ptlp7TFZ
	PV+4/kAvfv/oWsm0n/3w+Bga/I9YhRigE3m4OgYLNdS6Wluzt4EitnjzRlF9wzFWWAN1+bwSah2
	Rm0IfOMfAhugA+D4LrwDqdo/4pVQLnqhF8Bjckb9XwjA5VGKNS9DMqDIhVd3WY1k=
X-Gm-Gg: ASbGnctMQemiyO/XZeVErLg2rT6frHv9YhKNM0F9kNUt7pMKasynb+3mqO0opOiUYhu
	dij057xUn79MflC2DyNwfLyuywWlkRURoB6rUh3U1OaHADJYqQQbM5P6VpZMgnMMHjrYLk8zbgR
	3KnAtWVLgcCTRLG1Y1lgG/adKqISdvfepwI9GsZXRpza3IMA8gkFsRuilUDI2Tp1rUbBbqeJ8bn
	hqJwOusF9Yep5DLAm4pq89yz95nCZ5WrdtDCzp07lZ7+ZMME9jJ+8uak4JLSs0a5EfEWsUJAPkb
	OWOnoeX51znkPHnczzItJ1MWoYVJNdkfpq1mrW1Ou/Gvj7ExDfXCCzvalxJPcjIIyI1As7jZ/zZ
	RFWHZBchW9FLpBcJEQPR0iBbjuDe0PF6WvUBbpK+pX54=
X-Received: by 2002:a17:902:ebc1:b0:27e:f018:d312 with SMTP id d9443c01a7336-29b6c3c71c1mr57439115ad.1.1763787641085;
        Fri, 21 Nov 2025 21:00:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzaJB3tETHFGPKwtS5H4CJ4sdq+g/8P4mFhp+moshcF5KdpfshYLuqDo5fwCI563FmZq1eIg==
X-Received: by 2002:a17:902:ebc1:b0:27e:f018:d312 with SMTP id d9443c01a7336-29b6c3c71c1mr57438695ad.1.1763787640449;
        Fri, 21 Nov 2025 21:00:40 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:00:40 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v1 01/12] soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC path optional
Date: Sat, 22 Nov 2025 10:30:07 +0530
Message-Id: <20251122050018.283669-2-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX/u2eXHnbTG8m
 90PflE695rV1Xo1A0GVo6UaUW0N9XVXdhjL5q7tMHp2Ez3iRTYZ62auPNhsweDnGLLTylnUn7sC
 e7LxNee1TIBoQ0XFMrqQG7JoSc3CSVdcNmIJl8zucatCypeEOt3a1PiFEzVycrOOvJ1htfA/Eet
 zKb8ikS0yXF1krHLrCRvcpKM4o/L2Xa64XVg1ybExsuLerQyH3On7UdgYEny+Oz7ZehNUjZh9mS
 PghwrYz5k9gW3d6+SwK1m0aG1qd8dfc90somL5yI09bkIiZavT0nTYPjbQrg5PuhPkvgTt/es5H
 WQiBsKQWUMvb8bxFwajDL6wxJpDFMczLaMRLLikOK44NzODjApJLL9KyclQCoeJGsIHhU68dFyd
 mZKrmlL6J0g01uquzr2yigmtHdDBCQ==
X-Proofpoint-GUID: wUJs5G2IOz5ioZ5qkwnb95nBBtEtfICd
X-Proofpoint-ORIG-GUID: wUJs5G2IOz5ioZ5qkwnb95nBBtEtfICd
X-Authority-Analysis: v=2.4 cv=UsBu9uwB c=1 sm=1 tr=0 ts=6921437a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GTpMjWLy6HWSKpZSgkwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

Refactor the geni_icc_get() function to replace the loop-based ICC path
initialization with explicit handling of each interconnect path. This
improves code readability and allows for different error handling per
path type.

The "qup-core" and "qup-config" paths remain mandatory, while "qup-memory"
is now optional and skipped if not defined in DT.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 36 +++++++++++++++++----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index cd1779b6a91a..b6167b968ef6 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -899,30 +899,32 @@ EXPORT_SYMBOL_GPL(geni_se_rx_dma_unprep);
 
 int geni_icc_get(struct geni_se *se, const char *icc_ddr)
 {
-	int i, err;
-	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
+	struct geni_icc_path *icc_paths = se->icc_paths;
 
 	if (has_acpi_companion(se->dev))
 		return 0;
 
-	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
-		if (!icc_names[i])
-			continue;
-
-		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
-		if (IS_ERR(se->icc_paths[i].path))
-			goto err;
+	icc_paths[GENI_TO_CORE].path = devm_of_icc_get(se->dev, "qup-core");
+	if (IS_ERR(icc_paths[GENI_TO_CORE].path))
+		return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_CORE].path),
+				     "Failed to get 'qup-core' ICC path\n");
+
+	icc_paths[CPU_TO_GENI].path = devm_of_icc_get(se->dev, "qup-config");
+	if (IS_ERR(icc_paths[CPU_TO_GENI].path))
+		return dev_err_probe(se->dev, PTR_ERR(icc_paths[CPU_TO_GENI].path),
+				     "Failed to get 'qup-config' ICC path\n");
+
+	/* The DDR path is optional, depending on protocol and hw capabilities */
+	icc_paths[GENI_TO_DDR].path = devm_of_icc_get(se->dev, "qup-memory");
+	if (IS_ERR(icc_paths[GENI_TO_DDR].path)) {
+		if (PTR_ERR(icc_paths[GENI_TO_DDR].path) == -ENODATA)
+			icc_paths[GENI_TO_DDR].path = NULL;
+		else
+			return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_DDR].path),
+					     "Failed to get 'qup-memory' ICC path\n");
 	}
 
 	return 0;
-
-err:
-	err = PTR_ERR(se->icc_paths[i].path);
-	if (err != -EPROBE_DEFER)
-		dev_err_ratelimited(se->dev, "Failed to get ICC path '%s': %d\n",
-					icc_names[i], err);
-	return err;
-
 }
 EXPORT_SYMBOL_GPL(geni_icc_get);
 
-- 
2.34.1


