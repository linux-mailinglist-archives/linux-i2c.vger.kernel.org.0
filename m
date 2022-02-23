Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50084C187B
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Feb 2022 17:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242760AbiBWQWl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Feb 2022 11:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242757AbiBWQWl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Feb 2022 11:22:41 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2051.outbound.protection.outlook.com [40.107.96.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B97F75C08;
        Wed, 23 Feb 2022 08:22:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNOfeeI8tXpBJ3pMLxr9ODxSN10fwLXgSxrdrw/FSPj3Bvcr4mKgMiamTScEpTeMMXnlSbT8M5Ycw2YKR/eJcJ8LdjijvjjqnAeBZNUsZwiUciLJCrkdUZ0kUUI0AJxHf3wMAVlb5bI668gf9PZjIFnPBwcdONeUyfIhw7ZLo+RG57YDNgxkkNUPV6INI61cF4OU5Yc00K1oq3flhlV7YkGnM1TdjA9vN7Ij0iIAeOOTEPdvpzhmJucz5FaBqFKhO1YYoje7SdsUCqKFmrQ6BZaJzLYON7aJedenuTU0HMM8//86NNkaLbQ70+3m6BfH2gby1Lo9V1cNMd2enp3ASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVVNsVR6FhRVMvTuRDFiHE3g2Hnac5CE4S0GUYakVFs=;
 b=dcsO8JUoOd8R3Xt2i+wE+JCH6wH4wQe27kIEqMpwXESIxVj27736Rruc+HMnTlYDZwG7pWge+XI0XMD3hzZp1RuH6kgc4L66dbY7xwwc4XhrNk8PespF8vqXoa9U7YrPlO5k5Pu45LvPvn+19wg47ikGuTORtd6tN6mMJxP01b8dex5GDcS6J4PeCZG7kx9h5sJOexX2C4IPXJffBoPAFSQjlObB9ur6gFjUVZPuTbyatny0dBKTps5HAV4VsNYcrJmu3YoL/x/SdgaNeZMAx3XQO6u6bmzjeJdzvbNMnBjLgacBS2qA1OMI1WnQ+QXSaB4DZtzH+1tgm87J9+lbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVVNsVR6FhRVMvTuRDFiHE3g2Hnac5CE4S0GUYakVFs=;
 b=EG6Fn8o9XISch/+Mln+ioGSUWvU0vlGJw9iJmcn3dhgURXtgHMmyNNB8CDZCS8li90AZu4K4PdcvcyVHHT8WJHrAglAzAtDVUj7N8t8dsB4ycjhE/5A5uNv5gmxKazAmlbyn/aP3F9TsAUjHP6HIld15lqFy4MT2n1WiJWXTquU=
Received: from DM6PR02MB6635.namprd02.prod.outlook.com (2603:10b6:5:221::18)
 by BN8PR02MB5889.namprd02.prod.outlook.com (2603:10b6:408:b7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 16:22:08 +0000
Received: from DM6PR02MB6635.namprd02.prod.outlook.com
 ([fe80::f0a5:b805:c932:7f0b]) by DM6PR02MB6635.namprd02.prod.outlook.com
 ([fe80::f0a5:b805:c932:7f0b%5]) with mapi id 15.20.4995.028; Wed, 23 Feb 2022
 16:22:08 +0000
From:   Shubhrajyoti Datta <shubhraj@xilinx.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        git <git@xilinx.com>, Michal Simek <michals@xilinx.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chirag Parekh <chiragp@xilinx.com>
Subject: RE: [PATCH] i2c: cadence: Recover bus after controller reset
Thread-Topic: [PATCH] i2c: cadence: Recover bus after controller reset
Thread-Index: AQHYJ/Kh0wwIuA948EiCDqS/6iOWxKyhK14AgAAnlBA=
Date:   Wed, 23 Feb 2022 16:22:07 +0000
Message-ID: <DM6PR02MB663596AD498BE9D229C74565AA3C9@DM6PR02MB6635.namprd02.prod.outlook.com>
References: <20220222134632.18598-1-shubhrajyoti.datta@xilinx.com>
 <YhY92v3ItYdGV2r2@ninjato>
In-Reply-To: <YhY92v3ItYdGV2r2@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34520cf2-a878-4baa-1c4f-08d9f6e8a335
x-ms-traffictypediagnostic: BN8PR02MB5889:EE_
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-microsoft-antispam-prvs: <BN8PR02MB58897B6662058302D2870CC1AA3C9@BN8PR02MB5889.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q0o0lBUgthJ5U6meO60LZT/w48aZz5/u32ERhy49JdOwqFCpEFIKLHALofDHnCq1ve0TSUCpt6/cpe4X7DXLTy5TkVu1nhGhIBU034tw2dHqOtS/6o2Stpp+7CJmIelpfrdIS157Jfcj+pE+lo9T8tJrdNPiV08xLNWpzLnQQ6jMckOzbw/5d1b6Wix4pVwvU1XNK2D/LC+DE7Q8n8Oe1ePhuwSVmQu5h35H+Pmd0WnBJ2MPgW7373YivFd/BVuQaPOqxi3QkgviJ915yGorvTBilQf703e3zi6ac+7LhHXiHjKe/gODStzjceB02XEqYUQ0avrG+1tM61ssoFm37m/BWqBsbVSqrAhW5vDGam8N3yaWYX069CXdzaogE44NOHp7tdY5gxSfi4QzcUULl2EGWlATgcMXJvAgWUm4SjzBainXkuDw9qoCsDxNEZa8LznHwer6RDSQQ0c4mL7faaDSCDBGNDxr16duaY2faJ82WNRRq/QOZEwTTX4n5hRAWv60L1EpXskTCLTmcjHq7gVBUvBmNqqZSCeBHlFoMfKKy6CZyimG/tnwt+9wNJtWrMIrHYqo7TxF21aOjmbUc0V5IuiPLLTL4OEzEoNjVhhpbItrKCev8dsnBxmxcWq6X+/kh7br+EuS//vYl8NwhIDy5MQKC/oRdsNeE3KaAjkBH09pJ2aWUalWQjCGRQfOxtS5t4zMg4OC9lRPsSne6IGkUf8OBecYrwdujvo2AZ2+XLJ6eOZ6ns2TompBF8vpJZiF3hYFDX3wJIdZWcJRS4J9ReLvekoJBHDAsNfN39E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB6635.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(64756008)(66446008)(66476007)(66556008)(71200400001)(2906002)(122000001)(86362001)(66946007)(38100700002)(38070700005)(4744005)(8676002)(4326008)(52536014)(107886003)(8936002)(83380400001)(55016003)(33656002)(26005)(186003)(54906003)(508600001)(6916009)(316002)(966005)(7696005)(6506007)(5660300002)(9686003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wWL0CUPUZLzWOWtsQH/nszNpndn5KkJ91PDx3FBRXA8nikCEvN4cxMwzC1r8?=
 =?us-ascii?Q?J7iqL1kKRXNomrLrqgVrWPhuh7ylEIUuxnDyav/FPn+2F4ZrcT1Pp6byOIzQ?=
 =?us-ascii?Q?6lY741+8Er9Rxo5jn4btaGRb3Nk09JgJEcyTGbPY7avM4RREhFxyBw+lyPSm?=
 =?us-ascii?Q?ky4/lXG8tfiLWAiDYeUTMR7ZxyVTaW0PuAOI+chXtJfRmAf5QhLpOjO8lag1?=
 =?us-ascii?Q?1TB3CUQmu7Q723GNGZ863zD4bfiKilettbQGqNFh0uFCUi42SPnZh+2kbbxf?=
 =?us-ascii?Q?EJV3bgGp6MQLwv9Do+Ms3PIO2VS9Eti9RyB8Wl6PFZIINsc2LPOaVEwAWghA?=
 =?us-ascii?Q?Rm3qgTpflnzuKDTe5p/llI73fzpu1YrshDJ6jMGjDItnzKZRi7PFb3d5Jk/x?=
 =?us-ascii?Q?I5io46hEfNlhQwkbndwXlonQsa7W3oIQOgJfhXLJdLAO4XQHfyj6YlAzI7/7?=
 =?us-ascii?Q?slKlDA8wpgKCsFpdJ98O+s2pRmB0Q2QbvRUczkbSv6mp7FCTHsmL/gH5dzdq?=
 =?us-ascii?Q?EglvGE5ccLfCcvdRVg1OuKr2XFLn9sZVNU9IRPgLiegYH74oYjIzCELnl9Dd?=
 =?us-ascii?Q?Md3GmQfvCHG4r1nl8fjYHyLvwz9YA+sypwT8qUCA/lJ+2L/EFRUVsM9zllqj?=
 =?us-ascii?Q?laa9bt7cDrMAkdQE/xOdopNm8+7kQfFPqrIH5s9APStpj4pR1fsEj9Lxckfe?=
 =?us-ascii?Q?kTG0p9Kpy5GtqI/LqSaFnbe3bYqbu/O/RKdDDYI0XA+ZD8NjVyK+0b8/uVHQ?=
 =?us-ascii?Q?+woQfvK2fUXao5n0uPK3/z2pS1t/7F/VSg/vldPhObgwPs0c8E+g/hZAyp6s?=
 =?us-ascii?Q?evKmLDEOhPEpUD/dPhDsSX52ZG7oITg/apO92XJE2AzmwnhkEaCTM0MG+OpI?=
 =?us-ascii?Q?QtGyQAXRbTEahDTa2VBwJGl1RWPEaj98ghJFPk9BMlkedticxqkNX0NhPgzw?=
 =?us-ascii?Q?hCvjJvjtRn8ZATZOx4YOEJI/j/2sBEbLQ1dlVmMW+BYoOsrWCbt3d3OzrKis?=
 =?us-ascii?Q?gR4ImLvCFBdFC5qGbm28mQGxm3m1E4qawfY3ikWJQEcrUvC52NYX09yMPzLz?=
 =?us-ascii?Q?3VkLia3bpwqx5h5/t39svsmnE4/lNqE9qEM7AOn22fqa6kWJ7FTmTAexU77z?=
 =?us-ascii?Q?DKFsDtk84OyjCJzkCnjkWTjWAJXBHPX5LOa09tJnImr8uu11C/fGAPvbES4B?=
 =?us-ascii?Q?ksyanvxjx1wcyzM/Q1Xm+ItvQJpYvnmfHS79SaBRUBvH3TSkV6aUWOMTvnaq?=
 =?us-ascii?Q?M60JX1N3JmayiVLCxDxz8jqYLBO2jV+vQGSUsZ+TDv6zk3lq3yXl59wVsZL3?=
 =?us-ascii?Q?toMQ3y6mP68QwTQSuLutYo9U4jCNMieRkTffDGvLjbN4Qp3KLrdQho8EtzI3?=
 =?us-ascii?Q?baTkeVaU3VgtCa5KKwgUTCM05Lo6e1OfSFbJ7t29z0osW+4+/oQus+W3xGbe?=
 =?us-ascii?Q?3vJevMX7hd9fnMngfO9iw5TSAnCd39cmEmjwcAvWzmZjQgR/8l9XXhbnerJo?=
 =?us-ascii?Q?8fHIJaMhmhsH/W6Yf2sPBwJltfsq4sRkiXNbytxOHaGHr/ZAPZOM91Bex4NR?=
 =?us-ascii?Q?D97yA02WdB+1qE363LtuNpZdkg9m2hw/1TtarUMwyW+dVPEJzbIUEDXM+ON/?=
 =?us-ascii?Q?+fNCxF4cWkVATsAnnU1gphQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB6635.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34520cf2-a878-4baa-1c4f-08d9f6e8a335
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 16:22:07.9241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 67EkDhD8jQh7eLiJS8eC5JJvwWetNDV8aj5YAcf917WUNn1qy72WllBzo0+7h1sGAtzitXW36RyqYUwZc0d/qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5889
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Wolfram Sang <wsa@kernel.org>
> Sent: Wednesday, February 23, 2022 7:30 PM
> To: Shubhrajyoti Datta <shubhraj@xilinx.com>
> Cc: linux-i2c@vger.kernel.org; git <git@xilinx.com>; Michal Simek
> <michals@xilinx.com>; linux-kernel@vger.kernel.org; Chirag Parekh
> <chiragp@xilinx.com>
> Subject: Re: [PATCH] i2c: cadence: Recover bus after controller reset
>=20
> On Tue, Feb 22, 2022 at 07:16:32PM +0530, Shubhrajyoti Datta wrote:
> > From: Chirag Parekh <chiragp@xilinx.com>
> >
> > This will save from potential lock-up caused when I2c master
> > controller resets in the middle of transfer and the slave is holding
> > SDA line to transmit more data.
> >
> > Signed-off-by: Chirag Parekh <chiragp@xilinx.com>
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>=20
> The comment from last version has not been clarified or addressed.
>=20
> http://patchwork.ozlabs.org/project/linux-
> i2c/patch/20211129090116.16628-1-shubhrajyoti.datta@xilinx.com/

I missed that apologies.=20

