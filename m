Return-Path: <linux-i2c+bounces-3656-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CF08CDA73
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 21:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA1611F21B57
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 19:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD7982D83;
	Thu, 23 May 2024 19:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OCWaWop/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF6382863;
	Thu, 23 May 2024 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716491273; cv=none; b=d1YinAZxL5g5GnnYIGbyL9PZ9AEE9L5XxLOYLp3D1rRe2C/Yw+s8nu265fTGpbRh2NoTmOOFM/GahLdtDQHjS9NSBHbg4v6R2eg0Q/qbsP3YHi9wcLoHVc6pUlNPljLq7Fb4Ztaz2lUc27Q8BMIdNaqWHd/DZpXVH+Mxxy4Dkf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716491273; c=relaxed/simple;
	bh=XD30UEzgSSeL2mflAtdZXCCb5Md7riSIGIVnfpWQ3hw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U9s/pbM+aZcTqDCkye61kzQ5+1a5RRM3rKq8mFHMTAzAdRToL7rJkuJNbNFNB2G8xbaD20XYFeCcSUKQPp9vOWSo5iKWf0PPYXAl4XKyANHXLP6gKGNNckoo2iHQL7x1YJtLbzUuhE5wCfkrPIKkELN4fzVinJfC+j9Hg56NFzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OCWaWop/; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NJ7VWF025991;
	Thu, 23 May 2024 19:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Q688xSTw6bWKVlI3IHoLWJi8/sQGfWoYKVe4r6Iv/ww=;
 b=OCWaWop/kQs/bPc1og2/kn2iSnXtYM1ra6y92lZ5/up+cWbRdvEdxecLWJcv4p8NU5M3
 78upzBMzpVkSmrylcJLljGtemVPeXBwXu7Spw/8mW3c2IBy6KVs1WkMJCuPl3g94s3bL
 CUVhTIOpqUUdI+P8PwMxmul8v1NO9CbxsClkjgT2+B0lH4wcEiWH8q1M2Oh+uHnmno2b
 7goaPK12oKqsTJyEk5jR1h/MQVYXRWTcJoGIBWSnVEk0DV1+uCXBVuzdCbkXJJqBJGdk
 ejT+rB3LHPPcpHBoi0O3WZyeZjjpbVfvGPaFoGvo+jLk26UvBzALzH0uB+H4b7cCcAI4 zQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yabp0g01j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 19:07:37 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44NHDRtD023485;
	Thu, 23 May 2024 19:07:36 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y77npkudv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 19:07:36 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44NJ7XXK44761568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2024 19:07:35 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F27B58055;
	Thu, 23 May 2024 19:07:33 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 548C55804B;
	Thu, 23 May 2024 19:07:32 +0000 (GMT)
Received: from [9.61.104.209] (unknown [9.61.104.209])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 May 2024 19:07:32 +0000 (GMT)
Message-ID: <36030de9-0b05-4ab8-a603-510602d0fdf8@linux.ibm.com>
Date: Thu, 23 May 2024 14:07:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
To: linux-fsi@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ninad@linux.ibm.com, lakshmiy@us.ibm.com,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, andrew@codeconstruct.com.au,
        joel@jms.id.au, robh@kernel.org, conor+dt@kernel.org,
        krzk+dt@kernel.org, andi.shyti@kernel.org, broonie@kernel.org
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <202405232008.olE9azVd-lkp@intel.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <202405232008.olE9azVd-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 35oWZC4sOfejH1QRxif28YVySryd5vh4
X-Proofpoint-ORIG-GUID: 35oWZC4sOfejH1QRxif28YVySryd5vh4
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_11,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1011 impostorscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230131


On 5/23/24 07:48, kernel test robot wrote:
> Hi Eddie,
>
> kernel test robot noticed the following build errors:


Silly mistake. If this patch can be dropped from the series, I can send 
an updated Huygens DTS after this series is merged, unless I need to do 
a v7.


Thanks,

Eddie


>
> [auto build test ERROR on andi-shyti/i2c/i2c-host]
> [also build test ERROR on linus/master v6.9 next-20240523]
> [cannot apply to robh/for-next broonie-spi/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/spi-dt-bindings-Document-the-IBM-FSI-attached-SPI-controller/20240523-033334
> base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
> patch link:    https://lore.kernel.org/r/20240522192524.3286237-18-eajames%40linux.ibm.com
> patch subject: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
> config: arm-randconfig-001-20240523 (https://download.01.org/0day-ci/archive/20240523/202405232008.olE9azVd-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405232008.olE9azVd-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405232008.olE9azVd-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-huygens.dts:13.2-37 Properties must precede subnodes
>     FATAL ERROR: Unable to parse input tree
>

