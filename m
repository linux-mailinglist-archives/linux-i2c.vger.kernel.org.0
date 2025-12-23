Return-Path: <linux-i2c+bounces-14700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D22C4CD8C07
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D9AD3014D61
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525E234BA44;
	Tue, 23 Dec 2025 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAiODTnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MbD4ZykC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45837349B15
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484300; cv=none; b=U8R8EZO6/vlH78gJyeSMxhEzVJh7AFozl0TATHX58Th7ckOu0m7DqWHht6x5O2EhFmns+SXfPce4IdS4W6hSSU3qQfiBtJwDr2BovoeOg8xNlrn4Ouo5Shso7UxHVBWNoef/+8zaUwb+xBUnPMmhjdmT/9bMIf6Gps2oBi7aVX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484300; c=relaxed/simple;
	bh=Aessx24OljIFWC+mc2LsHK/66rMxd0lRq5JDSMHPZrs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xlm6bxj1x8sfs2xo0ah/2/++l/zxod5/VPDqFvcnMD1FAduyUxwYhyI74ONL0GVowHoYSVaPZjqls3iBPHLX2ZMUiFKlfjNUF001h5140hDjr1s318IWSLJ07skp+VEoIwNVlYNFfeCPAx1perkRDt8Aqg3iB09DCF/JUZgC1Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAiODTnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MbD4ZykC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN4LvTp1356377
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rpb4W73dFQhb2fFVWipjtD
	js1BBDNzb3ATpS6fi83mQ=; b=TAiODTnZbMj6PmIgx9AmPxt9azJHDmXkcd8QmU
	d2caYjG+9fRP3dpKbbCX/MqqOww+fHK8m4ygpbKLPRL+NQdtRHTDvANw+HiejMXZ
	+KZ0R2ENLChWcctaHwCkWZXCZHPNkiOEf6fxy8W/5G6ncv6HNjtGK81Sk21UeqEb
	uqeir517kr20DQfkuFHKJXaXVz5TqxqtqLxrQfyqOBgi0Jc4ZQbmGEwiCLGBawhn
	6yV7zTd3clbDt+xqTydTPh04zn3+IZOG4drvZZZ6Zyvxl0Dhxec1AtrfcLBupWgC
	0f+hb355KrFHSK76YEr+Bh1/X4sbZbtLvmUKUHT+Kt0j+Ysg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2sss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:04:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4ab58098eso105478991cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484296; x=1767089096; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rpb4W73dFQhb2fFVWipjtDjs1BBDNzb3ATpS6fi83mQ=;
        b=MbD4ZykCSYJ8V3vVyieD8BsNUm4G7Ng5F+ujqGDTtVdnOdlHai2+jsspfXmWEoT25b
         BgeIYxOHW4OCBzYlglXJVNt4oOjkalh8Gpsw8/VE1fRHvdhOp18Uu2xpdq/wpQeLv5uc
         /JAA8RZotAWBMFNWYPkVBtDEWO0l5nd3wTMjKFgaRZP/k7uo4/sPaF/t2WlWFETylBtU
         zFYRkPJjSlQtKoSvE4GvlLVC89UMJhabg44fKHc/JTIvvWxIZJDhkaxMgTrU8Z4o4bSo
         yA+yZSBohkgNWuH9Ru4wZRSmxh7tMoouPf8I+xni++tPRLdHq/0TQOK6AmRTjRl9VWuh
         fv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484296; x=1767089096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rpb4W73dFQhb2fFVWipjtDjs1BBDNzb3ATpS6fi83mQ=;
        b=l9mQVfbI1J5L5Sebt4LXxsU3vu0eh/e17IkXUZTXjKm4JvT341Xz5ZsmDMEBW76mwj
         vVE5j20qiFJMopORPCCQSQRLRi36qizB7NWt9Xh272Kj2iQqJIQyrNjN1JlztR8sqGmw
         gqO0luq/2QmOXIBqygPUR3DsIoBS6KvbBi5yhjc+1BMkvurjbujbo/Be+D1XOzEQ+AWs
         NNXvY7JkgDU3kHdpDiB3ET1Q3NR4HRVlv9UjGOv6mPCQFwVMJ/4MTTJdOdfFaT0YySsT
         LKQa2thmzWjywd3rsrNoUgtlG013PnJUNbnGOy2uPE7S8kji0TuatxBpDWOSGE/cAR3r
         nE4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVApvyUZ5xK5MoNnK/0jymzyASamclcpeEDjhXGgiGkIBVjXxcOJ3IQ1aXnrBjCticthHIVMKOj8Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrVOv3JeffcCtblM9JDJdMdbVTG5LYceB8FRYIikGndNH4/Dd
	BT+jVubqjldyWiBET6XxGRoi88Xb+u+rJvwKfEm3d5R9A9Ifp4FSuig5lF6us7YatO3dWQlseAx
	oLyolZ1FuSwDPzP7XJ0B86FKx9FRVojZ+wtEiR7H22iaqOWbLRo8EhAlE16wE1VqktZQTzLI=
X-Gm-Gg: AY/fxX5zOchTW2gxcnMWlBazKtD1UTOPos/Ug4NA0pap3WHyE92sOQD1bAVAZ3GPzlm
	eZ5mDweGds7Zbr5sG0i1aR/RYR1OHVntnzbQefUhten7hQeR68lNi1fxy6EtLWibQa/PO0q3zYo
	ROu3cZTRmDk5vHYt9mwcqr5EXCOMHIYAIK+BMNbdCLreDA4ntUi6zUbLEqLhSw6Rqp0UAZG+9Bp
	CVS7JRg4SjoM4809FLxMVeZ9e1mXBkZc9gEIL+qTrUe8mwhsOFAUmERomVTmt0y+6/KmpI6cLQc
	3Q1HwSJ3HkU1RSFkypdNL1qy42gJ2ZJAwdGkr5whTebbH4KVJuupCIWSGGYrWEmloNsXbbQY08c
	VSowhj5uxeju+C0JgAxhOIFL/L+JNg6lvBZ6tzj0=
X-Received: by 2002:ac8:5cd2:0:b0:4f1:83e4:6f55 with SMTP id d75a77b69052e-4f4abcd06f8mr204814891cf.16.1766484296269;
        Tue, 23 Dec 2025 02:04:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiNHKqDKCrFlscF1e8nxZ5lfR1gZCs8573oK/BJMiXsdrVSl2/AbVhz7yPs2GYVwiIg03KGQ==
X-Received: by 2002:ac8:5cd2:0:b0:4f1:83e4:6f55 with SMTP id d75a77b69052e-4f4abcd06f8mr204814511cf.16.1766484295661;
        Tue, 23 Dec 2025 02:04:55 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:04:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/12] i2c: configure parent device and OF node through the
 adapter struct
Date: Tue, 23 Dec 2025 11:04:38 +0100
Message-Id: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZpSmkC/x3MQQqAIBBA0avErBvIqSi7SrQwnWo2JgoRiHdPW
 r7F/xkSR+EES5Mh8iNJbl+h2gbsZfzJKK4aqKNREfUoZNE4E9Dxg/b2h5yoh643+6zUpEeoZYh
 8yPtf162UD/OF/y1lAAAA
X-Change-ID: 20251223-i2c-adap-dev-config-9403ab811795
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3406;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Aessx24OljIFWC+mc2LsHK/66rMxd0lRq5JDSMHPZrs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk6CFIKSo02FUVtncKxbJmpddSLBsdGwlGxk
 3xgKHq5LdWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppOgAKCRAFnS7L/zaE
 w9lvEAC6IPKCIFxQKEcT0e9etvsanf7pMOhUQltvitPug6OEIG0KYMeK/K84tQWkYK1rDNEM9+S
 VInnmCouxiX6wvyRpsmIWYdoTH3Hx0NwbMAtenLaYgj1HOqPC/2T4EfL2fhIHFks+HcwQJQtX/U
 6IJHl2gOPKIqt/Nsdy7uhRu+dsZtrmTox0QcIWDnQ2u1AJHSOPrUWAP2bziaEPzvN7wMFnmMI0L
 yWjqOuw6piX/7Jv7xgdIphnmGvtOjVJY8CN7EzZPssJk52TGwSu4jbPZ+oh+VVPDc5ednw2LJcG
 GbY06fhDBfb2tk7U5drjc/kU27DZ7CjOZoBeGXE3FMBPIKQBarOf+PxOssqRC6+0y+CfpBs/DWW
 rk1QSObI9tMRBTzeqAMF8jCp6dqEm7lHH21J+CnG3Ed1AFcnI9zYtDqbK4FKGKA2z6wgf0gwQbZ
 48KFlz+jGZHxm7KimHiLcfu5XZqlSW0GKFLwH++KbYffIP0VH8DrDBU4X42xbIZr/WaBfen+HLG
 tgpottRsMj2BslGnnqPwbYb70GrH0NM1WEm1Afevt9odAaChxpRNm0sHJHpnE7mukt8NUqfWiVO
 19KRrejHoawa94lLIdae41mcZ60Yr/TOm8q9qNfStSjmOFamByZqVSisccC+ixsP/EnQD1TXsYA
 hicHpNR/3lUOyWA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: mSsO4aoRAKN4LyQLcIjo9I36kgNiQVeB
X-Proofpoint-ORIG-GUID: mSsO4aoRAKN4LyQLcIjo9I36kgNiQVeB
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a6949 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_sFN2lLQU9JdPEgOWvQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX9/bGX2PgzoHP
 YwQcnuxBZmHMd5oYtZI2N+qvebix6cRjiFa1g0o0dM/B1d3eOm5Jk6Un6MNipR+pVV+Ui90mU4K
 IoO+1yP8mn32wNV4dKwqMT4kMoxGaSa7eI1baZ7BdoitdfXza0rR4bsdWPIUFQoHFtBklNuQeOJ
 SBp9D0u88j0tVAr77rMjtNkEK5RM8sVrVQX3+lymvuk5t12hB0urBrC/sbpY0m2o1roEWHSI8Wo
 i1xPaERCn1G2CKZRhdbGmreiFNsaIAarEP7ROaxoCNwTeyfqFlv8Xr0a9zccnaCzOmW3yyVbtAy
 23jhMwvqG+x+6qy/3yxEjqyPdzqvoPK94kxQsudvzg+PPLnrAzv7AmB+pr92wZspeLrzprA8HPf
 RAtDXvoD7qdeGxcrdfU2ykviWQJ4feCjrKwM9P827G5jE611784wyiG0p/Wf4glP27mhMdLqQdJ
 iSpXwSwKH2JOmN1xAwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

It's been another year of discussing the object life-time problems at
conferences. I2C is one of the offenders and its problems are more
complex than those of some other subsystems. It seems the revocable[1]
API may make its way into the kernel this year but even with it in
place, I2C won't be able to use it as there's currently nothing to
*revoke*. The struct device is embedded within the i2c_adapter struct
whose lifetime is tied to the provider device being bound to its driver.

Fixing this won't be fast and easy but nothing's going to happen if we
don't start chipping away at it. The ultimate goal in order to be able
to use an SRCU-based solution (revocable or otherwise) is to convert the
embedded struct device in struct i2c_adapter into an __rcu pointer that
can be *revoked*. To that end we need to hide all dereferences of
adap->dev in drivers.

This series addresses the usage of adap->dev in probe() callbacks where
drivers assign the parent device address and the associated OF-node
directly to the struct device embedded in i2c_adapter. We extend the
latter struct to accept the parent struct device and of_node directly
and make it assign it to its internal struct device inside
i2c_register_adapter(). For now just 12 patches but I'll keep on doing it
if these get accepted. Once these get upstream for v6.20/7.0, we'll be
able to also start converting i2c drivers outside of drivers/i2c/.

[1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (12):
      i2c: allow setting the parent device and OF node through the adapter struct
      i2c: qcom-geni: set device parent and of_node through the adapter struct
      i2c: bcm-kona: set device parent and of_node through the adapter struct
      i2c: keba: set device parent and of_node through the adapter struct
      i2c: omap: set device parent and of_node through the adapter struct
      i2c: rcar: set device parent and of_node through the adapter struct
      i2c: st: set device parent and of_node through the adapter struct
      i2c: mxs: set device parent and of_node through the adapter struct
      i2c: highlander: set device parent and of_node through the adapter struct
      i2c: gpio: set device parent and of_node through the adapter struct
      i2c: nomadik: set device parent and of_node through the adapter struct
      i2c: bcm2835: set device parent and of_node through the adapter struct

 drivers/i2c/busses/i2c-bcm-kona.c   | 4 ++--
 drivers/i2c/busses/i2c-bcm2835.c    | 4 ++--
 drivers/i2c/busses/i2c-gpio.c       | 2 +-
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 drivers/i2c/busses/i2c-keba.c       | 2 +-
 drivers/i2c/busses/i2c-mxs.c        | 4 ++--
 drivers/i2c/busses/i2c-nomadik.c    | 4 ++--
 drivers/i2c/busses/i2c-omap.c       | 4 ++--
 drivers/i2c/busses/i2c-qcom-geni.c  | 4 ++--
 drivers/i2c/busses/i2c-rcar.c       | 4 ++--
 drivers/i2c/busses/i2c-st.c         | 4 ++--
 drivers/i2c/i2c-core-base.c         | 5 +++++
 include/linux/i2c.h                 | 4 ++++
 13 files changed, 28 insertions(+), 19 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-i2c-adap-dev-config-9403ab811795

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


