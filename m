Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F77854D99F
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 07:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiFPFR5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 01:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347612AbiFPFR4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 01:17:56 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2063.outbound.protection.outlook.com [40.107.96.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD01E01C
        for <linux-i2c@vger.kernel.org>; Wed, 15 Jun 2022 22:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZ9tif2NYAX3o/jBbd1ZAvOw+b4bNUp2XMSyCH0NhFDjES7XipjlfxuJ6icvpLqffsoWJnthcKY3qyzMVP+pHu25/H9qqE1FS0A4jhW7ms1l/UTFdF/ud3Rhu2htpEWOwGy748bH185g03ysayL7l4kSFKQsbh0bpHrcjyQmAP9+hRDGKu3Qnnd6e4Edw6AUWGNMDNfKFLURj6Q03cwL1t8KjsjANMGULP4dU84OpnfvywVJH53qlVWQZSJgAIWOCjJ7shWl3zdcFWtZObJq1+lcnUbS4XkK9q64UyhKrr+gT2uc+5EeVLzDlev488JWndkaUgdxh5HMwPKG4wETWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHENdNjwXTENRbTnduY1SqAiCN2hbdxMgPJmloj5rsI=;
 b=ZMn2T7KwEOnRYdY/vWDAtDNdiuYBQDac2ik6PxuGGAQZOPNgdRpiKSNoky4B1+CJcwo/vXzUvgZi953CsFv5a8YU+djNp3n8hVvGdV84tEGYHkHkZpLeveAFwYt+Whbjqxkpum2xo6tr6JXlZyv+8rYtTo0+d7w7Njka4FvdJanyfC1OEy/FI2wFs68YQL0J+pHvfktDwRcvCKswDFsJBQopUECVlmKOY2L1ClLnan31jnPzgFcFJdfp6HAtKgyV/rlvSxc/VQm0E3K9hNkf5p4RtpB4CZqDcskasOEPmzZWgOjBWuTCTGe5X4ijcwrpguw6OBzmDwyTiNJdlqW+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHENdNjwXTENRbTnduY1SqAiCN2hbdxMgPJmloj5rsI=;
 b=EAS8OfqONgjX7KK6uUs0EHAsrogqF1W2eyiHq+Yfl/CUsqHTbnzYC0ojG88/GjZ7F0QzrKtb7QB5w4dhKvGlHKr6H7rs9B4yxeH+zAJZPM7vt5edi/Becu4TpSM/RzS62+0W0rfeprxuKjoy3GbvhL8V4M7zJXLQPWSXE5O4RCc=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 05:17:53 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::59c7:d947:6370:7de6]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::59c7:d947:6370:7de6%7]) with mapi id 15.20.5332.022; Thu, 16 Jun 2022
 05:17:53 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Raviteja Narayanam <rna@xlnx.xilinx.com>,
        "Simek, Michal" <michal.simek@amd.com>,
        Anurag Kumar Vulisha <anuragku@xilinx.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Subject: RE: [PATCH] i2c: cadence: Change large transfer count reset logic to
 be unconditional
Thread-Topic: [PATCH] i2c: cadence: Change large transfer count reset logic to
 be unconditional
Thread-Index: AQHYgEanRCYPJhqiyU+Wzyb/dW4Wqa1Rf8hQ
Date:   Thu, 16 Jun 2022 05:17:52 +0000
Message-ID: <BY5PR12MB4902C8591DE77D38B5C3F09581AC9@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20220614232919.1372621-1-robert.hancock@calian.com>
In-Reply-To: <20220614232919.1372621-1-robert.hancock@calian.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-16T05:17:46Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=aed0efef-a4ca-4f93-9cee-521261c964c6;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55d9e22b-f5d2-410f-380e-08da4f579066
x-ms-traffictypediagnostic: SA0PR12MB4495:EE_
x-microsoft-antispam-prvs: <SA0PR12MB449550C4729B697BD290932281AC9@SA0PR12MB4495.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oIrra7z53wQD5spGsX+Ec1XLJzVVFRKOgchUIFlnC0cji73QAr8GxpYMSF8WhU+aCVbRmhS2gDWpWFrmCFrpyEJL131gTL+GizfGkeWEHpwE48vEb/lX0kUxSt5eayIwZ/y6qwVPwMx+NoKQBtJuwpBOeDrP4TFweXsucDscV8HST6Em/zqqFjtBv3O2UuUWTIaO5TGRrsOKm63vwemesaLC0yefkSOZs8tkSxxzTI+HenqDxDA/YhYYph33sCHKzxlgdb4JGw3yzG0aA8VZR6cQY2IUB08JxFx38/01lVlF+a4wpRKZXnKyt+30NDkTJ1ovt9eybTgZivrt9KxY1lcg1pJwH0XNmyYHNFq2eeQDZPyCCW9mbff0uS9oDCq4HlgdJjTEmMNnzqRur8uLW8WbZW9ZixkRJkg9Qc6Gh7qsw8tLd6P6qyVH9+e0svrN/DJrM01dASfnKFho2g745rGKKhwJEsJ33A5/T7nlia1nnYL9sy1pA5mdcIrIwOYrbej+3Us9i5aCJ1X2rLF2DGDbG835UdUnAEaPGrEYoyjbCBjGlb6pbtx2VCKAWP5JZDNJolJE7PmEz+yJ7Imxcd+4NJigwce6cbnRWCFqQxwtAJqg91btnMXoFTOffiDw3mzTrKeEGiB194VxLFezc31pMjdzzqOgBfyqCrbLd+e47hAmEXekKJjmJDcUZPeoSXXO6krUHljUPC9pY8ZQsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(84040400005)(186003)(4744005)(2906002)(83380400001)(316002)(71200400001)(508600001)(110136005)(54906003)(5660300002)(53546011)(66946007)(7696005)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(76116006)(6506007)(9686003)(26005)(38070700005)(122000001)(33656002)(86362001)(55016003)(38100700002)(8936002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ka2BF4oZP80lZpgBZT0LJ2glyXYCrFlVuomU8a5nTkuQezuMe6jmMQwnRvCy?=
 =?us-ascii?Q?D/P1h9iv3QXUff08KnR9VOKYfRfcvJ6LSn8pC0Q7I+TI3/gqfBlsm6ww3OVq?=
 =?us-ascii?Q?ezsteIFBuNwT5+VK/LWkm9+/8+wN6ShH3k26ou2ln/PKNNR4bL6M1SEvKPdU?=
 =?us-ascii?Q?rEYcTfz1uqE366CuluR+WGCNTH2OYGEH/mf3lfHvbrQ7Us52bL/yMAWfB2Zv?=
 =?us-ascii?Q?c1lU6RBpvpSBpeJ8gSOeM/ucEBdp7XDGn6GDN48ACIpGbGtbO17SHXAf2mOC?=
 =?us-ascii?Q?07USC3JynHYXGbIetjVWGtU0gkmZvn94ru5cXSqTovBrQ8my9MxnVs8pS8nN?=
 =?us-ascii?Q?2Nig0VdeShKkTfHL5SPaK1Vc8T7Glf347Tq+po2amIQWvb5DEFq4GWuQ9YMm?=
 =?us-ascii?Q?spRtNM73GyVrMwCHPdJErtEvlDBOhYFRxCBT+TNuzQQvBCV4/sPID/mqjZBy?=
 =?us-ascii?Q?9PkL4m6f9nTAlIMZbhdEVnaqczvugTRD9jEnDjM/0fchfCi/gFuMDKtOWZgE?=
 =?us-ascii?Q?8tik/65ymPrbTFkEJxxY8YgATAAf+uuWgAzFVKbS8JXoTbgYlRJ9fGy+/jk5?=
 =?us-ascii?Q?pNISi3AIMHyRttIbBJ/Z6QAyW2llwRuDxZchUTQuXw7F5izuPbW5afEqBsGw?=
 =?us-ascii?Q?s/BB4CHun4NESSmHWshzo33U+4Bhp1MRSCXVrj8UFAokbKXaQ0473htKbaU6?=
 =?us-ascii?Q?hQbsOfuoGZOARFykNtom/cxR85SPrczoHk7N0tU3+FWL7qhyI6+csyA6HhWW?=
 =?us-ascii?Q?GoK1Te6/fd+4fkUHWwc3so8NBpInDs4koVHWDcsb9zbbDPLLSOax63KRu6lx?=
 =?us-ascii?Q?Mju+1ws4WtcnhLk9jPX6Rkrg3CEGazYgtSBDWyR4yzGt1DSAUeR8MpvB85+M?=
 =?us-ascii?Q?ApXF65VRF3YSRbGqhaAPL/VQXrr0o2/2TidjFnt+HbjMV0C8RIyI1N8puICn?=
 =?us-ascii?Q?w6ICyWJnIJ4n3xPcmkvRfrkF3v4AxAj89YVdZsy6KbTz06R3iUBj38MAMIgj?=
 =?us-ascii?Q?PJuXZo97/ywOoPpjSUDgzPF78z1AdjcZAiZxRRJCbHjvvfHRaJrv/zAw8U5+?=
 =?us-ascii?Q?9vqC1Qi2X+REtiSxg9ALwNdUSUUJbIw8uVjmj2bQNTWQDI32RB5uDNUHx/JV?=
 =?us-ascii?Q?8YtPbdYvPrwy9EreMC3zHp5KMB6ChiNb71Tk1RyGXEq8tDKdQPv5q+1unEL1?=
 =?us-ascii?Q?5Cq6vwAcBbCWeaPJdbE8xcy4EMH0gnCT0T2xqVTfnnXMgohyrDYXAIyapmO+?=
 =?us-ascii?Q?PZ3+ebK9fOUJIOidLOpyMBp4PpcjENVo1Ft5L/FGP/3pyDf2xxhAkz4ORDMN?=
 =?us-ascii?Q?+XBXvjBW8rPnEt1hticoUiSjCOXUnJvxuoOKrx8MegKo67Yjt2rM9zaTV+lK?=
 =?us-ascii?Q?i92q2QxcMsGESqAueij8xOdHKk94t1tn2AfK+1VEGdU7mxyvP2zJd/nLk6O7?=
 =?us-ascii?Q?qCdbsE8X/eDmyDxDGCjLKz7EaSYj+llGPgzIywPb1VrHU6n/kdDwmkzBVmti?=
 =?us-ascii?Q?/r+LquPSmeFIX2PjFgKlJDorWj4FDu3jaacbuBYLmUX5eqG0aphBZTrFPPpC?=
 =?us-ascii?Q?bGE4+aSLhQW8++oe6lIwfFw3eNN55uT7aTKGbdVJNiflPe9T1DQD9S0Z8yQ5?=
 =?us-ascii?Q?UElHEjJbEEVU6JqJrSlhfQa/4do2hBfmhAiwMyoOmqOLaoMP5rAWfy4Ma/Dw?=
 =?us-ascii?Q?Hh7gzYlEykFy2DBdG9hdPg5+4uWqJSGNuMXWzwa1DitWJndF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d9e22b-f5d2-410f-380e-08da4f579066
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 05:17:52.9401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Y0+35ntLeLZ6ZVdGCaM4SyGJplI/l0u6U0Q6Y/Pn380ahmkfNyK6AW3bJaa9wcyqSBoQR08tcoIAQJuQvoPVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[AMD Official Use Only - General]

Hi ,
Thanks for the patch=20
> -----Original Message-----
> From: Robert Hancock <robert.hancock@calian.com>
> Sent: Wednesday, June 15, 2022 4:59 AM
> To: linux-i2c@vger.kernel.org
> Cc: Raviteja Narayanam <rna@xlnx.xilinx.com>; Michal Simek
> <michals@xilinx.com>; Anurag Kumar Vulisha <anuragku@xilinx.com>;
> wsa@kernel.org; Shubhrajyoti Datta <shubhraj@xilinx.com>; Robert
> Hancock <robert.hancock@calian.com>
> Subject: [PATCH] i2c: cadence: Change large transfer count reset logic to=
 be
> unconditional
>=20
> Problems were observed on the Xilinx ZynqMP platform with large I2C reads=
.
> When a read of 277 bytes was performed, the controller NAKed the transfer
> after only 252 bytes were transferred and returned an ENXIO error on the
> transfer.
>=20
Can you help me reproduce the issue what is the command that you used to ge=
t the failure.
