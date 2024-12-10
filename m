Return-Path: <linux-i2c+bounces-8390-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 553419EA76B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 05:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEFA42891AC
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 04:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841BA1BC094;
	Tue, 10 Dec 2024 04:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dceYg8XA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E5579FD;
	Tue, 10 Dec 2024 04:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733806483; cv=none; b=kJ8bQ7PGVleM0UME68/bDvojI3zo69jxXmJqD5vVMo2hUjOyuiAaNlChFpDq6cvHFa4kEASetSVoHcfTw3uSkH5FhgQpSecwTkzDm72lUA1294TIDN4RU0Kj6BCv4ZG40ULXRXzIag/hXQmPkg0Kjrnxs52RhBUsNnTAOA23uaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733806483; c=relaxed/simple;
	bh=gdEbNFPl5kPLl0+Fyt3/DtxwUw1JlBhuVFojii4rjfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=omtPw8BYgufYZ5/tyaKuIUE5xqbOuk1jXZX6P18zk5j4yKVXe38hov1GM576pBJ6OEXojQvb0m0mUDp3HqtIqx5f1QFl+ciXETSn88h2qnKBgttTaATFVAeM/3+nD+piTgyYN2N/P9SieF22E0h7K2LhCWfQj9qSrU3qOW0OFAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dceYg8XA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9JKj9F014588;
	Tue, 10 Dec 2024 04:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IlC79XGTk+ZcsfIIqjz57EXU6SX3DgAASoT3HuQrm/c=; b=dceYg8XAWZBIpXgq
	iJ35yg6Ej6GpfnQVWpJtACqzuog4OGIfPRRxScQTeeJNda1xQVF3HVSEJ98qPPzf
	hjs6rCeP89F1HO/YL5QcirPDUs+uEAV+XGAXd7nt/VnzvDqo7bAnKGN/22ZqyXmj
	rMkTQ9VyqZDHk5FI3JLZ6Hyqq/reyD496mhHExL8rWLlS34VNz4rYMXxwiEKctCA
	vrwxpXhWCyMM3FsZzNOCSTZldn3zLKLwu0Y5O3qvt7yQcNpKtKAczLx2NoqyZ2gT
	z4rJnsQfKIEXoDwNB8jgwswME7Sm8F2yiXdDFTSISOD90bKMmgdSamWZXmOxnycn
	673pnQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dy8ttr4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 04:54:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA4sXd1007710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 04:54:33 GMT
Received: from [10.216.2.81] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 20:54:26 -0800
Message-ID: <a4df0d32-0223-4913-946b-ba6566798a1b@quicinc.com>
Date: Tue, 10 Dec 2024 10:24:23 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/7] soc: qcom: geni-se:: Add support to load QUP SE
 Firmware via Linux subsystem
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        kernel test robot
	<lkp@intel.com>
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <broonie@kernel.or>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <johan+linaro@kernel.org>,
        <dianders@chromium.org>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <oe-kbuild-all@lists.linux.dev>, <quic_anupkulk@quicinc.com>,
        "Mukesh Kumar
 Savaliya" <quic_msavaliy@quicinc.com>
References: <20241204150326.1470749-5-quic_vdadhani@quicinc.com>
 <202412050429.SJvNsU2f-lkp@intel.com>
 <5sni4plocjjtzdijtmlxnipthpfz4w3x27th3mergdhhaqjs3y@aqyngjkmg33h>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <5sni4plocjjtzdijtmlxnipthpfz4w3x27th3mergdhhaqjs3y@aqyngjkmg33h>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Cu0LDME5EqKYmt2dRoMiqga4Q6SFiD2H
X-Proofpoint-GUID: Cu0LDME5EqKYmt2dRoMiqga4Q6SFiD2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 mlxscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412100033



On 12/5/2024 4:07 AM, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 04:19:25AM +0800, kernel test robot wrote:
>> Hi Viken,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on andi-shyti/i2c/i2c-host]
>> [also build test WARNING on tty/tty-testing tty/tty-next tty/tty-linus broonie-spi/for-next linus/master v6.13-rc1 next-20241204]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Viken-Dadhaniya/dt-bindings-i2c-qcom-i2c-geni-Document-DT-properties-for-QUP-firmware-loading/20241204-230736
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
>> patch link:    https://lore.kernel.org/r/20241204150326.1470749-5-quic_vdadhani%40quicinc.com
>> patch subject: [PATCH v1 4/7] soc: qcom: geni-se:: Add support to load QUP SE Firmware via Linux subsystem
>> config: arm-randconfig-002 (https://download.01.org/0day-ci/archive/20241205/202412050429.SJvNsU2f-lkp@intel.com/config)
>> compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050429.SJvNsU2f-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202412050429.SJvNsU2f-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>     drivers/soc/qcom/qcom-geni-se.c: In function 'read_elf':
>>>> drivers/soc/qcom/qcom-geni-se.c:975:23: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>>       975 |                 *phdr = &phdrs[i];
>>           |                       ^
>>     drivers/soc/qcom/qcom-geni-se.c: At top level:
>>     drivers/soc/qcom/qcom-geni-se.c:1268:5: warning: no previous prototype for 'qup_fw_load' [-Wmissing-prototypes]
>>      1268 | int qup_fw_load(struct qup_se_rsc *rsc)
>>           |     ^~~~~~~~~~~
> 
> This doesn't looks like it was properly compile-tested. Please always
> make sure that the build cleanly passes "make W=1" for the changed
> paths.
> 
> 

we have compiled with -Werror but there was something missing.
Tried with with W=1 and now i see this error coming locally. Will 
incorporate and take care in future.


