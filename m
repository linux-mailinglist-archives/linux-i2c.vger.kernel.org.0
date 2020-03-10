Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C72A1809D9
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 22:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgCJVFZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 17:05:25 -0400
Received: from mx0b-00010702.pphosted.com ([148.163.158.57]:13554 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726100AbgCJVFY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 17:05:24 -0400
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Mar 2020 17:05:23 EDT
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
        by mx0b-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02AKgVT8017617;
        Tue, 10 Mar 2020 15:59:13 -0500
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
        by mx0b-00010702.pphosted.com with ESMTP id 2ymaad0neg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Mar 2020 15:59:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caTnoc5qUIufZVfV1OA1KPS1jPhtPHquiosTeg7dznjcc7tD9eMTl6egqr/+fAkkUFjm0q8NTUx+YV6TB6DVy/ardtAbHxBAUesbPFqPWhmQ5kppaP+fLB4mrh9oOWKDe5QAJY/UCCAJ93pdQbPokddCiR0GoVQWVZtgeCBnRXaSfKSKrN4F6AFyCr3XSFaYXkl7bVGGuFq8M4bzFZsjuGcGttIny/MEckS/W29tZw09MqUy22Wj58/ZMaJ3yj1j5LlfpP0GIOhUr+q1JltUZdqaxqertY0ga/ok0h0Uct0wYgRRqN53bM/r8zOr6GH4Wd7y47CvhcaZ96juRUfriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFtDHkts/BbPpVbU01c2WbAWbry+EPbgFUzIR7PrHcI=;
 b=B1Pf8eUcRuA/wJb13tYScAh/5Mw7IjoNBsPD8ufBOEFtXYl/GMnOPUCmSBJ7+d1RjeGPJwxrKbpl74fSl+YuxQQ4I2MpBJN+U5fclOCYSdQMZq8hK6CTNj7o16vLf37ar7naIhjOI5afiSFbFcgageaEQHoUhRPV5JK6nCDgNtSslH995mXQnUeSzKlwh6qLmqCRv46VLJj6Og/vE2H+bT7l07R5xlg8G1DwSZrH6F+w0A0pXgomi4c2dyRL8BwMqm42ooE8s9v7XSYZyU3NeY8xfVD3iB51qxu2n/8pDkqOp1Lhw5YDJiamW/xczR843Q3LzCZKR5+F5l2K/tkEIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFtDHkts/BbPpVbU01c2WbAWbry+EPbgFUzIR7PrHcI=;
 b=MslspAuaBqQ6QVE0E6QcHLATFurg49eQHonr8QFrS5hwh280wjPg/AaOcy6vRR/HvLkCVKUl6I5QWF6slle1IL/rClwMfH3ahb5xwDxjvwEH13i5b2rpS57JkNJz3+Dkuo4d45L1m04L7CJWkID9WA/QJ9Yh+Dd2PVsRxhfc2gg=
Received: from DM6PR04MB4553.namprd04.prod.outlook.com (2603:10b6:5:21::29) by
 DM6PR04MB4875.namprd04.prod.outlook.com (2603:10b6:5:11::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.18; Tue, 10 Mar 2020 20:59:10 +0000
Received: from DM6PR04MB4553.namprd04.prod.outlook.com
 ([fe80::bcf1:ec5e:65f8:8fbb]) by DM6PR04MB4553.namprd04.prod.outlook.com
 ([fe80::bcf1:ec5e:65f8:8fbb%7]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 20:59:10 +0000
From:   Michael Auchter <michael.auchter@ni.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Auchter <michael.auchter@ni.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] misc: eeprom: at24: fix regulator underflow
Date:   Tue, 10 Mar 2020 15:58:40 -0500
Message-Id: <20200310205841.123084-1-michael.auchter@ni.com>
X-Mailer: git-send-email 2.24.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR10CA0024.namprd10.prod.outlook.com (2603:10b6:4:2::34)
 To DM6PR04MB4553.namprd04.prod.outlook.com (2603:10b6:5:21::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from amon.ni.corp.natinst.com (130.164.62.202) by DM5PR10CA0024.namprd10.prod.outlook.com (2603:10b6:4:2::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend Transport; Tue, 10 Mar 2020 20:59:09 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [130.164.62.202]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6449a2c7-6cb6-435f-8b75-08d7c535e138
X-MS-TrafficTypeDiagnostic: DM6PR04MB4875:|DM6PR04MB4875:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB48756521C219C1D3FDAAA57887FF0@DM6PR04MB4875.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-Forefront-PRVS: 033857D0BD
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(136003)(396003)(39850400004)(366004)(376002)(199004)(189003)(478600001)(6486002)(66556008)(8936002)(66476007)(81166006)(81156014)(6666004)(26005)(8676002)(52116002)(86362001)(1076003)(2616005)(2906002)(44832011)(5660300002)(956004)(16526019)(6512007)(4326008)(36756003)(186003)(6506007)(110136005)(316002)(66946007);DIR:OUT;SFP:1102;SCL:1;SRVR:DM6PR04MB4875;H:DM6PR04MB4553.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: ni.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6G32o0clnvIz8aLJidoK5cforw4Txa3Xv/rWlJV8RvBgfDZHVU7WnPw346oVysvAw+8URhYgHGV/ziy+v+EvK2R6bm6gDajz9GM7+VNsuVoVdhrHolDK2C8vaGe3VOaNRTeGLcfLmLcOCa/zCJD/DSOw70LDL5hFd4sMOuOL1BR4U7wSjImN0ugaiVT3z9oZKyjxmLDKBtojr6U3FvoQ22Rnaf6oXJx6R9e8OrM+SdMgK/pjdOLDG2rn5TL/ibcror6EGECMMU7uE3ENwgQXyO4gT9NlQgz00Zosf5JARtuo1J7ixWXCvivmh5jrdmPoyk52uAfDmR2z5Klw/nhJcbSYWjGEr9BvFw0bz2CZegIS3DoIq5uZ34VXx6IYy88N2Fmxff2iRPhuBgQI7vbl6rHejcePolrlfC4d6JrfCNLhnrmy6f1VxMt26hd4J2qG
X-MS-Exchange-AntiSpam-MessageData: cmg9EDcLn2o3vGObhTfvwLG4e2oufBUdHahXypE63UhWkE4eBy6ZMHdX/LhGsk4QArT1t9rBE9DVHrIuh3f/ADwy1UQ9rOOmiwgn7B0zPUpJqH7Fhde4bcGe6nhDXkucavRlv4Aq+ogn/3EG6gcrtQ==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6449a2c7-6cb6-435f-8b75-08d7c535e138
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2020 20:59:10.0581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXE0xmnfLIPHin+YhOpX6jQa/Bey9PLZHigaCe5vYEEPBisywnYbwl1sHGS4GNTd9sUpFCLhrOl2nkbd+kG/jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4875
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-10_13:2020-03-10,2020-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy score=30 phishscore=0
 clxscore=1011 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=650 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2003100123
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The at24 driver attempts to read a byte from the device to validate that
it's actually present, and if not, disables the vcc regulator and
returns -ENODEV. However, between the read and the error handling path,
pm_runtime_idle() is called and invokes the driver's suspend callback,
which also disables the vcc regulator. This leads to an underflow of the
regulator enable count if the EEPROM is not present.

Move the pm_runtime_suspend() call to be after the error handling path
to resolve this.

Signed-off-by: Michael Auchter <michael.auchter@ni.com>
---
 drivers/misc/eeprom/at24.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 031eb64549af..282c9ef68ed2 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -712,13 +712,14 @@ static int at24_probe(struct i2c_client *client)
 	 * chip is functional.
 	 */
 	err = at24_read(at24, 0, &test_byte, 1);
-	pm_runtime_idle(dev);
 	if (err) {
 		pm_runtime_disable(dev);
 		regulator_disable(at24->vcc_reg);
 		return -ENODEV;
 	}
 
+	pm_runtime_idle(dev);
+
 	if (writable)
 		dev_info(dev, "%u byte %s EEPROM, writable, %u bytes/write\n",
 			 byte_len, client->name, at24->write_max);
-- 
2.24.1

