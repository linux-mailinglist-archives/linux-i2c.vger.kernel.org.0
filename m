Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398CB6A61A8
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Feb 2023 22:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjB1VmM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Feb 2023 16:42:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjB1Vl7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Feb 2023 16:41:59 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D23137721
        for <linux-i2c@vger.kernel.org>; Tue, 28 Feb 2023 13:39:12 -0800 (PST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31SLBYtg010066;
        Tue, 28 Feb 2023 21:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=vVS00Tiu6FIln2gNm8ULlFBk1C6mTSgIZmUN9e1SqZU=;
 b=rurB6fvXH0TeBLWP/Y/hB+Ltt69xide69MXl3HtxiI9TbtAlJNaVCjW3Z0k3ITR0yRBz
 A8k/e5Pif1I0y9MYpEh073pZ2GtNt9BzKtrwBmVnaS0IZJqYVrpe+tiI3s0StbTIVFpu
 eVkB0zvQO5gCed/0Bil3AH85vKLNsk7jB9tWec+aOyaxwQbpiLnN53AI+Hty4emjQAz4
 gOhMPkue2/NE4kugaIoChZPmwKj/fkDNziY22CVb1XSUY73lokEGmmfChFb6mF2sR28E
 V+k9AepQx4GIKJkPm78OeDWj6NMYotAo8RITTaxlLqtbtjsTEk8h6dZdr0ogBhMskw1l Mg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p1sad0ndg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Feb 2023 21:38:07 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31SKaaKw013020;
        Tue, 28 Feb 2023 21:38:05 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
        by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3nybcq3m99-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Feb 2023 21:38:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
        by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31SLc3rv23855466
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Feb 2023 21:38:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1C73320043;
        Tue, 28 Feb 2023 21:38:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 914BC20040;
        Tue, 28 Feb 2023 21:38:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Tue, 28 Feb 2023 21:38:02 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 085FE60409;
        Wed,  1 Mar 2023 08:37:55 +1100 (AEDT)
Message-ID: <f46474aed9f6e06c444c5c53b7545b9ee7ef9604.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] i2c: Build I2C_PASEMI with COMPILE_TEST
From:   Benjamin Gray <bgray@linux.ibm.com>
To:     kernel test robot <lkp@intel.com>, linux-i2c@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
        Sven Peter <sven@svenpeter.dev>, mpe@ellerman.id.au
Date:   Wed, 01 Mar 2023 08:37:54 +1100
In-Reply-To: <202302281135.KsarHDzl-lkp@intel.com>
References: <20230227233318.120415-2-bgray@linux.ibm.com>
         <202302281135.KsarHDzl-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0m9uPqAI9YcqbKzvwxoy5dm0YFpk_Jvd
X-Proofpoint-ORIG-GUID: 0m9uPqAI9YcqbKzvwxoy5dm0YFpk_Jvd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_17,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=532
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280176
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Heh, that's what I get for only trying the defconfig. This patch was
just a possible bonus though, only the first one is important.
