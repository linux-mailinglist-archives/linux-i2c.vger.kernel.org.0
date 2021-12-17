Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24DF478495
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 06:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbhLQFbv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 00:31:51 -0500
Received: from mail-bn8nam11on2061.outbound.protection.outlook.com ([40.107.236.61]:18080
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230106AbhLQFbu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 Dec 2021 00:31:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVRcJI9stBJLuwzVyc9vVobMG1YpKpnTBWsEs71E5vLSXR5r24tzX/ACQYj+A1SJC93chyQ1cT+wfN6vfaYaHUnaTrIptuIJE6M3fDMAo+2YkDrF9fO6wbFFGuDpSbniRxX7Xpwxdoqy1BekBxqBfZyziyfhb+Y5FmVJ1ylMYbvTqxrjq9JF1rWWCyYFdTRL6P2H5/aCvYFkOgdopo0gv3NhCgk96tJ/iHQs+V+kBS1nsuWrpm4NnskS4pM0KhyKVy4D4PuQG+zPyOhsOuEH6sLHEjN2ZnIGyLzuAeiEwxdYciZjC2xDL+0QEHa/gRBuq082aYDPOhmXJ4lVsISpiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykuK1K43Yyf5KTVhpdyaXJvqKXKV5fTFIEpEKdeCR1Q=;
 b=OC85wmNEAU1+GEUeMFj+KN4sdp0anWhI7nBKUhzs0PfMEh9aVQHFLd5Fq/EwCzBoObQ29Sklg/TxQAUVbzzAWF4G733f/LDxZO2BpwRzxjpeigKKT3SpyG34eKwlkkAunz0jHTRm8u8lLLT4LNuSd/1b6Q70J0/ZKnX2MRhrbO7uEzE6/Qcjh7wPvfefyKH57Io6iQikDDw5fWtL6/wG5QVUgEkIBwpXChDWmRooWS++zr6Q5wa9fJM6iz6/O3uM/6zffwYYT5wxb5IWPSTUtlUFrMXC6DrmyFDFpOQr42/6f8g3JqohKAMR43JTaHbFU7l3eAuGjMoKx92OVq422A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykuK1K43Yyf5KTVhpdyaXJvqKXKV5fTFIEpEKdeCR1Q=;
 b=bW4qlGGhcSbfPm7DAgGvPCj2WMSm2hJZTq6rvk21eQjZaQR64tU+dQX/Q8QbbC2uCdZPGK7S+N5Ec1cwPzFWBpSq2aAJL9BdytRj4NZ84FDnkVUIN2JrfMNMy/AmWEDPuFanmcR7pNX0YiBcg4ggHVeNhUHDCNGT97PZq3NVy9XRJDIDYhHKiOhKZ9Z36BUMJK4ELeLxztvZGCVTcJrvuzBliUSxQAw8XPFW0ezYOk2PW6mZ+dXH4TmVhU+L3SiTJ95WDFgZXt3bVBwcb0+7E9qho5bizfU1YvYgAhmvl0hedXjfCAkT+es3MYxDeiNmfCqXkJ3+aqTGOdejMbfwVA==
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BN9PR12MB5306.namprd12.prod.outlook.com (2603:10b6:408:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Fri, 17 Dec
 2021 05:31:48 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::6867:d54e:5040:2167]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::6867:d54e:5040:2167%5]) with mapi id 15.20.4801.015; Fri, 17 Dec 2021
 05:31:48 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>
Subject: RE: [PATCH 2/2] i2c: smbus: Use device_ functions instead of of_
Thread-Topic: [PATCH 2/2] i2c: smbus: Use device_ functions instead of of_
Thread-Index: AQHX8n7my/abMo8OBEe71trFCBr2/aw1NiAAgAAG55CAAFJGAIAAhfUA
Date:   Fri, 17 Dec 2021 05:31:48 +0000
Message-ID: <BN9PR12MB52736B1658C0B13526728119C0789@BN9PR12MB5273.namprd12.prod.outlook.com>
References: <1639660402-31207-1-git-send-email-akhilrajeev@nvidia.com>
 <1639660402-31207-3-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75VcvrM0qLQE-04UZEkxbAvkE-MNSN7RGC7mPxj+1hoUyTw@mail.gmail.com>
 <BN9PR12MB52732B801C0D15BBBA71B8DDC0779@BN9PR12MB5273.namprd12.prod.outlook.com>
 <CAHp75VfQpgWhKXM=1oRg8d_ntZvxkSArQv=6eaq7tyU6-KvJjg@mail.gmail.com>
In-Reply-To: <CAHp75VfQpgWhKXM=1oRg8d_ntZvxkSArQv=6eaq7tyU6-KvJjg@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 557a686f-a881-479b-c0db-08d9c11e8584
x-ms-traffictypediagnostic: BN9PR12MB5306:EE_
x-microsoft-antispam-prvs: <BN9PR12MB530631550C637574B43CECC7C0789@BN9PR12MB5306.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ndbW7rKmRFSNpbsTRMmDyiGbEKX0hzOLyZ5+aH8KhpO8oZR0aNIYj+EjsgRyB1rLOyqJvsAIcr2FkF0zOeBsRvSMKRoE4KXxUn+D91LsMEXFR49HEiBuBJ1GFkbB33CdtQ5jpADzGLcZ1PqGd1ZchkzL1+Qy+8VDAddKLiq5R9qh07xmCpAp5eLSJnxlaV41pVMqY6dPT9s7WwP7JmnANObIeq2Zgbo0dB8G1K4GItA78S94vDnGHQzERNpXkcB10WaH9MPHJQD3nrptmLE515YcNWMR11GBk32RLDqw2jfUoNjfkpJVl7kCeVVHiCDQDtoItmVs52Ph/ONR9MMUhqx38utOiztNKXeMD8rVXgPI22DB+WOtySgReV2Jb2l8AvKalLjVsbqXP1Ymo+Yc1ggPYWxgtq7en/eui5hMeR2u6smr7jkN9AU5E6fWn+9RZD+u7JpzVN7Rs4/TA4AXL022TW3fAa/93tIz1cjRaQ+ksy3TAk56pC2Pecq2E+CCa0gLFIeUSHp7xv48dYfD/jvCW8YxpLhgkbwyoFU3XEGVr/wAU6Ti3qdzYOwKfnMqnjCWIPAlvHD/MPFHeOPuHLXOe3EulFZka+xctbt/TcnNUSLsX406oZ2ZrQEUefZfjJNYz8zXZPKMdC5QTuc5eQKibuRB0K3bfnup2empmfdGgk5/v+oWZbsT6aAePXxjUj6NXuvktvPYoKJmBe4MbRj7dbORgV7B68Oh0J2Ll8AJDCf3hb0GvbRvVJ021bC5Rd9GJEvEQ2Bxi6gKk4uU5dzCA7nmd+Jd7vbO0r7W7XV8ic+hgSqfOgDoJ57lCjESlwWkZFliStWfyH9WvbOv7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(5660300002)(76116006)(55016003)(7696005)(71200400001)(83380400001)(86362001)(4326008)(107886003)(52536014)(64756008)(66446008)(66946007)(9686003)(66556008)(316002)(2906002)(186003)(26005)(66476007)(8676002)(38100700002)(8936002)(6506007)(7416002)(53546011)(966005)(33656002)(54906003)(122000001)(6916009)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1DmGqXO8mpdZtZy4wkkyC8HeHQSGrW9sIlSCoQOsF9nAtVuLYo0YmuP+bSvF?=
 =?us-ascii?Q?Kj+qNigEoUQQI5MyObY90n9WrcbVr4swuoPsE3kqZh3w3Gn8sVt/O5aFHTEb?=
 =?us-ascii?Q?40DDRmvdKHl4oBXpl/gud3aL5SGfNCKE9OFI26iI6IaORQNLDigxSgXykrBH?=
 =?us-ascii?Q?Ku+5pejfNFI1jbxck+pVjEXnzR9SJTDMacMsmj3ha3ZV1s6fPk8q72zzxyt0?=
 =?us-ascii?Q?eFSPe3F49Hb8gyN9T085Bu8NWXeZPAkIh66yD8cybA8jNhTuoqv+wDeBhJOu?=
 =?us-ascii?Q?UGKCHWz+SSAfdkStwAumilNB2vxHuS8HBesO1dUtOkFAXEgAjmiOYSdKGmZM?=
 =?us-ascii?Q?/8008CDakprgORzsB22s7uXnnvSkiB8f6JDYGKGoEcHA2xn9Jiu8vjC+XXnj?=
 =?us-ascii?Q?W+sroATYPnDpzR0jRsX2SBMksQzf7ifXoWSLPse9YXc0n4MghPbLBOxQ2DHI?=
 =?us-ascii?Q?Kfpj4sO9A/o4fbjZqdSf0IHKSS2rFW25mpbk/fwQRm6pBR86TYMxsCXWKFEH?=
 =?us-ascii?Q?dsRQROxPXSWq0mtynlmMVANDHoyN+jX+MBNTujUmpkgnWUiMHb9lhCWH8zQ0?=
 =?us-ascii?Q?fvbVipGmUueEAkoroRoiec9Nf+KpP7MDB30lP2UwTpm7EbC2t1NBvPLMiQQ8?=
 =?us-ascii?Q?2T6DhkbcKI6mpJ3nR1nbkdSz/DSkSPLfm0zN1+8RsNX+8kSSrbUjKkGRlR52?=
 =?us-ascii?Q?WglY6J1VY8byxf3Z6x9MPPMYXtZMYjS8VhsUBpzQbhtZC9Rp06Zv0E7r6ngr?=
 =?us-ascii?Q?VIL52wDSATCebPXlJgJ6iPrCG37DfWFQqlOO/cvZTn9C1oU9NOzeRBfSYZzP?=
 =?us-ascii?Q?dIi64G8BJm+t2L8RtfMa6CmjFMMcJqdcNnd/DZoTlBJOqNpOyUANvhsTYlOl?=
 =?us-ascii?Q?0HLA1M9UreY0kNaksWG2WCxbgmRbv5LsdHXl8kJ85vxL7xdAm7c6395NRTIg?=
 =?us-ascii?Q?8ZCzQ9LHDG9QceVfFhtEF60uJMvuy+zd85Vrwr8m6SZYV3/DnbpFqz5Of3/g?=
 =?us-ascii?Q?V8lSmaMloxXHLHdPeyDQY1chS/kgagnJK+vyGzPV8UDNWSj170Ox7dJ9p+3F?=
 =?us-ascii?Q?OABNQLXho+48s+dZMvWQ4foWMSa3CJwGt2FW4rQTVVWBJLuPaMIsX5pDDPI2?=
 =?us-ascii?Q?Azq9jnRUt4b1xAoavDBOboFh06Q44xm1avWvAz6HnP4AAvrI064KhMqYCXPT?=
 =?us-ascii?Q?fQ/OqH4Rtw2QsET0/clizgwgE2ePr2K8AL5FHlnDqVHlodXrwNTxLNe0uKUk?=
 =?us-ascii?Q?hibZpaz3XPT1WmKBsdhD5Op8Frnf4e5/mKtsBKZVqrL1aDs2f321uCgO4nCq?=
 =?us-ascii?Q?Ozivh7LxioeNfQd4E/dZdFl49MbdW0NdT6awNuf9vEwz0CbBDNapyrQd3bv0?=
 =?us-ascii?Q?kLyUe7uj0ieeZLqyMVeOitJKnHGqCUXsptLgBzacYby+DOCmvFZRr3anfWKA?=
 =?us-ascii?Q?HtlYYXIAFzdxJpDFVrkM3kdkuwELHWnQwrdbSBFj/LBKpQ2xj6B/wLvcat0h?=
 =?us-ascii?Q?1hZqRJFVcBzvIqe7qx99Nb1CZ1tbOjZXTXebCeReJH10HcfdDtxKlgkUrnGG?=
 =?us-ascii?Q?qMyyiJXnhihrHB3LfZ5QhZYoD8mU6HeY8cDcIlH98nZDxHL4kf3JUTM6LSGb?=
 =?us-ascii?Q?sQ0aIRxAStNf5jQEsSpTEi0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557a686f-a881-479b-c0db-08d9c11e8584
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 05:31:48.2260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NhqRCd8880EUi55oLTcRkzXA8r+w6awRuYTU+f+KKG/3ZqNEFYWT+LG/a9ilBpFz/e3ifWbtuzme+NcesxYOpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5306
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> On Thu, Dec 16, 2021 at 6:08 PM Akhil R <akhilrajeev@nvidia.com> wrote:
> > > On Thu, Dec 16, 2021 at 3:14 PM Akhil R <akhilrajeev@nvidia.com> wrot=
e:
>=20
> ...
>=20
> > > > -       irq =3D of_property_match_string(adapter->dev.of_node, "int=
errupt-
> > > names",
> > > > -                                      "smbus_alert");
> > > > +       irq =3D device_property_match_string(adapter->dev.parent,
> > > > + "interrupt-
> > > names",
> > > > +                                          "smbus_alert");
> > >
> > > Hmm... Adapter device node is not the same as the node for its parent=
.
> > > Do you have some code that propagates of_node from parent to child?
> > Adapter device does not have an of_node unless the adapter driver sets
> > it, I guess. I see all the adapter drivers add the of_node and parent
> > for adapter. Also, there are many places in i2c-core-base and
> > i2c-core-acpi where adapter->dev.parent is referred to as the adapter
> > driver device.
> >
> > Basically, adapter->dev.parent and adapter->dev.of_node would
> > ultimately refer to the same device (or the of_node of that device),
> > as far as I understand.
> > >
> > > I.o.w. I would expect to see
> > >
> > >        irq =3D device_property_match_string(&adapter->dev,
> > > "interrupt-names",
> > >
> > > here.
> > It would then require adding the fw_node as well from the adapter drive=
r.
> > I felt it made more sense to refer adapter->dev.parent here as most of
> > the (or rather all of the) adapter drivers already sets it.
>=20
> Is this
> https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-core-base.=
c#L1047
>
> what you are looking for?
This, I suppose, is for the i2c client driver.
I meant the individual adapter drivers.
https://elixir.bootlin.com/linux/latest/source/drivers/i2c/busses/i2c-tegra=
.c#L1786
similar is there in all drivers.
If to use adapter->dev for interrupt-names, I assume, it would require to a=
dd

	adapter->dev.fwnode =3D i2c_dev->dev->fwnode;

in all drivers (or at least in the drivers which does not use devicetree).
I thought it would be decent to use adapter->dev.parent as all the drivers =
already
set it.

>=20
> ...
>=20
> > > >         if (irq =3D=3D -EINVAL || irq =3D=3D -ENODATA)
> > > >                 return 0;
> > > >         else if (irq < 0)
> > >
> > > TBH the entire code smells. "Interesting" way of getting an optional
> > > named interrupt.
> > I felt it useful to have it this way as it would remain agnostic to
> > device tree and the ACPI. We would not have to add redundant codes in
> > adapter drivers that are using ACPI table.
> >
> > Named interrupts for the ACPI as well, I feel would be a useful
> > addition that can prove to be of value more than this change; I believe=
.
>=20
> Me too. My comment was about current state of affairs, and not to your
> change.
Got it :)

Thanks,
Akhil

