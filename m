Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CD621D1DF
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 10:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgGMIhq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 04:37:46 -0400
Received: from mail-eopbgr680089.outbound.protection.outlook.com ([40.107.68.89]:47751
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725818AbgGMIhp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Jul 2020 04:37:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xa1z7l/n+2Zf2AGbuGHIDTSmuHFaY/N9RuhvAQlcPU2TtTGuzEZ/OkrKi6NTG2Y8a2tN01k3c793jTi6X2Q7wz4TFaMEzbrU0MrMKgksYQzz9jEpVoxJx/bhJzinpNJcCPifB9B8GKRvVVjFmYEG37GmoQTmjRmzDYtt5CoNk9u7yCLm5gABcxO2VAb3n+JBXU6hyNJWLW4I5UbedjwbNwHpu07jmeMqCkr8+djfQG5LH8C2hq764okvLAPmXCAVLZuDVZxR+Krwmh7VxELJJqVX9CckotQ7dI+K33RLGNcT9u/BfUYxeB1v8tDylctJm/tYfXtxox7iv4aQisPsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF0vsslxsF4FELaqGNwbfp5csyu9NWgPvJh16HI4GQ0=;
 b=RZbkLr2KPgpqc7hbYigMZe63Arv+2J9ETlZVln3t9u1DscvtHIK9FASMjdcine5+EwpSLzCO8sHwcaTeaMjvtHmvscZ8qXaWfALa+7fdaeIg2oWbi3qneLwXMo7QFvG/wOlyx3aGrfKIB+T43CBCaHguHj6CkL/5w75ERjG8kAN604KoD/GPO7cbrpQ/vx1Jwf0xNbwOqj5pcI96HbXraYgdF1iSTXnzhHFt3h71TCBYxjFRzj4QSBNDu9OEFgk0xtSBlcuzRF1A7fZ6L7IvJb7C5IWOfdvtDxCAmrZpSYQuIgfthSc5Vcw0X9uS4hsK1W5dcGLREzUiDrZDc7CwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF0vsslxsF4FELaqGNwbfp5csyu9NWgPvJh16HI4GQ0=;
 b=mVroeD/W+zON3WOiq4YyvdRHjWzMQ6lF30roONPNDenA4F45TRSUQSlE271fhjmJoMFruw4rz3+qib0PhbNc7TBB82CHAhZleyjUEdUuwokOwBVdXPw2rQ5taImZcRslj0HU/IDw9i0DzgRIP/a0yDWzhdCLlMdILCJt6EgorxM=
Received: from BL0PR01CA0027.prod.exchangelabs.com (2603:10b6:208:71::40) by
 DM6PR02MB4923.namprd02.prod.outlook.com (2603:10b6:5:fa::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20; Mon, 13 Jul 2020 08:37:42 +0000
Received: from BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:71:cafe::ce) by BL0PR01CA0027.outlook.office365.com
 (2603:10b6:208:71::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22 via Frontend
 Transport; Mon, 13 Jul 2020 08:37:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT018.mail.protection.outlook.com (10.152.77.170) with Microsoft SMTP
 Server id 15.20.3174.21 via Frontend Transport; Mon, 13 Jul 2020 08:37:41
 +0000
Received: from [149.199.38.66] (port=54390 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jutwP-0007An-RV; Mon, 13 Jul 2020 01:36:01 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1juty1-0007ku-Iy; Mon, 13 Jul 2020 01:37:41 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06D8beGV005183;
        Mon, 13 Jul 2020 01:37:40 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jutxz-0007kb-OG; Mon, 13 Jul 2020 01:37:40 -0700
Subject: Re: [PATCH 5/5] i2c: xiic: Only ever transfer single message
To:     Wolfram Sang <wsa@kernel.org>, Marek Vasut <marex@denx.de>
Cc:     linux-i2c@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
References: <20200613150751.114595-1-marex@denx.de>
 <20200613150751.114595-5-marex@denx.de> <20200613193333.GA6289@kunai>
 <b79cdce5-9eff-411b-e2aa-30365a6bbc3d@denx.de> <20200613194220.GB6289@kunai>
From:   Michal Simek <michal.simek@xilinx.com>
Autocrypt: addr=michals@xilinx.com; keydata=
 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
 0Z1MQlmNcq2bhOMzTxuXX2NDzUZs4aqEyZQ=
Message-ID: <9071bef7-550f-3710-3c03-398cd47d9a9d@xilinx.com>
Date:   Mon, 13 Jul 2020 10:37:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200613194220.GB6289@kunai>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="ceNvNxLqJALj7W92fFJjb5zAE7giUZV30"
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(39860400002)(396003)(346002)(136003)(376002)(46966005)(31686004)(6666004)(54906003)(316002)(70206006)(15650500001)(9786002)(70586007)(21480400003)(31696002)(5660300002)(36756003)(426003)(82310400002)(356005)(8676002)(81166007)(83380400001)(235185007)(2616005)(47076004)(336012)(82740400003)(8936002)(26005)(110136005)(478600001)(2906002)(44832011)(107886003)(4326008)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: deefdc3b-48c7-43b9-7b70-08d8270801fd
X-MS-TrafficTypeDiagnostic: DM6PR02MB4923:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4923D262834C8AEF5CA24719C6600@DM6PR02MB4923.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tYwJ9Zj/10tzG2sr1NcawYk3m3Iz8b7qh/E0F0Pq19abprBbcQTq7bFvxRF8X+nuyfacIiqFlyrfqVTG/5Kq3j4OV3eXHvtWxeFMg5IPpugpLQvrL/bMWE8S11WmAUQA8RRnKL8YvTZrFfn9rHPkiUixvZk45GUjPgNxtW5A41SSdqgL4tIRZMP77D6WIOZGcbuw/SLoKOLC6q+rJ2/8jngVCvrS9pVbwULN1wL3KK7MO1yCZuLLF56tcILVABXXCV8ZnvLxUwPtn/gOHFpjh7DCZbL2U/3hMTbQob3099tH729BfDo0PGffeOS5912gn0WUe6XUtUc4J2YKD/trzR5JsueSAs9AlVi5+S32kq2CdqdbEEts+O9U96+9727wOuGvEkxdp0yPVPfASRGrwJh2grMGVEznX8Ye2j8Ukr3gjyiQtJdD4cCOMIGuxF7N
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2020 08:37:41.9476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deefdc3b-48c7-43b9-7b70-08d8270801fd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4923
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ceNvNxLqJALj7W92fFJjb5zAE7giUZV30
Content-Type: multipart/mixed; boundary="c1bb1RxfbBUH4KlR4U8NHXk2zSyOz97v0"

--c1bb1RxfbBUH4KlR4U8NHXk2zSyOz97v0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 13. 06. 20 21:42, Wolfram Sang wrote:
>=20
>>>> Transferring multiple messages via XIIC suffers from strange interac=
tion
>>>> between the interrupt status/enable register flags. These flags are =
being
>>>> reused in the hardware to indicate different things for read and wri=
te
>>>> transfer, and doing multiple transactions becomes horribly complex. =
Just
>>>> send a single transaction and reload the controller with another mes=
sage
>>>> once the transaction is done in the interrupt handler thread.
>>>
>>> Do we still get a repeated start between messages of a transfer? Or w=
ill
>>> it be a STOP/START combination?
>>
>> Repeated start.
>=20
> Good. That was my high level question. I'll leave the rest of the revie=
w
> then for Michal.
>=20

I have read all reviews in this thread and there should be update on 4/5
and discussion around 2/5 is not done.
That's why please send 1/3/4/5 as v2 and 2/5 separately to deal with
this separately.

Thanks,
Michal


--c1bb1RxfbBUH4KlR4U8NHXk2zSyOz97v0--

--ceNvNxLqJALj7W92fFJjb5zAE7giUZV30
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQbPNTMvXmYlBPRwx7KSWXLKUoMIQUCXwwdUQAKCRDKSWXLKUoM
IfDKAJ9H6tOa7oaSsaGMjeMMDYtkm3TiTQCgh3UYDyREkdgGQX/0uX2U3S6SgN8=
=Olb8
-----END PGP SIGNATURE-----

--ceNvNxLqJALj7W92fFJjb5zAE7giUZV30--
