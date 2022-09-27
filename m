Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C94F5ECD54
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 21:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbiI0T5R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 15:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232139AbiI0T5M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 15:57:12 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4AAA1CDB79;
        Tue, 27 Sep 2022 12:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkriAx5WX/ZMQwHR2yhith1G8INrw1QgzWpmCI/vCp0MoKhFA1NZ3cvCByVGyHl/b0OPoVwHWXFA6SeF8cNCRbMNjzShBWfU3b7YIotmVeR1lXpEfFtH2oTtYuai+YPQceKbOLK/fcDhaBd7LK1AbTakFULTNTKwVCSofIGXU0TUeNmzEUHr+PWDgPiiCmPUIRCoMP3Z3KgOrIbJk/O34+PIRKOWh1JKFzMehqjWTg7Mt2Z2O/Bk2C4u5lpAK1WNzkQdMwrw9yKIze4MGXiOVyJUWLzA45IdOP+rpzpMb/YYklLcigIG9IEvn4pcabqHctGu+jSg76REbstjJ6G2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0IbQ0DmPNxko8vYqTVvi2D7rFK9awEAY1NpBqpiQe4=;
 b=KJ5dnEPdH1mK2cEaQ+d96hVB2GIzdoxbN6mE8aGrYdhD3oFWR0pR4L09KnsLdzhyNGM43UjlLKrf1fCNN/ADTcc8Rm88Fq3Ilx8c4w9QBk5ZxKfjuDgg2wSXLFk+2flYlgurKnvcKVirKEprD0Pks0qC5MeSbmOCHbKcDhlYyzZc2mbluVlsogFRcgGqGX6HspAAsqMsMJ6C/HFQRz1YK+Y8U+MsG+4w0J+/ogHuvPvpDd/mXKcTfQny528vfCuoOY7TiJ83tFPtei0fUrrZWUOpI8aIgrNRETtk9Iwulas+QhR2g9J6BZe3sT6aekZC4mkSFSaQmXt/Ko3pUZ/9bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0IbQ0DmPNxko8vYqTVvi2D7rFK9awEAY1NpBqpiQe4=;
 b=UknSW3GCPvRmCE5llU1GJlbIhaW08XNGGeb5fh2ISBYsqg6zDXWowf21mYV8jn3Sp1sLK/YTHHVZv38LagItQOYJgDOAFQmhpaD1HNUOQm5Mzfny+OztvZiBDOLxNmMIiGbVvcNVzP3b1ekvXdRsPA6Qul68mUS2xubLWA1dPw9SWiRDCwjedanAkti4YnJBlsb2dRYz7b5s43jOGeZ8oO1KhQX9OBxYWH55w4UIrNPiWJoShBJOs2hBQM2Bt/36OX4/qg5HC8kB1mcNvW/k0pIUaSuax2ViuAMJ5HtaMt29BKAvLQl30265j0riB0KDkaaKJmophusb69f5jFctOw==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 19:56:58 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109%5]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 19:56:58 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: [PATCH v6 4/5] i2c: i2c-mlxbf.c: support BlueField-3 SoC
Thread-Topic: [PATCH v6 4/5] i2c: i2c-mlxbf.c: support BlueField-3 SoC
Thread-Index: AQHY0eCKUkSbmtpER0C5L/KgR0/Yua3zsdIAgAAA8TA=
Date:   Tue, 27 Sep 2022 19:56:58 +0000
Message-ID: <CH2PR12MB38955850E07D41FC6947443DD7559@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220926194507.24786-1-asmaa@nvidia.com>
 <20220926194507.24786-5-asmaa@nvidia.com> <YzNUrsFbG0vfP1Rx@shikoro>
In-Reply-To: <YzNUrsFbG0vfP1Rx@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|IA1PR12MB7662:EE_
x-ms-office365-filtering-correlation-id: d1a51b1b-d3f0-4ed7-36a7-08daa0c26fd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H13zvLcarA/HaBlh+HdW/quwi+aNfiJL3/NEqunUgZGVYEfrHObLVH9Ixo5fvNWS39JJLEyqAyBSRdTQp0iLUh7YYXl9krsKDdQkiwvvCIn44tMuMB9zmlR7aW62YD5qsGb8r87KBuYiogCI+TjO4nGZ/14uMBz91r+YubyjGST+S1Zg25qKeZzWAjFIDoxE2s5nduHLvi3dN/lZQSwDzvTcTAJ0UEXgrd1/CZjL3hvJXFwfqSbPDkcg2Utsefk2Y8bVE9AjQm1qEO5/nVEK97lTrUfPeRlMqd90BYBv6Mt/F6UW51azYvYcFE+PUMlip7j7Lj5C+cPLpyEfDzSK05TjcmJkSbnNEdrExaK2pxX/G73sNA64KaP7qDgDyD4tIRoe7ogmcF/NrvamwWUISJkqU/iwmuZfFJGBuojA/jzMnfPkC1beRC8z6vNtdS5O69xtRliZnoj+wIE1p4ztjYvjF0gAsK9yYGKL5QXRJ2jzDpyoCtGTAGYYSlvXmLHfLPedg+DJRWbZaU74zSa/A8P89kk97oOQStpl1dOOa4kP0ElNKNL4zq3Uw6PHq1Zsbrp6/11npocWio09FAwvQvpLUVSkxTsXYwY4rvhF2rH1dBqQnL8jgYiftMn45wYOTA94/AOtTJyOyk5jcUnll1B4cPAsPG2PuZLEGIGkmzTZX2bz0NRs9gejBRmilK2z5rMsl6y5n84CR8lbWoqi4wDKuZY3RUVmKvPiDNVAeCBOrWMX3finDzIdanOE/0WKAH3Xb+n6VEKqy+NPzsL0lg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(33656002)(54906003)(86362001)(66946007)(5660300002)(122000001)(186003)(38100700002)(76116006)(9686003)(26005)(41300700001)(478600001)(316002)(6506007)(66476007)(7696005)(64756008)(71200400001)(66446008)(4326008)(8676002)(55016003)(38070700005)(8936002)(107886003)(52536014)(2906002)(66556008)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1EUYh3BCxaNzrk8bdM6jlk95AVb1XXf9FsaiFRk0TPfGjWMYDUGBUvJFWB57?=
 =?us-ascii?Q?viZbZLzbB9pTVMzefRWmRE4l6JM77iN34RHo634+CjUHpwBpUNh5KekQWefo?=
 =?us-ascii?Q?ONEx9JXs8gcinORSWe7vrIBPwQzHQXgvlxBgUF4omSfdpSJNyyLh+Ensd3fi?=
 =?us-ascii?Q?Zk4q05N4AcPOqeepQD5rxI3puElzxP7VBTVuN4XumVre7aESxRybBnfMzKQ3?=
 =?us-ascii?Q?Xg2v/rSA/f2F8NZadGmn0d/uoVWB0EyddHgIAbLEDa3SNohS7gLVhauj5kx7?=
 =?us-ascii?Q?izE86bCbFQ4gkjG81IDT/pgnPY1NjSzc5+7Wkkft8QqbRvzpV7CbTA0Pq5Rb?=
 =?us-ascii?Q?g0HmwSSdUhry73V/cFSW7ZeYjLKD6XxKk0Asy29DxnTJYfuqIjP5igiknu5t?=
 =?us-ascii?Q?gFdtBrptZ9OzoSxDlr5AAIjrezUtZVfOekqlTCUw8NEA60ZRvZyZdVgVezF4?=
 =?us-ascii?Q?YGCyuiXbm2dHNQGZDBy7mm0Fs5UtBLZQGud0dteAwXq53l6iR/WWil+M3oRL?=
 =?us-ascii?Q?HBGtIfgnCc8/hNgMiq9oJfPP84E1qc+ZijaXnwMS9r79DjgiC7QBR4Hk5azV?=
 =?us-ascii?Q?llBXh+dY6zE3bX+5SlyZVom1K/5z2L9gMMLCAdLMY8SpAn5Z55DUnqYyJZXu?=
 =?us-ascii?Q?E9kI8TUd2v+MMXldQMVefxF2rpZl7v7EfAnwotH+/EsC84NaN0vg5J5DMeLb?=
 =?us-ascii?Q?iHnPGPFPhIKXrIgsPyOrQwrbJObA2EOz+Emxvt7P+NabtwKffG3vrl+7UoVb?=
 =?us-ascii?Q?f0byTXrO9/8BwW3W+i/CJTz5j1kN8rXqzHZY1y72PITkW5nsvrypolJ6xDqE?=
 =?us-ascii?Q?MVacyDScvG2URSvMt1Zb7/RGIsFSHYBaszl43LtsLoEO5d8o0RXkPtFTOA8D?=
 =?us-ascii?Q?UhNTKp/mvevKvY214oeeHziTxccQSd4zCpLlrC62cl+Yv0P6Gl2RDHi3mTo+?=
 =?us-ascii?Q?gHyXlcjYvMYKFEscHkfLCTNDrdcjrYu/czrNfBcytZJTwenhDd2FxOuBvsGE?=
 =?us-ascii?Q?2/E7W5jSrTtlHVSsjBoW7wNzyp6S3ZV2s5krE4HWfUYJW0dOtOinvzG9YzLD?=
 =?us-ascii?Q?CkEVCN4/ZjIq5k2fpM9ChEEPsjcERPB3B2HK/G9QEKZVpdWKKBZprZ2es+VI?=
 =?us-ascii?Q?/BDGKul22MB05z/8NyzGyuI0HVgjL0sYpOZbO1u6lW5HljbsBoXEYvoQ/Py+?=
 =?us-ascii?Q?I3jxEb1lXjHEUBbgu9eKEply8/d1o2Wvs6qKMdYds+uMEW2WhV2LVn9Infc2?=
 =?us-ascii?Q?CQQAK54xcKNwuRGxnplnnSqBTU1CV+LCO01ZufVe9sOcNgtfHKTR5mcdN1qb?=
 =?us-ascii?Q?42uhKS0MIW9T2Vys1yPyRgC44OwBMuVO1JLQbptF6lSJZ0BaP03HDOEeP4kQ?=
 =?us-ascii?Q?RdfJJ1/xPBHxfEZPDsvltcW3R90YKMnZVs0CRcc7bQm0oio5m1wg3qQubcAq?=
 =?us-ascii?Q?CmfyIus0K9CQRfJ0CY5o0PYtFSLGuVSv3rIBJkD8ICAV6UxKQlUvf97A494l?=
 =?us-ascii?Q?UJBAELdaVt/h+9tffoX4e72WhdBeeqT7hH2FOZcc3mhm0TfZgkPx8jUvpM6s?=
 =?us-ascii?Q?LJeAcRfrgBtPqr8zDSE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a51b1b-d3f0-4ed7-36a7-08daa0c26fd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 19:56:58.6377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UcIVVeMhKLCldp6bApNNqmafRoTaTUp04eylqT1Ep+qPiFNG8qP44G1xhQdgKqFVmaQC0wJLK+yNYEjrssWVlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> +		ret =3D mlxbf_i2c_init_resource(pdev, &priv->smbus,
> +					      MLXBF_I2C_SMBUS_RES);

Did you maybe forget to check 'ret' here?

Yes will do!
> +		priv->timer->io =3D priv->smbus->io;
> +		priv->mst->io =3D priv->smbus->io + MLXBF_I2C_MST_ADDR_OFFSET;
> +		priv->slv->io =3D priv->smbus->io + MLXBF_I2C_SLV_ADDR_OFFSET;

