Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA0320C84B
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jun 2020 15:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgF1NuS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jun 2020 09:50:18 -0400
Received: from mail-eopbgr20053.outbound.protection.outlook.com ([40.107.2.53]:12353
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726344AbgF1NuS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 28 Jun 2020 09:50:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VX4NO+2QefpPiLY9mVoLr/yAUn1vaP/s3+0fqRBOipZayLbtzhmvTP68UplpZJ8F07givaf15QfnZ5cDJAGe3bnEtge1vu8dlJSd7iMbrGRF7ZhXQNvXX+Nu8/ppsUTuT/vXsOrAE8PPsxNMNdLKFopAxI4QGTIa/XuHV3Q0dI7z1A7lSxsT/H5OyXZOJKCtJzibhsT+M0Ay/PSZHBHV7VQbj+ENQOcWiNwzH/8MGNB1/JeKPNbhaCd4sBe637ZQBjQAaD1ua2AFl0uBDHxaQT1KzdJ72g5RJwa61gGezMlTwlUjCHm2xFp9b1euYz5TEKfDeugeT+FaVyT6ve2n7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVyY4PtiefelYoXosk1WKVAlsoMUecVd4Ow0u6teA4w=;
 b=TCfqNlTSb0tu24IUORt2ldwWcplYn8NyhPMyCmn7BEjf7+UxBmjBK+a5kyKqzHTpM/HElBoEDiQfwOtbZOnlOb8h7Yf6Hjjreffm77sp+QeEVSTkS1/DUU9lhIkAgyFHQVaPVFuXWVl/IL1iE+5UHDT81/v21+EPLY7QbxSqOgDxlFjDlKkHFXgbRmhVyDVhB9+QyQhcdTBRhOZ3OHIXR2lac2DGroKKf5S7OTsXUjoMVcOKanwSKSBvCFCYXBUt5uL+eAAzkuBYwpYDeT++WKiecvfUKSyhps3vk41OoKtZZ7F9a2LxpCYJUxNH2sVavLdbXOzk1AOFmJS0WjgyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVyY4PtiefelYoXosk1WKVAlsoMUecVd4Ow0u6teA4w=;
 b=D6gkX8cc4oPxMlXYUqKEOJbVDlVN4h/nqlVveIrniDRb6Awmr2TuIIEeUSlNt/FuRg+CXpN381c9AcyAG6Svnm7OjtO87qvktYb6Ge/jVDPolwaH/rP482LggF8onD8tOav+VzLO7wT8czBHoRuYWfV73bNsk7aQVWvJMpNt+7Q=
Received: from AM6PR05MB6168.eurprd05.prod.outlook.com (2603:10a6:20b:2a::21)
 by AM6PR05MB5078.eurprd05.prod.outlook.com (2603:10a6:20b:12::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Sun, 28 Jun
 2020 13:50:14 +0000
Received: from AM6PR05MB6168.eurprd05.prod.outlook.com
 ([fe80::a5c8:67a9:1634:8a08]) by AM6PR05MB6168.eurprd05.prod.outlook.com
 ([fe80::a5c8:67a9:1634:8a08%3]) with mapi id 15.20.3131.026; Sun, 28 Jun 2020
 13:50:14 +0000
From:   Michael Shych <michaelsh@mellanox.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Wolfram Sang <wsa@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH 1/2] i2c: mlxcpld: check correct size of maximum
 RECV_LEN packet
Thread-Topic: [RFC PATCH 1/2] i2c: mlxcpld: check correct size of maximum
 RECV_LEN packet
Thread-Index: AQHWTUKphTsXSb6mkkaM23FqIchUdKjuCozg
Date:   Sun, 28 Jun 2020 13:50:14 +0000
Message-ID: <AM6PR05MB61688309AFCF832CA4D67696D9910@AM6PR05MB6168.eurprd05.prod.outlook.com>
References: <20200628115245.9638-1-wsa+renesas@sang-engineering.com>
 <20200628115245.9638-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200628115245.9638-2-wsa+renesas@sang-engineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=mellanox.com;
x-originating-ip: [109.186.100.168]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 73a1c4e0-0962-4c45-6db0-08d81b6a2f03
x-ms-traffictypediagnostic: AM6PR05MB5078:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB5078E3BF3029AC6879B39E07D9910@AM6PR05MB5078.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0448A97BF2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 12XXaOow/Qv74lHwDzRY4YF26KHQZ7M4m9u0pveI9F+Ci97rOJQa8jFUL07XkVPtgv0y+I+rmxUx8lR33IrxJHmOf7R4TXUG2Na2D3X+7jXcE6mxRYbSj8FAUOCJsQhJDsFoWYidUXO5CXgX6sZPRCtxvMeuHAexppSIc26SXr8WowPMrjA2HbkkAO76MWXnYbrn+mBRbAN2oPL4jO2lkzOjCS1yoAHioZukBsTXXBXGl+w8yTiFz4e/v5oX2pW98E4UX+oquQyK2LECqT3wcoxYdTKoc6DnDKAGHyyXfWg6kMciZHwfQAmNUrUDQb/PU/tEzktGU5VJeKt5N39rMnCLldJP/MtVNA7fEG6GyB7/Sw2bfYc5Ca4zDIf76oV1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB6168.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(9686003)(66476007)(186003)(66946007)(52536014)(76116006)(66556008)(64756008)(66446008)(71200400001)(26005)(7696005)(8936002)(33656002)(53546011)(4326008)(8676002)(5660300002)(83380400001)(478600001)(2906002)(55016002)(54906003)(316002)(86362001)(110136005)(6506007)(133343001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: q4gm8pvwoXLlwdpk+5DTGU0jwKeKK9pfIE3b6hTXzGQR24I91sGhdxC6yp4D1sDTqpsZc97dODRXhonu3z2JYbgEu0nh9w8OfHOfJGJI9aaqTevwp9iYqwdkSTe7rdWvZBfmnfxciD3UOfeGq+sEGg3crxEIYAuvYjvhZ2mm52lpfgEIGgEiMlpox2RChYHBBEt8z2huBTp4+4EusbVsu8OF/INkjPPY2ao4DrYiUg5iBhf3cr0dDOC6X5Fulwxak4f4JXxdqgj8SqUJXvS7vdr1J5c9pvUVCQAFhPAqwoiWunJvcROoPl7smygo5lk4Sx/wK2MoSTkZovhSIRdAaZunT9WcXXStsqmNJy41M2TpGAdWeeA1fjbSByGQL0sOrMI5kuYIBjMDSKAumUmrm4YVvucAxNtnhKHwF4DiWl6LpWbyr/FmwzO/gi3dwcJY//KQxLnB41WQNL9WEE26kL2kKHjEfkslX3FF56wMVPHmzY8lGegFfM/Z+AfwGvtk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR05MB6168.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a1c4e0-0962-4c45-6db0-08d81b6a2f03
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2020 13:50:14.1372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7kBgOUcFHN/445Iqd8WR/jn8j1yGNyK9WUXerYNGUnVb1kH9zVHhXqSAbKjR0XHKsJP54yV4RXOiAMzLxkcWtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5078
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

You are right, +1 isn't required.
Checked your patch also on HW. It works OK.

Thank you,
    Michael.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: Sunday, June 28, 2020 2:53 PM
> To: linux-i2c@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org; Wolfram Sang <wsa+renesas@sang-
> engineering.com>; Vadim Pasternak <vadimp@mellanox.com>; Michael Shych
> <michaelsh@mellanox.com>; Wolfram Sang <wsa@kernel.org>; linux-
> kernel@vger.kernel.org
> Subject: [RFC PATCH 1/2] i2c: mlxcpld: check correct size of maximum RECV=
_LEN
> packet
>=20
> I2C_SMBUS_BLOCK_MAX defines already the maximum number as defined in
> the
> SMBus 2.0 specs. I don't see a reason to add 1 here. Also, fix the errno
> to what is suggested for this error.
>=20
> Fixes: c9bfdc7c16cb ("i2c: mlxcpld: Add support for smbus block read
> transaction")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Only build tested, I don't have the HW. Please let me know if I
> overlooked something, but to the best of my knowledge, this +1 is wrong.
>=20
>  drivers/i2c/busses/i2c-mlxcpld.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-ml=
xcpld.c
> index 2fd717d8dd30..71d7bae2cbca 100644
> --- a/drivers/i2c/busses/i2c-mlxcpld.c
> +++ b/drivers/i2c/busses/i2c-mlxcpld.c
> @@ -337,9 +337,9 @@ static int mlxcpld_i2c_wait_for_tc(struct mlxcpld_i2c=
_priv
> *priv)
>  		if (priv->smbus_block && (val &
> MLXCPLD_I2C_SMBUS_BLK_BIT)) {
>  			mlxcpld_i2c_read_comm(priv,
> MLXCPLD_LPCI2C_NUM_DAT_REG,
>  					      &datalen, 1);
> -			if (unlikely(datalen > (I2C_SMBUS_BLOCK_MAX + 1))) {
> +			if (unlikely(datalen > I2C_SMBUS_BLOCK_MAX)) {
>  				dev_err(priv->dev, "Incorrect smbus block read
> message len\n");
> -				return -E2BIG;
> +				return -EPROTO;
>  			}
>  		} else {
>  			datalen =3D priv->xfer.data_len;
> --
> 2.20.1

