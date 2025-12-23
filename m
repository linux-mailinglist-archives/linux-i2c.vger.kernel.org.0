Return-Path: <linux-i2c+bounces-14716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42244CD8E38
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BD773051169
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804D2358D22;
	Tue, 23 Dec 2025 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmfjvagH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pq9TeL0l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87093587D9
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484430; cv=none; b=WKunLwkHVKrCNzFN/prRCGGCWJxK7My6k4ftUaMjW2xF6v+9HckVVOsPB6GEN1VFyvj9p0ApMwsrwEYW/4cVNC9/xCC2RxrDWBFXZdrJJRC/jPacccH+DlykXBLdpHfrFtXCzkN7lu1ZG195fLDInKlh9IaR3jd9E4KVC2OmeYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484430; c=relaxed/simple;
	bh=MXhKnmYAiCvsuHLW8uRD+raE6SYzZ05Q0Izy7qd7yUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pyw8e1x1pR1nX3zBumLO9PGNu4c23z2NuDcGU+f6BoRTCI5XZViN9TUcMYPW8Exfjf0ZUjBf5SQ9jIwljvnfLUzUDTPGHJhbMqgaehPHYrslA6DPGuSmW/y0xR5VPN+bekHTY324YCCJJBw9a64nLDxaDZLCbCUxVLais/YN6TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmfjvagH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pq9TeL0l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8goFX2748768
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wl0AuLD7oORJsUH4v6rgWGWjZkPezvXCPomSNNi6BE8=; b=VmfjvagHBMioJn7X
	VGfabUkaPOnXSJfpoXeBGuBdvupo6ghFKo+mTAoSmTAgjLRiK8E9hwPBTYv7hyGg
	jEygjb6NTYyT1ee9Hyp77KCQ6Xa4rGIRHxV5H9EMajC2QMu35QMN1NUfffQHujK6
	+qJnE8NRT8SnPIdB+FIIT24YB0QYMrB2JsdB+iO6vZDKb6VwGuKRdi2NUgOCXl+j
	gQwZvfWzME6RxbUz64yufr6BXCl0miyGubvHob3WxeQsIcgZp78zN3ogoZGOo60Q
	MDc5nj8XtktnW73OPxMDkR7eELqyD7G6EpHoIxvr1Q3zd0SqiXMCQqWli0qhX5Kd
	Zg98qA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5csnqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed79dd4a47so103712701cf.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484426; x=1767089226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wl0AuLD7oORJsUH4v6rgWGWjZkPezvXCPomSNNi6BE8=;
        b=Pq9TeL0lsGkLijcL/aPpCKUJl/vAJf6wsdW0Ithniygv6pp9/2j202SQ/n3iHvc/qJ
         tpzR5hI/ENARzlcyzHKcMqTSQ+baHeaoI9BBIjhzHD75P/m2rXV3UGMNHdvYNhhJuU+h
         qx6Z3aUt9a/0TKxsFUJTdgEDMpnPjyiI02ShOoJv3I/UsI3Sa4iKG7utB+L4GwTZL/0W
         IHO9vKEEV+LQJFlY49bbm4R2ms9pA8WhfFtblXuMoU2g3G6GaHNQr+NvH2pnpbqZEk01
         2+NT3+gswqgHpzzW8RmO3GLEXfUXRZWF7LBX4FFT0dWivgJC5lDl/CEuGy+k+S3hQw95
         4hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484426; x=1767089226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wl0AuLD7oORJsUH4v6rgWGWjZkPezvXCPomSNNi6BE8=;
        b=FthgDwm920kx3pStP8QfDHCWoKA8ublO9crwhZkXnei0/ZPHAOMV5uPj4Y2CHTkRlG
         RaeAGFCSj0w7u43rtfVrQwM2VY5CoW1VtweT3Oli4nOF8cvpigXySzmzp3kqDu77Osnn
         y4N/OViGHMGxURjJNuu+y6d+kXYfrwd4W9D+4CiHxHSVCgWjAhAMIKA23xcxSDtPlgX7
         zaFFNl4zyM12W3kXfzpDHB8UpjNhnrW4tbMznh7mALyfKxQJX3MFKM84yjrGxmjLwQov
         6VXJ9d+WrabzBBJQJPninmVQP57wBmbKTpGd4z5CInC+kZ9TGRrcxuom4XBByaOhf02D
         Gdxw==
X-Forwarded-Encrypted: i=1; AJvYcCWXxoK2zp/WTN9poSphMsgL826clY63erHAbYYIVcrJ79pM3uaxcPj95AN2udQRlxxO316hiNzSuJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdUMjjHCdf+aSV2y+oyl+8t6EU41DaalcrSEa+Q8hXmYR0ws/h
	dyaO6h4h2K1QsnMihu5BiV8djUM9/ofFiA+uTXrUeljnV4QamTbkI9TQiwXT7tKXosB2TGF5LUf
	XWhbkGfd5TsOUEhzeNZAAsGhq26GXAJ+XGbJmoGRymTh79LmwlFfxkKwOq+4kfpwmJ16njJ8=
X-Gm-Gg: AY/fxX7AqnLqiKeRtDCxhACVnw6Hi5f+y1R+TAM+HfFB+xqw28h73iwUgLburCbUxYS
	5vuR6kN6vy5f0kj5bRYCrTuH7+IIv/wTORe8O4XbeKMnETptJzqUTfyeuYLaOS5rFsFwfQyQvao
	rCSx/rT4tntwkHJMtSB/RT+36vLrakqduLb1i6nLFmQE543fXz/D842FY+brjhdGXUCqA8G5eVb
	dmRyICeKi/hsasQAYXVIrRdFPt5PZjSjstRSS0TKGFODrsFiFloi4CXSx6IKVKTWaJRLDElTvXA
	crd/sjRdgD9l8DPR3P+ndmIZ6RAC285SnHGw7HzyxcwbY/WU7N2EirJNzm1a6YjJXUUNgn+A9lZ
	txbi4uV2HVu8pb3oZxnsrYiIbBPWwPe+5RbiS5W0=
X-Received: by 2002:ac8:5795:0:b0:4e8:af8a:f951 with SMTP id d75a77b69052e-4f4abdd1c29mr220029671cf.83.1766484425902;
        Tue, 23 Dec 2025 02:07:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHszADskhOfq0QtATctRA+KYIcOIVgBtb1LHaHxyBkygUnrxiT7JjznSLYQLuEBaRzOGRWX9g==
X-Received: by 2002:ac8:5795:0:b0:4e8:af8a:f951 with SMTP id d75a77b69052e-4f4abdd1c29mr220029401cf.83.1766484425492;
        Tue, 23 Dec 2025 02:07:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm339882745e9.1.2025.12.23.02.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:07:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:06:50 +0100
Subject: [PATCH 3/7] i2c: gpio: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-ada-dev-set-node-v1-3-2e36e0e785b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=892;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MXhKnmYAiCvsuHLW8uRD+raE6SYzZ05Q0Izy7qd7yUM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmm+uuI1igeS/XehZQhmVHsA4yYwQB6b9gpt/
 WegW8Ijj2OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppvgAKCRAFnS7L/zaE
 w0oZEACvsojrhNzH7Ui4KC0AOLmfLHtGRx9KDOAmilA2L5S6myvAIVEYEtRizBWWnWb1hsDOLAq
 5qQVa+uNvWe1T544jJPHih3yNRda++7j/6Fs9shesgKC+x1R9NaJpstbwNYF/j9fRS8E7yDiNfo
 VVtSr7Y+/GsfQ3YNiQJy4ZOZcL9X8AEvxAGsf22zYuS+W6o0B208240spXOgjU8gZtUp/tkSuMU
 Sq8MZ8qEOk/w8pkRmx2T8F2cZvYRQEj3NKNfO9yoNCUu6v1GpQZSmPY6MdC8WU863QDTJjhP3al
 eOUeq2iQd+z1qCqeWnALeb+tdSNbMAlpzdf/tJXQnNQaR2ce7XzRz6G9ubQlto7yLdwpUwQSMAn
 APjlSh2j6wOva2WstzcDvn4D+1Z+CYOUOaOU0rwxgEDTrTlE4fTzceD7pY+OqhoQHduDfiTuZ7f
 1ksEhzHAy2V5DmgIJAC8fhpcdvCcvcFg4dWOL+pJa2A3x4r+2al/8UAJ/nfBLJt7bvFBYSurNha
 0mmVQsUweippbuGQVHmrp1uC3+EUEyL9wibcm5DtHos48PvQIuYKOBt43fywx2PqqC1j+2lxoHb
 NuWWQWTuuowDGucoiJqqejyjTox1D3l9qtC84aP2M3pNKLisyG3U6PG2tj4VH5KNfGcdnrXGcfm
 b7PoTxGhu5ltmfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXwGqhpRq3QrpL
 rIjLoappBU69+QrEVFp7Gli23zLVFlK9+Jh2rPlWA83riXfg+3696fuewm7KBjSMZ8k3vKy5+9f
 1EB6pic8cb2+8+QTcRzJ/kzldQ3IPboPnHbuTfTP4ybskfSc9Ap9URcN46I7NSnMuuIkBLvAhgw
 M/kyKuzJKhWg5Pgod4qmBFHWMjsDU69+rZwx6VN8CpPxeDdCG+h0drNN9/l3lJ2AfX6iYQ8iSk/
 rg+s4VjS/ecqvZ+GGjHSu8OYpLKh5lo2oE66w466vnUZ2kwTdlG17lNZvIFKn3JytVpyLQkfnKC
 XgrJZg9EfCtZP+/+zBIms3ZAjcVf6K/wKqz8WeH0tFesXqWBYmfjWSW6woTVEZkoY9KCn3msyPN
 7TGps6shr3MdQvcJloetyxKkN9zRwisd7L8dYFlzsO3RGzG/F5oO534aGrDCkplLkBrM5B6LZQS
 wqqRM/czzxVhSScf7xA==
X-Proofpoint-ORIG-GUID: YE8D17VFAzmeB2cBK3Jc0IDSpgrCFCNi
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694a69cb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=af0GH-rlsbmSA8_z1gsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: YE8D17VFAzmeB2cBK3Jc0IDSpgrCFCNi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf15c402e71096ccbb99f5a35bb479..4984736969e1bf2d11620772214cb13ceb411b6a 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -426,7 +426,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	adap->algo_data = bit_data;
 	adap->class = I2C_CLASS_HWMON;
 	adap->dev.parent = dev;
-	device_set_node(&adap->dev, fwnode);
+	i2c_adapter_set_node(adap, fwnode);
 
 	adap->nr = pdev->id;
 	ret = i2c_bit_add_numbered_bus(adap);

-- 
2.47.3


