Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4A8275238
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 09:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgIWHSy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 03:18:54 -0400
Received: from mail-eopbgr00057.outbound.protection.outlook.com ([40.107.0.57]:50500
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726557AbgIWHSy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Sep 2020 03:18:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxDpHOSAOwUDoluZ3mJ3Ow5yppc3drOrcaO3QgSqX7d/Kj6RnbxRzTe12fHausP5sdU90A+j/vO0+QOYThiyvLW2+7zM/UWksJkKMF1VKXSCu6ue/f0lXyCeTRxKAI8lXoS6yLfKdjoaBOZtffX6Z8qDrZ9ZvndnJDrRxUtorlME8eugJSaAol1aUqyBWfqOocbswiEnXJ4dIH8ev6RNS5PrjJe/UMpu8Qk0Omsr55WlQasU3smXOgFsWZZMivw7b6N/Im13uWSAFS+i81pn02xCnVXQ8K2taJW35exU8qbGtfsqYgDtrryRq/9NTtnzVw5b32fFltfwz/JNLPzXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byYi2BztjqAnkavdhLNoFCpo/xZ0FODaw5IC0jOcFVc=;
 b=jzIR7j0P8CkloEFG1iYMVY9G4bDffVTDM16EwLxCwcYZ/E0QMAKl+reJ5jzQKVhs+kpYz4XLra2TEClxWa92cherKlcjOfmezbLm8LqkHOgsQVbu8RC0AY1JR3SHXd12uLaq4RIjkLpRUpLIlmJX4SSEHflouX+d1qRHF19O4vW5+2JaL8Se1a0134Q/zto77zOgPvriI/TxFk6j457BXK13EYQw69J0yVIKdhZVLUCKp61DTWmJU5KxOnf7LeXdSg1LZYi2aWX2TMJJDiGJxV1AWVbUI7oYyj23wXdCxz1QcW+WrjijvuOP8dhLXrYjjyPhONAA4lwoKxHZJZJyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vossloh.com; dmarc=pass action=none header.from=vossloh.com;
 dkim=pass header.d=vossloh.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vosslohcorporate.onmicrosoft.com;
 s=selector2-vosslohcorporate-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byYi2BztjqAnkavdhLNoFCpo/xZ0FODaw5IC0jOcFVc=;
 b=UuVvi6Ja6iMaimic7M5+zrk5x0BSI5VKwcCu4zxD/qZBoHDvUH4Z0OPYZQ5oQTDIVjHjC2fIX72N3Bxc7ZYgVIXDX2L7L1yu80yze0+mzBNUM/Hwt1uEfIgnK8enL1Z2xPw9U3V02HSUcVlQ8BPVzZbI6vNbIil4P1fdyPGp7ZE=
Received: from PR3P193MB0731.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:32::22)
 by PR3P193MB1088.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Wed, 23 Sep
 2020 07:18:50 +0000
Received: from PR3P193MB0731.EURP193.PROD.OUTLOOK.COM
 ([fe80::21b9:7ba1:44b8:8510]) by PR3P193MB0731.EURP193.PROD.OUTLOOK.COM
 ([fe80::21b9:7ba1:44b8:8510%2]) with mapi id 15.20.3391.015; Wed, 23 Sep 2020
 07:18:50 +0000
From:   Vincent Nicolas <Nicolas.Vincent@vossloh.com>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        "jochen@scram.de" <jochen@scram.de>
CC:     "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: cpm: Fix i2c_ram structure
Thread-Topic: [PATCH] i2c: cpm: Fix i2c_ram structure
Thread-Index: AQHWkL9nLTg1aV//8kC96RelQCrk9Kl0mRmAgAEzkEE=
Date:   Wed, 23 Sep 2020 07:18:50 +0000
Message-ID: <PR3P193MB0731945473A9F251C7F37608F1380@PR3P193MB0731.EURP193.PROD.OUTLOOK.COM>
References: <20200922090400.6282-1-nicolas.vincent@vossloh.com>,<956c4b63-f859-df0c-2836-80a988ee6aa9@csgroup.eu>
In-Reply-To: <956c4b63-f859-df0c-2836-80a988ee6aa9@csgroup.eu>
Accept-Language: en-150, fr-FR, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: csgroup.eu; dkim=none (message not signed)
 header.d=none;csgroup.eu; dmarc=none action=none header.from=vossloh.com;
x-originating-ip: [2a01:e0a:287:860:29d1:d0a8:b1c3:1cbf]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d29a626-ad5b-4c59-f179-08d85f90ebbb
x-ms-traffictypediagnostic: PR3P193MB1088:
x-microsoft-antispam-prvs: <PR3P193MB10881DE9598B06E6B3639EA8F1380@PR3P193MB1088.EURP193.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cN59qxkuJzV+PiAwnKTb9o2Q1jowuI78lOef6ERNL7RfOwLQhLCxJIej7nNCNqH4pKo3WYO3uartcxXTMGW9BIUfPhljLH6LBeyBHDQrKyh8CViOvFU4nq8uV8FqKk1a3YyG7IYvbKKO7KrUpbbovsAHuFKRinFOSfcTtZ5WAcwdnDupY5t69mzxnMlnu0enDgMWv9yzV0hfUhR6IRZSsX3PLxaIeoA+vH+y90JsNnsXuig3NVA58CyVdEVNa+TDPLd1UMHh09a68QVWeHpqAWfcABqgodlyM9vns+Lgg+gTHQZyyDL6X39nyDS5Bb5t
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P193MB0731.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(53546011)(71200400001)(2906002)(52536014)(186003)(5660300002)(66446008)(9686003)(8676002)(66556008)(66476007)(66946007)(478600001)(83380400001)(64756008)(76116006)(55016002)(86362001)(8936002)(110136005)(6506007)(316002)(7696005)(33656002)(54906003)(4326008)(66574015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 7M6LoAGE3BN52j7j8vp6ivxedoz3HmrAZHEE8S50e3e5CK0A6oTiXIZ7wcpgzUu0kr31Ry7ULk91U6E378r/aTBD8f9DiBxdYqcr9+JG2H4LL07T1NV8gclK1ByFVmyHwpJi76H/RRWRoX0bsVq1MU/55qlxaQoM6XFaueSkI3m4++tsjSgwTVhyMILyVFEEPEmS3uLSFZugaYoctUh8HCsetCoDbnluMveIkty+RKdabvnNYHJcTEobJFWroicYkG+6u1MR5TnamYrcPbBPzj3ZXjXRZhbKHy1cRaXU/urKG0pB8oeUjXXzjBTr3QDFSIQ3QDroX50CSGm9DsELTGE7aNpRIE414yy9b2H7SdO3ugsCQTzvlwATvOcmkc0iirziTS6Fdd77yUj3lVW8fM4K5+MAvn2wBgpNBYj8yHkjoLAHqDKTiKoVyI8VWyasGEYX6KRDzhWuM5La2vAvUQPfp0fGXs0YEKReIXwKHFWlYXP+GRz7t96lXNV0Fzbkehk9oCxyunxwyQiRWBX2dfeehBHDOvmnqieEEPTGa7bVjagCg9pC2SIdvqFvf4deWLwfJUffpXabaBuYbHaDh/apjJn4xhUZeUSxspRS2xlnTSpi9bv9+bPD3kdKqr/D2UdMI0kYUEYUPyrlYKtD8a/D9lgeYB05qa+Ohoz3WZi7TeQrcdqFmD4ZV/sfQNLlOP/fPtKFHylv5l9TZTBa4A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vossloh.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P193MB0731.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d29a626-ad5b-4c59-f179-08d85f90ebbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 07:18:50.7379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1790b5b9-9585-4043-a430-926cf37fa9da
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xb55vRSavmPUeBovu1AMr1qxZCVp3Z0cvaGm7TfMB9jN3+i10H6h1T6YE8B4MWA1dh2WhNugPK+z5H5hTkqG2gfhSVjG82xoKkMBt7XAjK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P193MB1088
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=0A=
=0A=
=0A=
From: Christophe Leroy <christophe.leroy@csgroup.eu>=0A=
Sent: Tuesday, 22 September 2020 14:38=0A=
To: Vincent Nicolas <Nicolas.Vincent@vossloh.com>; jochen@scram.de <jochen@=
scram.de>=0A=
Cc: linuxppc-dev@lists.ozlabs.org <linuxppc-dev@lists.ozlabs.org>; linux-i2=
c@vger.kernel.org <linux-i2c@vger.kernel.org>=0A=
Subject: Re: [PATCH] i2c: cpm: Fix i2c_ram structure =0A=
=A0=0A=
=0A=
=0A=
Le 22/09/2020 =E0 11:04, nico.vince@gmail.com a =E9crit=A0:=0A=
> From: Nicolas VINCENT <nicolas.vincent@vossloh.com>=0A=
> =0A=
> the i2c_ram structure is missing the sdmatmp field mentionned in=0A=
> datasheet for MPC8272 at paragraph 36.5. With this field missing, the=0A=
> hardware would write past the allocated memory done through=0A=
> cpm_muram_alloc for the i2c_ram structure and land in memory allocated=0A=
> for the buffers descriptors corrupting the cbd_bufaddr field. Since this=
=0A=
> field is only set during setup(), the first i2c transaction would work=0A=
> and the following would send data read from an arbitrary memory=0A=
> location.=0A=
> =0A=
> Signed-off-by: Nicolas VINCENT <nicolas.vincent@vossloh.com>=0A=
> ---=0A=
>=A0=A0 drivers/i2c/busses/i2c-cpm.c | 3 ++-=0A=
>=A0=A0 1 file changed, 2 insertions(+), 1 deletion(-)=0A=
> =0A=
> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c=
=0A=
> index 1213e1932ccb..c5700addbf65 100644=0A=
> --- a/drivers/i2c/busses/i2c-cpm.c=0A=
> +++ b/drivers/i2c/busses/i2c-cpm.c=0A=
> @@ -64,7 +64,8 @@ struct i2c_ram {=0A=
>=A0=A0=A0=A0=A0=A0=A0 uint=A0=A0=A0 txtmp;=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* I=
nternal */=0A=
>=A0=A0=A0=A0=A0=A0=A0 char=A0=A0=A0 res1[4];=A0=A0=A0=A0=A0=A0=A0 /* Reser=
ved */=0A=
>=A0=A0=A0=A0=A0=A0=A0 ushort=A0 rpbase;=A0=A0=A0=A0=A0=A0=A0=A0 /* Relocat=
ion pointer */=0A=
> -=A0=A0=A0=A0 char=A0=A0=A0 res2[2];=A0=A0=A0=A0=A0=A0=A0 /* Reserved */=
=0A=
> +=A0=A0=A0=A0 char=A0=A0=A0 res2[6];=A0=A0=A0=A0=A0=A0=A0 /* Reserved */=
=0A=
> +=A0=A0=A0=A0 uint=A0=A0=A0 sdmatmp;=A0=A0=A0=A0=A0=A0=A0 /* Internal */=
=0A=
=0A=
On CPM1, I2C param RAM has size 0x30 (offset 0x1c80-0x1caf)=0A=
=0A=
Your change overlaps the miscellaneous area that contains CP Microcode =0A=
Revision Number, ref MPC885 Reference Manual =A718.7.3=0A=
=0A=
As far as I understand the mpc885 contains in the dts the compatible=3Dfsl,=
cpm1-i2c which is used in cpm-i2c.c to either determine the address of the =
i2c_ram structure (cpm1), or dynamically allocate it with cpm_muram_alloc (=
cpm2).=0A=
In the first case the structure will indeed overlaps with the miscellaneous=
 section but since the sdmatmp is only used by cpm2 hardware it shall not b=
e an issue.=0A=
=0A=
Please, let me know if I am mistaken. If the patch cannot be accepted as is=
, I would gladly accept pointers on how to address this kind of issue.=0A=
=0A=
Thanks,=0A=
Nicolas.=0A=
=0A=
>=A0=A0 };=0A=
>=A0=A0 =0A=
>=A0=A0 #define I2COM_START 0x80=0A=
> =0A=
=0A=
=0A=
Christophe=
