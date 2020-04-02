Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F58619CC28
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Apr 2020 22:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388872AbgDBU7L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Apr 2020 16:59:11 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:15082 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730837AbgDBU7L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Apr 2020 16:59:11 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8651bb0001>; Thu, 02 Apr 2020 13:57:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 02 Apr 2020 13:59:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 02 Apr 2020 13:59:10 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Apr
 2020 20:59:09 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.56) by
 HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 2 Apr 2020 20:59:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwmdrqpttmgpNuucMTsj8cMT1iGU782ZDzDhxB52hoITLv9zJzYo/ELLFXAXzJ44qu4L409MX1JRSpx5ZkRORmBOLE5pFFp/v0Ua75nTpWeE7yC0Uil2ikOrn/Do4hNSGu0zI5rckb5UR/Y3UPhPrUC/KP0lw03kAf98LrYrSVoXqtqLKlbBYtNqu8vZu09/SQhlCjkcwUDm2imCufxF5EoRdP0630/r67xIbwNp0zUz1ZxdNPoD3ASNy+4aisUpxVOpnJrb42UBP3MJsWf/IeQTY9F2kg4tJsfofh3aGFG2v2Bhp85w7Xn6w0z8bV5431X6WB2fCXXg2c7NyzfB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjZPfL+HG0khXSokmkq+AEdMl+eXW1us03S17H1bWsM=;
 b=Jc8iBABvWIYxKISCK0r3MK65rzzNMAnhr07R9ztf2ssKU6+2TG1T1NkqMvdMFhbbruB030xBLuheIQBXt47MwJbieCSlyNhc09HKeiJWPdZxhXl3rmoVb/M3DrtuWCirOZZ4M8e+meq69XoF1ziRuLLw8H5FvZpuNhWIlZv83YdkJgAf8pcZeUzYgYUkNSsZftZ0YtinhvQsRFbEYYXXTcysUYEkx8zW165y8XwL1IdW3V5i+dp3N1q1rxK8tFx6PQqmZ/axOvEh/XVg0b01qlnNRBEy2BLdrCdF2bO/yRYD8Nmm4GNfHj1CIY1I8ODDyoDaZx8g+YMdhAM0+R3v6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (2603:10b6:a03:71::22)
 by BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.23; Thu, 2 Apr
 2020 20:59:08 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::b874:508d:247f:e4f6]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::b874:508d:247f:e4f6%4]) with mapi id 15.20.2856.019; Thu, 2 Apr 2020
 20:59:08 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jian-Hong Pan <jian-hong@endlessm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux Upstreaming Team <linux@endlessm.com>
Subject: RE: [BUG] i2c_nvidia_gpu takes long time and makes system suspend &
 resume failed with NVIDIA cards
Thread-Topic: [BUG] i2c_nvidia_gpu takes long time and makes system suspend &
 resume failed with NVIDIA cards
Thread-Index: AQHWCNiFo9/27/yphUebnXQpkS4yXKhloviAgACuGxA=
Date:   Thu, 2 Apr 2020 20:59:07 +0000
Message-ID: <BYAPR12MB272705C6DEE5182159B0EF26DCC60@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <CAPpJ_edj++oy7_EDN95tM+BPdYFOztpCrRh-cfzFrY6unJb1Rw@mail.gmail.com>
 <20200402103447.GD1886416@kuha.fi.intel.com>
In-Reply-To: <20200402103447.GD1886416@kuha.fi.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-04-02T20:59:05.5506017Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=1f843b3e-610c-496c-9d48-591965f4cf34;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77d1a6ca-921b-4603-c8ef-08d7d748afb0
x-ms-traffictypediagnostic: BYAPR12MB3560:
x-microsoft-antispam-prvs: <BYAPR12MB3560E8DD6624AF546E7834C9DCC60@BYAPR12MB3560.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2727.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(396003)(136003)(346002)(366004)(376002)(39860400002)(71200400001)(81166006)(81156014)(2906002)(186003)(55016002)(9686003)(6506007)(26005)(66446008)(53546011)(52536014)(316002)(33656002)(4326008)(7696005)(86362001)(8676002)(15650500001)(5660300002)(478600001)(110136005)(66556008)(54906003)(64756008)(966005)(76116006)(66946007)(66476007)(8936002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZwVYfyaeYakKg7bOaCV/+FsUOpobuno5Ul5z1qpafz2EVGHFP0wrI4bhZIIcoefjMu4ERaqCmVf2LghnIJREHpVGW44Htw520kTy3ZVii9CE+/wv4tuOxvp5NifppKX72e7GMp4+/J1dGy95qMpjVWHcvJ2qatUU7Sei4prfYX408o000+28bfYbQM16P+8YzjOlaMtdNOUuMV65L1rCxzjd3sVp7jEGrWHE0yJ5KrnW6rwESEaNyePhzl1OkDPB3hXUfn+z2o/vbxxzI+VoAITh841u9GJGOSvDmU81PPlnabtHTYLwGoQZIrDr8WpS2CSsVQ/kdp4gXN074kvsQRDKPf1Gldi+qGJyYJrHMOUDpk3JfBAtRbhNfV/0KPrTCtk0BbWU+PznVoMGHvqrOwZVzAQIL12qbIVOCTRz2bYGUN6qv+RDo18C+bsPbzXQbNHA8amTDXU7EEoDdgUtE7ZHhoNqlpqMtv9dFVtl2hQCsUcmgPoM2LXr34alg6X9UbozOsEGJeI/+QA4r0Hn0Q==
x-ms-exchange-antispam-messagedata: f8G+dIKrJauwKOEx1IYgz0pPQBoHqBcj0UgCxzYTvv+PLh4u7gwEsssmO5Bpzu2iOxYNXEehZB6rk8OrB6+P65RBDf/k7pK0jPDlYpJhVvBlTevYwwqUOrfUmLW43IlS++jkTGgAb+EYLA7g3uLt8Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d1a6ca-921b-4603-c8ef-08d7d748afb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 20:59:07.9921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E7V6oVGY8dS1JsmsHWbD+fJMxCW1kOY3Qhqj5IZLF3E5MvCdrv+uews3DEjqfVfcmpxdhso1TPx3XEyb/FMsVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3560
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585861051; bh=CjZPfL+HG0khXSokmkq+AEdMl+eXW1us03S17H1bWsM=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
         x-forefront-prvs:x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:
         x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=B2dAkwBIFRAakj1hSpLZz6scJEYGtBCab1l8cXZYzWKdwFhB0huAqPPjmEpElGSj5
         hfeFYtLL8yGXJyIvW083DOoe0xb1nAlxhwyeYfky4joe9sJjqeSdUSUiStLVjpWoaX
         0ztYeZdxaOfdF3xkBJu64oI8BdX9GNTIxnddxllaII+lK7/nco0wDYe3CZJB7zr3i/
         R+2+WLQt4caKT8CM4eoW4gxRSbOBbKSLQtUF+HyFDKOEAzcxp0oXgCrVaJ8XssvRbl
         YeSlfhfuD8fMgmbKI4OOaOUyy4YWRMjJ7bXthAAt31U2Gn7iT/gY4KTtiBqq7Ayede
         XyRcWgkyc5DPg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jian

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Thursday, April 2, 2020 3:35 AM
> To: Jian-Hong Pan <jian-hong@endlessm.com>; Ajay Gupta
> <ajayg@nvidia.com>
> Cc: linux-i2c@vger.kernel.org; Linux Kernel <linux-kernel@vger.kernel.org=
>;
> linux-usb@vger.kernel.org; Linux Upstreaming Team <linux@endlessm.com>
> Subject: Re: [BUG] i2c_nvidia_gpu takes long time and makes system
> suspend & resume failed with NVIDIA cards
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> Hi,
>=20
> On Thu, Apr 02, 2020 at 06:22:14PM +0800, Jian-Hong Pan wrote:
> > Hi,
> >
> > We got some machines like Acer desktop equipped with NVIDIA GTX 1660
> > card, Acer Predator PH315-52 equipped with NVIDIA GeForce RTX 2060
> > Mobile and ASUS UX581LV equipped with NNVIDIA GeForce RTX 2060.
> > We found them take long time (more than 50 seconds) to resume after
> > suspend.  During the resuming time, the screen is blank.  And check
> > the dmesg, found the error during resume:
> >
> > [   28.060831] PM: suspend entry (deep)
> > [   28.144260] Filesystems sync: 0.083 seconds
> > [   28.150219] Freezing user space processes ...
> > [   48.153282] Freezing of tasks failed after 20.003 seconds (1 tasks
> > refusing to freeze, wq_busy=3D0):
> > [   48.153447] systemd-udevd   D13440   382    330 0x80004124
> > [   48.153457] Call Trace:
> > [   48.153504]  ? __schedule+0x272/0x5a0
> > [   48.153558]  ? hrtimer_start_range_ns+0x18c/0x2c0
> > [   48.153622]  schedule+0x45/0xb0
> > [   48.153668]  schedule_hrtimeout_range_clock+0x8f/0x100
> > [   48.153738]  ? hrtimer_init_sleeper+0x80/0x80
> > [   48.153798]  usleep_range+0x5a/0x80
> > [   48.153850]  gpu_i2c_check_status.isra.0+0x3a/0xa0 [i2c_nvidia_gpu]
> > [   48.153933]  gpu_i2c_master_xfer+0x155/0x20e [i2c_nvidia_gpu]
> > [   48.154012]  __i2c_transfer+0x163/0x4c0
> > [   48.154067]  i2c_transfer+0x6e/0xc0
> > [   48.154120]  ccg_read+0x11f/0x170 [ucsi_ccg]
> > [   48.154182]  get_fw_info+0x17/0x50 [ucsi_ccg]
> > [   48.154242]  ucsi_ccg_probe+0xf4/0x200 [ucsi_ccg]
> > [   48.154312]  ? ucsi_ccg_init+0xe0/0xe0 [ucsi_ccg]
> > [   48.154377]  i2c_device_probe+0x113/0x210
> > [   48.154435]  really_probe+0xdf/0x280
> > [   48.154487]  driver_probe_device+0x4b/0xc0
> > [   48.154545]  device_driver_attach+0x4e/0x60
> > [   48.154604]  __driver_attach+0x44/0xb0
> > [   48.154657]  ? device_driver_attach+0x60/0x60
> > [   48.154717]  bus_for_each_dev+0x6c/0xb0
> > [   48.154772]  bus_add_driver+0x172/0x1c0
> > [   48.154824]  driver_register+0x67/0xb0
> > [   48.154877]  i2c_register_driver+0x39/0x70
> > [   48.154932]  ? 0xffffffffc00ac000
> > [   48.154978]  do_one_initcall+0x3e/0x1d0
> > [   48.155032]  ? free_vmap_area_noflush+0x8d/0xe0
> > [   48.155093]  ? _cond_resched+0x10/0x20
> > [   48.155145]  ? kmem_cache_alloc_trace+0x3a/0x1b0
> > [   48.155208]  do_init_module+0x56/0x200
> > [   48.155260]  load_module+0x21fe/0x24e0
> > [   48.155322]  ? __do_sys_finit_module+0xbf/0xe0
> > [   48.155381]  __do_sys_finit_module+0xbf/0xe0
> > [   48.155441]  do_syscall_64+0x3d/0x130
> > [   48.156841]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > [   48.158074] RIP: 0033:0x7fba3b4bc2a9
> > [   48.158707] Code: Bad RIP value.
> > [   48.158990] RSP: 002b:00007ffe1da3a6d8 EFLAGS: 00000246 ORIG_RAX:
> > 0000000000000139
> > [   48.159259] RAX: ffffffffffffffda RBX: 000055ca6922c470 RCX:
> 00007fba3b4bc2a9
> > [   48.159566] RDX: 0000000000000000 RSI: 00007fba3b3c0cad RDI:
> 0000000000000010
> > [   48.159842] RBP: 00007fba3b3c0cad R08: 0000000000000000 R09:
> 0000000000000000
> > [   48.160117] R10: 0000000000000010 R11: 0000000000000246 R12:
> 0000000000000000
> > [   48.160412] R13: 000055ca6922f940 R14: 0000000000020000 R15:
> 000055ca6922c470
> >
> > I have filed this to bugzilla and more detail:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D206653
> >
> > Any comment will be appreciated.
>=20
> You are using an outdated kernel, 5.4.0. Please make sure that you can
> reproduce the issue with mainline, or at least with the longterm 5.4.x.
>=20
> Ajay, based on the backtrace, the issue seems to be starting from your I2=
C
> driver. Please take a look at this.

I have replied to Bugzilla
https://bugzilla.kernel.org/show_bug.cgi?id=3D206653#c5

Thanks
> nvpuclic=20
>=20
> thanks,
>=20
> --
> heikki
