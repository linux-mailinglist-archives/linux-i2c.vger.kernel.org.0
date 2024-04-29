Return-Path: <linux-i2c+bounces-3300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 768458B5B84
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 16:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 287A72821C7
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 14:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9655A7F484;
	Mon, 29 Apr 2024 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="XkzW4Gv2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411F27E0F2;
	Mon, 29 Apr 2024 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714401530; cv=none; b=QXc4Ra5LPHTTkCqKbrlCiBtEoZvQGz5/AyNQfqD6HZqxcrNiftzhtJ0zZzU7HE25dYv0isCGG+TmHXWpnyRgdj8DtG7swJjslVfzTQpEYm8aJOG7e5utj8fAdkr8ogDS8fT8Knj4s1CqjyhxBPsIQxPbRrn1jsOdD5QRA/z2w8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714401530; c=relaxed/simple;
	bh=0ByfEefQs6fmoxNt23ATwL3+ZYXlN53mM6e3DUHpL7o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qe8hpDavrtSYp2AEgb4/O0l/qaRTOsVPf5S/rkBrVvXZUvcwbIY7iUhoBnENX5oR6s+g/0v9m8tsISBMcn4FQtqE8RxQ4Jk9Q2LG57la6hQE/k7VnIVzNtB1WbXPyLZ5+/3NHHc7Y+xcdk2y9n51UuKozhPnaIvhK+R40OR1h64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=XkzW4Gv2; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TEYTqU031754;
	Mon, 29 Apr 2024 14:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=aX+pLyMEaPhNXR7d2ERuJVDwyZzOSEXqi/pX/qY6RN8=;
 b=XkzW4Gv2BlAY7l0Qk9/ti96bKkO9LihT7qAyZaesUCrGt4SQT4OZLyF8UTivNKCpQlwx
 kFpaZn65N6Br6WWT0iGMIUC5hHm9wtE6gZ10JfULT1fVXmSJkTqhOOdiuPRHsdne4vBE
 sHthlMxRsCgKx9cekD8dr8rzKEMTW84AX0h+eddIhcJAGpzOrxYZNUMb7TD8sChUWzJ5
 sujYomrK1eEx7G6vGWGJd3lPfDvU1NLczD5prSyt6VhNOkXy+eiLHm0ZqscZ5lUxDve/
 5uY7Utd4s2rvDDKx1cntpQVjCEpGJzvLLjOXhILQuiYaOBoyvA2eNAgFXt0kiZssMrb9 mw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtbq9rc7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 14:38:34 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TELAul027546;
	Mon, 29 Apr 2024 14:38:33 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xsc307xqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 14:38:33 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TEcUnh23200382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 14:38:32 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C8805806D;
	Mon, 29 Apr 2024 14:38:30 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E28958059;
	Mon, 29 Apr 2024 14:38:29 +0000 (GMT)
Received: from [9.61.151.254] (unknown [9.61.151.254])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 14:38:29 +0000 (GMT)
Message-ID: <b2bdae97-7cd5-4961-9cd4-1142a862d55f@linux.ibm.com>
Date: Mon, 29 Apr 2024 09:38:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: spi: Document the IBM Power SPI
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-2-eajames@linux.ibm.com>
 <e2b52bfb-0742-4baf-8269-86075b5cc54e@kernel.org>
 <f1c3947c-e1c8-4dac-bbf7-e9c0dc9c27e9@linux.ibm.com>
 <992317a7-2606-404c-bc62-4d181ea9e147@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <992317a7-2606-404c-bc62-4d181ea9e147@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pbxTbTYYe8HvxHZMsyvvrZLJm0VEvl2p
X-Proofpoint-ORIG-GUID: pbxTbTYYe8HvxHZMsyvvrZLJm0VEvl2p
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_12,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290092


On 4/28/24 11:39, Krzysztof Kozlowski wrote:
> On 26/04/2024 16:49, Eddie James wrote:
>> On 4/26/24 01:15, Krzysztof Kozlowski wrote:
>>> On 25/04/2024 23:36, Eddie James wrote:
>>>> The IBM Power chips have a basic SPI controller. Document it.
>>> Please use subject prefixes matching the subsystem. You can get them for
>>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
>>> your patch is touching.
>>
>> Isn't spi the right subsystem here?
> And what prefix shall be for SPI bindings? Did you run the command or
> just replying to disagree with me?


The correct prefix is either dt-bindings: spi or spi: dt-bindings. I 
used the former. Would you prefer I use the latter? I followed your 
instructions but you see the results are mixed, which is why I asked for 
clarification, wondering if you meant something else, since I already 
used one of the two apparently correct options.


53df0409b59b Merge branch 'for-next' of 
git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
f63175733f91 spi: dt-bindings: armada-3700: convert to dtschema
1f48cbd6f00f spi: renesas,sh-msiof: Add r8a779h0 support
eb4fdb4bf46f spi: dt-bindings: cdns,qspi-nor: make cdns,fifo-depth optional
52826aee484b spi: dt-bindings: cdns,qspi-nor: add mobileye,eyeq5-ospi 
compatible
002514d91fcc spi: dt-bindings: cdns,qspi-nor: sort compatibles 
alphabetically
02ec75edaa94 dt-bindings: treewide: add access-controllers description
80a38bfbbd59 spi: dt-bindings: introduce FIFO depth properties
ee09bb727bff spi: dt-bindings: samsung: make dma properties not required
666db8fd4265 spi: dt-bindings: atmel,at91rm9200-spi: remove 9x60 
compatible from list
ff690e75d64b spi: dt-bindings: samsung: add google,gs101-spi compatible
737cf74b3800 spi: dt-bindings: samsung: Add Exynos850 SPI
18ab9e9e8889 dt-bindings: spi: nxp-fspi: support i.MX93 and i.MX95
6685d552a0cc dt-bindings: spi: fsl-lpspi: support i.MX95 LPSPI
f034a151059a dt-bindings: spi: stm32: add st,stm32mp25-spi compatible
e1fca6957f19 spi: dw: Remove Intel Thunder Bay SOC support
4c3ff31a85e3 spi: axi-spi-engine improvements
252eafe11ffc dt-bindings: spi: axi-spi-engine: convert to yaml
54a1dc08e173 spi: dt-bindings: renesas,rspi: Document RZ/Five SoC
09388379b6d7 spi: add stm32f7-spi compatible
1b2e883e1af8 spi: Merge up fix
4056d88866e5 spi: renesas,rzv2m-csi: Add CSI (SPI) target related property
9f778f377cd3 spi: dt-bindings: Make "additionalProperties: true" explicit
da6de6d3ecc1 spi: qup: Allow scaling power domains and
0fc57bf1b2ff spi: dt-bindings: st,stm32-spi: Move "st,spi-midi-ns" to 
spi-peripheral-props.yaml
d15befc0cef4 spi: dt-bindings: qup: Document interconnects
e6419c35f0d9 spi: dt-bindings: qup: Document power-domains and OPP
3b4e5194138b dt-bindings: spi: fsl-imx-cspi: Document missing entries
b0ef97ac89a7 spi: dt-bindings: arm,pl022: Move child node properties to 
separate schema
8f447694c23a Merge tag 'devicetree-for-6.6' of 
git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
47aab53331ef dt-bindings: Fix typos
0e19118ab24b dt-bindings: spi: convert spi-brcm63xx.txt to YAML
0d2b6a1b8515 dt-bindings: qspi: cdns,qspi-nor: Add clocks for StarFive 
JH7110 SoC
ffae65fb1ae4 dt-bindings: spi: spi-cadence: Add label property
883622752403 dt-bindings: spi: spi-cadence: Describe power-domains property
b350e6c6297a spi: dt-bindings: add loongson spi
026badeb7055 spi: fspi: Add power-domains to the DT bindings
49aa77165c00 spi: lpspi: Add power-domains to the DT bindings
8858babff615 dt-bindings: spi: add reference file to YAML
b8968c388b69 dt-bindings: spi: Convert Tegra114 SPI to json-schema
17a9ab02f72c dt-bindings: spi: tegra-sflash: Convert to json-schema
8c87a46e2ce3 dt-bindings: spi: tegra-slink: Convert to json-schema
6c1561fb9005 Merge tag 'soc-dt-6.5' of 
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
e884a133340a spi: dt-bindings: atmel,at91rm9200-spi: fix broken sam9x7 
compatible
a3eb95484f27 spi: dt-bindings: atmel,at91rm9200-spi: add sam9x7 compatible
14dde0746e67 spi: dt-bindings: Add bindings for RZ/V2M CSI
01fa9edd8bcf spi: dt-bindings: stm32: do not disable spi-slave property 
for stm32f4-f7
e6afe03351ac spi: stm32: disable spi-slave property for stm32f4-f7
7bac98a338d6 spi: dt-bindings: snps,dw-apb-ssi: Add compatible for Intel 
Mount Evans SoC
d5c421d24d7e dt-bindings: xilinx: Switch xilinx.com emails to amd.com
34fcc0f0a410 spi: dt-bindings: socionext,uniphier: drop address/size-cells
bbd25f1ae8bf spi: dt-bindings: samsung: drop cs-gpios


>
>
> Best regards,
> Krzysztof
>

