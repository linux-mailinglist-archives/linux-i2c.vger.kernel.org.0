Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4EA4B208C
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 09:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237171AbiBKItr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 03:49:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiBKItr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 03:49:47 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08on2052.outbound.protection.outlook.com [40.107.101.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C5AE67;
        Fri, 11 Feb 2022 00:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlaOYhyCVxt2HilbiF+wbMi6cXqdhM8wJTQ6H4EKzCCMfyd1wUlsmqXTwv4Gb6NbZxWFf34tPs/mcPhaaQChm+lcIrknG4wcs2Mjhxt6sFf8a5wyRIurNvXa0vBVJw9QfYPlDoLxZ6/ZnssijY4ctqrNUo5rZe94MobjZDE4ZiAvnspQGNmPQHSO+qoQIOSWSiuKr96n/2wxiI2jd9ESfiEX4/3N6O+QjMdl5P7UVecFR4j0jNzmJcbxEIKMKaHVz0PaDeP4mxeyrjEkl1MeAW/hl9/nKrOXn8XZVuWCOE+HjjBdp9kEhTlXAAQphA5ocRw/G7dNGdz9lpzmfs8CAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlGoXbpus9ZgJ23NuWtZXgHxYySRN9pLAQgvDUCx9c0=;
 b=GA5Un/gURKJAW++dDh7DL1Ia6XxVSVveu6nGeqgadBwyMaqhBssJTvWkEgiEIcxYREBavhm34Moi/S8P8oTb6nN6N22bYhKhZ3M1qSqd6GEqB87yLcmOGWzqIgJ110EnQF+TQzEMkqNEuyi+MprbBVn98ElaiR1mff+sNWHRF9+qUi8dr8tW86n7LNZAOYsqurJC9R7YJpmGidxAfnnQ2juc/hsz8htUSs/IvUgysAOnV3WCoMfrxHDSSvSYEVhi+poDQGpKO2uYkILcVLAdEOgLsKtf7EYRyh3mr5xd2HZgaUL6XiUEygWd3Pu/4ggchFqMYkxKu9M7bj3WImocwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlGoXbpus9ZgJ23NuWtZXgHxYySRN9pLAQgvDUCx9c0=;
 b=ujl58IJhKlALuUYaG0xzlt3oxPjrlfhbOri2WDI7gDk9Ye2JSmYNgB6tt/raksjgKZRWiQdpwJ/kz/UhmKAjXeSEZusRg7UL2UFQLUpXKEuwEgMFcqjxDjuVIBhEHR4NbpPMGQkRKW88DoYEtNL5tk5MAtxxs3V7ws6+L7KeekNdro0VoGiHXl0uzd5Q6ni80/T9NTsDr615YU1dgpVn/fUnsSNMT2byFxGRS14WNN0I5Gph0idAweyozaiN6tXL8dTDuHv4H2pNOEa9lU+VwKLvK+fzx3cIiB6tF3kNh/hhLEukJjWXm+sdNf6kN/pl04b0bzk4tpM/b5mw5U9imw==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by CY4PR1201MB2468.namprd12.prod.outlook.com (2603:10b6:903:d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 08:49:44 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::94d8:5850:e33d:b133]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::94d8:5850:e33d:b133%4]) with mapi id 15.20.4951.021; Fri, 11 Feb 2022
 08:49:44 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        syzbot <syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com>
CC:     "djrscally@gmail.com" <djrscally@gmail.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "johan@kernel.org" <johan@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [syzbot] general protection fault in i2c_setup_smbus_alert
Thread-Topic: [syzbot] general protection fault in i2c_setup_smbus_alert
Thread-Index: AQHYHvrABmtaYMoQ80WZ9sW9XVXmHKyOB6QAgAABooA=
Date:   Fri, 11 Feb 2022 08:49:44 +0000
Message-ID: <DM5PR12MB185081963130725ABE6F38F1C0309@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <0000000000006e988105d72fbe3f@google.com>
 <0000000000001a5dc005d7b5fab1@google.com>
 <YgYgnqnBqRe/pRoo@smile.fi.intel.com>
In-Reply-To: <YgYgnqnBqRe/pRoo@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47b3a3ae-7719-4c6c-6cec-08d9ed3b7390
x-ms-traffictypediagnostic: CY4PR1201MB2468:EE_
x-microsoft-antispam-prvs: <CY4PR1201MB2468BEAA72F76BA17FF2C4D9C0309@CY4PR1201MB2468.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /MKkHR3x/dRUl2RBsowrsf4zMS7oTQnCgHWM+Me5Yzvdbj9wWtWQtYzE+SCUDlyt+5zKHEOl0C557juo/eyh0OUGSQ+DqrTk75tUC8qn94sSzxhm3/VYgPZeYT7nk9UfmSK54tySt4Xn8dsSlhLK9K4wI2eoC6iTbfQ7cTlVsCU6DCTSNtf024iEbO8VLOrVaSySSm4Lm1M/Lyfg9Pl19XKBSVpLkVuTINJWKmCGqmyeP761klTMGIBOSde38e346J7Uiyg3MrRuQTTAAgyE8DEKDXDoMU0auytpdGIThS3AyhmzM7+FD6nShLGVGFatRPFnXtGLuPGKui88XRm4K7ARJLHJJaYOrIuWQBSEinHgqkDVRBDPKZIRckKpvokbEj+/DPi3oDDeEHYZEFWoPAkZsqEshux38GFGfb3Jx29Q75RgzgjQkw63ujfe/2U12diOIqX78axGe14ODQ2ZDF6nXEFdq410vRccxEm2XsdzBAfrs+NtNYyyCfx+g19k+fK/mcd2IJ3KYU2n1D6WsrbAkmjlT+g9UHWHA0UHHwtf6keWtjTiVXHg8oOKqjQwpNjwCr4wKjPod0uGgQKMjGNDCU3mRH9rvgeRYitgCLSvLxEzcO6+wYOPgZQy228eBTUxk3IBeUayn2vWVYUI5+/i2WGcpKT8uk0COgLAgSNU+tFejUgzGjMd8oVM8IwfEI0RNHNWd9OW8Kmh9MYjAob2fEylhXpgshVdrgkGPoeCs3Ce87HiWGWhfooaFDJccCD4mvhwkGkuCMu5WlW/xNTVo3hZfQQazbUjutkHcqEzoyutygSrVd95Eys2IV5muST2UMwvTsYWAUkCWj/Vc7yJOZ70dwI3TZh4GAK63ig=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(66946007)(33656002)(508600001)(54906003)(110136005)(66446008)(38070700005)(7696005)(6506007)(76116006)(71200400001)(8676002)(5660300002)(9686003)(64756008)(66556008)(316002)(8936002)(66476007)(86362001)(26005)(52536014)(7416002)(2906002)(38100700002)(186003)(4326008)(122000001)(966005)(99710200001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ftcOKgF4UWgc5iYU4F3AiatXTUR3moRIuw5MRCTXdSsZXcFeXNSxQ4n4It82?=
 =?us-ascii?Q?3hw3Pe+fNvEEJFAYDtNHIrhmpeS7qRfu6RN1zGvUjXJqB6v1rEP/Bd/zpIPt?=
 =?us-ascii?Q?BDAvJII68IxMMKDlovMhhoJNH3ZVnzPrDiNu3XkX8BBGUnfRjwICrGBltT/r?=
 =?us-ascii?Q?JfH3O1sKi+13vwW4D1UKDX06bx+YHHVnUzlBSvQSZ+NCnyGBMaLE05kHCaPB?=
 =?us-ascii?Q?JZPiiPWWvp3j6IMtQhlVj7fX13fSYcCZlyRMdy9EEtsKm7hGOrOx5CI96X2j?=
 =?us-ascii?Q?xfPrTO2nDjFD0ov4H3NQcyzdTMtcG4pg9qRpwrqdtranvP130sLR68cgiP7A?=
 =?us-ascii?Q?XK6DxruvvJ/+t1TtDlPco+Qhd+2Xi329SxaDHnnvgPJXoZDW/MnHayj5hF0I?=
 =?us-ascii?Q?JsjDbDrXPRUJnEtW3rtkG7ZKXk1NwIgHpsNjAWxOuGDiUXpRQhZh8KwtHIWn?=
 =?us-ascii?Q?nCqAB5K4e+oiivbtPteRmAi9dFmTMO/GXuOLd2GGX0d0xJO8LGYxky62t0hG?=
 =?us-ascii?Q?Wv5UDY/+2EqQFNDGIDbjczJ+BVetwipLkkg3hde4ME2qZz3diVgQg9xjbfvQ?=
 =?us-ascii?Q?KiHCaxsU2xdd32SC/NBIKNcQRc8bRJSLN9dq2bbATHMxQbTF8wOOJbPubeQ4?=
 =?us-ascii?Q?UKex3AeDFMvYD/kJGD88x4IHkWsMfgtg+A+2MYq9SWuuVoL0xbxwG13vgnZz?=
 =?us-ascii?Q?WVTAER91pBEEUjZ+QVVb/4nuRhaW9jLoTTSXv6tgyH7WhPnfz2t3l0npiBO4?=
 =?us-ascii?Q?u7xzQGVLtZPq5UbkNwKZ6yNCTE9eMkvwxM8bwsohZSEjjri77iRXtQsZsr9U?=
 =?us-ascii?Q?AWW+OqZZDbK7/NS4nWXMdu1mpil4mW46P48zqXv6CxmcyZjCrDqntK/Lha0x?=
 =?us-ascii?Q?O+b9do7anAoZ8RfQRjFSK2wlHxN2bAodxZWRDC9rpcCOsTZ4vymvkfMLT/G3?=
 =?us-ascii?Q?4I3+DvCbwojeI8nfcOkUw1vpBnQAZgaG/H7YVjAcBxqTLAAFMCRNsz8QGnV1?=
 =?us-ascii?Q?f02GkwiWDeqMBgSILJ12amU0YKTZSWjWFvYAedixGgBF/796RDS0bD3NschM?=
 =?us-ascii?Q?ES1krGGyHqC0Hb3ofQ2shiZkM27Iv+OUwVO5Gffh7Q8Q/dKgyGlWUkA8m2gI?=
 =?us-ascii?Q?TfXlJZNtO6HHjucxctdCNjqcxvpU2UeOFb0f5oyUuG4WOQJOcxRx9qmTzcS+?=
 =?us-ascii?Q?Bhu2xNFAn2DckXmmauWRa4RDCs2r2RjK893Ax+5JZ6Lha+pIWkFdkZF9ESGE?=
 =?us-ascii?Q?12ZVuB9Ocf4MC8lPbuVG+SoirnK0iO6Ta1pVqVkTwbk24tRWvy8gwLJMcIbW?=
 =?us-ascii?Q?DUn+PK9advR0mv+wjXISMJlv5apBRymzrIduns0/uGBZ7obqygjPzMbZu2cc?=
 =?us-ascii?Q?gM7A8b54Kdb4CvNlniqpNQSSUDZOf00ERKDxZhi1LIXCrgUV4Rn5Swh48bXa?=
 =?us-ascii?Q?j6naCcc54vK7AqA0g/XufqEnj+rvhPyI20/AbqCB0mDtq4JHgKxhRv1BkfEq?=
 =?us-ascii?Q?xfK2fBlZ6z6S6Ucfog1DEjCgpBK7XBeBp1MY6bdTXVqybL4s0I1HniUeY71b?=
 =?us-ascii?Q?tgpuF+KRnYACXpLEFzy9fbV5R6KMXJ3x23vD/qEd6dwd3ZbODTlHbM8WxvCi?=
 =?us-ascii?Q?gx+tTQcYNQgJV8AUtJH6B9M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b3a3ae-7719-4c6c-6cec-08d9ed3b7390
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 08:49:44.6240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WOrLI/RYEMAKM1CQGesqWw0dtQEPBm+dNO7fXDlDtHVBPOcKylajdEEsJclaStNJhq5LD9lDtp6+NxP13ZLACQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2468
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> On Thu, Feb 10, 2022 at 07:51:08PM -0800, syzbot wrote:
> > syzbot has bisected this issue to:
> >
> > commit a263a84088f689bf0c1552a510b25d0bcc45fcae
> > Author: Akhil R <akhilrajeev@nvidia.com>
> > Date:   Fri Jan 28 11:44:27 2022 +0000
> >
> >     i2c: smbus: Use device_*() functions instead of of_*()
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D156c8174=
700000
> > start commit:   ef6b35306dd8 Add linux-next specific files for 20220204
> > git tree:       linux-next
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D176c8174=
700000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D136c8174700=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3De0431e0b008=
10b4f
> > dashboard link:
> https://syzkaller.appspot.com/bug?extid=3D0591ccf54ee05344e4eb
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1105f4727=
00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D16492aa4700=
000
> >
> > Reported-by: syzbot+0591ccf54ee05344e4eb@syzkaller.appspotmail.com
> > Fixes: a263a84088f6 ("i2c: smbus: Use device_*() functions instead of o=
f_*()")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction
>=20
> I was faster :-)
>=20
> https://lore.kernel.org/all/20220204155920.13364-1-
> andriy.shevchenko@linux.intel.com/
>=20
Thanks. I was looking for the details on the issue and found that you had
submitted the fixes. :-)
https://lore.kernel.org/lkml/20220204151726.8924-1-andriy.shevchenko@linux.=
intel.com/T/

Thanks,
Akhil
