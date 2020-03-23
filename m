Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFC918FA4C
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 17:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbgCWQrW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 12:47:22 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9728 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbgCWQrV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Mar 2020 12:47:21 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e78e7eb0000>; Mon, 23 Mar 2020 09:46:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 23 Mar 2020 09:47:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 23 Mar 2020 09:47:19 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Mar
 2020 16:47:19 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 23 Mar 2020 16:47:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3Zq3LF2dvTPSUU201sEvh81XZKxNFrOzTnVT/QBsYjn8nIRef8kV7UlMP3fnduSsQaotYKnH/zYKVMvA8I01LWHuoQbDdXvzmvf3ayog5ITFUJvnmwPUtQJPHDZvUkbngp2ttZbTQgD/wnpG/7i9+jhleMgQdbknwxKqKVrtFCkFtm14HvLjogfP+B8+zLVcYmDiVbWc0B/YSyLtCLlGcPNdpUta8t370/S6+vWL4+JQZ8JziN9tqzMTMuM4htbicbFFDUiTHdloz8aO6BEeyXPs9HPY9laKD4os9HFXsUfzlfZjW591HL/GhfAug3FK1mRimw45JVdXOTLhmmelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJsVi6im2ZZXOG2lpiKxUTbuFe4ibOj/GD1c/hhXIak=;
 b=H0Wf+dfrDhTyyR8/BBOMiLn5+nO6brMd94CZVRIze81opYzE1Wi1Y1AdvAJFGpQ9YPa4strzd7ASQ1Y4HlEEvA7X5pf2Bw4jWYKcd34msdlmYeeWuLBZ0ou9i+LADiVaYRC0OGKpJney1Pm6qw9Ds9Be3PfhcP+n6GXF4na9bGrnukm6AhTAkzf3Y3szN+eC7iSdNOHzRukCDZD3+oG4JNoPB4BIp7EdgIoqLr4jVnWJyxJEG/Ziz5O79l7frIj3rJX06BeW/5ye2DsN9nLg7wCtgpMWfG9f5h80p3qTxp64ui1smm1gI9Rjw3BSD8C6Jm8SCBzoprBEvUTD5GOrnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (2603:10b6:a03:71::22)
 by BYAPR12MB2744.namprd12.prod.outlook.com (2603:10b6:a03:69::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Mon, 23 Mar
 2020 16:47:17 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::b874:508d:247f:e4f6]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::b874:508d:247f:e4f6%4]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 16:47:17 +0000
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
Thread-Index: AQHV98ZNTFr9lYhuHEKRpwz8oAZByahVuuuAgACzuwA=
Date:   Mon, 23 Mar 2020 16:47:17 +0000
Message-ID: <BYAPR12MB2727B1862E56594E4B6A3E0ADCF00@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20200311165806.12365-1-kai.heng.feng@canonical.com>
 <DA56E103-CAA7-4C28-9528-9EAFF2C717CD@canonical.com>
In-Reply-To: <DA56E103-CAA7-4C28-9528-9EAFF2C717CD@canonical.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-03-23T16:47:16.5021139Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=5e4ad8e0-5209-4558-b003-a0f0eb2da94a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [2601:647:5500:817:e4cd:8d36:b72a:5b9e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 291f64c5-7879-42d2-0c20-08d7cf49d91a
x-ms-traffictypediagnostic: BYAPR12MB2744:
x-microsoft-antispam-prvs: <BYAPR12MB27440F03B0C8FF76FED908A1DCF00@BYAPR12MB2744.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(396003)(39860400002)(346002)(366004)(199004)(66446008)(8676002)(86362001)(76116006)(66556008)(81166006)(8936002)(52536014)(2906002)(186003)(33656002)(71200400001)(55016002)(53546011)(316002)(7696005)(9686003)(54906003)(81156014)(64756008)(6506007)(66946007)(478600001)(6916009)(5660300002)(66476007)(4326008)(70780200001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2744;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ET0+eF8jYLx/TmySDnmqMpNa+0ztxFhPO4h/y5ZeuaVHNJEYtWKEozk0FCCSwUyUidKysft6rnmdVKlmKTjnOHJAE1oT8H3bDCD79rBO1LFuxnvM38Zy+G6kBIDepNWkXZUezbXwD9u1q4pJNxO1JnVqNK9TjcXyTbROYyN8LlgdoiTVbXo8/WV15Ua7qcYln0sYxnZiNJDG9BRxZRKEY9pzdV9f26rULQFKIaOp0eOBD8ZY2xfnU+40JkNLAUM64Q0pLvU3pGRB4e7VSvwFY6oDLJ50OfUQPk51uE5hmkGySa5ewn4oeEvj9HJFxIrvg7u3Mo0GISXAh7z0QhASJfGzctSLVdWxkzHlVlCUboGWGRjPU9CZqMfhXyQN2xfp46PKPaMJo4ATUut+9Z612py7aweWNrL4dSv1zkEjvug2SpqmVmqW5hYH/JFOJBLSw92h1gdGj2rwbS42zGNsd1g8lvSxLlbOJRz6cD4SaTecAhU3fz6wB6llO5CSMYu+
x-ms-exchange-antispam-messagedata: hWjTBO2CK/muPKvWJ7QrJUPGXI7gSPIu27v1enDgfOIwyh7Uiw3sFgvFUhxi8H2WV7gInVM/XdV41hLzGcNVLaKoVcAxQEmUfRbrwB+PvNs9c1+z2wDCji6qJZCPeNnnNneqyfefzm3x8rSUrl19h9ZonJze0K5ShBFKt3bc1Y1hIKisDk9oC1vmqy9v1yUfqP2Fyw3tyih30nCz/vByeQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 291f64c5-7879-42d2-0c20-08d7cf49d91a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 16:47:17.7330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PgA2WKYKbkFZVRtufaK53PCUvKpMW08IvzbxZ0REazWdf0Zd1ujCtK7fuPKjWPTA5YXOIK8NC1wujXQzgKfeyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2744
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584981995; bh=XJsVi6im2ZZXOG2lpiKxUTbuFe4ibOj/GD1c/hhXIak=;
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
        b=LJrB2koAEPLc1lxHMuDjCStxF8YkjpJdTXEbQTSPz2RrfnJzeQcPNPU0XqaZjn5RT
         lw7EkoEWu8upSdi9MmpwAuszTip9ozSJqf2AQDPTzyJSImZXLM/Ozf8KosjROeeCBT
         T4xq5Pu16Y7Lnja4AS6+iA/Ah53MX8lurj8wW1WFyg4dWAqzrabfzAe1hzhIF+cKjk
         QRmQnqyvBqz5NrUeJtZxH5rPW7/jwRJT1w3gPRAmRJ7udIJNuEI1toQpXr+x63pmr3
         RC2iZVSp1wikJuzQmTGFl+VzwozI/5xj1nPS06sg6GXc0YI1aSnGWcR2yDcsQiWA8/
         WFAlYtlm66Mpg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Kai-Heng

> -----Original Message-----
> From: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Sent: Sunday, March 22, 2020 10:38 PM
> To: Ajay Gupta <ajayg@nvidia.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>; open list:I2C CONTROLLER DRIVER FOR
> NVIDIA GPU <linux-i2c@vger.kernel.org>; open list <linux-
> kernel@vger.kernel.org>
> Subject: Re: [PATCH] i2c: nvidia-gpu: Handle timeout correctly in
> gpu_i2c_check_status()
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> > On Mar 12, 2020, at 00:58, Kai-Heng Feng <kai.heng.feng@canonical.com>
> wrote:
> >
> > Nvidia card may come with a "phantom" UCSI device, and its driver gets
> > stuck in probe routine, prevents any system PM operations like suspend.
> >
> > Let's handle the unaccounted case that the target time equals to
> > jiffies in gpu_i2c_check_status(), so the UCSI driver can let the
> > probe fail as it should.
If status is not seen in 999.5 ms then I don't see any reason why it will c=
ome
exactly at 1000ms. In fact,  we expect status to be seen within 160ms as pe=
r
I2C_MST_I2C0_TIMING_TIMEOUT_CLK_CNT (16 cycle) and=20
I2C_MST_I2C0_TIMING_SCL_PERIOD_100KHZ (10ms/cycle) programmed in=20
I2C_MST_I2C0_TIMING Register. We already have enough extra time to look
For response.

Thanks
> nvpublic
> >
> > Fixes: c71bcdcb42a7 ("i2c: add i2c bus driver for NVIDIA GPU")
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>=20
> A gentle ping...
>=20
> > ---
> > drivers/i2c/busses/i2c-nvidia-gpu.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c
> > b/drivers/i2c/busses/i2c-nvidia-gpu.c
> > index 62e18b4db0ed..1988e93c7925 100644
> > --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> > +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> > @@ -88,7 +88,7 @@ static int gpu_i2c_check_status(struct gpu_i2c_dev
> *i2cd)
> >               usleep_range(500, 600);
> >       } while (time_is_after_jiffies(target));
> >
> > -     if (time_is_before_jiffies(target)) {
> > +     if (time_is_before_eq_jiffies(target)) {
> >               dev_err(i2cd->dev, "i2c timeout error %x\n", val);
> >               return -ETIMEDOUT;
> >       }
> > --
> > 2.17.1
> >

