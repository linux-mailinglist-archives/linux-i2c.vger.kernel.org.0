Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D05D15FEE5D
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Oct 2022 15:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiJNNIr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Oct 2022 09:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiJNNIq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Oct 2022 09:08:46 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5311CBAAD;
        Fri, 14 Oct 2022 06:08:45 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E8xCev031628;
        Fri, 14 Oct 2022 13:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=L4qGYHDlMyemRnk6qneB5Mk1RKKg2MqEDpuZh5iMKjk=;
 b=lNQ1DdUvAy+iUmzajdiLGMDPb+LxCM/5ZDwO+te98TCqyHTYfATE+IvtqKGWzTr/5l2F
 5uM4xtAyQSPJPctDeulUfjR+I2YkaqMGea6ZA2uT0xe9nOWyCa378/HhofJA7nnNc0te
 bFH/b9QNUd9emLzPpvFOvIXrwjZkk7AUCrOIbJeVPU981I4WRH748nqvLwwTcVBPR9IN
 PoHELHWLtYUJKUpuIdOlC6C3Fx+K34azO5qsujr96BE0ygbK0Z1ncnNHldIdO2z6lfia
 kUKVSeuo7aMa4cynD9qfYjUE0Q13DHkKZlGzcyGs3sRpDZg8rvY7BQeTvaLd/9QBf1ri 9g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k73h6gyx6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Oct 2022 13:07:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29ED7qhv012825
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Oct 2022 13:07:52 GMT
Received: from quicinc.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 14 Oct
 2022 06:07:52 -0700
Date:   Fri, 14 Oct 2022 14:05:17 +0100
From:   Graeme Gregory <quic_ggregory@quicinc.com>
To:     Quan Nguyen <quan@os.amperecomputing.com>
CC:     <devicetree@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
        Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
        <thang@os.amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        <openipmi-developer@lists.sourceforge.net>,
        Open Source Submission <patches@amperecomputing.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v10 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Message-ID: <20221014130517.y4mdinylnwfrg6u2@ggregory-linuxws>
References: <20221004093106.1653317-1-quan@os.amperecomputing.com>
 <20221004093106.1653317-2-quan@os.amperecomputing.com>
 <5fbc5a54-60f2-fc0d-a4a1-839f28a4d8ba@quicinc.com>
 <48a5e252-9a1e-65e6-e8bf-add3d39a0286@os.amperecomputing.com>
 <72c8a5bc-830d-25a9-0528-5d428dd9f163@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <72c8a5bc-830d-25a9-0528-5d428dd9f163@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GhBJVq-FaNrcr7G3ZBgPGC6CUcLwXHeR
X-Proofpoint-GUID: GhBJVq-FaNrcr7G3ZBgPGC6CUcLwXHeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_06,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 mlxlogscore=894
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140075
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 10, 2022 at 12:08:24PM +0100, Graeme Gregory wrote:
> 
> On 10/10/2022 02:28, Quan Nguyen wrote:
> > 
> > 
> > On 07/10/2022 20:26, Graeme Gregory wrote:
> > >
> > > On 04/10/2022 10:31, Quan Nguyen wrote:
> > > > The SMBus system interface (SSIF) IPMI BMC driver can be used to
> > > > perform
> > > > in-band IPMI communication with their host in management (BMC) side.
> > > >
> > > > Thanks Dan for the copy_from_user() fix in the link below.
> > > >
> > > > Link: https://lore.kernel.org/linux-arm-kernel/20220310114119.13736-4-quan@os.amperecomputing.com/
> > > > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> > >
> > > I have been testing this on our hardware and I don't seem to be able
> > > to get this driver working. I was using an older version.
> > >
> > > I have hacked ssifbridged to deal with the change in len from u8 to
> > > unsigned int.
> > >
> > > It works as long as I only ever send SSIF commands, any attempt to
> > > read a response crashes the state machine and the driver never
> > > recovers. No further SSIF comms is possible! (slave doesnt even ACK
> > > writes).
> > >
> > > A couple of comments below on possible state machine errors.
> > >
> > > Its possible I am doing something wrong!
> > >
> >
> > Thanks Graeme for the test and the comments.
> >
> > What's your testing hardware?
> >
> > This was tested with Aspeed ast2500 and ast2600 with the patch series
> > [1] below applied.
> >
> > If you use the same hw, could you pick the series and see if any thing
> > improve ?
> >
> > [1] https://lore.kernel.org/all/20210616031046.2317-1-quan@os.amperecomputing.com/
> >
> Thanks, that patch series does stop the state machine crashing.
>
> I am testing on AST2600EVB with A1 rev, but we also have our own DC-SCM with
> A3 chip.
>
> Responses are still not working for me, but I think that may be an error in
> my ssifbridged hacks.
>
> Oct 10 10:54:55 qcom-evb-proto-ccf37d18ea0c ssifbridged[335]: Read ssif
> request message with len=13 netfn=44 lun=0 cmd=2
>
> Oct 10 10:54:55 qcom-evb-proto-ccf37d18ea0c ipmid[312]: BootCode:
> 000000000000000000
>
> Oct 10 10:54:55 qcom-evb-proto-ccf37d18ea0c ssifbridged[335]: Send ssif
> respond message with len=4 netfn=45 lun=0 cmd=2 cc=0
>
> Oct 10 10:54:55 qcom-evb-proto-ccf37d18ea0c kernel: ipmi-ssif-host 0-0010:
> Warn: on_read_requested_event unexpected READ REQUESTED in state=SSIF_READY
>
> Oct 10 10:54:55 qcom-evb-proto-ccf37d18ea0c kernel: ipmi-ssif-host 0-0010:
> Warn: on_stop_event unexpected SLAVE STOP in state=SSIF_ABORTING
>
Just to close the loop on this, I have now fully tested this driver on
our setup internally.

Final hitch turned out to be an aardvark not issuing STOP events between
reads/writes.

Thanks for the work.

Graeme

