Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5722A1F1EC2
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jun 2020 20:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgFHSMJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jun 2020 14:12:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23974 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725797AbgFHSMI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Jun 2020 14:12:08 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 058I2ui4130692;
        Mon, 8 Jun 2020 14:12:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31g77qcgjf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Jun 2020 14:12:05 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 058I3920132054;
        Mon, 8 Jun 2020 14:12:05 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31g77qcghw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Jun 2020 14:12:05 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 058I4gLV029043;
        Mon, 8 Jun 2020 18:12:04 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma02wdc.us.ibm.com with ESMTP id 31g2s8cght-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Jun 2020 18:12:03 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 058IC37O8520544
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 8 Jun 2020 18:12:03 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 89E3BAE05C;
        Mon,  8 Jun 2020 18:12:03 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EC77EAE063;
        Mon,  8 Jun 2020 18:12:02 +0000 (GMT)
Received: from [9.211.140.245] (unknown [9.211.140.245])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Mon,  8 Jun 2020 18:12:02 +0000 (GMT)
Subject: Re: [PATCH 2/2] i2c: fsi: Prevent adding adapters for ports without
 dts nodes
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        wsa@kernel.org, Joel Stanley <joel@jms.id.au>
References: <20200608160544.7134-1-eajames@linux.ibm.com>
 <20200608160544.7134-3-eajames@linux.ibm.com>
 <CAHp75VfRj4kA1yrhkqak9zMJuES8Udk3YuzMKHXyh+hwrB6rSQ@mail.gmail.com>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <cab1dd65-e746-d861-3aef-696294bf496b@linux.ibm.com>
Date:   Mon, 8 Jun 2020 13:12:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfRj4kA1yrhkqak9zMJuES8Udk3YuzMKHXyh+hwrB6rSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-08_17:2020-06-08,2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015
 cotscore=-2147483648 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080129
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 6/8/20 11:31 AM, Andy Shevchenko wrote:
> On Mon, Jun 8, 2020 at 7:05 PM Eddie James <eajames@linux.ibm.com> wrote:
>> Ports should be defined in the devicetree if they are to be enabled on
>> the system.
> ...
>
>>          for (port_no = 0; port_no < ports; port_no++) {
>>                  np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
>> -               if (np && !of_device_is_available(np))
>> +               /* Do not add port if it is not described in the device tree */
>> +               if (!np)
>> +                       continue;
> I believe this is redundant, since below will do the same second time.


Good point, thanks, I'll update that.


>
>> +               /* Do not add port if it is described as disabled */
>> +               if (!of_device_is_available(np))
>>                          continue;
