Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA707084DC
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 17:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbjERPbd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 11:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbjERPbc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 11:31:32 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E95118;
        Thu, 18 May 2023 08:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaYxQ3NSmZizX3GLJ3bMOFdyY+vVJ0och1ks52vv+g7DkL1rYotNIC7FNIXRV5WVLAz+RIvRUya5uiOHHNRmel838FGHZ112HILl8YRE35mJ8/XU7UVwU2UKeEtpSbFFAmBcetXOpXEsCnBwjUfBYoPjdynMEAM8c/1Y0I67Lfmq/8xwObgkunbDsirf+e+G3xHMYY6agNAG9CkazWzeZ7dIDOQtj6a9oJ7+9uFa1MNY6k3CMKQhf/Sd4k5yetiKgHsLlOiCrkNyNogmfiOHu9sxmaB/9P3CbCh7wcMVQqJpuL36L+Z90C9BQm9otHBALbweAaEk8v3+3+6oL7Ywow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIoQV37p/6QbaZiP1wh/UtxK+62Q8n2feIMnSGavYTE=;
 b=YWmdwSEqiSzroL3LWmHNnmyPdCtcBHNbkh+TVP4osRugL6f4wucIXPytXpOhg1nU4VYEjp6RM6WyqafaWtHseJkWevWNIZbTkkuQ+OzWumsUetII52hy3nTmefTLEjqxo+aR/uolpoPnq+j43byY61K9G/xKfTSgowrwLqVFb+99wUqu3kM6flwLqjy+l0h9TxWYqrO/63P52j2ozfb6ECU78xEX6S211Mrt3q8gcR/yHF36xv/KY8qp3YG4g1uzRA+1iQx1j9WTYzIRqqGEEo2XPiOKr+Ks1k2nXC5VPbjWtSipcAbfsFaa2pmpFrU+GRaiqPUu1Avp7Ajbun57dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIoQV37p/6QbaZiP1wh/UtxK+62Q8n2feIMnSGavYTE=;
 b=mmF33iAJ5V0WKFKkm1UuxiqLWfBC6CH2Xs/Chxme8+Y26p85xGrw9IM6BX0W+AVQ8x67gXGARlra6uzy2zQeshBphvskImsyVVEbRryVppb3VsyzQttZaVJft7NAZcj6oWPTk31IFbynOn1ry062/NKPm79TSZnsnZrlEIoBj1E=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 15:31:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5%3]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 15:31:28 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg KH <greg@kroah.com>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "ajayg@nvidia.com" <ajayg@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Quan, Evan" <Evan.Quan@amd.com>,
        "Lazar, Lijo" <Lijo.Lazar@amd.com>,
        "Goswami, Sanket" <Sanket.Goswami@amd.com>
Subject: RE: [PATCH 2/2] usb: typec: ucsi: Don't create power supplies for
 dGPUs
Thread-Topic: [PATCH 2/2] usb: typec: ucsi: Don't create power supplies for
 dGPUs
Thread-Index: AQHZiCcbbwpKIMFk9EOkzitfmMss169etbKAgAAdOoCAAAQ/gIABU8TA
Date:   Thu, 18 May 2023 15:31:27 +0000
Message-ID: <MN0PR12MB6101BB8E0F2A2CD20BD73443E27F9@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230516182541.5836-1-mario.limonciello@amd.com>
 <20230516182541.5836-3-mario.limonciello@amd.com>
 <ZGULZU01tdqm1Xoc@smile.fi.intel.com>
 <2023051742-guiding-footing-3527@gregkh>
 <ZGUneSmV6dJBk7AO@smile.fi.intel.com>
In-Reply-To: <ZGUneSmV6dJBk7AO@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=a1fdf1c4-ba9c-426c-a359-b7d0cc8876a2;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-05-18T15:30:04Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DS0PR12MB8816:EE_
x-ms-office365-filtering-correlation-id: f7a23ea1-2d15-4151-efb6-08db57b4f2a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wNpTpHY9J7h0rwpEgXCvQdnWUADF9UztSEVJhg7IeH/NceNyhFaM2pOUA7P/ltQcZVJkH2abdYPuh4FDNcNPeZ0Qp3ouUuNRAUn0xWAcdqLEGYRRQP0zdmJV8EM36bw/kKuXQUzGzqQnKcv2o6Txm19vjGyPAufHhSsDBw73Jyz73qt8BYwvjlfiK/PM8yWd2rioVUMHcqOoJl7+/o5xvXZ6Jcr03QvIqDLtmoZ3I3ho6qqnHxIHGYnpbGFbvVWcwfMdpWnx6ynondnOdP/M5sgQ/kKVYM0tj3JRaTuwzaPw9ZkLccLthN1LioaRkWhqYTtvsHObApEssSbbO/WDH0viDAl8vAvsosbQzDBw+a4Fked3+o8RkgyHFyZPIrsIITOkfyIRHpYdAKn+/OpzX1+W95Nu+qKUUxDI1IYn7b1N129ta+LuzaM3ZOsxUrCxD35W/bWbnzyQ9xtEkayIhCxR69Y0IPkeXYjcZiC54Xam9I8QzbRweoe7Fgy4+VrhD2Ij843+8SWs+BNmDDkY3V4aadNi52aUn5/9xBBJcmFLvzcrbuRysDIeEhF+aFX73MpGO2YZmWNcwBYsh04OkUqzApWHEy4iH7rwwUjnvl2b0c0zcfO0oY1ztRLbCB+R
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199021)(53546011)(9686003)(6506007)(26005)(83380400001)(33656002)(122000001)(38100700002)(38070700005)(86362001)(186003)(55016003)(54906003)(110136005)(478600001)(2906002)(8676002)(8936002)(316002)(4326008)(41300700001)(52536014)(5660300002)(66556008)(66446008)(66476007)(64756008)(76116006)(66946007)(71200400001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Sw9rBlR++lQOzZFB2CkbSc6LS/m9oEPZ3Xcg2SK5oB8w+COn67CfnNABGYx3?=
 =?us-ascii?Q?s6lQA9MQSku4xj3xbtPwHpFRWJshiK4vku1bDRdYdnffIHcE1/nXj+lpR6XT?=
 =?us-ascii?Q?fnOYStQ2TSaf4hQJhlATXEx/QbTSW8whZUJpEMrRY2A12MQ34h/0RNaY41Mv?=
 =?us-ascii?Q?/xx8qaOG8RJe6hwQ3Jkm7fhgABRGaX+txdKduSjkkjhzdMBE1j/DzySOI98y?=
 =?us-ascii?Q?qnrgcoPftR4AuQB+XwZxiz5KoB3jmyn7gpuMxV6rvpAs9Ut8NpEEmwK5WT3c?=
 =?us-ascii?Q?wGynSBtPthhdxGcncpIqZ1uzGaRZy4i+SpMSPnHssgaAuZqnDjXehTcQE6jl?=
 =?us-ascii?Q?u0HThKnYHVwjR50PsdY3jlo6h0TT084A2lHpgME6dMmPa2phCu+wiziGRbXV?=
 =?us-ascii?Q?gxb7W/Y/GVEq81osl1G51dxZ1Bs6UtXjRLO53O8cnrD0+XwEu6eVOmbKvM3n?=
 =?us-ascii?Q?md0lsF2Oy8J24s4WDTu1LqhBWqcXv4EXAxmXLLEhHQvhhqv8YfYhwKROYk/k?=
 =?us-ascii?Q?p7JqgIyGM0mncmHiXGHDkTg56HGB40xlmRygH6qrenzcBbtnwHsKLZH8KPFv?=
 =?us-ascii?Q?mUEKnyEp5AdqYNLsQbrH7wPhn96daaocmt/Ry4YG090koUwZWyvPYsGMZ3BI?=
 =?us-ascii?Q?eFPGZ8nnu9uJDYm1Cr7Y3bSKqqa8g0kvdG2WWwhbWDyxFXWxMMqLb9Y5Bz9m?=
 =?us-ascii?Q?Qqv+fuL+wP1OHK2dTjnK7xV7bNHUxL4YWpEF9OENg5/PsvZfU2LjCYsyTkVL?=
 =?us-ascii?Q?Hx2BJCD+0k82uJC/qt41BN3P/5pzwHOqR78FDgkYEPDXqn9P9HpoN9ASqdEk?=
 =?us-ascii?Q?YxnmEv3LLNefGC1rBCLJFTKd+czUWXW16BqpXfYQhov7aDZvHn0U4bDdMPqX?=
 =?us-ascii?Q?g5LEcm3/bnIwrvQuh5Gva/cOctYCeitj5zzIzQtQ9vmc0yoRqDolLrriky18?=
 =?us-ascii?Q?xoR7ZUkhsMzJkmR25yHutNE9r1cm5du62NUrLtZIvZriSDvw/f8guG0cV7TT?=
 =?us-ascii?Q?RWoc0E+r5DAGeV8Ts8Rnf6GosI2mD8bkQPiCnLuYlYcpNGxLA+N1Ibw+BZnQ?=
 =?us-ascii?Q?akvi+ti7S0DPSxsBQbEbu/z+ucO6mjo9zZxX0eAGmEBAZ19gxlRMemcvqwM8?=
 =?us-ascii?Q?k8z76YhzgJSXx+7QrP34zOky3D2bv9m2kZAH0gPBdaDqSZFaHIfAvNNDKWTv?=
 =?us-ascii?Q?pHtT+r6xdxrHVUQ+H7nFZR05oe/wt1GzXNfMThEBqDi4e92w7SU4+XyunvH5?=
 =?us-ascii?Q?K3hXXDCE7AvZc+yhwvzdJUGq32EXRKTGuiOsaOTUQCtyKDBM0zdwgMayT0j7?=
 =?us-ascii?Q?zS7xv06CnxLp3JCnAtKczx2z6JhlmQxCyW5f9wZ6dutuCfzmRM2N1p/FUBr2?=
 =?us-ascii?Q?b8N8mqlHWMLZb15nEgENOOaVa//s31tQDxHTEnrOqb0B2PNIvu6CNaf6omKi?=
 =?us-ascii?Q?kDoJLyBX6Y7S0BAs2OWCf9BaHhu/O3CnRW2NvVz0fnyc6JR9tSdp7yT3jmk9?=
 =?us-ascii?Q?d39lLuDlisUZ+sjOB9mW7QzFNHd04Qa0OrUfPwvTUe+y7G2WPvovUvN61tS8?=
 =?us-ascii?Q?6wc0KAE+BhIY6gyuz/4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a23ea1-2d15-4151-efb6-08db57b4f2a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 15:31:27.9444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XOGfpbWdqEQeFlwZTHzrMdyAOezN56IxgvNU/d0ysJwhK0pLu0oiI8H5dyFxtOwFMBkASxzW98T4V443gOV/jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[AMD Official Use Only - General]

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Wednesday, May 17, 2023 2:14 PM
> To: Greg KH <greg@kroah.com>
> Cc: Limonciello, Mario <Mario.Limonciello@amd.com>;
> heikki.krogerus@linux.intel.com; rafael@kernel.org; ajayg@nvidia.com; lin=
ux-
> i2c@vger.kernel.org; linux-pm@vger.kernel.org; linux-kernel@vger.kernel.o=
rg;
> linux-usb@vger.kernel.org; Quan, Evan <Evan.Quan@amd.com>; Lazar, Lijo
> <Lijo.Lazar@amd.com>; Goswami, Sanket <Sanket.Goswami@amd.com>
> Subject: Re: [PATCH 2/2] usb: typec: ucsi: Don't create power supplies fo=
r
> dGPUs
>
> On Wed, May 17, 2023 at 08:58:49PM +0200, Greg KH wrote:
> > On Wed, May 17, 2023 at 08:14:13PM +0300, Andy Shevchenko wrote:
> > > On Tue, May 16, 2023 at 01:25:41PM -0500, Mario Limonciello wrote:
>
> ...
>
> > > > +static const struct property_entry dgpu_properties[] =3D {
> > > > +       /* USB-C doesn't power the system */
> > > > +       PROPERTY_ENTRY_U8("scope", POWER_SUPPLY_SCOPE_DEVICE),
> > > > +       {},
> > >
> > > Comma is not needed in terminator entry.
> >
> > But it's encouraged!
>
> Why?! This might lead to the subtle mistakes going unnoticed during rebas=
es.
> Yes, it's quite unlikely, but it might be still possible to have the empt=
y
> entry in the middle of the array. Why should we shoot ourselves in the fo=
ot
> if we can avoid it without any effort?
>
> Hence I can say it's discouraged.
>

I tend to agree with Andy here, you should never be placing something after=
 the
terminator entry and putting a comma there means a mistake /can/ happen.
I will pick up the tags and respin a v2 with this changed and patch 1 dropp=
ed
since it went through another tree.
