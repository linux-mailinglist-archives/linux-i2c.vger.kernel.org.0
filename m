Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD8D76CF0E
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 15:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232731AbjHBNoh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 09:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233935AbjHBNog (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 09:44:36 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721B5269A;
        Wed,  2 Aug 2023 06:44:35 -0700 (PDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 372DdWmY001583;
        Wed, 2 Aug 2023 13:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=g55Ym+YpNFbYbsHJm78sD6z/mEY3akqaVkYyzH3Jg7g=;
 b=XalsLoKFIRMecbK04Ju3GMu6LWdk0ZWH2zOQoUDSUau+5GV3bZUpMGlvGZzaGlngcA7F
 my/jzr5MLWWc2CkwQ9iVw0xoOqNradBdA3LDq8bYw+0V6mOBWTdQ8VbOF2wmQ7G4RAOq
 QP6v2ylxhFkJbYc20fWBiyMrNp3VMgHTwJ5lMxSRmoG+m01xMWxVdGuobsSSHDt6f1ZJ
 vBGgHLMJrxEn0RCfvHlYmG/JXHnlfnvxAb4m1XBtzomio0wiWJaAdDrxlS/cdY7+lVGt
 PW18230/0EavT612jKmHZT9OuNrGKA9NMMPqb3HEaV2RjX9ew1eBwsPDrhgE22Id2Ua5 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s7r1a8f0m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Aug 2023 13:44:01 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 372De5Fx006219;
        Wed, 2 Aug 2023 13:43:40 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s7r1a8dr9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Aug 2023 13:43:39 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
        by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 372CkWXw006161;
        Wed, 2 Aug 2023 13:41:18 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
        by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5d3sn9kj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Aug 2023 13:41:17 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
        by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 372DfH2B29295132
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 2 Aug 2023 13:41:17 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3D1D758054;
        Wed,  2 Aug 2023 13:41:17 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 973595804E;
        Wed,  2 Aug 2023 13:41:16 +0000 (GMT)
Received: from [9.61.179.91] (unknown [9.61.179.91])
        by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
        Wed,  2 Aug 2023 13:41:16 +0000 (GMT)
Message-ID: <388f1d61-c419-a133-6266-daff1fa4cd60@linux.ibm.com>
Date:   Wed, 2 Aug 2023 08:41:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] i2c: aspeed: Avoid accessing freed buffers during i2c
 transfers.
To:     Lei YU <mine260309@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc:     Lixue Liang <lianglixuehao@126.com>,
        Lixue Liang <lianglixue@greatwall.com.cn>,
        linux-aspeed@lists.ozlabs.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        brendan.higgins@linux.dev, linux-i2c@vger.kernel.org,
        p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org
References: <20230728122416.17782-1-lianglixuehao@126.com>
 <CACPK8Xf6YssamEmHB5XDf8JYk+_=hnG8Yzqn4kCikseqg6rqOA@mail.gmail.com>
 <CAARXrtmZbu3aabYJkEc25rHymRHDX4=zNdecHAs3LnQ259RkPg@mail.gmail.com>
Content-Language: en-US
From:   Eddie James <eajames@linux.ibm.com>
In-Reply-To: <CAARXrtmZbu3aabYJkEc25rHymRHDX4=zNdecHAs3LnQ259RkPg@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: brqHT6bMSvTJF7K0U5buGGNpMKUKQ0Wg
X-Proofpoint-ORIG-GUID: svrKPSwC-tR9dzrOChMyy-us0eG8TCj-
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_09,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020121
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/31/23 01:10, Lei YU wrote:
> There is a same fix in 
> https: //lore. kernel. org/openbmc/374237cb-1cda-df12-eb9f-7422cab51fc4@ linux. alibaba. com/ 
> On Mon, Jul 31, 2023 at 12: 21 PM Joel Stanley <joel@ jms. id. au> 
> wrote: On Fri, 28 Jul 2023 at 12: 40, Lixue Liang 
> <lianglixuehao@ 126. com>
> ZjQcmQRYFpfptBannerStart
> This Message Is From an Untrusted Sender
> You have not previously corresponded with this sender.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!12-vrJBTB7HSMYjxkCEvpHwVyelw0CenAD3RKRjmVVfRig6DzCgRBaxHaeYsJsATzFgNYSRGXy6rQNXpmK9YdWQxScm-2h9p_bilDuLeU1r8NS5OEkCngl01P94y$> 
>
> ZjQcmQRYFpfptBannerEnd
> There is a same fix in 
> https://lore.kernel.org/openbmc/374237cb-1cda-df12-eb9f-7422cab51fc4@linux.alibaba.com/
>
> On Mon, Jul 31, 2023 at 12:21 PM Joel Stanley <joel@jms.id.au> wrote:
>
>     On Fri, 28 Jul 2023 at 12:40, Lixue Liang <lianglixuehao@126.com>
>     wrote:
>     >
>     > From: Lixue Liang <lianglixue@greatwall.com.cn>
>     >
>     > After waiting for the transmission timeout, the I2C controller will
>     > continue to transmit data when the bus is idle. Clearing
>     bus->msg will
>     > avoid kernel panic when accessing the freed msg->buf in
>     > aspeed_i2c_master_irq.
>     >
>     > Signed-off-by: Lixue Liang <lianglixue@greatwall.com.cn>
>     > ---
>     >  drivers/i2c/busses/i2c-aspeed.c | 2 ++
>     >  1 file changed, 2 insertions(+)
>     >
>     > diff --git a/drivers/i2c/busses/i2c-aspeed.c
>     b/drivers/i2c/busses/i2c-aspeed.c
>     > index 2e5acfeb76c8..c83057497e26 100644
>     > --- a/drivers/i2c/busses/i2c-aspeed.c
>     > +++ b/drivers/i2c/busses/i2c-aspeed.c
>     > @@ -713,6 +713,8 @@ static int aspeed_i2c_master_xfer(struct
>     i2c_adapter *adap,
>     >                 spin_lock_irqsave(&bus->lock, flags);
>     >                 if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
>     >                         bus->master_state =
>     ASPEED_I2C_MASTER_INACTIVE;
>     > +
>     > +               bus->msgs = NULL;
>
>     Eddie, is this the same issue you were debugging?
>

Yes, it is, and the same fix I settled on.


>
>     >  spin_unlock_irqrestore(&bus->lock, flags);
>     >
>     >                 return -ETIMEDOUT;
>     > --
>     > 2.27.0
>     >
>
