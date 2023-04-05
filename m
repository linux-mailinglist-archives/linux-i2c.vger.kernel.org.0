Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 646446D8328
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Apr 2023 18:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbjDEQLx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Apr 2023 12:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231644AbjDEQLv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Apr 2023 12:11:51 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064DB6E93;
        Wed,  5 Apr 2023 09:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNX1PJZbaeXRYfwKzz1kSoQxgj/FdawA1EMSPeuPYSuv9if9SrbY0+Gk+e6MMqxbDizmkCkaTQys+cLWI5cIlVF0NguhCNzFccjNAwrLS65Uq4DhfeNlowiPLpATYHP5bRk0/GFyHE4DWLbthajBLFZYIMDx1ETaaHY7GjAPIR9HFxWK4Mj+xqusr5Qno6YJsoHYRtrem6hWOBEgtfzeVNbTD4aIYYljRez46SmiCKEp76emjErBEOyK+ZsDDhT+vWHcK7njPAmK1syHOlFkql0eXpT94T9Yn8EPUIgfzUGxVtDVkXNLOYMW9zXzaTuITREZXr8rkw5kUYIJlElfMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DnlRNMsWztSwsypXXsO26bj8D6Kh1HeZMZbKzVzY54=;
 b=Pd24oxg3dxHWH/CtSPN13BZ3iB9+fSSbIVM6axIG0Ach5+Mndaz8Hp6Ocq3Li1Qv04JzlvqJjdt96yyNHaI33eTDf1LWJRjPCa0bU7cEoAJdKXLygVA+2DPU4T9NpiYwA2rWUY3jjkM3U3MFLtHuSIGy2ZQkFZT5jkwLxuIgunuY4YPyc32Y+Fv8SRsYoz4aNerPe5deMgHGPnM/dTwYEMZwaYVPwYa1g3jyY4jtX4NxxF6RAMH1bPHb7PltIYLh4iBYaasIGNFc8UQlGZa7wjcXdubHQcFvkUcNjcX4RIN6KWDEK+Yk3nPtIYWGp5TVX0hCJbiExP6PQ3J6QIBLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DnlRNMsWztSwsypXXsO26bj8D6Kh1HeZMZbKzVzY54=;
 b=WX/H3P1wZgK+VUCImOu36lblkQG9wjr1iw3J/MV5H9uNZ9PgmreY+KB1XQ1/F7evpoa18oxVbYDFEvAy7ifsa4AppFTXnI1hIup8h4PSU+8CYeIWhLYIJojubljUcLoI0fmi6iknJhQQvWpjhqvClQAosqKu6Vv2O/1bh0rmoCduJeqHdJdVkt/eoMe65SBHkrtplzqWqSAy1eAYuyYdv7sqW3DcDdazjY0tuz5iBaD0Oe3IGYQGxa3BdL1q6q0zNRdHvxm6/Wa/E93tOfaDFNXBlaO1XPtXyJXGttWnf8nofu+VlCVDyME1emPiwp0gT8z2LG/lPnABvNc2BeWaAg==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by PH0PR12MB5648.namprd12.prod.outlook.com (2603:10b6:510:14b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 16:11:31 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::1183:1168:f0fb:40d7]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::1183:1168:f0fb:40d7%5]) with mapi id 15.20.6254.028; Wed, 5 Apr 2023
 16:11:31 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: RE: [PATCH v4 1/2] i2c: tegra: Fix PEC support for SMBUS block read
Thread-Topic: [PATCH v4 1/2] i2c: tegra: Fix PEC support for SMBUS block read
Thread-Index: AQHZXkgw2PM0numSMUyEfg+jyyqHX68ctr4AgAA34IA=
Date:   Wed, 5 Apr 2023 16:11:31 +0000
Message-ID: <SJ1PR12MB6339EFB7B8496F95CD4225CFC0909@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20230324115924.64218-1-akhilrajeev@nvidia.com>
 <20230324115924.64218-2-akhilrajeev@nvidia.com> <ZC1oovV5CSfzvhd_@orome>
In-Reply-To: <ZC1oovV5CSfzvhd_@orome>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|PH0PR12MB5648:EE_
x-ms-office365-filtering-correlation-id: ede88ce8-2333-4992-5361-08db35f06bb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TwJi8YQ0k/Eos6LVJohFFkEkPD38cdEmebnICot1AhbEvf6Nev6ddooUiNlhZicgBQIhgc+MjndPV5DF6YU7xF35oj4+cIkUTdxnw1yWwxdQe0Nke4Ky1uRZQrCs/2spRi81FFOY/OnhNdLvZ5/Sayn+W14TyaPXW0R6AeeLlkdvmrIn0p+lYBodTB6ayEUHszU1vLIqNKtVxutSwhu9Wno5IYpTQAk3ab0T8B314C7/NJKygkmoCaMueBnbChmqDw+GZzTTlQBRr9K89Cq/kP/cB2POV7PtThzGxOqvZlLZs+qdxkNZRCwQz/aoTCxH+Ab59pirSmU9+DHhAireQYUfmvZZLgC304aKRaVJ3NKG2OTkzSVMZ7jjCdN4x5m026jAwKmkvG15vv+mbRbX5stRfLE/K8SZmGXfAmZpj/53SYs48ZBLJqj4YGDK8b/towolmu2Y0KmOF7Zg8eLtzSk+NxTmqqXg+dvDBITbjyx2Pf60WqHErvhOfip2Qby6ZEsRtnPQLmsSl6NDI9XPIDFcEZTyQ5oJ1HDQ56ME3v3uSieSDA0y0ZZ1UNre4Vtldlmp93lZu1RJMjc8UbGkl2U0KHlQ1a/4eN7T7p9G6+WwJWIttb4kLPhACkE0TxEf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199021)(6916009)(4326008)(66446008)(7696005)(41300700001)(71200400001)(8676002)(38070700005)(66556008)(66946007)(64756008)(54906003)(478600001)(38100700002)(76116006)(316002)(86362001)(26005)(55016003)(186003)(52536014)(6506007)(122000001)(9686003)(83380400001)(66476007)(2906002)(33656002)(5660300002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5FGYmITe6ME3Nw/MpS9TXoQHVv4D+3482Il98jq/g+eIaXi8YYW6UqntXrXK?=
 =?us-ascii?Q?T+67ZrcPj53drbB8yDic5CbYCVkLHDc04ECLJtNpyc7eepAq7AZdogEziRt9?=
 =?us-ascii?Q?YK6xOeEbE9SgVNkH6Dvan3YG5KXxTWfU9Lj+MZhroImT9tiVgkN55dgMy7xz?=
 =?us-ascii?Q?+7DGPAFta4367/JNgyHXH34ptlceFexW5dgCq0YjAcyXMzZLwj56E5inc2u0?=
 =?us-ascii?Q?PBjVl56gpSY/xY5mR6/dyYA5TNXMPWAgPfJ6hAGJpdXiBfdLxVYolB3fQQQw?=
 =?us-ascii?Q?jm20sKk3IuAw/JmTg0w3AIv5BstqvYbHpPfOkKpt7Cbv5snpnjV6PLJtgOMD?=
 =?us-ascii?Q?0tOe479Q/seeHSxuNW6ByZp2mgfyWdbTnP6wgDPmrZfeLva/8syv1ftCGX3F?=
 =?us-ascii?Q?dH2ugqTNHKbYoBQi5HnI6/qWo01X2EQX+FvqZ7z732k6gZUffkuAFZfWvvt8?=
 =?us-ascii?Q?9OAPCKW1zEmaHlF9uPQxtC/qDRvy0vZ+ZfD5xMQYt88EAyOtPZVRKy+9YPjd?=
 =?us-ascii?Q?OlC+5SpY9ERp+c7HRFlfduC9nBjMNMOm3/TU+mIN5FKbvvaGDGZTuhkAd4hp?=
 =?us-ascii?Q?JOQRb3gsnTemKrSU15PgAIH0jq7UD2z9e9bv1eoO/UhF+ZvPdkMwgrwfi+0V?=
 =?us-ascii?Q?pngtv6yjUpv91QvqPRAkkoeNgrmwzewJxIMcPOViWD5tBjHvhfOWGB1ndq5n?=
 =?us-ascii?Q?Bof4Z9iST4DoJ7H/TT3oCs5ovDQOlW3xabl1l/PLeuQuzs1yw2Vbyuujvdsi?=
 =?us-ascii?Q?VHRDh4V1Fa8peVDJhOcsctvtxCxGSsg+vGfBdSqItK0nvrL5ikYCT1YhNG9R?=
 =?us-ascii?Q?LhyE4+AMH2VzBaj2mIb7h42yGcHT5zzNMNS146EjptvdAWCWimtl+Y7vW/4T?=
 =?us-ascii?Q?FI/wzN8zYlNMNSOXo0VWGO32pYSmXRgHDSeG1DDhn8YkJtcRQr9VoQG/vzGx?=
 =?us-ascii?Q?v5JOVprYz4gXvzRTNKCzr07Il0z5/KGn3LxecIBmkr074NWTgUAsRzjOje89?=
 =?us-ascii?Q?tblhWLtlIltH0+97GhmZzzZrbatU1+Aj49zwNRBQHjk7HEo7WY+G6Ijs6MBO?=
 =?us-ascii?Q?axwsEOVkDrbGCHcHTf3G7kHZmxbpYJVUGjs/lkhJgubM43L23xGynW6t8M5f?=
 =?us-ascii?Q?jCLIe6o2l57lw9X1xZxMLbmkA2Z8VS/N17xmSHOFQdZNWBVtIc5NV9wklzd0?=
 =?us-ascii?Q?Q6Nga2QLXxYcCFOEXvKaleSrQEZybvL6h0eoNyLYvKQhnHMOVwnNLqIRYPw8?=
 =?us-ascii?Q?Iqyv698B8kXvMRrMRCTTe80hVOGTJad3kpV1OHxk5c8vjq/fWuFwol73MtU3?=
 =?us-ascii?Q?WRA3d4jIQLfgUjDZ8bf2BtJXLusxxqwxk2slnY8dr8chhmWPTMvCFaD2s0Ya?=
 =?us-ascii?Q?mpwnOeb+gUa08PVOJiEpLMdXXrxCY/XdPNzQZsAZigr2MmjdaGGNRs/GhrvR?=
 =?us-ascii?Q?hO42TPFjVzu/q7P2Cl+M2xlH6qFoyMdb93rfTzMJ0O8Ce3nSuHP1w4j2FJ2U?=
 =?us-ascii?Q?LHcNgzDXb6XQJukJIh8mDSZ3//qxk9v13ihb5WopWVAtvWvKuE6R+6zMMHg4?=
 =?us-ascii?Q?JTWnO7m+godH52nUeWPsZmjX1FG2o4qML1TagDo0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede88ce8-2333-4992-5361-08db35f06bb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 16:11:31.7831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CuV75c93DsbGH2E+zxXJTu4kLpg6pGv+l+3arXB0nf4k5WWF80LA6j+EpRsNsKzGL6QGAwrcfavIYArRaOb43w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5648
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> On Fri, Mar 24, 2023 at 05:29:23PM +0530, Akhil R wrote:
> > Update the msg->len value correctly for SMBUS block read. The discrepan=
cy
> > went unnoticed as msg->len is used in SMBUS transfers only when a PEC
> > byte is added.
> >
> > Fixes: d7583c8a5748 ("i2c: tegra: Add SMBus block read function")
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > ---
> >  drivers/i2c/busses/i2c-tegra.c | 38 +++++++++++++++++++++++-----------
> >  1 file changed, 26 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-te=
gra.c
> > index 6aab84c8d22b..83e74b8baf67 100644
> > --- a/drivers/i2c/busses/i2c-tegra.c
> > +++ b/drivers/i2c/busses/i2c-tegra.c
> > @@ -245,6 +245,7 @@ struct tegra_i2c_hw_feature {
> >   * @msg_err: error code for completed message
> >   * @msg_buf: pointer to current message data
> >   * @msg_buf_remaining: size of unsent data in the message buffer
> > + * @msg_len: length of message in current transfer
> >   * @msg_read: indicates that the transfer is a read access
> >   * @timings: i2c timings information like bus frequency
> >   * @multimaster_mode: indicates that I2C controller is in multi-master
> mode
> > @@ -279,6 +280,7 @@ struct tegra_i2c_dev {
> >  	size_t msg_buf_remaining;
> >  	int msg_err;
> >  	u8 *msg_buf;
> > +	__u16 msg_len;
> >
> >  	struct completion dma_complete;
> >  	struct dma_chan *tx_dma_chan;
> > @@ -1169,7 +1171,7 @@ static void tegra_i2c_push_packet_header(struct
> tegra_i2c_dev *i2c_dev,
> >  	else
> >  		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
> >
> > -	packet_header =3D msg->len - 1;
> > +	packet_header =3D i2c_dev->msg_len - 1;
> >
> >  	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
> >  		*dma_buf++ =3D packet_header;
> > @@ -1242,20 +1244,32 @@ static int tegra_i2c_xfer_msg(struct
> tegra_i2c_dev *i2c_dev,
> >  		return err;
> >
> >  	i2c_dev->msg_buf =3D msg->buf;
> > +	i2c_dev->msg_len =3D msg->len;
> >
> > -	/* The condition true implies smbus block read and len is already
> read */
> > -	if (msg->flags & I2C_M_RECV_LEN && end_state !=3D
> MSG_END_CONTINUE)
> > -		i2c_dev->msg_buf =3D msg->buf + 1;
> > -
> > -	i2c_dev->msg_buf_remaining =3D msg->len;
> >  	i2c_dev->msg_err =3D I2C_ERR_NONE;
> >  	i2c_dev->msg_read =3D !!(msg->flags & I2C_M_RD);
> >  	reinit_completion(&i2c_dev->msg_complete);
> >
> > +	/* *
> > +	 * For SMBUS block read command, read only 1 byte in the first
> transfer.
> > +	 * Adjust that 1 byte for the next transfer in the msg buffer and msg
> > +	 * length.
> > +	 */
> > +	if (msg->flags & I2C_M_RECV_LEN) {
> > +		if (end_state =3D=3D MSG_END_CONTINUE) {
> > +			i2c_dev->msg_len =3D 1;
> > +		} else {
> > +			i2c_dev->msg_buf +=3D 1;
> > +			i2c_dev->msg_len -=3D 1;
> > +		}
> > +	}
> > +
> > +	i2c_dev->msg_buf_remaining =3D i2c_dev->msg_len;
> > +
> >  	if (i2c_dev->msg_read)
> > -		xfer_size =3D msg->len;
> > +		xfer_size =3D i2c_dev->msg_len;
> >  	else
> > -		xfer_size =3D msg->len + I2C_PACKET_HEADER_SIZE;
> > +		xfer_size =3D i2c_dev->msg_len + I2C_PACKET_HEADER_SIZE;
> >
> >  	xfer_size =3D ALIGN(xfer_size, BYTES_PER_FIFO_WORD);
> >
> > @@ -1295,7 +1309,7 @@ static int tegra_i2c_xfer_msg(struct
> tegra_i2c_dev *i2c_dev,
> >  	if (!i2c_dev->msg_read) {
> >  		if (i2c_dev->dma_mode) {
> >  			memcpy(i2c_dev->dma_buf +
> I2C_PACKET_HEADER_SIZE,
> > -			       msg->buf, msg->len);
> > +			       msg->buf, i2c_dev->msg_len);
> >
> >  			dma_sync_single_for_device(i2c_dev->dma_dev,
> >  						   i2c_dev->dma_phys,
> > @@ -1352,7 +1366,7 @@ static int tegra_i2c_xfer_msg(struct
> tegra_i2c_dev *i2c_dev,
> >  						i2c_dev->dma_phys,
> >  						xfer_size,
> DMA_FROM_DEVICE);
> >
> > -			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, msg-
> >len);
> > +			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf,
> i2c_dev->msg_len);
> >  		}
> >  	}
> >
> > @@ -1408,8 +1422,8 @@ static int tegra_i2c_xfer(struct i2c_adapter
> *adap, struct i2c_msg msgs[],
> >  			ret =3D tegra_i2c_xfer_msg(i2c_dev, &msgs[i],
> MSG_END_CONTINUE);
> >  			if (ret)
> >  				break;
> > -			/* Set the read byte as msg len */
> > -			msgs[i].len =3D msgs[i].buf[0];
> > +			/* Set the msg length from first byte */
> > +			msgs[i].len +=3D msgs[i].buf[0];
>=20
> I'm having trouble understanding why this change is needed. msg->len is
> never changed in tegra_i2c_xfer_msg(), as far as I can tell, so it would
> contain whatever was in it for the previous transfer. But since we want
> to read the message length from the first byte, wouldn't the assignment
> (i.e. the old code) be the right way to do that? If we add the length
> from the first byte, we could potentially be reading more than whan the
> first byte indicated.
>=20
> What am I missing?
>=20
The value in the first byte will contain only the number of bytes to read f=
urther.
The value excludes the first byte as well as the PEC byte.=20
The function i2c_smbus_xfer_emulated(), in file i2c-core-smbus.c, increment=
s
msg->len based on 'wants_pec'. Other functions, specifically the function=20
i2c_smbus_check_pec() expects msg->len to be the number of bytes of data +=
=20
first length byte + PEC byte.

To avoid reading more bytes, I added another parameter ' i2c_dev->msg_len'
which will contain the exact number of bytes to read in the current xfer_ms=
g().

Regards,
Akhil
