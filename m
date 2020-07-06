Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5DE2158D7
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jul 2020 15:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbgGFNxL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jul 2020 09:53:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19098 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729109AbgGFNxL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jul 2020 09:53:11 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 066DX6QQ063588;
        Mon, 6 Jul 2020 09:53:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 322nxxcgkd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jul 2020 09:53:07 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 066DXPsO065281;
        Mon, 6 Jul 2020 09:53:07 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0b-001b2d01.pphosted.com with ESMTP id 322nxxcgk5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jul 2020 09:53:07 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 066DisRY009392;
        Mon, 6 Jul 2020 13:53:06 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma04wdc.us.ibm.com with ESMTP id 322hd8quaq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jul 2020 13:53:06 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 066Dr60r34341128
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 6 Jul 2020 13:53:06 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 37223112064;
        Mon,  6 Jul 2020 13:53:06 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AAFBF112061;
        Mon,  6 Jul 2020 13:53:05 +0000 (GMT)
Received: from [9.211.88.162] (unknown [9.211.88.162])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Mon,  6 Jul 2020 13:53:05 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] i2c: fsi: Prevent adding adapters for ports
 without dts nodes
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, joel@jms.id.au
References: <20200609201555.11401-1-eajames@linux.ibm.com>
 <20200609201555.11401-3-eajames@linux.ibm.com> <20200704063918.GH1041@kunai>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <4c1aee77-c544-9688-f679-5cd8b5405fb7@linux.ibm.com>
Date:   Mon, 6 Jul 2020 08:53:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200704063918.GH1041@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-06_11:2020-07-06,2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007060101
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/4/20 1:39 AM, Wolfram Sang wrote:
> On Tue, Jun 09, 2020 at 03:15:55PM -0500, Eddie James wrote:
>> Ports should be defined in the devicetree if they are to be enabled on
>> the system.
> The patch description does not really fit anymore, does it? There is no
> change in behaviour, we just remove a redundant check.


Hi, it does change the behavior actually. By checking for the device 
node pointer, it would proceed and create the port for a NULL device 
node, which is not the desired behavior.


Thanks,

Eddie


>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>> Changes since v1:
>>   - Remove the check for null device node since that is checked in
>>     of_device_is_available
>>
>>   drivers/i2c/busses/i2c-fsi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
>> index 977d6f524649..10332693edf0 100644
>> --- a/drivers/i2c/busses/i2c-fsi.c
>> +++ b/drivers/i2c/busses/i2c-fsi.c
>> @@ -703,7 +703,7 @@ static int fsi_i2c_probe(struct device *dev)
>>   
>>   	for (port_no = 0; port_no < ports; port_no++) {
>>   		np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
>> -		if (np && !of_device_is_available(np))
>> +		if (!of_device_is_available(np))
>>   			continue;
>>   
>>   		port = kzalloc(sizeof(*port), GFP_KERNEL);
>> -- 
>> 2.24.0
>>
