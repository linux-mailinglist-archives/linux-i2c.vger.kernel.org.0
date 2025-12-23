Return-Path: <linux-i2c+bounces-14727-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E06A7CD8C67
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0D8C306986F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D983C35F8B6;
	Tue, 23 Dec 2025 10:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+ICR8/E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McCDoERY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C2535F8C9
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484519; cv=none; b=nv5k7NAfQh62bEvltQdcO1fSl1M3ckhBagK51pcXizpgaeEGPxpVt3j0Th6AsEvEO+eX3Ca15+jn0EefZTjd6T/cc9rBvXKhcw/BpJuwOZ9t0/abJzP3FsE55meJgKsPWi1Y4ATkpo8V/iA9lXpmFJ5t69/ZmIsswlOIBaXernQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484519; c=relaxed/simple;
	bh=VLukJSCiVPWJ+84aHt8Ph9T6nLL7fWynI+AjcsxtCnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWS2Ds7fIDuCWVco5aJcYEGdPjKKOUR6A4cyriRxjdngXWvwVuuApg44lbFIuSpdMk5kLxtVVKlhOTVDMwgQHKEn3OtsJ4Ms7a5c2BcgoBIyWYyPkT5quVZYkIFw31bTTliUSNlzNWBuFlcW5oyR6ONcExvLIaTUZOdyXX78lwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+ICR8/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McCDoERY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7Sgr61630835
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+uzcgbhCyIJXZYdHV3U/26SmMSKIkhfl4LrCFhdZnE=; b=b+ICR8/Ewl3AE/E3
	fE4G67w3dNIBhyDs7ukH7xvCYyzGDFUjobQR31TILGBOULiFb4hx0lvNIsiwRjTL
	woqHUfloBRvlzG0j72BLYhnXe5thhKaV/WO6uc9gIFtR4O7YUBaytlbGupAp3HcC
	S1NgigRHbh4AkyalWjkpbd22MhfKirSSvRfAOnvjAHSO+Z10/AlBey5jvIhYepO9
	3XDfOHx2qk+BKOa3F6Ex/TjbRJm+t+gbFUGNtQWjvObgk8M5/wIEgQyPr9wzr4mz
	vMS1eWvFVpuz1JXxL2l6ZpFRZ+wej9YXaq+4QfVlJYupPG00QbtGp9SIdIRUSSML
	Bv6xxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8jacw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee3dfe072dso127072691cf.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484516; x=1767089316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+uzcgbhCyIJXZYdHV3U/26SmMSKIkhfl4LrCFhdZnE=;
        b=McCDoERYA4t/cfcGbX/JXewnMZp87GY+Y4Thx180wtdlOQ2KFlOa1SoqY0lIhw1jIw
         bxOEO6E6UljH8PBSN921gk7hVY/bQ4hDR8xPzyiRAqOznR1by4hoCbN44O0X+sUvMYFH
         VtqSMOYBS9LnpS3UTd7D/6ps9DOQ8PIucmuozn/VO81eiIyc909YLcJpGyp8e8JuDwZ4
         b3QuW2XK1RPBo2MBlnVDuhBYiKScT6s3u3qF7laOg/5Xy6kgR/HNWOMRKPXLM0dBdm8K
         g2565iLktt+EwpaU+MHvss17jpoWDpeWQrJqNLNKCFfacyc+P5jQwyT0qfLWJiWj462i
         neyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484516; x=1767089316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+uzcgbhCyIJXZYdHV3U/26SmMSKIkhfl4LrCFhdZnE=;
        b=DAK3e449WqpQNM0xXRHvs4Aa4/vi6wl3cPVuE3AahrGAwaNyUvzCX6NahIdnvbBs6m
         unu5rBtulytdnv+brU+Fg8R74eyYVO9JdhJw1fzb2VcRYS+MSLr/VtnAedUfIyBEgYo8
         Bqljsx8vJdBS6RaBf6eBXr2FZ3MwD9bLpljbtvjwXazrdvYvqYQcR5Pu+G4/qJhzZMTo
         yOl9wCakX1rEztSFCiAfblaS2CnUqj8xh1Mhl0aVT39xpYKUazLVqLQqtRpDZ4n9E5s8
         0rRCYHco3gUb4KMyJQZ4EEGAvpJOMaHPAZe2Hin5yeVKNyjEo0FowE1VvlEOgFK44Ciy
         PkiA==
X-Forwarded-Encrypted: i=1; AJvYcCWzm8vV3ljvkRxybCsviFki9O/KxvkC828a7kZZklWx3kEoUfRO0qRdRahj5SRLSRUF2mtzIR+CbtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2GEuFLqzUaeNwuKtkiE2Buct+aQgFL69jCRbD1pzNC73dG2l+
	JfZ4e15z3BxI44/vYAPtRVHle44VLqn1p0noz9TY7mD4LDmiclnTxYsunig31ZVMqzC++Rk54yx
	KDrT/pmfoKPZDnoiGIlVLA+8xLVqxplRVrNevQfMy7ewIK0P3oRlAHYPvXvi6DoY=
X-Gm-Gg: AY/fxX7oodbzZy4n5ThW0l6X0lVTnpG/Yyod5n17wp0jSy2HRu8TadNqZD4HviQGy8g
	dQkNKFJtE5HRl3yROro6sridUq4UNNicUwiwXIAne5qPrt4oWMDuBiCeFw9XxXwMlqABb58S9f8
	DywYBuc1GNtqBMI9sfQL0l7Di4FV9zAhdifDkVtafOKvXLn2QYGgcYLZheF5I6Oy7OpBXTECcts
	qYyPHlYmwQc99WTwWzLn0MEA2aeaqdhzpf1en1Yn6cpOgS5iQORvMbcHxlwlYQSw+1so67qFTnm
	76t1oZECV5lcZbWN/JsVThvYylshU4Zx/2qAae1acOnsWXqBzQ3LjSzhKeu/Q8scE8BS9dHWWm+
	Wdfr3WDrdgi27uLcUO3VEkRVZVmba9lkc8OiSrg==
X-Received: by 2002:a05:622a:230d:b0:4f1:e8f1:cbda with SMTP id d75a77b69052e-4f4abd839edmr204016221cf.54.1766484516400;
        Tue, 23 Dec 2025 02:08:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEx+wYKlsa0uE8q7p9uOGINRt4HF+E9dZLNsl5kSWTdV6aw5k7iInD7LOFNoEwpggQzglHTtw==
X-Received: by 2002:a05:622a:230d:b0:4f1:e8f1:cbda with SMTP id d75a77b69052e-4f4abd839edmr204015931cf.54.1766484515897;
        Tue, 23 Dec 2025 02:08:35 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm249823015e9.8.2025.12.23.02.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:08:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:08:23 +0100
Subject: [PATCH 6/6] i2c: viai2c-zhaoxin: use i2c_adapter_dev()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adapter-dev-wrapper-v1-6-bcf960a48fa9@oss.qualcomm.com>
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Hans Hu <hanshu@zhaoxin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VLukJSCiVPWJ+84aHt8Ph9T6nLL7fWynI+AjcsxtCnc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmoZMXyMxo+0dmDclk1HVYeFE7vj0OhHthX40
 eyHDV9LOGKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpqGQAKCRAFnS7L/zaE
 w81aEACD5WdjY4cE6lmElRUCqujjwGnBBltdzsva0616qREx22na78VHrXwo2nV6PSvoZXgROox
 QxcKeC6eLx7STjcoLnBGm0WofjQHptr4vv4S0HxoxHQt9Qr4Lpil6Z4/uPbT/fzjPEV9egTo4cm
 Xjli0eAfjppBKJrUAJWrHl58KmJPD3SiazcJISgAwmr+eKFiq8FuOo6Zt11vidkLih/ptAE8dA1
 50nGbc3NjZJUebr4RZzlpk8/qxz1JARydC0AUXENU8ypPpTvfN2Lf/onhrXwRq0nZvwEYAu1mav
 cXwxNxlf27vkGejO2SdvVohRnGOxdiGTHEOcZIIkke597c0LYpYe21HO7N6udWOY195bwa6epIR
 r9GLd9X7mFBdw48+k8b+aYF7RrgpcwHDQ1jAJXLKMAIlLqdH2hnphRu7HKpV9vqi3lJCq6HPvGp
 rRr0+h8uGekHf1MdOhi3mloDkKp1ybI4JbN6H2JGVdcvd10EzxwY6O3LEesHu9lptuf+TVA8d21
 lb25FBPHiAF8u1upNveqblvgwpbYAsFLhpoUa2aycx/NIY+iQJnyzqqoG8QeCYgVVOpljASxALy
 2f+h7w3GVw60LffQHJyCOvJX5KYqXwjqyIGgmKZfiF1nnZjiTJUvZcdLcqxmqM0i+SUmMvskaG+
 rZFUtW1LDG0VJSg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 0QCx7_GYD_ESZ6XEMofFud0W8Za8DKnl
X-Proofpoint-GUID: 0QCx7_GYD_ESZ6XEMofFud0W8Za8DKnl
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a6a25 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zdNWxmMMA23eHnuPwWEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX+bQrDvWGeGLu
 6WLDOV6tgFa9Q+U+p2Ed8rbPG0UPEUKDj6uqiOdEcBmCqnHvYVcfm/bkmNqJcAKAC/4deAOgMOC
 MwF8n2VFG8IST5Yr4W2hzeM25+id9SO9Gkd7r7JfIHGsvfYGfyyQwXjKWQ7/eUo5MnAMoi5vlR/
 73g+/8Tc6AIV6k/bFTWIl5MafiDgpA0KqjvC25Zem11V4XUXW4zxWZL9rK+3d/ptFUE1QejsX79
 4gJxHE5Lj9i44HtNs84MO9mmvRlKwT5EucoCHeWXDi3jVdCJysMnqb+vUz8/3I3Eb/VhvafKrXZ
 j1dLNyrKl3lBSl8AcSNlVFupVyoem8tHF6o3G0aPIJOvRsK+TTSHoT77Yt3UYpPXbe7AXkXYb98
 vgOvufcf/D1e9DaHHPDA6PeFwjlcrpPViRGjpECIGzg3u+sDiCVN0QfKdXNbCyJ5hwbBFhP4v7H
 xevEe3Sd/WymXr2s5Ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Use i2c_adapter_dev() where applicable in order to avoid direct
dereferencing of struct device embedded within struct i2c_adapter.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
index 95dc64902b7cdb01beea04acf7bad8f20133d965..d68c1f38806deeb3f233315e717092e96473c887 100644
--- a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
+++ b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
@@ -323,7 +323,7 @@ static int zxi2c_probe(struct platform_device *pdev)
 	adap->algo = &zxi2c_algorithm;
 	adap->quirks = &zxi2c_quirks;
 	adap->dev.parent = &pdev->dev;
-	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
+	ACPI_COMPANION_SET(i2c_adapter_dev(adap), ACPI_COMPANION(&pdev->dev));
 	snprintf(adap->name, sizeof(adap->name), "zhaoxin-%s-%s",
 		 dev_name(pdev->dev.parent), dev_name(i2c->dev));
 	i2c_set_adapdata(adap, i2c);

-- 
2.47.3


