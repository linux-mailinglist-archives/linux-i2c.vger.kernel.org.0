Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCCCA7276
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 20:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbfICSTD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 14:19:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21530 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727667AbfICSTD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 14:19:03 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x83IIbT9066084;
        Tue, 3 Sep 2019 14:18:54 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2usu0bwc9f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Sep 2019 14:18:53 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x83IIrc0067817;
        Tue, 3 Sep 2019 14:18:53 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2usu0bwc8s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Sep 2019 14:18:53 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x83IEnKw028606;
        Tue, 3 Sep 2019 18:18:52 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma04wdc.us.ibm.com with ESMTP id 2us9fmx2th-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Sep 2019 18:18:52 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x83IIqx355116174
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 3 Sep 2019 18:18:52 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4F2F3AE05F;
        Tue,  3 Sep 2019 18:18:52 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D79B0AE05C;
        Tue,  3 Sep 2019 18:18:51 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  3 Sep 2019 18:18:51 +0000 (GMT)
Subject: Re: [PATCH] i2c: busses: i2c-fsi.c: Add of_put_node() before break
To:     Wolfram Sang <wsa@the-dreams.de>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     eajames@linux.ibm.com, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org
References: <20190706131911.3068-1-nishkadg.linux@gmail.com>
 <20190903181501.GJ2171@ninjato>
From:   Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <ddca6d49-e52b-bf5d-48fd-44124b2de528@linux.vnet.ibm.com>
Date:   Tue, 3 Sep 2019 13:18:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903181501.GJ2171@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-09-03_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030181
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 9/3/19 1:15 PM, Wolfram Sang wrote:
> On Sat, Jul 06, 2019 at 06:49:11PM +0530, Nishka Dasgupta wrote:
>> Each iteration of for_each_available_childe_of_node puts the previous
>> node, but in the case of a break from the middle of the loop, there
>> is no put, thus causing a memory leak. Add an of_node_put before the
>> break.
>> Issue found with Coccinelle.
>>
>> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
>> ---
> Eddie, are you okay with this change?


Yes, sorry must have missed this when it first came in.

Thanks.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
>>   drivers/i2c/busses/i2c-fsi.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
>> index 1e2be2219a60..5e01875082c3 100644
>> --- a/drivers/i2c/busses/i2c-fsi.c
>> +++ b/drivers/i2c/busses/i2c-fsi.c
>> @@ -685,8 +685,10 @@ static int fsi_i2c_probe(struct device *dev)
>>   			continue;
>>   
>>   		port = kzalloc(sizeof(*port), GFP_KERNEL);
>> -		if (!port)
>> +		if (!port) {
>> +			of_node_put(np);
>>   			break;
>> +		}
>>   
>>   		port->master = i2c;
>>   		port->port = port_no;
>> -- 
>> 2.19.1
>>
