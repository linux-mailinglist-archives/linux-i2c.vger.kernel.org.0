Return-Path: <linux-i2c+bounces-15046-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 096ABD12062
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 11:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E44E4302476D
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 10:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160CB283C87;
	Mon, 12 Jan 2026 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIuQxxh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1tTuZSD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AAE34BA22
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214934; cv=none; b=Ek+JX96QOz4EQfi9CQE6XPAkFzfBMvX/8LLPF18MRJVdAXorKb6TzIVAlqJ0K5gq9n0yYN/1aAX8iMz1kmlDx0G6WpGFgnSZtxZq50rMuiO+gnR6agF+8kZ8V57xab/ZPr53MshsvIB0Xvr4uBbPBJtPpmkihJ+jnhp5p2KG++s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214934; c=relaxed/simple;
	bh=YIHYMofa7MM1n5uKKT/qVy70UWWioCFNHYGxbHnXI7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=POyOgJPS5JNvyJZuwp5grpvu1YPzSOMGMmqNjceJFIcdVPirZ0wtKeL6OSaOL69FfKnk+Q+09UocO8/52ohiGl1IKk78brk7cwJrx/0Ot5G6AGr4biOlyvcZTN1/0lkd1xiIE4N80xwZfZXYKP+E/pj7eoGlDsRwpIoIAQPnYK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIuQxxh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1tTuZSD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C9WktR309309
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jQcAcBkjL0G
	3tUxlp42cxgokHnjt05AgkeoLcV3XnyY=; b=RIuQxxh/ie3IlZVW0qIi/nCTwRc
	jT8YXmt8WIwiS+WwMHTXYYJfElvS2hWv5KXkGcroO3aGkOwrkN23h3YG5zv2DLpH
	PlRGksFC8zApdNakjaOSnFytI98UoPrsCUo3sMQ9xoYYWHEQYGj8PFuxJVuzJcAm
	9fVBkhj/SKLXMNJ1KEG3hSiseI6PdMFrZzi7ZpibFDj3zaPiu4ijvfyMbE7ZkPLN
	hXKZZhgdbI+Pb2hmqzHsVVTlK2j+PA6Gr0jG+K622xe0CPK78OKX0sP1jf/R+z9C
	YyoLppFv0P6+mpzt7cFrxaWIgn/Edov6ZpLLt0SX5SMtY9j3r/ApbTgRupw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxdvr7am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so4462978a12.3
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 02:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214931; x=1768819731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQcAcBkjL0G3tUxlp42cxgokHnjt05AgkeoLcV3XnyY=;
        b=i1tTuZSDXcvKf6D5i0hC4SwrSeVXEQMayyughCQERul4EbCMLHDRvoB55fRQT1GCk/
         Xsv2Lz6GA5bZBqSTe4Pf6NGQ59BhzPor+5y19/jqR+0NIkBuzvWF8+dEnpiSoAAaHaIM
         /7auQy4fkf8n7bnEFQ1ceD1Uu8LMu5Er9HGAKX8/I4XUTjdDMBR7U6jnMrhkTcEWOcWg
         ftf+jpxTRvNcmt6vjxUHVHm3IWvQJA/d5X3g5kfxF40ug5SzVB7eo/mTb8Fx+qkxDz4Z
         Mj/ULCvP2kSQMx6w+ob2PvWtK64oG62ci1nPUym7PVUUq+Ln99GRY4WDvvH2X8CEBbxd
         fXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214931; x=1768819731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jQcAcBkjL0G3tUxlp42cxgokHnjt05AgkeoLcV3XnyY=;
        b=BQRM5A+OASqqVWioazV6SRVb+8Xqer62TIkvx8xXqSLGXLgQQntNA/6MRjXLdjc/eE
         FG4kFBVwlxx4e4Zljkz9bb6+s5veooYK6cufA2rXgbhcC5yeYnUFoszVRWcKEa2RwGYk
         Z8BODP0r7xr4EB6s9oFpUel7lqLDoEJzT15RMQ/OouP0J/MeGoj85I3fX9LIFQP/ahvI
         fu4LVddLQyxRwTwUMc3HBmGzdemkkTK3TXEqfk3mw4DY2CQAlIBitXBp04Zqyh9HKSrj
         B0xvpdc6vvbkyPjYbNckPTVQxeuBr0ZL5iMlmeI08k8fv8xcWI2GlRdUxjetr3VJsNK9
         FgSg==
X-Forwarded-Encrypted: i=1; AJvYcCVSnIXF5Ga8832rwUmQDsDHOBAeHGa3zgsfXppJ/CmOPLUjWxBZtwEx/sxlJPexdGdRRkyR8dfici0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9YWKXtrHkhKBjAoOWrIqHlWwgDHG9llbtWKgarU8uF7Oy9Q2W
	rPpmyqGNTtq1hbux/J6+vC7Jwrd4HDl/52ohf6LQyvyoXViMaU+LDeziNeSxOlVGEou5V2WS634
	RrvHuWF2wFwJ2Dpml2gjPM4B2zWwc4kCWml+jrwBq0MMP9S+bzqn7PHc5+oTP7WQ=
X-Gm-Gg: AY/fxX5aPqa03/WA59IxdLq6dfDbgV9gxnVwsb7VyoV4c02DIUneVQ4xkMQR2QtNyBi
	hNAaOz9j984gL6L8uNLfDMRMCEaLX+eG2ZyfTyQPjXURK9mtD52QN91pm0ii3+dT0F+uJqUFTqJ
	CWaZyt8x5wOzzLKWGue/K6ijbdB+2iZszG9dJXWqOQjYVAp/Jtk3vWsDdja4r4uO4Rc9wvgAehd
	jp/CXIyKzrOUAZZKiJJB42tNoeIZsF8AsAAqhjYR0LGjPFC++YnbshQAHEkwzgq8meCt2n6EWsz
	AcPjZIOW5BwYMgTfdOw5SJ4lhTVE4OT+CuxH6iofHGYKsgJjqPTG/SypWM9uISZUzu9aTOLmgid
	Sbd/2gpW49XQ9rtW0ZxKRP0IF+SztzdWW/3WgnWMh8P0=
X-Received: by 2002:a05:6a00:ace:b0:81b:ad93:a874 with SMTP id d2e1a72fcca58-81bad93a9d0mr14171016b3a.16.1768214930695;
        Mon, 12 Jan 2026 02:48:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhPyAERmzr9Dw2x35aSuyt4PyrwayfBvLR+kwrYNIeRwGfH7SfDHmMlNc3aMJf2XF21+hvew==
X-Received: by 2002:a05:6a00:ace:b0:81b:ad93:a874 with SMTP id d2e1a72fcca58-81bad93a9d0mr14171003b3a.16.1768214930105;
        Mon, 12 Jan 2026 02:48:50 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:48:49 -0800 (PST)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
Subject: [PATCH v3 12/12] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms
Date: Mon, 12 Jan 2026 16:17:22 +0530
Message-Id: <20260112104722.591521-13-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aOQJZ4TGZ8l6MqwZYi8YjuoniDrDjqlE
X-Proofpoint-GUID: aOQJZ4TGZ8l6MqwZYi8YjuoniDrDjqlE
X-Authority-Analysis: v=2.4 cv=HoZ72kTS c=1 sm=1 tr=0 ts=6964d193 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zgZzUwpPmSg69XYvEVoA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfXwyiGyRGU6jEZ
 tS0WOt/FIa2+n59a8F3MwBH+tatdcGL3WTOo/S8HUythzto8b9YRh6kBb4muwN9QMDFxMrRhIbN
 JPKxpn6iqfXckD3cVBvKMerObd0+pgBASDH4p+tR49h2eERNdtY8GZ8irFUa6AtHvhPj0xHHl1o
 vpIkJDxFRwFmLfTAobbXAhx+CEot56ltWc+275cuwzrit8ZmzECoEJBz19xmUeI5weMTKALV9FZ
 B3B+53CxBhdXBVTS2c6gANa94bDwZHzgF4PePuKoIUJHHyfD0zh23Xe0OUeSfSw+vFMoPh6Lj3g
 o2K3H6vhA6tg5PgDdupzbTclK5oIqkZXW9PDZluqSiw/WvtWOiLYtR/w/akc6nTVmEUfuu3b+W2
 L4evmCApxSBtk2/FvRiX51/sYpz8pWaTnzUq3wZ05OxcCw0zijK1FwZJYSTqV/tqynSLnmNCwB3
 9fM3KZHDF76bQOGKk0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120085

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

The SCMI performance protocol manages I2C frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate..

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
V1->v2:
From kernel test robot:
- Initialized ret to "0" in resume/suspend callbacks.

Bjorn:
- Used seperate APIs for the resouces enable/disable.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 53 ++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 1c9356e13b97..72457b98f155 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -82,6 +82,10 @@ struct geni_i2c_desc {
 	char *icc_ddr;
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
+	int (*resources_init)(struct geni_se *se);
+	int (*set_rate)(struct geni_se *se, unsigned long freq);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
 };
 
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
@@ -203,8 +207,9 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
-static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
+static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 
@@ -217,6 +222,7 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
 	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
 	val |= itr->t_cycle_cnt;
 	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
+	return 0;
 }
 
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
@@ -908,7 +914,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		return ret;
 	}
 
-	qcom_geni_i2c_conf(gi2c);
+	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
+	if (ret)
+		return ret;
 
 	if (gi2c->gpi_mode)
 		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
@@ -1041,8 +1049,9 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
-static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
+static int geni_i2c_resources_init(struct geni_se *se)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	int ret;
 
 	ret = geni_se_resources_init(&gi2c->se);
@@ -1095,7 +1104,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 
-	ret = geni_i2c_resources_init(gi2c);
+	ret = gi2c->dev_data->resources_init(&gi2c->se);
 	if (ret)
 		return ret;
 
@@ -1154,15 +1163,17 @@ static void geni_i2c_shutdown(struct platform_device *pdev)
 
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
 
-	ret = geni_se_resources_deactivate(&gi2c->se);
-	if (ret) {
-		enable_irq(gi2c->irq);
-		return ret;
+	if (gi2c->dev_data->power_off) {
+		ret = gi2c->dev_data->power_off(&gi2c->se);
+		if (ret) {
+			enable_irq(gi2c->irq);
+			return ret;
+		}
 	}
 
 	gi2c->suspended = 1;
@@ -1171,12 +1182,14 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_se_resources_activate(&gi2c->se);
-	if (ret)
-		return ret;
+	if (gi2c->dev_data->power_on) {
+		ret = gi2c->dev_data->power_on(&gi2c->se);
+		if (ret)
+			return ret;
+	}
 
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
@@ -1215,6 +1228,10 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 
 static const struct geni_i2c_desc geni_i2c = {
 	.icc_ddr = "qup-memory",
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
 };
 
 static const struct geni_i2c_desc i2c_master_hub = {
@@ -1222,11 +1239,21 @@ static const struct geni_i2c_desc i2c_master_hub = {
 	.icc_ddr = NULL,
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
+
+static const struct geni_i2c_desc sa8255p_geni_i2c = {
+	.resources_init = geni_se_domain_attach,
+	.set_rate = geni_se_set_perf_opp,
 };
 
 static const struct of_device_id geni_i2c_dt_match[] = {
 	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
+	{ .compatible = "qcom,sa8255p-geni-i2c", .data = &sa8255p_geni_i2c },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
-- 
2.34.1


