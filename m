Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 265A468A50E
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Feb 2023 22:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233844AbjBCV5Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Feb 2023 16:57:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233802AbjBCV5P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Feb 2023 16:57:15 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33031AB5EC;
        Fri,  3 Feb 2023 13:56:57 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313LUfr6031846;
        Fri, 3 Feb 2023 21:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=vQ5+qWzgpqiVjrznsV2/OvhJ7RTj4rYACnN/rjEubAE=;
 b=DIYh1f+mGXQxFMcaQgQ0WlaYNUGpZRhQ2oqzmWqN3lhWmow3nLM/WAUiKz7dwwpjdFsq
 whKYqbLXeAKvo0VMrxbukUgoO6J11384oDotMoUX9TfirzjPGMds7k+xKRpQ3Up6h20R
 Sb+0I5b3tJWkJxEyCGvnZnEfx4Mv3ZzgfZ2/zrUIic1TzfA3jlW5q7GS6LVSqwSL2O7G
 PA0BgFyBKT9GOSNsGfEOzdn7Ge7GqqVLFENSZNq8PJAqUBDrWVcWZNYW9YGri71t8KJ1
 6Bi6JI5EMC6c0l8KJB1bMvGyRYtqKfwb0I5Atrl94+2Jdp9nshXPSDgeqIDikdRVoM/6 lQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngwd01qxf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Feb 2023 21:56:51 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313LuoRV028692
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 3 Feb 2023 21:56:50 GMT
Received: from quicinc.com (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 13:56:50 -0800
Date:   Fri, 3 Feb 2023 13:56:48 -0800
From:   Guru Das Srinagesh <quic_gurus@quicinc.com>
To:     Elliot Berman <quic_eberman@quicinc.com>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Visweswara Tanuku <quic_vtanuku@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-serial@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: geni-se: Move qcom-geni-se.h to
 linux/soc/qcom/geni-se.h
Message-ID: <20230203215648.GB10258@quicinc.com>
References: <20230203210133.3552796-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230203210133.3552796-1-quic_eberman@quicinc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: drGMzA3-chlOZMczk-1KeNJ8Sr-sk2mv
X-Proofpoint-ORIG-GUID: drGMzA3-chlOZMczk-1KeNJ8Sr-sk2mv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=708 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030198
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Feb 03 2023 13:01, Elliot Berman wrote:
> Move include/linux/qcom-geni-se.h to include/linux/soc/qcom/geni-se.h.
> This removes 1 of a few remaining Qualcomm-specific headers into a more
> approciate subdirectory under include/.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

Reviewed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
