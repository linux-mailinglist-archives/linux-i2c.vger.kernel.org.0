Return-Path: <linux-i2c+bounces-14719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48471CD8E26
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C57430552CB
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1753590DE;
	Tue, 23 Dec 2025 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJH1bJxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FymM1BRQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49493590A9
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484435; cv=none; b=bf+wyfLHCnX6GPntgQ9CHmKC4dyFJo2bo7RmhbxuHdmtXjSSHfSdV2IwPTC3GTGRU4StzwMCClvT0CyZwvl82u9d2cCYlf8ANJoElXBGGKR17Boiee4Q73ICDZlobmoX12Reem+RVpIqhq1QLoDoX+msRutVWmUUbO0hWNR00SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484435; c=relaxed/simple;
	bh=hGEYRcVyYQYKY/F7Vyt1mfXKZTROQ4LT8kOAEJ8GJIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnNup7U5+ACVABc4hd6DTdrBPTdzxYuQWZDK2mbkN2C+1UCDXZJBlu9dAv2vwixRmdobt1G7tat6J0FnhDWdkxgLFQtrLfSB41eHzDDpGpo8teN9uRF6t8hb+Sbz8Bzeq9jwrrRw7qVnmJh/OnXqoaBa+O++W8o1xXojzzUdzD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJH1bJxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FymM1BRQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2kfsM1528829
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tH0LfxtvFUfgqAN006eWum8rbC+E0ztuIiM0KqrSDxs=; b=EJH1bJxMDv13SNhK
	OtKNs1P0PiDaON47Lv54IlhDYEipaA7nDzF6scUp9KrcJ0WokcL+qgt1E3fkpTAV
	e0wyJAIyFflshgQ7uyJqDin0Acpmr5kfm6hqA7fot+NxxRGL3dDjpAnPuUVqGdiy
	+cLv7vYuueSKvBiHr6bYgpZY+91EaknWMypyOGDKymCD2Tg8vpBSMaU5Jfx1Nt9O
	jcfGKFde0VEGMUUmrAomXqxW598cnTfTxa+bFYcafPLqVcAJo8Pu+BDMFTMtrHxU
	wiUqPD19guno+HTBaXXy6B4RNe9P0IMxCDuawOhuI1H6+3dKpfoncmvA+ZukZBDi
	aFt4wA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3guj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d7ac8339so158527991cf.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484431; x=1767089231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH0LfxtvFUfgqAN006eWum8rbC+E0ztuIiM0KqrSDxs=;
        b=FymM1BRQftQFTLKf1WCG4ZbpiWmKZDfXnwkCZt7CmTMrF6IjtEyUyv1u6CCJhRa/gE
         GTceh48Rl0EZKPOQcHAaLPHrJkBTvJYtsijRQbFVn2skOiGU6yVZ/pmfJMA5hO/rQGZX
         Jl1cvxNLdFEzgv2wPvOQCvgKNeP+YMlzp5ZH7G/BA8zEPeH3KQTH5/gQl0QDdowtVRgg
         /M1zhOGINkuwTIriWc8YV7bCKGo9r/nRXF6BAeSrJL2rGr8lN2lLM22xOlEOAAJuPunO
         Rnz/U8OdTAUyz4FOp2nd+FI/B3PbVh4HbtqGNE6+NZicINJJ5ejjlyJ2WKwa+9TP+RP2
         IuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484431; x=1767089231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tH0LfxtvFUfgqAN006eWum8rbC+E0ztuIiM0KqrSDxs=;
        b=h9G9The8J1RSmz1nJFze9jKggepwQAJjrDTPYyWI9G//LjnSg0T8up7AQCGQaHnCpW
         sPFSvzHNRbKMT6RwWqzVVT8eV96FfemtHsoE9vwHfan6eVnMO/NznNYg18ZkCvB+aAMS
         +yMP7pGwL5bqbmG4khaZ18paZaL8uB963gSFGIumnQahgNacY2/R6+EsGI9DiSRtSR9s
         W0mMc2urKBcM9OjlY0Y26Z13AiLXpsV8ZSvr+H9xMlVWQ896dUIl8N/c5CtvRkL4hP6a
         IH5GzcoBoIbFpDklBqE+oF8I3tQhV0NMsJMmgGNU0Agp/V3VRDMi0d3jK3DkHeWfvQPY
         9c/g==
X-Forwarded-Encrypted: i=1; AJvYcCUxjhL7uWz7zQlnnn2/Fe8i7XXgDyTBEtH1R4RtEsOrMMXaCoQu2fc1FvGKP8J1fcMnzT8gWkwW/e4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO9AK3E4vCd2jyxjUMKhRTcidj89w6ah/coMCjRbUBcEB8uPzU
	aebn4RdUZGK77JAONGjV7zvvENImiytPeCfAml9lbJX2BA1P1NZ0NwApgQDUpvct9opEz0UgI0p
	m76TDOrfVqmeFkBveOVFZrBmkIeI6qezEZ6Pqenss9WjhWFZa1knIJvizXEGULW0=
X-Gm-Gg: AY/fxX7yojtoQefRarJlm+GN2a1iA0UEaHAFAOWZ8O+HX47tqnPEkVx8bjq5pPTbu8/
	mhJTf8QczI61VbY+9Se8rQvJj2/IVunOgovkvXqyHnYPEDc3iCnEFBJICYqvUrYlxLSWDlWNUW8
	dnzZcqP8eE90zuJPOFjrrx8TuBsFHu+rIf3v1ApJp070vWGHmZ8MknaUXwwZFd2y0C7wxAi0Mrc
	RqK9119Feem2f3Nv9AqhoAGrezxPFruh47wromdZuBjoSqZc7e7qhOCqgCOsoPqdrr1/323392E
	W/bCuJTEtCE7ZN+dEyLAbdhQ/fuBruSvDN5hZJe7c+GzDXMf40rYcydNPiC7XduQvqT7h6o/kHm
	or1WmhZb7P/os8OMkDTD1lowNoiptZodyDsguAus=
X-Received: by 2002:a05:622a:1e92:b0:4f3:5827:c96d with SMTP id d75a77b69052e-4f4abd6e4a0mr244377191cf.46.1766484431135;
        Tue, 23 Dec 2025 02:07:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpwCEboa9pbFgXvFCizm2CmsBF7yQL4nyhOOrPRDwjigE8ZK8Kh1O+ad5TTuvyeoq1c9qCfQ==
X-Received: by 2002:a05:622a:1e92:b0:4f3:5827:c96d with SMTP id d75a77b69052e-4f4abd6e4a0mr244376841cf.46.1766484430750;
        Tue, 23 Dec 2025 02:07:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm339882745e9.1.2025.12.23.02.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:07:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:06:53 +0100
Subject: [PATCH 6/7] i2c: rzv2m: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-ada-dev-set-node-v1-6-2e36e0e785b4@oss.qualcomm.com>
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
        Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=980;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hGEYRcVyYQYKY/F7Vyt1mfXKZTROQ4LT8kOAEJ8GJIc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmnCViJzk4QP9sdJqbi0g1cVCg1gllisAZwge
 qWWHuWBePyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppwgAKCRAFnS7L/zaE
 wx12EAClxWoWNxQyesOQuy+EEcVR/vfGAKUA/l2WfKaJX6Im1qGDZjEU/gr4+iMQpHguY8GuqmG
 vGwKfaPBQeVaeGr1MuKmS6qfskuXkJqV91nUY0LDl09QgTuSe1HIcZvjLN503xnNjoM5Vi1kR6J
 X1ppA7DTmwjZ7A9tuEA87Gfu/4POu1P7UPU1/C32t8IlCSinnzaaskyA7TRGMmMeP6MyMgCGE++
 P5WMs9gmW2elWvLNq3X43kZaQDNeC0m1ksEHAitfYg8IhTnspyF3oL/SM7nV9k8tXWgX6pdGJ7a
 F9tfJ4eVxTIcI1kWF53gU7XsMZzVNh5oPg3ufcu9TE/6MCOe26vnYt/rCL6ewPwtsXd1hohtJ1Q
 ANHOFUFXXF3gcWMdRHQUFVTU6qetSJKmhhdm8BHLDrqgLySAEvOQeNKay3QB2skYDp1CkIZwzip
 GOB3gDtA/vS/qFQXaE+U9nqa84e3+hMGrkZWo9s8BRaG0L7+i06b0xCoTPyu/rBmd+j7t8nEiCb
 DBByClKiZgfAi9vECTeh1HyyZa1MbOmQ/AgTc2O7l2eFbPK0Rd5Dzg0M3yj3GtcOBF5eEsCbKOq
 L9e9CH8RAPtMrvCJRa01NmtsMxBrhQlUTFoPgYsIVYpFwfL5INVjxV+FxE2wNYIBOUdYUmFgKYg
 xqQLyDrk70xzcSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a69d0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=84Df8qURJmcINpNV-cAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: FWh2jQ7zSU8y8MP7ZfgPuAyprYOmZS8I
X-Proofpoint-GUID: FWh2jQ7zSU8y8MP7ZfgPuAyprYOmZS8I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX0F8wmPleo7zq
 XsyuKOuEdXAuh30nS5F+vtoGribYO9CMCXI4xJZx77cUuP9ZNdCwWGDkbHYhFwvAyROtWtTKO0Q
 1iwfZr1wFtKdg3q75jneF9smB/p/dDwMJr/lsh+sVzpZywP2CVV056h9b8Q95jFZQgEmIiH5lBL
 2znQkZy/Cziw7ApMbzbwqb6oAg2OnGYpiql0lHBag1TQ/Ew3WwsC9MU7zm1n1gGudI3DUDj1zJT
 eOc8b9r3PmgUFCFZiFR9F//O5v/5wlcgJRDEJBAK8IXiOj0kHXduAu3gBdLDpXrzxsKrngp9ZWe
 LDoIAUwxD0VY+WgORtdkuhEoSCFy4Wiwc8lMeFMK/l5DAGAo7g4qhl50pFvpnforGw7tIJ7cVVJ
 fWEf8JAQfvgP+O6eCCL6cVYrkdDliZ+vLdOuDOBSnF6lyi+PeexqMlJ7xnrcQ23S4X+7fnGdbuH
 7ozDVd5NW4cOBH9QWew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-rzv2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index 2387148506736a65378809971bfbddfb436b6c4d..f31d5b90802477a3d27557a4a92ca2b26023e343 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -451,7 +451,7 @@ static int rzv2m_i2c_probe(struct platform_device *pdev)
 	adap->quirks = &rzv2m_i2c_quirks;
 	adap->dev.parent = dev;
 	adap->owner = THIS_MODULE;
-	device_set_node(&adap->dev, dev_fwnode(dev));
+	i2c_adapter_set_node(adap, dev_fwnode(dev));
 	i2c_set_adapdata(adap, priv);
 	strscpy(adap->name, pdev->name, sizeof(adap->name));
 	init_completion(&priv->msg_tia_done);

-- 
2.47.3


