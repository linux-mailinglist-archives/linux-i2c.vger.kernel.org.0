Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A0F574CA1
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jul 2022 13:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238003AbiGNL6N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jul 2022 07:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239145AbiGNL6J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jul 2022 07:58:09 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F845C36C
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jul 2022 04:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtgzU6qQ+0L/YyhkUydr7UAqV9mqD3E0bixrvQgXqfqBNUBXjwtTfyYI6wcnzKtXRwj4IeKkr+SsWkjzCDH34GwYHwKW/Hrc7Q4AqIdH2KD9nZxA3KZ1Wiz02ej+F6dAm0jT3o6ojmEmA6OqFBN1XleHIPi2jgPxLjvcvvJkO1r62m6HpppDFp6KDz0iuorsGkL3QqsPjSkSKB2EaJNpLPbEmd3CTwFD09crhKFyRbWdC+syLeDvAW/fbM+ZeHz5JPPbtNfij6taVc6oJEL6fkJiuQrBT6wpORTCHL5stxmMMushv6MCbv9pBNohzWK6JSt8LyK3wdwEViAjswIS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxv1Ge7FQjSJLVW/+j9oNgHHNn7BvETpCq9CN0RbQfY=;
 b=a7eBZKQw8ibs5VMi55zQWQdyG16v+mrekvZpog+jF6KQMmnzWTtevrcQoo6Usu0lwWIgBEeAps1bzXsLCSQ7C4modbMmZsDOZR1+5LNdsDHigST18dKgpdN+4e+Q9px1Lvnd239RptlUJ2yjPxDhB5/0KuHDYA5c1Br37d8Q+SnBio099i31EMBO4vTbSJbkBdhaNLCTUf4UJs+DVSATZAp73W+Z3c3/Uxeo1d2nYI1+SbCw2qWuYqL0XfUQnF+71I2gI4FpkReTxMtileTzbjD4BI5z7tNj2nxSZY/fwEmB+tADxdjOujOCxEuDtAhLW2LFhcAPkBldgHNtLoIP1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxv1Ge7FQjSJLVW/+j9oNgHHNn7BvETpCq9CN0RbQfY=;
 b=uweSQrCCa1O/4P6GkfvqZBv+2zObSr4gBAP/KYh04FaO2PVus0xulj4taK4gZBbSr5OsuqBwC6GwAb/EleWBDhPVsIuWplRSPOQMIh12CvkEvemOott5KrYAaSmHRZric6RmF8ZDx+NOT+MDfM6aM6GbLkou8q/+1TmjV8Zw9zk=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by MWHPR1201MB0191.namprd12.prod.outlook.com (2603:10b6:301:56::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Thu, 14 Jul
 2022 11:58:00 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::c070:5fa5:52c4:5d43]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::c070:5fa5:52c4:5d43%6]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 11:58:00 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Raviteja Narayanam <rna@xlnx.xilinx.com>,
        "Simek, Michal" <michal.simek@amd.com>,
        Anurag Kumar Vulisha <anuragku@xilinx.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [PATCH] i2c: cadence: Change large transfer count reset logic to
 be unconditional
Thread-Topic: [PATCH] i2c: cadence: Change large transfer count reset logic to
 be unconditional
Thread-Index: AQHYgEanRCYPJhqiyU+Wzyb/dW4Wqa198RFQ
Date:   Thu, 14 Jul 2022 11:58:00 +0000
Message-ID: <BY5PR12MB490276306C7DFAD42708540681889@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20220614232919.1372621-1-robert.hancock@calian.com>
In-Reply-To: <20220614232919.1372621-1-robert.hancock@calian.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-14T11:57:50Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=bad4d8ee-8505-4a50-803a-a5b99ff9d308;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae9ace3b-ec9e-46b3-75db-08da6590195e
x-ms-traffictypediagnostic: MWHPR1201MB0191:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5fpjtQuNdn6PtVe9Arw9lif1KAUk7SQ2MtNCOZjOigA3hUYyM+5/JscvQwFjR4CjwxBPBmk+GOUFLARZriK44t4iOKofzgAfKXF6G2NrsrDDRjzhQ8U7SuIJwcA/+uez6ntH8/hEEiJXIVr3TGEa2oZuKVHkDCbI5aV85b+SzDb64nCgv2lFsiRGv9Dbly2eQNhPlJq6DHDyem/qOw+R2quw3zx46wLoKq9SIzVHLhhcFaD/e2L06QC+ehTcRwOODIOTRi3WhEuIgcjpmjfJj82+lN2dB64DmKiVxywRKAGPjcmWNmKDDK1ckSA0PtQ/5ROe+OHQnPd2ukXOOyHUXGxjeT5Zv4xl8QPlJQlRBLbvc4EpXw6rFuRCajzIWgvdz96Gh6ux5mBAWXT+bDaCaD8Eaje9v5Adg98HWQXjjK86JEDnl86/5RL9yhRRIRUj9ff2r8SoyKkD+VvEPsagfXy0X4xvbfjh284m95B+vgVptYsydoutd62WNlsQ9CV0pmSHhYGsPk9tlRwfDuJLXvdABh+z2GEHKIf01mgvMDhXzQF8XPYV8iXQMMx5rWxTyn4MepE4uf7yNT5e8gec0mqDdjMVSRcDdYr7CItboGKhLpR+SKBGXvLBZjXtLCLEb0khaXlHJKxsNLo4/kCFdPNVWYQMUNkLik7AGHKwfriVjvlBYsXYbjHY08IzgvNhOEyH3uZRDSWez6uy5HrMkdngSDoxenqWnkUs/l4V9a1/4c2m3DuBsjlNUeTyJEhacI49sVNMuM8wdj13IXzuXLWjdqYIRov9ROUL7jgErjP4gX8hgy7O0vXdp+voWWVv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(66556008)(38070700005)(2906002)(6506007)(53546011)(9686003)(41300700001)(66476007)(71200400001)(4326008)(66946007)(26005)(66446008)(86362001)(186003)(76116006)(7696005)(38100700002)(8936002)(55016003)(478600001)(316002)(8676002)(54906003)(52536014)(5660300002)(64756008)(110136005)(122000001)(33656002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2VPt2vOwMBfV4MlO52iKqYH5+a2OwQz0zfkvyT3aG3Nl4uYDGOz2iCHEibwT?=
 =?us-ascii?Q?VSWDUZLnHZadir5yaR5ZfBJvD73l+mga0bxy85tvZxrakLRI56RVVh6XqiWn?=
 =?us-ascii?Q?1+DYBW01sg+mj6f9skh/touQVKKM5O6cdqza19tEEm6bCbeObmuS3qDgIiK4?=
 =?us-ascii?Q?DOXXsX5Fb47KTzlSwGkmONfNxtCru4dsjkYE6GRgRZvKAHkBdodOhV5MCSyx?=
 =?us-ascii?Q?36Ueyf/I5AWfQ86p/0dhQShj+G26LU/g2xJAgTPpJ354TxRu3ALJKjdF7Tav?=
 =?us-ascii?Q?vYDEThb/PPxLw+B2qYRyPg8kxRyNG/Uzb37YH9KDAmDOO6i8Yo0wKn9Sz79l?=
 =?us-ascii?Q?CCzzlYUfQ8DPAJDa7QtyL9qNbwDTMQGXd18kS/PNvICSEK4YLv7nCWUkIzOr?=
 =?us-ascii?Q?e83k9a/8+C+6z+q/ARRLxax5ex2/EW2I+d7hYg1q6J0Y5wIadDugVEWMVjM1?=
 =?us-ascii?Q?HeqOnWwarROMACXCa9ZsBBZrlgWlM2rJMjtVHfz5+q3oqlxaAJdcS+qlISyY?=
 =?us-ascii?Q?zHVlaQPI/fCapZXUE7TepSUaGOxeeSIXmOuE6XxPIXCNi9dqTdXPOXAOYRBs?=
 =?us-ascii?Q?r5y3f8inJFEKdlULE5ylkgoqlu6ylDvjErWg1GJw680fzw+GFq73UPVgVbMV?=
 =?us-ascii?Q?c2kb2c/DmZr7BTElIHC5u/pvupVZv3F2yM7dNA5Ary53HmKXjpWMIL7iRz+h?=
 =?us-ascii?Q?FtH1FBR06REigAPY6BtOftFpD6reqYUK+VXPs07KvGi4tzCuUy8k+PY+okHi?=
 =?us-ascii?Q?4NBX7+IdWJ/jA6ccsuwSCEWJbqiBTrq+FE+ITLc4WPLibJdHakRTxgJaUveb?=
 =?us-ascii?Q?RWQLcPGOnkT6di5yUUMGzR7SqD/QNY49b2ZCF6gdEcIgGVqLgyIsLb+OYzu7?=
 =?us-ascii?Q?gMPlIH5tL9AHLcoES8XR5073tUVkkoHvA0MjeNIFmeFsZRg27xcV47kEzoId?=
 =?us-ascii?Q?Kn9BN/OomBmjs0y83A5LaFvC7PQQ/4JIwHmQ4YBWUjwScX5AkBAUbEhHtUvp?=
 =?us-ascii?Q?0txW6HCg3+yU3YnMscRvgFpBpZzsZ2GSEr7bfUII81v0/TgZ4wTIEPiPko8L?=
 =?us-ascii?Q?yAnrE20s0iKW25Y8sH4uwLduLD5Mf4UKitUvlLxkN5HiVjPbKVnU69cWinSJ?=
 =?us-ascii?Q?oIJUdp/a4qebRYyTT4Wp89spVGjRQkXorsxMqveD6rPn5f6l5NuavzAB9wtQ?=
 =?us-ascii?Q?GV+9cqBHEaqG6VEw6cOiRGzWxGsJN6JlBmDFX9tNj0FDOojJUVdCEaz46Y2P?=
 =?us-ascii?Q?PcBaZDh/jmfw8BetajRMxLAPOzwLnZ+iQAfBe1vKKXPjopblt5fwMiyq/QHb?=
 =?us-ascii?Q?lgcoiZw4GAJQpGBjeiwFQjB9r0joB//wpqM91eflzC1woSAODaQy86OJevrt?=
 =?us-ascii?Q?twjOGUxj+wpWf7sN8a2GwbHnF2d9FIJXA0LhixKcABWKdY8Lw8nTjReb7UOc?=
 =?us-ascii?Q?JndGBHXg7oPUFb5khuW2L2Uw7TOtuzX4QOkznV9aMOpx2Co5z8PdEwpyvSA2?=
 =?us-ascii?Q?EdtHg69ASB+qXhXO0Rfs3YQXDxp5qI6H6pBRiDED4estEMiGSVv3npjp7XJ3?=
 =?us-ascii?Q?IHFkZvNdsdlKmTDsj7w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9ace3b-ec9e-46b3-75db-08da6590195e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 11:58:00.1038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 50iGnLt1/qvlsDAy7Q65bnyLgJSJMsDdL7g2qrj2t9ZtsNx/WkaHkYPe6bI+OT2vKP/3UVJhIiOlEQk4x7S55Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0191
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
> There is some code in cdns_i2c_master_isr to handle this case by resettin=
g
> the transfer count in the controller before it reaches 0, to allow larger
> transfers to work, but it was conditional on the
> CDNS_I2C_BROKEN_HOLD_BIT quirk being set on the controller, and ZynqMP
> uses the r1p14 version of the core where this quirk is not being set. The
> requirement to do this to support larger reads seems like an inherently
> required workaround due to the core only having an 8-bit transfer size
> register, so it does not appear that this should be conditional on the br=
oken
> HOLD bit quirk which is used elsewhere in the driver.
>=20
> Remove the dependency on the CDNS_I2C_BROKEN_HOLD_BIT for this
> transfer size reset logic to fix this problem.
>=20
Reviewed-by Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>

> Fixes: 63cab195bf49 ("i2c: removed work arounds in i2c driver for Zynq
> Ultrascale+ MPSoC")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
