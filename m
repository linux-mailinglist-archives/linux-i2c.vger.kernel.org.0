Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 284A9160F72
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 11:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbgBQKBs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 05:01:48 -0500
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:22344 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726397AbgBQKBr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Feb 2020 05:01:47 -0500
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01H9v07K012051;
        Mon, 17 Feb 2020 02:01:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pfpt0818; bh=NuwKRN4OmdJZGjIO2uVXLEr9jFygoWVGQrxrz8GCASw=;
 b=UD0aZZwOYjqeDCinRQgHaqQT6iSuYMHleFevOXQU/W//LGPPstQohpyZ2xxhavezEiDV
 gw9wBcgrK7RBlKtkCtxfUSStSbApGQu6nq+bnGl2nKKxmn8viA5iYTTxSnNjUX16sUp7
 zWTOurIALXZz0gvHhWdT7ox9JSlTGE3Gk1CPQhp7Y1H6ud+JgoudXbN8gbOenxQgWj4m
 rRYhXUIG3bc/cC+P8p2lypA8hK7jwQ03BfelvcRPBG/msa2+Iqp01cqgOpYGSokqBr/P
 bfCjTHSEiESaMtFXhUukszBEwBM5+aLloyg2wwC+NqRPau8Kgao8tg4ONMJ81qcURII0 Ig== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
        by mx0b-0016f401.pphosted.com with ESMTP id 2y6h1sxhxu-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 17 Feb 2020 02:01:09 -0800
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 Feb
 2020 02:01:07 -0800
Received: from SC-EXCH01.marvell.com (10.93.176.81) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 Feb
 2020 02:01:07 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by SC-EXCH01.marvell.com (10.93.176.81) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 17 Feb 2020 02:01:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5Vz/sGmuG/xzSs/K/0vfwMe9IneG004UfvHxOELR6z7b2BDwcnGgrItu+7R9bTA9MBjbqALo36tfjRsulhc3rljsyaZMzU2hZilFbUbh/Kt3gsXc3Zjj8qpz9PvAESNGrQaDh2x2T1AN4/k2wI9/MqHgc4X891p01DCU/+4RhHpTcdbHDYxYS6ox9CYy2x0cRBm35ubA0MjpnqUS3ddgD7PR5PUdRuemAi+wXd9VszwebKhbeQGw+nuy76eYZe7woHP5jmTGjGF/qEvejf7FkjHTzteoJKIhWcx0VZcFNsCYSid0rmYiaLsh3G4ApaupQFRY5/BfZ8L0WKfBu1CDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuwKRN4OmdJZGjIO2uVXLEr9jFygoWVGQrxrz8GCASw=;
 b=f2NapgGTQGNiFOSVgYE3MjYtReDjhd4cLXsrIUXIziSr8UkbfxXCyWmDnS5abNkNoe2rda7U5Zsq/A2rr0bZbVSfydjluHO1PBoGnBAX+C0pAr3tabycvpg3pP2nzoTVO+3djf5hf9vnfuVzqy/2dXxNgu0k4S6DPiJB9G4aR2eSTaCx1TXKXc/mJy+SSv2jXZ6TEoXRAekArXIHPKLrVwWbV/2UvR/vbktQtGrJ34FtvaeVA9q/nnrzH9ctstIglzclIIcEmb9vR6ak1P/CDgGhdTjaG+HNMfVIxi1yqjRc5R6ib9qfbcUQUoVsthJLL5s9Z32on9IRIZZeZTUifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuwKRN4OmdJZGjIO2uVXLEr9jFygoWVGQrxrz8GCASw=;
 b=IaFtapNoVVAdNmyMymJPBXAki2lSLLWd+PyvtlPFgkwuuhGGgO+2KIWVPaW7nNxBjZFi5L4suwK3JVDCdyOj+8DZ3BLzl/zLN4RNuPLbLXhvUg5CidQogLcDtNyzqFZP0qnW/xknOHGspScK8Av5f08+X4tnC0j4wEygdTqiKSA=
Received: from MN2PR18MB3408.namprd18.prod.outlook.com (10.255.237.10) by
 MN2PR18MB3040.namprd18.prod.outlook.com (20.179.84.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.29; Mon, 17 Feb 2020 10:01:04 +0000
Received: from MN2PR18MB3408.namprd18.prod.outlook.com
 ([fe80::30c4:52fe:fdf8:faff]) by MN2PR18MB3408.namprd18.prod.outlook.com
 ([fe80::30c4:52fe:fdf8:faff%7]) with mapi id 15.20.2729.032; Mon, 17 Feb 2020
 10:01:04 +0000
Date:   Mon, 17 Feb 2020 11:00:57 +0100
From:   Robert Richter <rrichter@marvell.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-i2c@vger.kernel.org>,
        "Benjamin Tissoires" <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Jean Delvare <jdelvare@suse.com>,
        George Cherian <gcherian@marvell.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] i2c: convert SMBus alert setup function to return an
 ERRPTR
Message-ID: <20200217100056.di54osv76xlcnhdj@rric.localdomain>
References: <20200210172929.6001-1-wsa+renesas@sang-engineering.com>
 <20200210172929.6001-2-wsa+renesas@sang-engineering.com>
 <20200217075837.2agub5deqdpet3ce@rric.localdomain>
 <20200217081758.GA2814@ninjato>
 <64a14944-ed27-9f4f-6d1b-e31508c92692@lucaceresoli.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64a14944-ed27-9f4f-6d1b-e31508c92692@lucaceresoli.net>
User-Agent: NeoMutt/20170113 (1.7.2)
X-ClientProxiedBy: HE1PR0701CA0076.eurprd07.prod.outlook.com
 (2603:10a6:3:64::20) To MN2PR18MB3408.namprd18.prod.outlook.com
 (2603:10b6:208:165::10)
MIME-Version: 1.0
Received: from rric.localdomain (31.208.96.227) by HE1PR0701CA0076.eurprd07.prod.outlook.com (2603:10a6:3:64::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.8 via Frontend Transport; Mon, 17 Feb 2020 10:01:02 +0000
X-Originating-IP: [31.208.96.227]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fae5329-6107-49be-03a6-08d7b3904cd0
X-MS-TrafficTypeDiagnostic: MN2PR18MB3040:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR18MB3040290F1BB8A9D4BA66F37FD9160@MN2PR18MB3040.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(199004)(189003)(7696005)(86362001)(52116002)(6916009)(54906003)(316002)(956004)(1076003)(53546011)(6506007)(5660300002)(478600001)(186003)(16526019)(2906002)(15650500001)(81166006)(8936002)(66556008)(81156014)(66946007)(66476007)(9686003)(6666004)(55016002)(8676002)(4326008)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR18MB3040;H:MN2PR18MB3408.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ozb8iYjEnmbHPTJoZDonWC6LyYEus7zYYjOc+2pUYSM2qe9I06kAOSsarmdqy76aykWuPahrkvJfvrsC+XVR0bWIFH3aVPES86SKtg6r6NVv/X4M9KSpc/DRFTM6J0IxiOUPq33udjI6kpdt2ceaUuyZJl8Psh7PsvtCy/ZA4+F9tM4Vf5qtxNY8cFTPN/MXQrkZH1ORZ2CBKclxCOj1V39ZQpwvcn7JS/FqseNhFZuTOevhxeeghWHncuLswefL8RXleYqnzo0l7WRF4XgQN8adoYX6n9N+9AaIyrVGAm9VxG0EQ+qkFQIRc546p+aRQg+yBr5lFGO/r1gsGXT5Il8vPAhJIXSx3EKpwSsVAuH2kPmm28gqWNR7BPUWVTofVxn8E911lHtuBgePtCxAzUURRmabwLDv8AFYhBQ1mf3FRrtUcly5naWfuH5zrHr
X-MS-Exchange-AntiSpam-MessageData: LV9zAUn7e0ZfFzGDKt4sv4KTsQtnWRYkzKT1z5nmcAzhKS7wxUxrd2zqKqwCPwGxGu4rMh8jl0rr0/SBNPhbQ+9vxnYMQk3mjExiBChtvpzIXT8cRUDUt+sz28RUACWtvQKzAlRtzkUqBxY6TP1/HQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fae5329-6107-49be-03a6-08d7b3904cd0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 10:01:04.5415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKhZNtobrcmxXaj7fM9ezUE8NptNzhuAUDkvHlieL8dharlzCzg++IRezB6OvmBavG9dpW8nyeNetLmH7wzwsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3040
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-17_05:2020-02-14,2020-02-17 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17.02.20 10:14:52, Luca Ceresoli wrote:
> Hi,
> 
> On 17/02/20 09:17, Wolfram Sang wrote:
> > 
> >>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >>
> >>> -struct i2c_client *i2c_setup_smbus_alert(struct i2c_adapter *adapter,
> >>> +struct i2c_client *i2c_install_smbus_alert(struct i2c_adapter *adapter,
> >>>  					 struct i2c_smbus_alert_setup *setup);
> >>
> >> This function naming is a bit odd. It creates a struct i2c_client.
> >> Then, there is also i2c_new_client_device() and i2c_new_device(). For
> >> i2c_new_client_device() there are no users at all outside of
> >> i2c-core-base.c (except for Falcon NIC), it is only a wrapper.
> > 
> > i2c_new_device (and friends) returned NULL on error. I am currently
> > converting all i2c_new_* functions to return an ERRPTR. So,
> > i2c_new_client_device is the new function, i2c_new_device is deprecated.
> > If you check v5.6-rc1, you will find many more users. Similarily,
> > i2c_new_dummy is deprecated (and removed already), i2c_new_dummy_device
> > is the new thing.
> > 
> >> So how about reducing the interface to those both only to:?
> >>
> >>  i2c_new_device()
> >>  i2c_new_device_smbus()
> > 
> > Given the above, it would be:
> > 
> > 	i2c_new_client_device()
> > 	i2c_new_smbus_device()
> > 
> > Yet, I think this is too vague. Maybe
> > 
> > 	i2c_new_smbus_alert_device()
> 
> I always found the function naming a bit messy in the linux i2c
> implementation. Among the names proposed in this thread,
> i2c_new_smbus_alert_device() is the only one that makes sense to me for
> the new function: it is not vague, and it is coherent with other names
> of recently introduced functions (i2c_new_*_device()). Of course the
> "alert device" is not a real device, but it looks like it is as it has
> its own "slave" address. So I vote for this name...

Yes, better fix the naming now that the i/f is new. As all these
function create a i2c_client struct, the whole set of functions could
be also named i2c_client_create*() with specialized functions such as
i2c_client_create_smbus() or so. It will be clear it is a subset.

Anyway, it's just a function name, but while reading the code it was
not obvious to me that i2c_install_smbus_alert() is actually a subset
of i2c_new_client_device(). That said, I like the i2c_client_create*()
variants.

-Robert
