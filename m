Return-Path: <linux-i2c+bounces-14464-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DCACAA07A
	for <lists+linux-i2c@lfdr.de>; Sat, 06 Dec 2025 05:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 458E230D69D0
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Dec 2025 04:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152921DD9AD;
	Sat,  6 Dec 2025 04:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NKSNEV2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAzcGU0m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9771487F6
	for <linux-i2c@vger.kernel.org>; Sat,  6 Dec 2025 04:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764994386; cv=none; b=L8g9SClya/ImMywJEyns4Ges/2csw+au7lkoaX7PA1sSwRaGUPe3tDEF8ghCGSgJ7G88Ai3kkHILGUGE+Ahf2oT+wijsuD6v1RJ4qKkWvoO28NMjHxqZxpabhe4lhBo7NAwIghQTj5PG+Q2r/Sj1aevLgqXpniBLwli+hk6MFuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764994386; c=relaxed/simple;
	bh=CI9OQmR6bO6fBvEL7pAivSNsXX1RDFYeu9p0jLmq0BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4o6ndI3HQNvE38W2n5zFlJGhRmwuAVMOvxrfu7c/QN7hjkNQE5fJWos87mYpdXD3T695gj/vIkDBK66joUGc06U1TRA8vQIqx9wlFDBQspMuS0F5q+zmfcdM4APHdXsRZj8bXJ6FGNOCFPz8si3osk+67oQhAq3NZz0EitlAMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NKSNEV2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAzcGU0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B62q96W2696639
	for <linux-i2c@vger.kernel.org>; Sat, 6 Dec 2025 04:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tpDwo3AVFEqyo8uW2zQ2fAN5
	CJka0mLD3vVFUxIz6Og=; b=NKSNEV2sPW/NLZtegux03RPcUB7WqOXPXJwnqVh6
	NTx5LrFkEIpN1fpObwbVlyv8atVfIccyswvVv/fFmDUxBHWVw41P77kHAnmDgjc5
	U58G+ymvzAcY7oft2+LqPIBcbs6ktwmgTKLxZ+q3IQ7hqZobOrLMDxAHYusmzPFM
	r4Irb+SP5FSnF/rIJgOW52hv3hMpXlPAYDZX6ZDJDvmuLCM8aAYuT8ddzXrjGgDO
	akKPhIPpRM0fysBZggJQH3/8yphmo8yoSHXvAkAJlBPuGK15Tzf7jAw5odn6gPDh
	1STmBUwXgyv+Yww5UTuRp95/0FqHe3ZG9JScb2WRgmdo0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avc2wg3rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 06 Dec 2025 04:13:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e19c8558so525724485a.2
        for <linux-i2c@vger.kernel.org>; Fri, 05 Dec 2025 20:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764994382; x=1765599182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tpDwo3AVFEqyo8uW2zQ2fAN5CJka0mLD3vVFUxIz6Og=;
        b=DAzcGU0mIm9H6v8DCORQfhQx8g3++mQtl+vVJPEgbf+Z+vf+ea4zHouVXd3SSxe6ZU
         MQAlA7NpYOWp8SrIv5scgaYKEjuCsJ9QG44HMy+w6qf7RXwOKEHE8eGYBbSMEA1Wz4JB
         wBGWXAZNeEZfvM504YqiTqmHxD3qaKm29tyUV3yvXUzLWpmjngBjY8EC8efDbRaxDRrq
         Src8nDPKKSP6QFp4dO9786PZ4xgxxfm1a6eYXZToqLDXT8xQ7S9dE0H0mszitp8HjkCm
         kJpHeSbw/GXTuZ698o6xgzmML+L1XBVrtfUmckWa3CJET99u1yXmnAvr8fPFuEbLcdO1
         y6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764994382; x=1765599182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpDwo3AVFEqyo8uW2zQ2fAN5CJka0mLD3vVFUxIz6Og=;
        b=qiYGp6cy9FWW/1ikjbCGOSkODcR2Ro4dWrcyrc+Idb7OEn+94D1hGy4LdCy55MhM8Y
         ROYcPjOBPUDbxJsW552KSCyiARYroPxtm+pC8Jo8do/abMEgig0EM62kYJrEay2F6GLz
         zUQHlCX+lwL/5+5D1/uwZ1JK3P6yswCCp5LRpu/tkjJc7ojlrysImPEEDUl88958qa5u
         lKtDVHJh2cC/wMVNKgfGh0r9AQzje+jNml8EdqNnRVTiGJamKdWZ9FyhfB6FxwpEyLVV
         9C1phOFZI2Lild4ylnY6D/6kZUGURVIyHh4bDtef5MB/pBddNvU+m6xvrc+edk8l7POf
         KTng==
X-Forwarded-Encrypted: i=1; AJvYcCX2f/IepjBCsbajB5Dr37vXzqC+xXNpqkygIwnK3+SNxz6m8o5LoI0utCE06apMtcZPuk3fOwwFTWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp5mErVWfkKJiUCQox2n5qqSnbpvFI7aer4QSTk50opOVlgb1K
	bpoKTrX+9wTPtBzPL+9aNjn/uC0flifojGPu+lKAOtb4r1+TeCxqDpDE3ToNjqRYWqGwoyI1LSb
	xWoFLxW9JElm018/w27djHxztAzBITuRsrcs4PyFxp3CQUoOcM9aHWbaZ3n3OhO8=
X-Gm-Gg: ASbGnctox2QGUggRtfEvt5UNHGiKB5dPp7ZA/ZD6tY0OL8jLBWt5QJ2gJVvxzbQ1Guy
	uViP9/16/GA9+q0zg3ENlroF6kxkNhW1/Ok0YZCEz9ZC+485pJ/IovN2k+5tZ/6hR7EwSOqR7eW
	Ual+YBSGdC2+agf7LdNkkNrm5X+cpqpFGjea0W/yv+9rxDmfugcB1Owogc/nKckHOk+t0Rx5dP/
	g5zqN6a8sWs2joNFsGK5uG0ej2ZaqtbVCJwRP8+9OMwPfbDSXWswM7CqfETFWqXzN332YARyNPg
	/cNSZKEv7XQ3DA+jk0S7C2G3fm/S/VGWtMKYzWuJnUwZfxh+M2JIiPDCeFOTI3vmfHurDRr3Nuz
	S2/Ue/RtBRbiU10BEaJqs/7/Q+0W5LaJ9QpwttYNT5VtsWaWoiMHnQ6mjGDF+E0kgZZ0hk4ApWR
	getWsfWpqJf6QXVXjoo64GnNE=
X-Received: by 2002:a05:620a:17a3:b0:8a3:c4fa:9b58 with SMTP id af79cd13be357-8b6a233151dmr187945785a.10.1764994382328;
        Fri, 05 Dec 2025 20:13:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpJHsFQhad/ybeRaGffC96lG7VG9syusgSlhnLEPrgLX+czXrCbZ/KXbv8LjB8hKejgBvLOQ==
X-Received: by 2002:a05:620a:17a3:b0:8a3:c4fa:9b58 with SMTP id af79cd13be357-8b6a233151dmr187944085a.10.1764994381843;
        Fri, 05 Dec 2025 20:13:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70595fbcsm19441981fa.23.2025.12.05.20.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 20:13:00 -0800 (PST)
Date: Sat, 6 Dec 2025 06:12:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 2/7] i2c: qcom-cci: Add msm8953 compatible
Message-ID: <2xnqccipxskew4xmm2rmmjey7g46lu5lcnormgucoyjg6ch44m@deu4g37l4rcd>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
 <20251028-msm8953-cci-v2-2-b5f9f7135326@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-msm8953-cci-v2-2-b5f9f7135326@lucaweiss.eu>
X-Proofpoint-GUID: xY529YIXpqSkailS-g0acnl311DNWq1P
X-Proofpoint-ORIG-GUID: xY529YIXpqSkailS-g0acnl311DNWq1P
X-Authority-Analysis: v=2.4 cv=d774CBjE c=1 sm=1 tr=0 ts=6933ad4e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=dlmhaOwlAAAA:8 a=SfhF9SiZLXNrBiBhEFwA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=DZeXCJrVpAJBw65Qk4Ds:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAzMSBTYWx0ZWRfX7MngcHj/I4Ud
 9NDeoVU+ZJArJ+JhVM4Itzgf5ejvu/TodFI1unB8r99znkfd5laY26D5b2Hm5J1xlfj6QtNo3IG
 naGSbnAD2CqiH4t0EN9QL41/uJ4xw+Oa3AyuTI7Cjbu3MU82kpGiPObYUW7GbsKSh1wd1JnQNdP
 rxE8dpbiBAS0S9Zay15ZLB07Om7sTNyPWv0oBoEG18plkgGdf1y4TVi7l1tU0daWnkUSn9rO6J9
 8k33ZIzigcq7+nWusPFCFQL7Tph+omU+vsfOzimdz1wz/yVXHEdrFlRIayGtffAvSMelTyNc0iY
 xScrbvVhUPfE5hXZzSWlAbzhslS/gTwHOo1Ss+4Y2AeXBXcP/qpR/N2H2vNN6m6CBWrSwo9c3/Y
 SysyycpbMDrFsOGSHKH10c+TD4DVpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060031

On Tue, Oct 28, 2025 at 05:40:47PM +0100, Luca Weiss wrote:
> Add a config for the v1.2.5 CCI found on msm8953 which has different
> values in .params compared to others already supported in the driver.
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 46 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

