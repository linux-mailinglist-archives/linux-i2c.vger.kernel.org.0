Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64B331903F4
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 04:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgCXDvN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 23:51:13 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4989 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbgCXDvN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Mar 2020 23:51:13 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e7983820000>; Mon, 23 Mar 2020 20:50:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 23 Mar 2020 20:51:10 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 23 Mar 2020 20:51:10 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 03:51:10 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 24 Mar 2020 03:51:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXPINR709ziFwU+VDLtwzVTAynbkQdgc5UpJZAkNGvSJOMHWIHgYc3AsXA5eVKublbCtpHZ6Lf9D5uwd+77mxCUla71mh2qy7ylae8/7dX453ae5016QHoGuGGSIde5iB7z1jh/Llha/McDl6H9Bx4QPHQqTCLpxYPenBZTEBxmBtBwkIpOc9+8TTGSM67uw1epU3PAolsodvPtCnJvDgBIckNbrDjdfa8x25xOaC8sJrzZKfpNZkzw5XMEJM53VUgmfP8AcuvMh8RRgS6MYbUW2oyA3aD2xplyALU04+m70rCniP9zgIFVUUM4dXGEsiuJ+q5NbgdB7SMVl9mTGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU3l0hKHebzvA0hQ77JENKXmGpG0NLH34MUrCP9l0Ho=;
 b=TrWkFENhcDTZc6LJqGha58eFP6mRDA8KwHW+HpMMRn2wBOgBcOwHrwsM6AkqPBwkW+cCn/a2RTR2UTf0NIIDnTGM9+fu/aVtXNNIG5iyEkQBAoS8n4hJiwehhLEqsKmyKRY5MQgEjG13AJZ6GbsXO4p4GnNTYXvhaZ7lfSygQR8ocqc7SZRsge5ijB7eAIeNw2pidrqUms8Jc88x6hXFhYN68yqHkwVgt3clJG7YfWpHQDmE2k+Y1h+3wytEA5fV/XjBQtSvw0/EDXhHHhI9q/p5e/zX0JLuSudqiNS/EdaXiRxowsrftBkSJ0elXr8W6G3m+p3PMDHeQ0jtz0CU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (2603:10b6:a03:71::22)
 by BYAPR12MB3352.namprd12.prod.outlook.com (2603:10b6:a03:a8::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Tue, 24 Mar
 2020 03:51:09 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::b874:508d:247f:e4f6]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::b874:508d:247f:e4f6%4]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 03:51:08 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:I2C CONTROLLER DRIVER FOR NVIDIA GPU" 
        <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: nvidia-gpu: Handle timeout correctly in
 gpu_i2c_check_status()
Thread-Topic: [PATCH] i2c: nvidia-gpu: Handle timeout correctly in
 gpu_i2c_check_status()
Thread-Index: AQHV98ZNTFr9lYhuHEKRpwz8oAZByahVuuuAgACzuwCAABCCgIAArD4Q
Date:   Tue, 24 Mar 2020 03:51:08 +0000
Message-ID: <BYAPR12MB2727F872ED47A1862C8A9CF9DCF10@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20200311165806.12365-1-kai.heng.feng@canonical.com>
 <DA56E103-CAA7-4C28-9528-9EAFF2C717CD@canonical.com>
 <BYAPR12MB2727B1862E56594E4B6A3E0ADCF00@BYAPR12MB2727.namprd12.prod.outlook.com>
 <E6C41EAE-C56D-4FAB-969F-0842F4FF5C18@canonical.com>
In-Reply-To: <E6C41EAE-C56D-4FAB-969F-0842F4FF5C18@canonical.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-03-24T03:51:07.5824598Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=b4303885-5bd7-4a17-be7e-84d84813a564;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [2601:647:5500:817:e4cd:8d36:b72a:5b9e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0142defe-e140-4c4c-9f34-08d7cfa69651
x-ms-traffictypediagnostic: BYAPR12MB3352:
x-microsoft-antispam-prvs: <BYAPR12MB33526FB3EDE77D09AB6E9BF0DCF10@BYAPR12MB3352.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(136003)(366004)(396003)(376002)(6916009)(186003)(4326008)(86362001)(6506007)(81166006)(8676002)(8936002)(7696005)(81156014)(53546011)(33656002)(76116006)(52536014)(64756008)(316002)(55016002)(66476007)(66556008)(54906003)(66946007)(9686003)(2906002)(5660300002)(71200400001)(478600001)(66446008)(70780200001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3352;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6oydTxwzOl+YEKm6PRpWf7gu9IQRsxVrcmNEcpG7DQVNdo/OZ+sy6oirlFQfT92Ogvs/q2mENq6f/4yZYR2XCVhzOFStgLIHnZqBXVM1TI4rdJj3iMFKxshou8fXBCq9kK0IoWso6edhK/y1iIqWCMR1jUMQ7YdQS66cWe9EQ3nTUgUxBJDrCuhT4inKl/aNv4r0Pv2jd5oGpj01YKbOgI5fO0ZM9acNep55U+Aa/rmbfqJUY2qMR3BaSIcSjs+b/ufdMs86ry1OlM/29KULt29g69Y7FndRf5ynu2yw7vvB65hCVOz58iRHJtAkqviK0ikKv97V0o316MNEIeCUFIXR6AGx3UGSP2NRuWvU5PDS93xWLz6aHDV+EE1L7cnTmDbFZbhAFDbKEhE7IoVEKVLGp6TnO4rhWzwRAZKEJCDaQ0KTVuQxy6Dk0miEyLWuB8oZL0ljX80T1iKck3UQPXXp8bXFs4vxynN/3jEiP7kimj6VdNDuDoiJ4OPQiXYM
x-ms-exchange-antispam-messagedata: 2kfQXs8KYV7C8vpU+DdbULkS3Hp16WiA0qoLBEvg3y8b5ymFi2rjwmGBnKxl4LbFeTyzZuXuwfVLzHMBt8myc1fOupXNoeyOTAvJOci4MDbZZIrNAll+yNsP7IdD15ORwayu7xPncM5AAdF9QfOIe9DAWr+d/tFhzxmQEGMDXcj9kAfi1PunU4Tc9Pr4NlgtAxz1ffqlLbLxC+4m2hgYzA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0142defe-e140-4c4c-9f34-08d7cfa69651
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 03:51:08.7528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJ2pJgAUHmeW4VMzJlQUD0kAx8PVaBYMcV/0j+Cqx/Z0tUC7ZOQH/7+Tmrtsf9D+84MoeuULVcWTSQ/OYT4OmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3352
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585021826; bh=iU3l0hKHebzvA0hQ77JENKXmGpG0NLH34MUrCP9l0Ho=;
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
        b=CUap3Hf5MggmkR4DPPf3Gqk/9K4s02NyaVcDhDWR7NEL1Xi4+khPhPSZi6DwMh2Uy
         ZfhjwjoW0FELOug+CL9cUmWzggTCGwl2GNsq3187MsqwHnftANJSZ0DSlCPIq5q5uA
         XU1tmAoGv/AzBBYd6U1HBFwEbOBiFB4Vu0gKDgTH2V1Etq+RSsoJO8STZYiR6epZ5H
         nELanEXlULkIVUdo5nzo8UtivwvuKIXl5aaH00CwM3P/soJ4UE3prOSzmZIHtvmg9a
         nGu4fDV6iYYRzZp1rH88Bl9X6Ecnmf9zC/Kq7B+5cItDcWAuLfBXVxWRowCyijNjBm
         grU0nz9bb8Cpg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Kai-Heng

> -----Original Message-----
> From: linux-i2c-owner@vger.kernel.org <linux-i2c-owner@vger.kernel.org>
> On Behalf Of Kai-Heng Feng
> Sent: Monday, March 23, 2020 10:21 AM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>; open list:I2C CONTROLLER DRIVER
> FOR NVIDIA GPU <linux-i2c@vger.kernel.org>; open list <linux-
> kernel@vger.kernel.org>
> Subject: Re: [PATCH] i2c: nvidia-gpu: Handle timeout correctly in
> gpu_i2c_check_status()
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> Hi Ajay,
>=20
> > On Mar 24, 2020, at 00:47, Ajay Gupta <ajayg@nvidia.com> wrote:
> >
> > Kai-Heng
> >
> >> -----Original Message-----
> >> From: Kai-Heng Feng <kai.heng.feng@canonical.com>
> >> Sent: Sunday, March 22, 2020 10:38 PM
> >> To: Ajay Gupta <ajayg@nvidia.com>
> >> Cc: Wolfram Sang <wsa@the-dreams.de>; Andy Shevchenko
> >> <andriy.shevchenko@linux.intel.com>; open list:I2C CONTROLLER DRIVER
> >> FOR NVIDIA GPU <linux-i2c@vger.kernel.org>; open list <linux-
> >> kernel@vger.kernel.org>
> >> Subject: Re: [PATCH] i2c: nvidia-gpu: Handle timeout correctly in
> >> gpu_i2c_check_status()
> >>
> >> External email: Use caution opening links or attachments
> >>
> >>
> >>> On Mar 12, 2020, at 00:58, Kai-Heng Feng
> >>> <kai.heng.feng@canonical.com>
> >> wrote:
> >>>
> >>> Nvidia card may come with a "phantom" UCSI device, and its driver
> >>> gets stuck in probe routine, prevents any system PM operations like
> suspend.
> >>>
> >>> Let's handle the unaccounted case that the target time equals to
> >>> jiffies in gpu_i2c_check_status(), so the UCSI driver can let the
> >>> probe fail as it should.
> > If status is not seen in 999.5 ms then I don't see any reason why it
> > will come exactly at 1000ms. In fact,  we expect status to be seen
> > within 160ms as per I2C_MST_I2C0_TIMING_TIMEOUT_CLK_CNT (16
> cycle) and
> > I2C_MST_I2C0_TIMING_SCL_PERIOD_100KHZ (10ms/cycle) programmed in
> > I2C_MST_I2C0_TIMING Register. We already have enough extra time to
> > look For response.
>=20
> This is to handle when there's no response.
>=20
> When the while loop terminates because of "time_is_after_jiffies(target)"
> (i.e. target <=3D jiffies), we also need to to handle "target =3D=3D jiff=
ies" case in the
> following if clause to properly timeout.
Ok got it. The change looks fine to me.

Acked-by: Ajay Gupta <ajayg@nvidia.com>

Thanks
> nvpublic
>=20
> I don't think I2C timings here can affect jiffies.
>=20
> Kai-Heng
>=20
> >
> > Thanks
> >> nvpublic
> >>>
> >>> Fixes: c71bcdcb42a7 ("i2c: add i2c bus driver for NVIDIA GPU")
> >>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> >>
> >> A gentle ping...
> >>
> >>> ---
> >>> drivers/i2c/busses/i2c-nvidia-gpu.c | 2 +-
> >>> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c
> >>> b/drivers/i2c/busses/i2c-nvidia-gpu.c
> >>> index 62e18b4db0ed..1988e93c7925 100644
> >>> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> >>> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> >>> @@ -88,7 +88,7 @@ static int gpu_i2c_check_status(struct gpu_i2c_dev
> >> *i2cd)
> >>>              usleep_range(500, 600);
> >>>      } while (time_is_after_jiffies(target));
> >>>
> >>> -     if (time_is_before_jiffies(target)) {
> >>> +     if (time_is_before_eq_jiffies(target)) {
> >>>              dev_err(i2cd->dev, "i2c timeout error %x\n", val);
> >>>              return -ETIMEDOUT;
> >>>      }
> >>> --
> >>> 2.17.1
> >>>
> >

