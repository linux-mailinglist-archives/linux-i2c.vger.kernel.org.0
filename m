Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2256E28E9
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 19:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjDNRBw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 13:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjDNRBu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 13:01:50 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98B055BD;
        Fri, 14 Apr 2023 10:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0gwfocLjzAgP2LVxcBJMevv2Vz8ZPSBKD2t5beenG15c1tM21+vATS4LE9WqCa1JQnCc37MMMMviSHXmhR1hRUiLlC99XkNyU6MaxqRuO4ZX2ksL/WBxKjWCIp0B4UaeC98ODfxY8NVBv9LQOudu1kR1V0m3YIXvAU4xPPA/eZwVuLI/ewgcbOHwzao3HIN4R5qIEqOCS1nOxvskS4Ki3vy8M+Ey3KfgHRhFBVQ5aoPbqO1KFJo6fVBGNiHeW0AEXbR8XW/Ci7+qlF5CeVV/jSnPW2z1qey7sxQI1Ug4v3UgsjVnnE5K/UBCBqgrRhNe3VT8A6m7wy3c+7zhdAvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6bDm4ziG3mJbW2mvsy9sVMY9GYawME7sXDbkn6hxM8=;
 b=SBtZo2JB8Howbxfc53fdBJ1XWGLRw0oCS75Be2c8qs/Jm3dyodzPtLjo5dIXxdwlQ8/poEN27dyMFjT7UTqL+7xuPN3p7pKK8VSHKycgl01vDbt5CFmrdSUwOBYhcR/KiPw5dp/Q43d1DlocSgt4UMb0m00hVZvYlfYBjWjmYIkYtuEFmibsBx0D8ItiPDbjwMI3AKTPgDh4K/67CsUHHvg61ACNJbJvVAM/IxdLHeZRyzwD+ygjynVRT6bBtcWWqfRx4IY8WVxKtKxFYW4cSAy9+oXU4OM/kVzDDSxhlYjt8FSPfWi4ihsZ9chouqM1PGbxuVsu2hCcj0ecD2hpfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6bDm4ziG3mJbW2mvsy9sVMY9GYawME7sXDbkn6hxM8=;
 b=cBTRuZ9jsqKzPEfDH+FRVyLwhXs+LmakNkXLPDK8drRZnMRpo9rHlrG1z/+nINtOyATGo6KxRbGVtn1gSxvvarOM+/2QYQt19VN8LzAksFlUyqEdDXAHear6eIRr1BrdZNk9jc/JWt0P3dWoAZ4gxzULftzrqeozYwTILtmjgV4=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5167.namprd12.prod.outlook.com (2603:10b6:5:396::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 17:01:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6277.036; Fri, 14 Apr 2023
 17:01:39 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        kernel test robot <lkp@intel.com>
CC:     "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        Mark Hasemeyer <markhas@chromium.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: RE: [PATCH v9 2/2] i2c: designware: Add doorbell support for
 Mendocino
Thread-Topic: [PATCH v9 2/2] i2c: designware: Add doorbell support for
 Mendocino
Thread-Index: AQHZbt8Pv5fqdLVGWkeqwK6oVjESiK8rBK4AgAAC2EA=
Date:   Fri, 14 Apr 2023 17:01:39 +0000
Message-ID: <MN0PR12MB610155210F27281FF959A033E2999@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230414144008.836-3-mario.limonciello@amd.com>
 <202304150012.IieZ4vzl-lkp@intel.com>
In-Reply-To: <202304150012.IieZ4vzl-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-04-14T17:01:37Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=2fea0528-5743-43d9-9459-2fcfee7dbacd;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-04-14T17:01:37Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 8db15970-5657-4c60-ae16-ac44a1970d9a
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DM4PR12MB5167:EE_
x-ms-office365-filtering-correlation-id: 009ca800-9f80-443c-ec52-08db3d09ea5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fdrLAV+y/ZtCHCreObWW7lGlWCgttceFy6p/DL73oX2Y7TS03JH/TRPAoWsmeojfk4TDd+Jp3I62O58lF1Ey5cQlWSwSPdAVysZLUa8hsMor0VvJ20KrFzecyV9HHSrJz93OtOOxLoWMSPK2C4NpejNnlHVrVKGN4bStTrCV9rD1NG+pbb5NMDVGA2R9FrWLtURR1fjWOt0lmvrc2/eqPKvJ/c+xQiXMp617oXhlYTfxFhalezlcR4UgTJYuJqAJppcyu8jpZ+nER3Lh9QJnBiN8C8anASTYdt99eoBzMv0e/V9NbSyAb/W5pqvQF7nyWA06OxPhqjs0OxWVBMuGW5qlb1tJyplxem30iXvumTM4/f6ORX0OwP/mS1atgSTYqxn3Xuivx+TIy7rCw+OUy9qj90JXwS28We0OqDfimMkBVz1nF4XC8bxPunrDdNhsVz8k+McYE1e7ejn348EoVshAyQmRBzLhEGkL04GgYOn0O3z9q+0PnygW7bZjaR/40HxQ6rDFFuGegXkNzkH9S4HhxttmvcjMbHGqQfEFidrclgFvZLc7vjalW4uuSG5X3vZuEm5ZGjThWiqiW70Bq8BkVU2I0ywZBjMjGROX0l5nQLHyydTrAN99SCcy/jEKlcE8rslftOttAoNmsI2RKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199021)(110136005)(9686003)(53546011)(26005)(6506007)(54906003)(55016003)(186003)(83380400001)(966005)(71200400001)(7696005)(5660300002)(33656002)(41300700001)(316002)(8936002)(8676002)(52536014)(38100700002)(38070700005)(86362001)(122000001)(478600001)(66946007)(4326008)(66446008)(76116006)(64756008)(66556008)(66476007)(2906002)(7416002)(19627235002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FfVIJVdW6x7MgZdO4ugKl5x1Sgx8LxELI2/ssN/gdtInInfV6XYUMv5f1zBS?=
 =?us-ascii?Q?lObm6tYHT1fh2WGJJtXxpUZPFkhOwGuS1H+Ylr0c9+C2oHIE6CFo7lHgKn4E?=
 =?us-ascii?Q?BLk50/tRfu9owcmKvfHQtJ9YFqyRuT2WaHfBxeY97/y6NPoLYGBk8o3C7neL?=
 =?us-ascii?Q?1RkuTy2rvZiwWyZEdhN2dmfyppW2j+HcpevB+VuHDVuhXHeKh1VcA4fd2fEU?=
 =?us-ascii?Q?r9xTxUkLo1+VyU4ku8QoLc1HJjsi4P7TUS+26eZnVfkDYsP5Vb0VrVfOJHhz?=
 =?us-ascii?Q?PdSGuWAiQ9uxxOnvTpT6/7kqc2SKjua99O14kNOtIVLDIaN13zPy9BWZmiqL?=
 =?us-ascii?Q?CRwSfFTvy58JYTdaIsoPZQPLcRt63oXicywrALDDBjewozhXBvOIo1OhMSTq?=
 =?us-ascii?Q?kSYlZVZ4dcdT22iQ/BEcE7mKcibuizGFGrcHcibE8fLXY3byGYjaqDdTRe9K?=
 =?us-ascii?Q?s6yvU8F5Ku/UQUhlFwXupciBsFGU0t6uN07NZ/7au1Gc+XoH6Vn/XYeMi7rH?=
 =?us-ascii?Q?HLkhS9rzzbl8Mra0l+YJDXM3cJShl6OTuJXHY1g0fkcnWRxpndzzfabDXEuP?=
 =?us-ascii?Q?gNhxwmHcngT84x1ukQ+KNiuOsvq4BkCeGWbsS/hNcLoZTCbXG3ZX/xiAOGt/?=
 =?us-ascii?Q?wEYEPyVEG88oJcy1n534FsxU9mcg5rxiAq7l9uVu1oUP1P95fknQIJgiwm7b?=
 =?us-ascii?Q?azQ7LuZQq7vCt9btnIMzJkCOEBp9RRSb+E5m4NEk7ivX8zt0BNu75iskLf21?=
 =?us-ascii?Q?mDYuTvyV96uJ1dsN+4ui98JdEh1F06EMEndhn5cWgsL3cZKL4dXBW2N1bnpG?=
 =?us-ascii?Q?XV6Som9bbWE9YYIPUL9ghwGtiETz4PSDKN0iDX75j9TBL4XgrYWk6HO335bK?=
 =?us-ascii?Q?EF5ZOdirQ8cauLri5j2hKF+5TlB3pkPl2vgvpC1PlIz+zayXKYu9cinTVVXh?=
 =?us-ascii?Q?L+QBvRClHVD/+tbfuS5uXgDkzMKO1oGN7whV85DaT6ArMNcr8cLQ5TZ91KYe?=
 =?us-ascii?Q?93bzqgJ2BvMmEdyUiAcpwhEaIyFrBWl2whWvx2Obwm5Eiu/BVCF9b3DGIgYL?=
 =?us-ascii?Q?FfGXQiT+o/Gd7i/mmAwSWCLs0PGHxgqO1ibZEWwcpb1OiPUQnUzfBgFK5Udd?=
 =?us-ascii?Q?zZ+LTHFNvS+ZIhvuLsnM8nehPt1jj4rtMNseZ3tjafuX+LdywrHXKOsaSREB?=
 =?us-ascii?Q?bjHBZQVODG1Q2YcuQPOxLk/nz+uKdbBROWnmK9PaQgY2g/Wuc72VSZIFkdX9?=
 =?us-ascii?Q?E1MmabIGOvKs8hoRgG5H6uGaBHryNOtMX6ezFZ6tqFEarpj8yIWwiiT166RL?=
 =?us-ascii?Q?SN3yqWgNzPHltrb8VVuqTs2Ei/50PRkTBLK/K7+s6xZr0tgm3eDLQnKIl/J8?=
 =?us-ascii?Q?LIEWI2oDn4S1mcLAyyZVJyqbxRQXGBFVEJcX7MXNPmGTIfrBQ3htWF8R2rvy?=
 =?us-ascii?Q?bhK0hG1WdsM4zvbHeaT+rF/CGPA7Snt/4FpS20T7BpXX0xgyAMV9AJwslMjk?=
 =?us-ascii?Q?QPhy1ofuXFBgvMMg1Jr/bacfnbJhPXNNOIWXt8nf0WXDK07DB8PPrXjn5z/E?=
 =?us-ascii?Q?abHOg7qlWHT4U3TjwzY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009ca800-9f80-443c-ec52-08db3d09ea5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 17:01:39.8872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QtDD8sx2SvhGMXbf1I2HFtecls5/cmw6wJtSiodqrlemYdYTbGfu5WYG2FDBG2mF5msvmi4tYo0dlzuRbXQxSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5167
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[Public]



> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Friday, April 14, 2023 11:50
> To: Limonciello, Mario <Mario.Limonciello@amd.com>; Herbert Xu
> <herbert@gondor.apana.org.au>; Jarkko Nikula
> <jarkko.nikula@linux.intel.com>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>; Mika Westerberg
> <mika.westerberg@linux.intel.com>; Jan Dabros <jsd@semihalf.com>
> Cc: oe-kbuild-all@lists.linux.dev; linux-crypto@vger.kernel.org; Limoncie=
llo,
> Mario <Mario.Limonciello@amd.com>; Mark Hasemeyer
> <markhas@chromium.org>; Wolfram Sang <wsa-dev@sang-
> engineering.com>; linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v9 2/2] i2c: designware: Add doorbell support for
> Mendocino
>=20
> Hi Mario,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on next-20230413]
> [cannot apply to wsa/i2c/for-next linus/master v6.3-rc6 v6.3-rc5 v6.3-rc4
> v6.3-rc6]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/=
i2c-
> designware-Use-PCI-PSP-driver-for-communication/20230414-224238
> patch link:    https://lore.kernel.org/r/20230414144008.836-3-
> mario.limonciello%40amd.com
> patch subject: [PATCH v9 2/2] i2c: designware: Add doorbell support for
> Mendocino
> config: x86_64-allyesconfig (https://download.01.org/0day-
> ci/archive/20230415/202304150012.IieZ4vzl-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=3D1 build):
>         # https://github.com/intel-lab-
> lkp/linux/commit/a8ae7845f0c3fcb46f4c37508838fed08dae7eec
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Mario-Limonciello/i2c-designware=
-Use-
> PCI-PSP-driver-for-communication/20230414-224238
>         git checkout a8ae7845f0c3fcb46f4c37508838fed08dae7eec
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 olddefconfig
>         make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/=
i2c/
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304150012.IieZ4vzl-
> lkp@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/i2c/busses/i2c-designware-amdpsp.c: In function
> 'psp_send_i2c_req_doorbell':
> >> drivers/i2c/busses/i2c-designware-amdpsp.c:82:15: error: too many
> arguments to function 'psp_ring_platform_doorbell'
>       82 |         ret =3D psp_ring_platform_doorbell(req->type, &req->hd=
r.status);
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from drivers/i2c/busses/i2c-designware-amdpsp.c:5:
>    include/linux/psp-platform-access.h:51:5: note: declared here
>       51 | int psp_ring_platform_doorbell(int msg);
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
>=20
> vim +/psp_ring_platform_doorbell +82 drivers/i2c/busses/i2c-designware-
> amdpsp.c
>=20
>     77
>     78	static int psp_send_i2c_req_doorbell(struct psp_i2c_req *req)
>     79	{
>     80		int ret;
>     81
>   > 82		ret =3D psp_ring_platform_doorbell(req->type, &req-
> >hdr.status);
>     83		if (ret =3D=3D -EIO)
>     84			return check_i2c_req_sts(req);
>     85
>     86		return ret;
>     87	}
>     88
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

FYI - this failure is because it was tested across wrong tree.  I didn't us=
e
a base commit so it guessed.

Thanks,
