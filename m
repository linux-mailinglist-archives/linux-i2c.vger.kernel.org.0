Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4CE26D4EC6
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 19:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbjDCRSa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 13:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbjDCRS3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 13:18:29 -0400
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31161AC;
        Mon,  3 Apr 2023 10:18:27 -0700 (PDT)
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 333GNelU002948;
        Mon, 3 Apr 2023 17:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=rCB5lhMtX0tG1SsWwzZupintWxcWSOqj0yQ4OgrY4MA=;
 b=FpWEratiZxx6QgzfJCAoQzUuFh2b50GQzwIFwtR2PIUHE2nVh6pzB2j2r2Vth9rM9bmq
 Cv04z+Ezb/7Up8cP1ifwOQImxyMy0PWVMABqItGeg5bPKh/wI3ZSdq7wUIenCHxflJ9i
 f6tOPf0dEZFXh4f1pbA7G/SHz0Y1rp6VhZt1sT4LIASG1LiJtwwHmh355jGh/UQtLPYa
 I2tPeUfgadO9QNbK93/SFiBQO1kcnmX9u7noPEKwQLDmryn28StTOa/+0SGXVGuQeOzO
 DEkbpnhoub0xWFgqkI8aCgPOTk2+y3D/n/YkVc5kmJv2/Cz7stoR/tMuXy6PlNymrxg1 qQ== 
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3pr29ark96-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Apr 2023 17:18:02 +0000
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14878.it.hpe.com (Postfix) with ESMTPS id D5E5612EAC;
        Mon,  3 Apr 2023 17:18:00 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 3 Apr 2023 05:18:00 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42
 via Frontend Transport; Mon, 3 Apr 2023 05:18:00 -1200
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 3 Apr 2023 05:18:00 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CH4t8IOR3BLW4YQJTn3tXqZCrBqL4xeHpoToCv8F5k/mT3fuItdVLwfFOWn3VTdsSfXZE+eQyNfCIQvGGw3oIJ3rUPtFB+RUfmDwCDWIVBy2C/R5f+aWvQ4c6bQ3c278M8jWNAMOkeyN1g9QBqTOon1PeXTxvaLcrGLB3ebDVXWbF2zkD+6paWkbjvRJQeMTkpoLmyg0tfA08O5ykWwb5UaNRoXlIhtMIjb5uFiIc/gZLvKBeWKnl7DGPGGClC4cic+iLOdaWf1i8BS9XVA8oDTOZkFsoAMLWGmcnBq2G4ZPYtMfb57g7ZHVEFDO7J3NQu9L7+KMmnhW+j+pyvkfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCB5lhMtX0tG1SsWwzZupintWxcWSOqj0yQ4OgrY4MA=;
 b=Wi2aObra7M1JOBAQYwqwPztt1dloC2HGOPLj09DzPphlP90OyL0fXTNB08q/8dbegoLIgw14vKXVhRHNZKervX6MI8TywpTU0BLWspRu4HWnD1cJV4uFAcyw+OVF82haDV6NgxOOXeeZxKteKIUGnsOBjAqhlYakaYtt03sTMw7BKkVb9esClTWWfgooqVOV1pJFXfcDqFQ4CRH/9WZGgQ4hMdgVahoW4vfwkTdlDIk6HVV+Y+khixHMoQPOrUE6MeBR3qm6Rr+prW0RDEj4FM0s1mCizsX43NsWaez3xJORnROoBgyBJE/tCEUihrVmqJVhOryZoU7+EI423kXc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 MW4PR84MB3293.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1b0::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.30; Mon, 3 Apr 2023 17:17:59 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::ee74:bb9a:75ba:71d3]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::ee74:bb9a:75ba:71d3%8]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 17:17:59 +0000
From:   "Hawkins, Nick" <nick.hawkins@hpe.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        "Verdun, Jean-Marie" <verdun@hpe.com>,
        Wolfram Sang <wsa@kernel.org>, Joel Stanley <joel@jms.id.au>
CC:     Arnd Bergmann <arnd@arndb.de>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: gxp: fix build failure without CONFIG_I2C_SLAVE
Thread-Topic: [PATCH] i2c: gxp: fix build failure without CONFIG_I2C_SLAVE
Thread-Index: AQHZZgDs0hNfVR2yy0ujAn/FRZ2ciK8Z0wDA
Date:   Mon, 3 Apr 2023 17:17:58 +0000
Message-ID: <DM4PR84MB1927213E096523B6ADCB030C88929@DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM>
References: <20230403074939.3785593-1-arnd@kernel.org>
In-Reply-To: <20230403074939.3785593-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|MW4PR84MB3293:EE_
x-ms-office365-filtering-correlation-id: 65dfff09-8bd3-4b02-1650-08db34675f68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C60w/KrJ0Qpeq+qivkbawKGeOrj4irGshuHQfhpKjdOHaifQjshKOcKLxORyOcfbdfj4xtGUe7XosRKE+zhH5FbURACMXZcIei6RRjm3qKDE3tQi51WzhAt08txz0sBhcrdMruoKVL8TuH8ieTQhOAfTv141ENpNUONfI7z5M8YjmILuFsyeRIU4GmyaGLFfw/XN02fUnJmET6VkXa5vy8pjzztDUqR7tH1Bnmr9MzW5SjJ8/T/fSfLDJprm4QhfCHoL1BD47X7b476A1YM3wx19L5rAQFNEcb63vg2HKE6j9k4CB0kNu+VXAYDEqVTsYqrrK78TsVLBXA7t8iBYX42hwhclZ6ziggEyz0YXm5rQCREFiC4qdrfDglN0OIakcUCxZKQW/R6Tcg7aqQJsSTJH8Jhij0CQd/FsAWr4TNC9Q0KSKpDvv4iqtYAlTe2PVyvRiTeroXE4UBxvvPNh9XnNQRZzAKoczw9F/+8Sb+i6jpBQLR/LRNkymiljLoKQ15b1JVBsbsfpSX5yr7vDQ5+szZn3+pLriUjZLGqutfPdIkV3bgLCBbqLXpFyuPB6/aEQl40BWkp1H/x3Z+YE+Iff0ee+sItZypd7sOkEi6UFWVUnkem1lytdb/fO2V0c94dVvC3RMA1gB0bet22nmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199021)(55016003)(122000001)(4326008)(66556008)(66476007)(66946007)(76116006)(64756008)(66446008)(478600001)(316002)(110136005)(54906003)(52536014)(8936002)(5660300002)(8676002)(38100700002)(41300700001)(82960400001)(4744005)(186003)(55236004)(83380400001)(71200400001)(26005)(9686003)(6506007)(86362001)(33656002)(2906002)(38070700005)(7696005)(70780200001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?x5GI+0pUE8Nx4ShSHsNNPngPR/O54Znpmg7HaUdWlMP1vhZbtukijWY+HA?=
 =?iso-8859-1?Q?RjhOeMRD3wpqZ9QDtwqAUcBw0sfO9f9aewFFh71UrR474L3hzGvt7gz3iI?=
 =?iso-8859-1?Q?d/AI6VoPXDpFZuxBu+xwa2pU1sB4zzqSNGMFEcAKJuVq+f/NFusWbCTA79?=
 =?iso-8859-1?Q?jvQzMaNEtLIMoYkSwpviD6w6Id0fHopZTw93x/kvfSdzWgNSLtcm2wneVt?=
 =?iso-8859-1?Q?ZhLWdkjmr7PZ8BUml75nXXC1wOX4kuyeOsZY7A7DtBu1MAwpCi+kGnXUii?=
 =?iso-8859-1?Q?XZpwfzNze8VO5EIqUmAwTWrwQqXf2KxDiufrsr765/SDrkXWwwbohtVyCz?=
 =?iso-8859-1?Q?lEKv3ilkj8aZ2V2MzVNOfYy8uC1zqY4HSFl6CU6CRq4XOveWI89eoOeOBW?=
 =?iso-8859-1?Q?BzsS/Nr61zeZS/IqdWPw9vbuwYst5x43ltASGbiNMePb71lJiDrRBdcwxq?=
 =?iso-8859-1?Q?so1iSq22yT1c6l9/Ggy0vLFs6IwODlRRf0GscL4J2C+nsFnlmGNTyR3mk4?=
 =?iso-8859-1?Q?4HdhftdiYmqQWJsw7LTaXC96SmQckhO9F0opiwC8E1bXpA/TU8dhcjoxfK?=
 =?iso-8859-1?Q?ZRfddBZG454oI/cEjSCcCp+bRWm3s6FhWqv8aJveIXNIqrpNrq3/zglxut?=
 =?iso-8859-1?Q?yx1jSZYpgvWZZ35RhNvSrjMtEHz2pnAkWh8L/ZQK7xCJmMZURAaEAD4CGJ?=
 =?iso-8859-1?Q?AcGlP+KmwGgIA6bxp5n09+qDpXFEZL9YLLJmXkXGNsvSR05MS2RYTMrCGg?=
 =?iso-8859-1?Q?EPiN7SC4TqzLUKqWoIvm/bZ1WtYFQWADudfoDlXVSkC4OsQLUoyL8p1Yeh?=
 =?iso-8859-1?Q?9a3xQY9tqZh9gvhpWP9tWwaUBdqyPA4CIrZ5b6vHtYA/R17jhqSS6+AYPq?=
 =?iso-8859-1?Q?e38PvUE09U2ikQr3TEQWXPmexwckleS61eYii2dUTgbaI7rPo3lQ4l11hM?=
 =?iso-8859-1?Q?IwGEKfn9vICdj8UkXnYhi3cfUda1VhaGMA1anIgoL+DhQ7d/CGJWHHVmTw?=
 =?iso-8859-1?Q?ZNJCYfRTgGWyuU3szGh4qYjQjz1bOVqA2zaZ686oVxk8y3ZIdDA2pMlMbL?=
 =?iso-8859-1?Q?MuucuLm7+XZSe6m9XPTQnBzocVUtHDqI3DiUnqnWXRsIrMULgVXlVG38o7?=
 =?iso-8859-1?Q?yAnoKHxUVS1xaKKK8x3S9Y4mAh6ddyJhLFU6WmUWVPBXO+NY1uBP7SHJXQ?=
 =?iso-8859-1?Q?vWk4mlKAKxNhC0eqxy0Wp3zrmnWeHN3gBQNFJ6bdjKEPhyD+KFMECfqVsn?=
 =?iso-8859-1?Q?Q4LxqOtDlw5S3iIRCB9Xm+E/rFZCSJEOqXlK2xUdqshPgzAVqREBVbvoC8?=
 =?iso-8859-1?Q?GwrBeS8svCdiLz/jOEVZsufNx6wAogbgMMmYXpLczHU2SS9ZKhVOIpnqzh?=
 =?iso-8859-1?Q?3I5usb46/+BuLd3HG59lvDWSJ8KoH42319x0fVWkctVdufLT3zAJQzqleI?=
 =?iso-8859-1?Q?5mj2yF1eMj8CudO89QrNHu8wYYvAGYO0KeGE1zo2LP22YzwgY650x4CtHM?=
 =?iso-8859-1?Q?5iA/K7lDKuXLklNv+siuF12JgrueADj1XmTseLTlF0wAxQ1frw2yvyM/oN?=
 =?iso-8859-1?Q?5MFqggdsyw1XMxsZ0sgZVp45N3VDXsf7CG8e6KdJBiI/UoI3mHNr8kdV2t?=
 =?iso-8859-1?Q?1dg9J6W5hXa+pNDLuKH7BwhhmXL/KoZ6m+?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 65dfff09-8bd3-4b02-1650-08db34675f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 17:17:58.9653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y6XOUFiez2mKMB4rCa1vM6Mlist7ixi90jXmAz4icklrUh2/JyUB3N8C+rurqSSNhbAb6F4hfTmVBJR1Wf6OfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR84MB3293
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: qO25zI8WTJdziDDFMR9HXBLhOze3X6Kl
X-Proofpoint-GUID: qO25zI8WTJdziDDFMR9HXBLhOze3X6Kl
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_14,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=301 bulkscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030130
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> From: Arnd Bergmann <arnd@arndb.de>

> The gxp_i2c_slave_irq_handler() is hidden in an #ifdef, but the
> caller uses an IS_ENABLED() check:

> drivers/i2c/busses/i2c-gxp.c: In function 'gxp_i2c_irq_handler':
> drivers/i2c/busses/i2c-gxp.c:467:29: error: implicit declaration of funct=
ion 'gxp_i2c_slave_irq_handler'; did you mean 'gxp_i2c_irq_handler'? [-Werr=
or=3Dimplicit-function-declaration]

> It has to consistently use one method or the other to avoid warnings,
> so move to IS_ENABLED() here for readability and build coverage, and
> move the #ifdef in linux/i2c.h to allow building it as dead code.

> Fixes: 4a55ed6f89f5 ("i2c: Add GXP SoC I2C Controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for finding and correcting this!

Reviewed-by: Nick Hawkins <nick.hawkins@hpe.com>
