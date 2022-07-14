Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B63255745D6
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jul 2022 09:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236299AbiGNHX5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jul 2022 03:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236664AbiGNHXz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jul 2022 03:23:55 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38CC9E035
        for <linux-i2c@vger.kernel.org>; Thu, 14 Jul 2022 00:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qir3iZT7B4v0+ytVZWGxzZ4Eaol/SFVk6jA1pyg6km0UjRfsj113R4+rOM/dBz+QtNRSDnGjzYaAUDokhsC19DkMk5v+FPHa+9HKNJcCqb5t/PSsjzDnMu7kzzaNpZ65GW9o/+V7I0BICga8xNuJhSXiSBkU6FqlHe5+X9p/BvijarTlIAirxAw/v8vFTX5AEYPhXnS7fK4xxjrO61o8qJV6555MQzOQX0cq0oLb5Xj4PrJpBigw8cTr1O2lMQkjIZ26t4XZn2H8NHHBIsJJVycagYw4ldCqdFaTaaw0mAJCoTCdAcPhaW/UsEryyrCElfxRzruxEq7D7ehzgydrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kP7SP64j6OiSZr+qVUUXy8V/jsHt7v0aLtXG8n+fv8g=;
 b=MGkkQTCavJlyDO1Xl0CyFmmp+t680J2yCgvckAReiZillzm8q0cVhS3C9DJZ/rAbOWFqlXEf34u2lQNA/zh7LLOnJgX76Ycq0DWm8J+RaFXOydLzXBbpgHfZEJ9h6kBCU5TVsgg0P/Z4fOozb9B3r0dnAmefeue/QmWz43pQc++ZwPUHDwIVJxfmEDAHv77QSpL9wFibDg4m4PSmHiyZWmZrPzgto9sBarqFq/h7ZFA3jPTLtaDdhdmC9jb8lZ/J8Z61+yD82U0oEOhRWXKhIKtw7ye9XOIX71PdUqz/IkkAwCkUufHaMfC8I3Ann7G1sGljDHfuMmCuuWAzszdV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kP7SP64j6OiSZr+qVUUXy8V/jsHt7v0aLtXG8n+fv8g=;
 b=5ssSJbt9x68wqioYzYJefxNSd1RmFVjAgUmI/6YwvG1MCluxfaIJdi8g9JwDAcWvDXQRvokxXx/NdBuMNIbL20SBSMSkIJM/6lgPBnlPJ37HpO/Wn7TpXpaZ50zfYkM2mkf5W/yYyjlvI6s/jKuDNwsuPS59vNVqBTxSZM9v3aI=
Received: from BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17)
 by SJ1PR12MB6315.namprd12.prod.outlook.com (2603:10b6:a03:456::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Thu, 14 Jul
 2022 07:22:49 +0000
Received: from BL0PR12MB4898.namprd12.prod.outlook.com
 ([fe80::39ce:8b61:fb1:3aa]) by BL0PR12MB4898.namprd12.prod.outlook.com
 ([fe80::39ce:8b61:fb1:3aa%3]) with mapi id 15.20.5438.012; Thu, 14 Jul 2022
 07:22:49 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        "shubhrajyoti.datta@xilinx.com" <shubhrajyoti.datta@xilinx.com>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v2] i2c: cadence: Add standard bus recovery support
Thread-Topic: [PATCH v2] i2c: cadence: Add standard bus recovery support
Thread-Index: AQHYj2qGX9/8M6n0ekuB484xBjUCBq1zaxKAgAAT+oCACgZA0A==
Date:   Thu, 14 Jul 2022 07:22:49 +0000
Message-ID: <BL0PR12MB48987C83881A6B4F089CFEB281889@BL0PR12MB4898.namprd12.prod.outlook.com>
References: <1656914060-24445-1-git-send-email-shubhrajyoti.datta@xilinx.com>
         <YsdKCeEbEW7ZodZe@shikoro>
 <6140bac860fea41348a7922b4772ab6af4ec41ff.camel@calian.com>
In-Reply-To: <6140bac860fea41348a7922b4772ab6af4ec41ff.camel@calian.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-14T07:22:46Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=d0ecff75-0d53-4955-bea8-e8757f318cec;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cda09ec-0a0d-4ff7-c7b8-08da6569a825
x-ms-traffictypediagnostic: SJ1PR12MB6315:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +wOjmA9cvaE8gjxee6AwfKF3zw+dfwiNdPymsscTOe0+h+oL8SmMSolB/G6xtlVSWON75wGjwsuoYxCIWKbpbyU0zmVXMAm8S7k/+MPfITm5dicDDNvDp9btosnyKWn1Lh+kXXfMJpqwu0NzDXWtc26UsfAmQ/JHAkWwJ64WhCXmlscmhGvzUG6p3S6XEmaeYejcq7UeoqvXaEg/lpxM2JUfpVPiTdpw2xAcoklonWS9Jz0oVYwwzfY5uaocuPqTYhS38mRoQJkujOjVAW9aistA69SwGBKZ+qij78vq7PVURS79FWAWfAiBToBxwdAQn84mhN7CyyxsvUJYOfAUZhoc1nRXq/QXkW4dqhI8LwNMKgNx9c6ux1g7HDFFqrHlX32Enr6/3BmL5vsJeAt7dcF4OaNfMTbQaVTBskZZcP/2Q4Hq/KiyiwempTCT5LMHsolV9g6BpiBal1HVtHdXl5k5jU0oqO/y6M3D2yW+z1VZPoEk5Zd+PtwcYLfeZj4x+n0DA987QBDgqW3NDfZ+Pt+487cOYI6qbbA63MsBNvUsJjBdVZWvHdLorh6oxB2Z6DXmawiQVFvKE8UTbY6QqXkYFkvtW4dwL9eK5PPM5zcfJmXFm6t4poOcj505QU7ESWkXWPhPqapki8zBB45K0+rM1tLrrUh5utLqHFxFu/9UflLzMkdN8gBCKCSHiCJeMWpXxxCo1aCmLYUGjs3FeyjWiwcIQDDvrI05BiY1CyJdprDhTI7Bq5FnJhETSKdf6nb3mbSJHCEPn0Nf45z2/XCjyp9bWiWYeOmyGYx0L55M6uPMaU9EK2RQ58kgI1IllPC/i/Ff0/aj3lvhVjka3XqsS6d4yjf3PJv+NjJZCmQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(55016003)(8936002)(52536014)(5660300002)(6506007)(38070700005)(2906002)(83380400001)(26005)(53546011)(64756008)(71200400001)(122000001)(110136005)(45080400002)(38100700002)(478600001)(54906003)(966005)(76116006)(86362001)(4326008)(316002)(66946007)(66476007)(33656002)(66556008)(66446008)(186003)(7696005)(41300700001)(9686003)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1yg0RZtaW6M6ek8lDlJBtjfyuBVtn+HEkYG9H0riGXI+k0NIUEtHz/LK4q7d?=
 =?us-ascii?Q?z2fyfYzXirHPf5ib+5dXQPiv3UOTg25OImfYftq6VbVxfgDZi++xa24qEjcc?=
 =?us-ascii?Q?dy5ljFKFZ/UC7NxiJnDYtI7yGkVAC6hlk5VOtv7DKXG2zV8XeEzwtMuTpaYe?=
 =?us-ascii?Q?kL/M2kFUvj3I66rgHie8HYgvuGoKrj28kF7hk3F4orsUmBRQVWpIid7fYl6L?=
 =?us-ascii?Q?qrDGXj6yIvaayqge+8E79tXu1Snm6/iyE8qxHMtufVRWX5ntq/TfN9Mzw9yJ?=
 =?us-ascii?Q?c07oOoQWTFJcp9jydPy1b2z8laCd57gNTzzeXvvfq4Bl/DjtVNrDAYi3Nesl?=
 =?us-ascii?Q?Akenr3s2UanQjho4No+NksKWLfuwkbh9d3/y5TfCWj2NX4vOpP7OtNwitDf7?=
 =?us-ascii?Q?4XaZux6Aa6czrRFzeNBTo51dwyusH+cALmWsSBm2vFldRMX6A/SeXn5sj+yd?=
 =?us-ascii?Q?sCOZZy9bIIZCHD3gwjgu2ldwSjiKEo9NLRl+riJNiL4TtyeUpgfHfkjUUAgq?=
 =?us-ascii?Q?yo/X4skvXdmAdjqK39y5UrrM791NZKTGI3qCLNBNIR+EZqdcsH37NRvCK/TJ?=
 =?us-ascii?Q?cXHdwtKO/0tUdO6EjapCgMk1Xlp5kTykxXmj8wXHuAUEaYJqdYqI1NNm6aKs?=
 =?us-ascii?Q?mRlC05gxglFxAtHGs1d1w0DhH4lusuacYF2LLkJ99jWgDCdPjghApMu3UHFD?=
 =?us-ascii?Q?qnfbuGtztDvzMYmJ777PLhx/gQ+6WXXEMS81ms+pSczyMPpIEQU50WOPWVM3?=
 =?us-ascii?Q?8TqTxLMnzG1BBODtCudND4sAlY7T/kztw2LZjx+8HkGbBs3/gjfB4t0RAwPt?=
 =?us-ascii?Q?jfHxK4DtcNu78rWVGuvkTJ07RlNKu69YH/BYAlgRNcLA/b/s9gGdeiE0iTuN?=
 =?us-ascii?Q?PNF5+QnKVgo6Yul7JiOV6FdsesnQkUzYB3Tgu0yb/NbXfrgjV5KxuBLQGIVP?=
 =?us-ascii?Q?PFDzn2rmg6S5jsC7pFCnP2wpuoIaJBJo4bBggw8IvU7dOYV0a+WtH6tPKtGa?=
 =?us-ascii?Q?atyAvN2E7K24D/+jSuftj99IwLK3TTLag9/4ru7JXTROQLktDCx/bJMHPv7z?=
 =?us-ascii?Q?E759VrYW5InF/oL3DihMQI0hVt8pgHph9JoraDL32rEoDRcu+r2waDxuvWoU?=
 =?us-ascii?Q?REE+9LfZQXEgWOyha7FwckSnqNavC1JG6dxenaKkIXVsQ/acNGxLstMpaO9U?=
 =?us-ascii?Q?fw0l68+Gd5KwJ/1SDhsIWcDQuZHE73iElW80H6iLdPBJ/s/JX9w8Z7M6oDRd?=
 =?us-ascii?Q?Rp45Udd/kuYXCAEQkvi1NeKG3PZVCVvaQXhT9+ULkqTfv7A8k7KRUeoXryzO?=
 =?us-ascii?Q?HRL9vY7F+wX75B4oyuGi0MzABmh+uheOIQCi49wRXqLKDz8vafTNnjs2sy+0?=
 =?us-ascii?Q?lbZmeY5na3BiG0S7uTCGcEBZzL4JswXRIkR8Ae3rVk8JqujCa29G9el3vvof?=
 =?us-ascii?Q?EV2rgu+HxsOoRgClLC3+zvef14ZdkAm3F7Qlph3RZNFrroT94XndZjB14w6C?=
 =?us-ascii?Q?bx516BdI5fBoPinbYl/w5Mra/L8C3BSqgnq/x+fPDrJ1ARg21qnH74Mn1ozK?=
 =?us-ascii?Q?YZ/T1xTygB1mNX+N6AQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cda09ec-0a0d-4ff7-c7b8-08da6569a825
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 07:22:49.3053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9fUaudWKVbbznqdXveRh4r9PNVWmBfz1pPvCuzzbxaLA1PfmzvOkUug15Qh2/ZfZt8yHaP85yQREfcCvd+pelQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6315
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



> -----Original Message-----
> From: Robert Hancock <robert.hancock@calian.com>
> Sent: Friday, July 8, 2022 3:45 AM
> To: shubhrajyoti.datta@xilinx.com; wsa@kernel.org
> Cc: michal.simek@xilinx.com; linux-i2c@vger.kernel.org; Datta, Shubhrajyo=
ti
> <shubhrajyoti.datta@amd.com>
> Subject: Re: [PATCH v2] i2c: cadence: Add standard bus recovery support
>=20
> [CAUTION: External Email]
>=20
> On Thu, 2022-07-07 at 23:03 +0200, Wolfram Sang wrote:
> > Hi,
> >
> > On Mon, Jul 04, 2022 at 11:24:20AM +0530, Shubhrajyoti Datta wrote:
> > > From: Robert Hancock <robert.hancock@calian.com>
> > >
> > > Hook up the standard GPIO/pinctrl-based recovery support..
> > > In the discurssion
> > >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpa
> > > tchwork.ozlabs.org%2Fproject%2Flinux-
> i2c%2Fpatch%2F20211129090116.16
> > > 628-1-
> shubhrajyoti.datta%40xilinx.com%2F&amp;data=3D05%7C01%7Cshubhraj
> > >
> yoti.datta%40amd.com%7C4e1a91e059a8495756a208da60661551%7C3dd89
> 61fe4
> > >
> 884e608e11a82d994e183d%7C0%7C0%7C637928288864536085%7CUnknow
> n%7CTWFp
> > >
> bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> 6
> > >
> Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DxhjvSNSf1%2FO5ihd%2B92O%2B
> LCOci265Q
> > > R8HiNh%2B8TBWXw8%3D&amp;reserved=3D0
> > >
> > > recovery should be done at the beginning of the transaction.
> > > Here we are doing the recovery at the beginning on a timeout.
> >
> > Which is still wrong.
Will fix this.

> >
> > >
> > > Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> > > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> >
> > This is an AMD address, but the one you sent from is from Xilinx?
> >
> > >         if (time_left =3D=3D 0) {
> > > +               i2c_recover_bus(adap);
> >
> > This is the wrong part.
Will fix

> >
> > >                 cdns_i2c_master_reset(adap);
> > >                 dev_err(id->adap.dev.parent,
> > >                                 "timeout waiting on completion\n");
> > > @@ -852,8 +858,12 @@ static int cdns_i2c_master_xfer(struct
> > > i2c_adapter *adap, struct i2c_msg *msgs,  #endif
> > >
> > >         /* Check if the bus is free */
> > > -       if (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) & CDNS_I2C_SR_BA)
> > > {
> > > +       ret =3D readl_poll_timeout(id->membase + CDNS_I2C_SR_OFFSET,
> > > reg,
> > > +                                !(reg & CDNS_I2C_SR_BA),
> > > +                                CDNS_I2C_POLL_US,
> > > CDNS_I2C_TIMEOUT_US);
> > > +       if (ret) {
> > >                 ret =3D -EAGAIN;
> > > +               i2c_recover_bus(adap);
> > >                 goto out;
> >
> > This is proper.
> >
> > >         }
> > >
> > > @@ -1278,6 +1288,7 @@ static int cdns_i2c_probe(struct
> > > platform_device *pdev)
> > >         id->adap.retries =3D 3;           /* Default retry value. */
> > >         id->adap.algo_data =3D id;
> > >         id->adap.dev.parent =3D &pdev->dev;
> > > +       id->adap.bus_recovery_info =3D &id->rinfo;
> >
> > Since 'rinfo' is never populated with actual data, I am quite sure
> > this patch has never been tested.
>=20
> I think this (setting bus_recovery_info to point to a zeroed structure) i=
s
> sufficient to allow the generic recovery initialization in i2c-core- base=
.c to
> work. i2c_gpio_init_recovery should fill in the required info based on th=
e
> available pinctrl and gpio configuration in this case.

I  checked the handler calls however I will try to check with a setup where=
 I can probe and
Verify the clock cycles.
>=20
> >
> > Regards,
> >
> >    Wolfram
> >
