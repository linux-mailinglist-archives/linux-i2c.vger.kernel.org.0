Return-Path: <linux-i2c+bounces-14292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A483DC8B6D2
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 19:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2CAA5358DDF
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 18:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B24313534;
	Wed, 26 Nov 2025 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwtoBXyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxtorLYm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883313126C3
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 18:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181391; cv=none; b=h4lixA220hEx5qrwhBAsdmVpEoMyrnaQCzPcp7MVmD3d2DTJJH+jWq6cM4+A3JVQMxOJTTvLqmTXgGocmM+bhkCSao09xDS3mxGhoSAAwm8mHeJtinSPJmqQkeXmF/yWzx3a5+ZKbmEL257ao2Nz3B61h8QQGIoqwsY8ADU049E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181391; c=relaxed/simple;
	bh=/22vU4YyhoreGSVE+8dNtnPv0bjJh/n7NQdBBkBHaLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWtECy31A7s4+/m9KvMBPI2xtOIdeRLuXZ3dmPJYUSbeg+ZXydnGeEpyA5St83henYaXrjDUET0C/0OFEQ1QrwvXZCKOpwotVrme+qZa+f6XDNrDcNz+C7W6/eZ73SLA1xBoQH9dQmbhKNuvlWDsVfCGoFhlPOPoNbGvK5VpF6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwtoBXyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxtorLYm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQEiP8v3890136
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 18:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l0+YTwJt14x
	VeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=; b=EwtoBXyIL3bBO5AhGzHoP87LeF1
	AgTsfLEU4ja/LlNrZ0vEkz0wC1aRYjqnHliVP1hp2RdkRzs+oEabu5ryiSAMsKGc
	CnoEYC+squlLbOck6iOSv59abeIo//8FsXXeryl+10as/CMJnv68G0bJHyksXR2X
	lSpTuMyXL7I/wJTpJSeRhoDcVwjsLD6Dp+Ag2GiLUPVjV2bwIe4f6UHv5PqYFr0H
	eBdPj6jKQU18b4Y1ojzWbiTt/a7m5YeqWsO/Iw4/N86wB2OE7H23rNvyQYMgFcR6
	6DKpxSnw4x+2hHKjeow7/4eH4NqvuNcvJMX1PeDyBktmvl4PL4iNqj+8vZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angmebswd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 18:23:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b245c49d0cso3829285a.3
        for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 10:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181388; x=1764786188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0+YTwJt14xVeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=;
        b=FxtorLYmJeHJUZtk6sBAUw4C2kph4VE1s1FgJrlH9ogZWJHqVMlEllbHnyuFEETwqn
         7ZfS4U0Utsv2LUA01c0E5wCl0fUvDTBCFuFAkGClzfPGsGZB5yb7+z/R/ewgR3L4tMRR
         6u/Q4mXt8/k5MfHkG73yXxiZ3VwHsatGxfUSHWJalYJRlOasJzCsR249yuTPUWIVUhp8
         qFg9MNBXFMSVRI5g+ev/rJDpBJ30q4IMKufv1kgacqbKiI+wSbURMLVCP5IwgQwo/25V
         AztSLOVtyl228uls3Q1vOqDx616BJ1lAAah3gTUgd5YPpcH+nm7w6GhlDxOwevrUkXjv
         O99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181388; x=1764786188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0+YTwJt14xVeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=;
        b=OAmVS/VYYgJUSlFF7f9JhpLPgNaS/2OBxcOQq2WTvsstSfpx23EXf4/CVcXBWzwNvn
         LE8jLJOUlirWTKyAWLjdJrBjH5dei/879I1Qq9j1UOvFInQ4Yqr5i87CMQCO1xWiDHcl
         G8UXqGtnBoROoX9dhVzfcxbcTCGEvvSzcl12Y1yUbK3pF2q+sPNwvTuSSQLA73wJymxA
         MEA1+48ZNbhh8RGL3twUdw7Wu6oW2LIbxk3OpcygYNLi3KXOONjhvHL4nrmZabxGgu4x
         ZKdgI7Xc8iF8AheWFjwYaOd/PvTyILPhjdTbJJVVLt1p7s5fe706Nef+VovVErbhcksj
         oBMw==
X-Forwarded-Encrypted: i=1; AJvYcCV3AZ5/E40xJgZW5VuycbZ1X8CzKV5jDyvHcN3AqsDKUa0Kw5zOKxjEptqa8f0j1eUL27DMRxF1CBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFrGGkdxgYJjGyq5/CHsTzc+3JTrOoLP4emd3zjGnDs+NFpJQD
	W4hTgBw9b7WIwkAkUdnYiiECsvXDCXTPbk4REE9cR7F8JAEtSnK6HFHh3apjTI77b56TrHzWgqJ
	JYae8oQHZqYbJtissZjx6nvkFIKOtuaNQdcweUnJJrUJ0DTaACXY37kGv9YiEydg=
X-Gm-Gg: ASbGnctWNbC4lDp+KLlTsOTCQgKsVlq2KE1P6ZN5L+g4udiIiDa6MHWGa3yKu9m7lBr
	twLgQppWLJuV/Hqo0VTMP2bUvnK6WlRHCH+Hp22pkBclQX++6qcO8p9mkidfNLojNme2AoC8uYR
	5HeMkTvsR1dOa8PnGLqzlio2YfxAGxgVCjDFEFU6zNFOhh/6AWnFAgxkXwBFzV8kKXLRpFAxUnj
	FPkRd8zhs1rCfcMKhVnaSjjMDrE3V+wecidxSEWGSiSOxkQqZUQx7U8+IZDdlU3d9RbDgq4bK9f
	z+ULkCIzyC+f/+CB4s/OxnR2+vLl8ZDU6z0OF11nyciDV435DEZEoE8ZSPunm3/peGoHl6wBlkL
	l4pqh4rAib6FhgYcqiFu5YNSFBkGz
X-Received: by 2002:a05:620a:3184:b0:8b2:f892:9136 with SMTP id af79cd13be357-8b33d469055mr2792629485a.42.1764181387702;
        Wed, 26 Nov 2025 10:23:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2mLxW/D2Z12EY0+agf2CZ+NW9zLRlloli4DWeMWWCw7bKngIVu3ZKUo7gwIs2SgNmvD00Wg==
X-Received: by 2002:a05:620a:3184:b0:8b2:f892:9136 with SMTP id af79cd13be357-8b33d469055mr2792623585a.42.1764181387148;
        Wed, 26 Nov 2025 10:23:07 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm61078295e9.4.2025.11.26.10.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:23:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 26 Nov 2025 19:23:00 +0100
Message-ID: <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=6927458c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbJ2VWT2XajEZlGPt78A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MCBTYWx0ZWRfX+p0IkB9GRCzu
 +AwPnUFHPS1ztV2swI13+m2T7zUtLGFo02SBHld7wubDJXY6+ysHpsehUuB9kRW4QEdPkqq1GMZ
 femsXFSVKq8hHvsEl9PqY4NdC+od2i9KPc9nwybTjJB2/cg438domLZhOB6BG9XMXR4bgiDW2zA
 PJGRev3ZToGi01PNOiMNUo+z4pytv8Hw/3uDIinYIGDUmCBg0kado5w8IFiDPdsHJ5+B53CQSAU
 38SfP5VWvGWmiu5JJKwGK2wlAJtzCYoVocBt7onfbemKeSNxL+UmvPYdhsK27YWMvxsX0ifEaFh
 Yo2OUbgW6zTEk4QsLY3em9KWnzHw9zQEjt7Ofib9aXmSX+UziVgR5EcW5Jlz5Q+mZHcr4z6Z4D1
 IavBLNstK3yb6ntZQEHJgpBa6E3RFQ==
X-Proofpoint-GUID: f5CrNfHlxjeH_RXBQ1LLJ293BUCT715m
X-Proofpoint-ORIG-GUID: f5CrNfHlxjeH_RXBQ1LLJ293BUCT715m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260150

'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  i2c-rcar.c:1144:18: error: cast to smaller integer type 'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard since that time, so assume
the warning will stay and we want to have warnings-free builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index d51884ab99f4..5ce8f8e4856f 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->io))
 		return PTR_ERR(priv->io);
 
-	priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
+	priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
 	init_waitqueue_head(&priv->wait);
 
 	adap = &priv->adap;
-- 
2.48.1


