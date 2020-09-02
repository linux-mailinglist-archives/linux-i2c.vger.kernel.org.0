Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1063F25AFF9
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 17:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbgIBPsC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 11:48:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45574 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728571AbgIBPre (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 11:47:34 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 082FW52j046432;
        Wed, 2 Sep 2020 11:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=B9HMMIYxV7dLKsUViztHWLvJvaoop/tt7LeMtRlkEdg=;
 b=j/L2kevaqTtg0L2RSlXvTdVbe+bR5FpGm3jSl3XkfCeJYMtWlz4wTp6ho1KQ7ifeuYss
 JhzRrfLNCMor+uQiL3FlIUBJ0UtFGbxHPonJa1PJlFPUCo1B/l5mcqCSAdoShdaKiN14
 OI+qbcqPndA51Ome97Nwjj/oOiiMsE4D/6gJgsRMCeKq2amt5Z3C1V7WlrDOkWBcH5It
 zEXxwgkzWsOftYzMqm/qny+zP9gR6LVkAT9kQgJRt/b4e7mj2+75aYFypfh5nWvf2P5Z
 8RJjuQUKgDS9zDlhCs7RjyWonF3AcReiB2nm12t4AXCs1ZbrdROeyXXH6jXqBZ2sjTka Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33ae37rh9x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Sep 2020 11:47:23 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 082FgMtE113019;
        Wed, 2 Sep 2020 11:47:22 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33ae37rh8u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Sep 2020 11:47:22 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 082FlK8B021110;
        Wed, 2 Sep 2020 15:47:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma01wdc.us.ibm.com with ESMTP id 337en990f3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Sep 2020 15:47:20 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 082FlGsH34472356
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 2 Sep 2020 15:47:16 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5785C78064;
        Wed,  2 Sep 2020 15:47:19 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CA4E67806B;
        Wed,  2 Sep 2020 15:47:18 +0000 (GMT)
Received: from [9.211.74.86] (unknown [9.211.74.86])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  2 Sep 2020 15:47:18 +0000 (GMT)
Subject: Re: [PATCH 2/5] input: misc: Add IBM Operation Panel driver
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        benh@kernel.crashing.org, brendanhiggins@google.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org
References: <20200820161152.22751-1-eajames@linux.ibm.com>
 <20200820161152.22751-3-eajames@linux.ibm.com>
 <20200901061108.GB1148@ninjato>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <796de8d4-6771-a8da-ea93-6e7e08aa93b0@linux.ibm.com>
Date:   Wed, 2 Sep 2020 10:47:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200901061108.GB1148@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-02_09:2020-09-02,2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009020144
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 9/1/20 1:11 AM, Wolfram Sang wrote:
>> +	switch (event) {
>> +	case I2C_SLAVE_STOP:
>> +		command_size = panel->idx;
>> +		fallthrough;
>> +	case I2C_SLAVE_WRITE_REQUESTED:
>> +		panel->idx = 0;
>> +		break;
>> +	case I2C_SLAVE_WRITE_RECEIVED:
>> +		if (panel->idx < sizeof(panel->command))
>> +			panel->command[panel->idx++] = *val;
>> +		else
>> +			dev_dbg(&panel->input->dev, "command truncated\n");
> Just double checking: Do you really want to process truncated commands?
> Since you detect the state here, you could also choose to reject such
> commands?


Yes I suppose not. It could still be a valid command with extra bytes, 
but unlikely, so probably better not to handle it.


Thanks,

Eddie


>
