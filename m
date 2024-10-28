Return-Path: <linux-i2c+bounces-7618-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E602F9B2509
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 07:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 223BB1C20E27
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 06:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B2819048A;
	Mon, 28 Oct 2024 06:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zf48rz3J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB118E74C;
	Mon, 28 Oct 2024 06:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730095595; cv=none; b=UTKogaWRMU0hZdwMisNGFMfLvV1ebz/652vpSICVif+LSRL9YdPCoyJGlHlrhPW+CfKiaUpt1F8YXVPDtNAZ1wEnsjsHb5w4fM4lY8+HMhLPwOvChJe/dBB7jCl91f5LIgBLIdvEC8/AgWDubgZ7rWx3+nxxNhpSl5JKr7bwk3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730095595; c=relaxed/simple;
	bh=miIxxl5+U0i14SfV93WdmSgaguMjZukgbuvI8Med48Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=phdroc+fh6VeqgYUI7EI+tr1KgWqcqdpC185MPZznalGAeeuNaGPPyHUC7pE0wJM/n16BFyPEMFxAcjrBWYk4mg62pf1avViO5m5DlKAWqRhzx5+Sh/CuuSK89syaw5x6hTH9onLbypJ1WNiYB+Ja3p3ATuadj1KHQMSCVw9r/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zf48rz3J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RLw231016167;
	Mon, 28 Oct 2024 06:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Em8Tc31dZKLc4ca5+0jW7wblgmsW9KumGOsBtyhqUj0=; b=Zf48rz3JrMv+eXeW
	7NxyLXt1RbEYsE7eQHdg8jkV+sJyugz1NgtSGWuF+sOx8JR1WPJv1AOb/hPMbLEi
	aS0bfpuJEJKbkRMlbC54xPNE5GCWpBrGmg8Z4x5NSjNpg76OyOKt5evh3FQgQtlr
	1Q6BIppDcWi6/iSCi2WBnvuwXpLq1EJKlBug8droYx934izZrIsYaZEuzHziO4T+
	0wIvdIAkxspLiOPmuw7u0rsLVCs4/NcgFepfGBsKjokEZ7eHtpRr1XMrJ0PdSFKM
	vxNaOpIN5oDc67er1I3F1oTv0n0Mrxyx/hqm81RjufS5r62/cN5YGcp2sbZi27Lh
	MNyRrA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gp4dv14w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:06:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S66Om6020194
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:06:24 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 23:06:18 -0700
Message-ID: <e5405cc7-a748-4e6f-8128-9e271ccc462f@quicinc.com>
Date: Mon, 28 Oct 2024 11:36:15 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: kernel test robot <lkp@intel.com>, Vinod Koul <vkoul@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Sumit Semwal" <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>, <cros-qcom-dts-watchers@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>
References: <20241015120750.21217-6-quic_jseerapu@quicinc.com>
 <202410191055.bi1pWTAY-lkp@intel.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <202410191055.bi1pWTAY-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fAQXcrvzG8ifnkoAE7cliPA5KgMYSabc
X-Proofpoint-GUID: fAQXcrvzG8ifnkoAE7cliPA5KgMYSabc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280050



On 10/19/2024 8:42 AM, kernel test robot wrote:
> Hi Jyothi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 55bcd2e0d04c1171d382badef1def1fd04ef66c5]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jyothi-Kumar-Seerapu/dt-bindings-dmaengine-qcom-gpi-Add-additional-arg-to-dma-cell-property/20241015-202637
> base:   55bcd2e0d04c1171d382badef1def1fd04ef66c5
> patch link:    https://lore.kernel.org/r/20241015120750.21217-6-quic_jseerapu%40quicinc.com
> patch subject: [PATCH v1 5/5] i2c: i2c-qcom-geni: Add Block event interrupt support
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241019/202410191055.bi1pWTAY-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191055.bi1pWTAY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410191055.bi1pWTAY-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
>>> ERROR: modpost: "gpi_multi_desc_process" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined!
> 
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for GET_FREE_REGION
>     Depends on [n]: SPARSEMEM [=n]
>     Selected by [m]:
>     - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]
>     WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
>     Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
>     Selected by [m]:
>     - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])
> 

Fixed the reported issue in V2 patch.

Regards,
JyothiKumar

