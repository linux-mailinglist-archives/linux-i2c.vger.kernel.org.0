Return-Path: <linux-i2c+bounces-14707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B56D6CD8E1A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D70B30AAC92
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846FF34FF68;
	Tue, 23 Dec 2025 10:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAS4G2Q7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MycQdT+6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D8934EF1E
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484315; cv=none; b=iBg1OuZbjlMhhph+BVVjIFmZoFYEq26/igmPTLfCOWorn9ZzxGeR0Ok7Jy87VWXKwdojD2/f30z2OroCSPkLWBDs99lIJONM4R/Td0U9CQh/l3QLmy5XnRG8NQ/ia1bPn7nlJ0wnOQ21bfyCn/79OSBGZi58rn+S/qgGU1Hxk0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484315; c=relaxed/simple;
	bh=4VTHCgrPHZIkSmUOibk7Y1K7i7wyCTns8fIiAuDUmjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H72SL5lvjRv5IbCPQoebDHNlIJFQFNzlLPIUHMOjw8XwUJYrVIc0LJEEjcH8nTD/TEq0HoG/NmyPawalWeXp/oapRVca/7mwDKiqzqG9+R2sqXd6WsoX6iF36q0J4iBDU9pOw6cgE5lcQ+rteRFO0pST/yxIQeV11+fjObv39hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAS4G2Q7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MycQdT+6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN4B1eU1358168
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VESHsWfPvaoi4+tiqe+hxrug8kTFVaKspteSAbY4EtE=; b=QAS4G2Q7io445Ezh
	nAZ9Psw1yyqhWxNa/qHtPQXie7kitVAgyT+CqzSeeZd0iOkz1aOxuiT8VbTsFBHI
	CQUPFX5anQIUR9+ZSGpxbhRBiKCgBsM9fOBLFCJiBdJ6u3vMjSHCPlpJuqnTu9Y0
	8F+M7oUx/otBmTR14/BeueEo1srl2syW+BYtooSexJ7gYvdKlZ8ZEYMOJjsvk4w/
	t4+lvmcV6zcYiH4hvBANGvjrNxCmzEV+Mo/MQYQFwxetHvOZBkNbDd9hcRYsH8SE
	0p5xIzc1vueS+ubQwjsLfGbCQTsKjbnfc3CsWqGTQlWtWXDI0NUHhfa5a7HOrm+2
	LMWJQA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2sub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed74e6c468so69442621cf.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484311; x=1767089111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VESHsWfPvaoi4+tiqe+hxrug8kTFVaKspteSAbY4EtE=;
        b=MycQdT+6ni3GuqlLgSpTQIB2wv1KkM7IDFoxxxpwgCAI2DgwU2X05cuMyKFmGvX57w
         LOixs/CIjwX6mK8VVH29py5JRTya0JUnJZc7PJo5Lc35Cdcxqd9cw+LG5Teb3RpuqlED
         Mh3p3QP4U9SQb/y0AJz04ALvaBje4y1nxzmJveVFKAq2BkHWZ/LTyUGN/ofwDAD2+Jac
         L9qyi7HLPCsBJDUztSVYwZT3WOu15gOIUVsuZvVHVruRoTa0msLz5ZJV9JzGrvBeRcvk
         7PD1kzUhCoLYCn7byycsH6HBf5a/ohf/1OPX1oHtnIZqtSPyoIvPUcDLF5E7e/1vMlnF
         fDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484311; x=1767089111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VESHsWfPvaoi4+tiqe+hxrug8kTFVaKspteSAbY4EtE=;
        b=K341XVUrAWNsS53/T2RaUnIs5tFyBSAufxVTxGe33yOQoOJo0yKFdCSsHE8/HRRN2V
         SRVNpN/P1Xq/slCye/dv5X5ZMlsOjz+MJVGSL7za0g3BJvowiXkGehX6Orwh7HqWcZgf
         DpJDXMxx4IRRiaj5yKhkna1A6EyJnN5V1pEXBqKPhOFfeltsPfQ48MXDaeUUvdKY+jq3
         xnGJYw1EaSlrn7cOnKBQ7FoDvbKVNoyGq0RHkhnEk9XR8BaxodU2fILrTwp3KnRm5Ke6
         m/dPM1I24GBVfHqJ4lAS7HCW/vOeY67p4P77/vLDkNeWGpdasBmdu8uRNPqPVGlYW7R4
         I/pA==
X-Forwarded-Encrypted: i=1; AJvYcCWGoTSkxnwnyS1ci0kfaALmsLs8cWO5ag+LKAxJnpU9vEqCnrKGRlzcsysTK2+llU5Aq7ZIXG6uwuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhd50EOQIE9C2oSdr4BXXPtOH1E3OF5GW/tsgk4P2rf8pec5f3
	ZxJesnvq1DSq9vYEhLuWyNDssCB6B5Zso5xB9kmq2Gdt4fKm9PMaNEm7EL0KaMbB+HgCJ5X8Bqq
	Sz8yy1/M+j2eU2UlbFxhYDWg9dPJSYyFsdcACnUsrXpv+swrlcBT7zBLh9s3oIvA=
X-Gm-Gg: AY/fxX6qrm1peovTKfyQPqY65PrGhDQJLlttRmz0IFXPwdBGuihmo0sKhiY1qL2K/SF
	Y3a8FdtK0auYC9MxxgNNeDgmay+6QsxCfYdaHcn6p/rKJsutM6IsaIUg7DV89vrNcXzfDvSE+vP
	rSaIfWxURnrZj8m4HsLck9yuQwG6zS9tXVJ1nDHrbIAhvOPlfUa9mQ4ECh7QAhLq0bjlsxESj9Z
	ftxd22soxcV5hQCrKI6JsxSQXxg/lQ5PwfKqf7kz+1w+dOYtDAIxAE5UHixhA18UNEPJbSGOq66
	RTt1dkzQCPczemdiGo1tmCbmBYCLuqwpe/VUUBMnclV4WUPpAqngCONgMM9xjCaK1FJsmroumWu
	bc/f1cEosDG3apkqTomJLg6mctw+69g6NW6aQh/s=
X-Received: by 2002:ac8:5f84:0:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f4abca9abemr221784551cf.1.1766484311435;
        Tue, 23 Dec 2025 02:05:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1Q9GcA/8ICDBh3b32h+BDN0dPrIAIb45m474a1bZscaPBYkROzgBv0H89r6pe1f5PLFubmA==
X-Received: by 2002:ac8:5f84:0:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f4abca9abemr221783931cf.1.1766484310894;
        Tue, 23 Dec 2025 02:05:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:45 +0100
Subject: [PATCH 07/12] i2c: st: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-7-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4VTHCgrPHZIkSmUOibk7Y1K7i7wyCTns8fIiAuDUmjA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlCfBDo9ayd5xJjNDefHMY+MeprfqWaGSes7
 X/ntmYV6uWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQgAKCRAFnS7L/zaE
 wyySD/91tRc6qmcix1iUN41NkqvYaKWNZg7twzSemJ9R2CAbmtrAUoDnzD1pUdkhNQsAGQjwWFH
 7KmtVJYSWxgYWGsbmV/SCfiIUJRRjJoE0n7r3qa3R4HQBgZxAs3MPaVfs9aRMv4Bl26cnJe7Hh5
 BntwjvHXdv9BwUYUD76Fg4QDnT8OSycLzHHH9IHBSM2x5UUQpfTSy/yEvhUkU/SrdLisOk05l1j
 pyAuS4c10z/zMyo/Auo3Q2ovGAIXnSKI6YNh3helH7rDqCxVzTw/UX7j50/g//wpUcBu0gc606c
 LVaZgCpeTQQhRFD+i/haihsQWmCrIODQ3ashDc9sGKyKPWD49M6AsEEtsuasqO1Rx0SVKM1WwEz
 WYHanibvULvtfiGMUIQLziMHX0YFWvBAJlzcb4xpNuKHgAepDUzpimIicEhTJ9/EdFG3EDrpj3m
 MZ4jeedoXkvHYeM47k0xKoblIU9VoT9bdaENYwTDEfm+2tQz91bdN1HtmzAHTIjLmt/NaoBCyVH
 s0XXPQiJIewHbvOSWHPsc3EzJdUeTsDyPVQvzuAzADKipCiTgUxT2k7Mxzq7PNgIIQYwKXukpDG
 Ji7S4tEPwKd82IgVyMgNEg6g4ekYQlegH+ITIJxMIrqOfBl3UV7CpFZQL1AHCGCKQO1TOR08/eC
 q7hOFISKYAicpzg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: J6XWaFPjYijB7a5UFcnpkXoL1QYlximu
X-Proofpoint-ORIG-GUID: J6XWaFPjYijB7a5UFcnpkXoL1QYlximu
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a6958 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5jvZOilLG3lo3iFWl1UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX8d8MzyLX4RWC
 zb5t8nSzlWI4TkcKKURe5rLBPkfncbE2oQfUpIUjgyErFCeLt0fCf/O1s615KbUmfzA5uuq7Qh3
 3flIDzSW/R5nGFa45WAb1kqXMJdLkQpnBCTXbHp5iJYQIe7pODdwUmHIBetsXG6utQg9Pg4QlOT
 8pRtvL76eT6ukM6pwUFTOpcVdupShLHZaHJCXvqJm05Ci5NZVOKvw+ZUWa5htTIzfGX5242foy7
 nZJd18iy0z/7vxOEdIyhytLW/42xuPlKDyGCMGruNMB2ncJUZiEc4nlFw2nraRAoQE9spzl6kDn
 w6bejVoNvwWBSnIYzFSKZ54UtFWKHCl/GALs7KL3xiHtgHwuFfhk+xQ9NcRW9JJRU9Ixd2JFUfg
 5s9fxkScisdpIkTm82P03OPjGaGUDac+KNa9b7cVEIXqaco38Olqb8inEfTjaKl1ZZr2C5y1dCD
 7+biOKnQQwrRlueVkHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 97d70e66722706f242cd97153387c3a865abc12d..b50be2c39eaa4b9b95a71b038a4d63f3c5fd7c4b 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -849,8 +849,8 @@ static int st_i2c_probe(struct platform_device *pdev)
 	adap->retries = 0;
 	adap->algo = &st_i2c_algo;
 	adap->bus_recovery_info = &st_i2c_recovery_info;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 
 	init_completion(&i2c_dev->complete);
 

-- 
2.47.3


