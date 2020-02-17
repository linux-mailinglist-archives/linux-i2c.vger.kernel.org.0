Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D890160C04
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 08:59:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgBQH7E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 02:59:04 -0500
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:46912 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726267AbgBQH7E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Feb 2020 02:59:04 -0500
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01H7upEJ015826;
        Sun, 16 Feb 2020 23:58:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pfpt0818; bh=dQZoENo2Gv92RBv3RARtB4LqGW98oOI6hGMRsjftx5U=;
 b=YUpbhrU/GJszXCaBtQis+p68uhRZwPbqLdRgGxHoayERmXcTbQknxeWTxmYE1hcwHKc0
 s+rV0ZYNQuuIQETCnC8aHUV8pUctljtuua978StFxWmLfj98T4GkKxbQx1zABqEuGptb
 WY3eIt7bwABDagio9/KyxhIUSubKmPxA80VPMIGJRWj4GiHd1ABVQW9oabEmZ5Zgp+s1
 qk1tIR8NhJ/6eZof6HRBQMiOPu0zNMy/Renb/4M/wFrXw40vbAaFTF9eGKPaQMXMghDz
 rw6uh3z/ZESPeoD8Sb4NX8dDz1O5PKxm1oFfFfSiTdWAScd4eC/5hoO4K4OJz0oFnvZP Hg== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
        by mx0b-0016f401.pphosted.com with ESMTP id 2y6h1sx56v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Sun, 16 Feb 2020 23:58:50 -0800
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sun, 16 Feb
 2020 23:58:48 -0800
Received: from SC-EXCH01.marvell.com (10.93.176.81) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sun, 16 Feb
 2020 23:58:48 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 SC-EXCH01.marvell.com (10.93.176.81) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Sun, 16 Feb 2020 23:58:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNBEZheGX5ZfA6K4iHv6wS6NefOGrq+bRFwInqSX0X6vjD+nNRnohhs8yTz4Gk5TgAjEjMqeFAnprGGCtWpVGVt2Y9mwg8M6YVjOaLbX7q6yJqXBks6nhjeiuMbjUMc9p2WKuo8pLXMmAotR7Besu2PG/fXGtsIq3akFruhzSL2ck2hnwOIRpuWgaYA79uCOLMDEEzdi10mLny1+o7lq+5E4GlOdF+ENre7U/kddFitpzPLlvpjs9FM6Q1HLZXjBuRIQA6+4R05kaOipQvUQuKt1Ri6OAbPgxOkhI2mvWggQFTjG2SWIDDzC0ht2Xy5wgcrDGn1Y0wk3OHZ7Vxdm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQZoENo2Gv92RBv3RARtB4LqGW98oOI6hGMRsjftx5U=;
 b=mJi5UIjfsbTWiAop3GZzv/PBiZniWCtQQpZem2F55/sA0GNXHkhfZTMEIwo8GBkAqu4/+7Eri00QBF3bheXJU3eFukXWD5e6m4qWUBXlZQ/K0HjcosDS6eZvepYEO5CZiQRqt/8+Ov8JVpTKYjSmhTSXhsMrNtK5fNAb9T23myRdqTSQcBblyhgAkKmwpBHpT/LooirOo2Mwywwr0jmxHn35wI7ic6p146sBl3n2DG2sTbwiBdRfRnBy7KzOwfhVlonSIR/794VscaYSwWxKEdDG9YaeoFRGzZqTjcPoDiymAaxoXW4YMcSuZvKvR1p1PvKVKzwPEqYzfXTXodWl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQZoENo2Gv92RBv3RARtB4LqGW98oOI6hGMRsjftx5U=;
 b=pEu4KR9gaV40Jr0PMTRdGapmPkrWUy4FOIDGNf3dSRcjCvf48x1PAB9BqS1Rtt6lt2f43V72kGYxw+qO/uixuBDY7Qmgk4HeTc/pbQQXdwVg3/9ichECmikAN4E835JaV4NllsociW4yR8ARYkiME0wclcGRAiEEwjc7SfXblMc=
Received: from MN2PR18MB3408.namprd18.prod.outlook.com (10.255.237.10) by
 MN2PR18MB2688.namprd18.prod.outlook.com (20.179.83.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 07:58:47 +0000
Received: from MN2PR18MB3408.namprd18.prod.outlook.com
 ([fe80::30c4:52fe:fdf8:faff]) by MN2PR18MB3408.namprd18.prod.outlook.com
 ([fe80::30c4:52fe:fdf8:faff%7]) with mapi id 15.20.2729.032; Mon, 17 Feb 2020
 07:58:46 +0000
Date:   Mon, 17 Feb 2020 08:58:39 +0100
From:   Robert Richter <rrichter@marvell.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     <linux-i2c@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        "Wolfram Sang" <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.com>,
        George Cherian <gcherian@marvell.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] i2c: convert SMBus alert setup function to return an
 ERRPTR
Message-ID: <20200217075837.2agub5deqdpet3ce@rric.localdomain>
References: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
 <20200210172929.6001-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210172929.6001-2-wsa+renesas@sang-engineering.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-ClientProxiedBy: HE1P192CA0017.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::27)
 To MN2PR18MB3408.namprd18.prod.outlook.com (2603:10b6:208:165::10)
MIME-Version: 1.0
Received: from rric.localdomain (31.208.96.227) by HE1P192CA0017.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend Transport; Mon, 17 Feb 2020 07:58:45 +0000
X-Originating-IP: [31.208.96.227]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c619bcf0-0d1d-4f2b-d9ad-08d7b37f3730
X-MS-TrafficTypeDiagnostic: MN2PR18MB2688:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR18MB2688F4ED3DCA8C02D262EB6AD9160@MN2PR18MB2688.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(376002)(39850400004)(189003)(199004)(26005)(186003)(53546011)(16526019)(6506007)(1076003)(5660300002)(8676002)(81156014)(86362001)(81166006)(8936002)(956004)(66476007)(66556008)(4326008)(478600001)(52116002)(6666004)(7696005)(66946007)(54906003)(9686003)(316002)(2906002)(55016002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR18MB2688;H:MN2PR18MB3408.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Rolhz5Ij8e3HiYCxfdwymAssUwckjR3kBic+/UTtpwpAu0VEa8L6bJULXwv0pJjrqlKAfX2/dW3tRBz0AQlI6EGK1mLS0XIcG/9R3AdxQPHZitJn24rfNbOS4fLdCJa46FxAPZkRmPqnC8w5o72WUqfvFzs3rz4UULdKxE2WOTZXjVjQTwBjeU/an8JTksiVpf3KI6KyZAWu/UyzWELwcSvP6pPUPTA7En7Im3ET2xl2wf00zm+ShoqOQvYrbDlQWCLAwrjGwCVMQZCuWs+dcQWjwGz5RkuNRc1dzyzhfIlaj+uvQ3DM8aMD4aSkgHQd0qV1zv4KDccIhRn0s7v6NMca7IZD37wYbZ33yY4GtaPVSoZZ+BGY3eo/bE5Cni4+H3NAJEcy9mD79GygOBbsABf4khCb9QjPxJtCL0V0NdstYcHaLW1VM076NUvighS
X-MS-Exchange-AntiSpam-MessageData: 8Q3/uB+IOwHuV30uDKgicGbcA5rurFajUyId6WnUF/q+cMnpC8jzJ3QNktB8j8h+GVwEhrOft7Fqzsd0925QvNSzry4wWxAVV+f9S1QCStiab1s/jnHXiRD+3jqSUAutiQi3FbiRQIgFGU5eqhKJ2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c619bcf0-0d1d-4f2b-d9ad-08d7b37f3730
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 07:58:46.8558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsJ/AmWwbyVrxziilaIJSwIxDpUkeueVjS+aGMPHeSqzDViv7x9iWFf9KaqrKgYpukKl4oLHvMlkMZypfwnkIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2688
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-17_04:2020-02-14,2020-02-17 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10.02.20 18:29:25, Wolfram Sang wrote:
> Only few drivers use this call, so drivers and I2C core are converted at
> once with this patch. By simply using i2c_new_client_device() instead of
> i2c_new_device(), we easily can return an ERRPTR for this function as
> well. To make out of tree users aware that something changed, the
> function is renamed to i2c_install_smbus_alert().
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> -struct i2c_client *i2c_setup_smbus_alert(struct i2c_adapter *adapter,
> +struct i2c_client *i2c_install_smbus_alert(struct i2c_adapter *adapter,
>  					 struct i2c_smbus_alert_setup *setup);

This function naming is a bit odd. It creates a struct i2c_client.
Then, there is also i2c_new_client_device() and i2c_new_device(). For
i2c_new_client_device() there are no users at all outside of
i2c-core-base.c (except for Falcon NIC), it is only a wrapper.

So how about reducing the interface to those both only to:?

 i2c_new_device()
 i2c_new_device_smbus()

To avoid a namespace collision it could also get new names using
*_create_*.

Thanks,

-Robert
