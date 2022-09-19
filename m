Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAFA05BCC27
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 14:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbiISMuY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 08:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiISMuX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 08:50:23 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAC0101EF;
        Mon, 19 Sep 2022 05:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STLjEu6yF7rhJoCr8C1T365Os3LiJ6c/zLR1LrmTu0nnNSsdPG57sR/jD8ihd/T52/S+R3/IA7qmLtZgz/TStssFrFnxmIoS+N76CxhY2WHs9/T1VkZWRkQ/ZAIHOUsvCvjaiQ6Q8oNxQIOFnR1U9mTUaB3AaqfkqyhMqi2p7YyfGanZP7zPPznrnFjK+Qu0sIe4Iw1+RVY3Dcu8z8Luiq0SjXQUUmp9F/xzC9iEQVTXDKG10z3hq6pdNQbgQ2n/F1weujUqrFS/XyS+G/4J4xBswvuFRWdajkyKXDI8iNM8DLaN9TZBhmkRIAk+OXpqd7JUvWu8eH284hjpowk0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snYT4g62YLsClWrjjqRwcTFbyp8iIyBLDExyJridHJU=;
 b=cxsRhNpOMUoBYvTWjYkfm5IhEukqdZ6cmUc+mfw5lQgfjNVeVcimEcau2wSwjryg5+vuBFZWJDFoquDLplenCZYY0I3ckfKVavNfE7VOrKrCOBFcmTxkVAU/zs9cJ6duIvzB94kAgyqanZQaPdN/sUDgK8OuFd4v89LOLHgtkZpZ8u7ShWwT4GT9/dE/fuVVU84IB0LjPYiAD717ngM3WVf9g0E98SXP9ENuoLmG2B2ENha3kMc0v8JGuyYIz3rxzqCjgQK3Si3v0UAZq7lop8j2lG3HhoC/XkqyvWPIiZT/oHUUIs1NEu5sSCeXRO0Y368TAXNwPsoRcXSY0l/WrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snYT4g62YLsClWrjjqRwcTFbyp8iIyBLDExyJridHJU=;
 b=Z//3U6y10fTellPuw/oazlAz/Oj7lX8SUXNZHgtr6PDQOXGGx40YQ5rFGyTL+PriVlqJCABCIHad22335Ndgy0+SwwCGao40+nGhZWRKQaQ1Y1H9pX3J+VeGxdInJ15nBLVtof8Edzsn7gBg8Ods/GWGGb/kOFXQIULGnm34G++dR5xzeAwsLPuz/9w7D6lEQnfjP3adMbcb97kJ2/YEZRavJ/E1FegSJ3bMh3qiwy8hblf4LflCD4c89xr2J5fcJJxw+RWLnEQHk9fo4Zq2ZcBZS/WsNltxc4BIfUO2ZCbDvql6SfSPFgOgLFzQ92k0B3sGu5/kM0AWAXF7MBqeNQ==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by DM4PR12MB6638.namprd12.prod.outlook.com (2603:10b6:8:b5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Mon, 19 Sep 2022 12:50:20 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::41c4:dc:edc6:b5e2]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::41c4:dc:edc6:b5e2%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 12:50:20 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: [PATCH v3 5/9] i2c-mlxbf.c: support lock mechanism
Thread-Topic: [PATCH v3 5/9] i2c-mlxbf.c: support lock mechanism
Thread-Index: AQHYw6l4ztd5sEaXI0iQkdRZ858Ywq3j/mgAgALG2dA=
Date:   Mon, 19 Sep 2022 12:50:20 +0000
Message-ID: <CH2PR12MB38955CA9A05468D75940C96BD74D9@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220908173544.32615-1-asmaa@nvidia.com>
 <20220908173544.32615-6-asmaa@nvidia.com> <YyYRGuXeXAT4FH0L@shikoro>
In-Reply-To: <YyYRGuXeXAT4FH0L@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|DM4PR12MB6638:EE_
x-ms-office365-filtering-correlation-id: 1bcb6cf7-60d7-4296-0d1a-08da9a3d82eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: opVPD9w7n+QmnqiBw8tJVrxN/R0VvbnD1RbQh8SU9nG2ui5oR248FcGnbOIJU9YIPtvjTy1KYGX++7I2OY/Q9Xbdx6APDTldoWesfEdXmEAorkoy4m6iq3SVl/1Gpq9/nS+bCsksGIHkWl0af+oo+d0QwI5lxlEfoC3XOUe+/Rd8KMq2Fwa0joCMRvaAnBIW9RK+GzFKWf5uJghCvDfv585dSUNSxE+YMfeJc8B/C2xUBzsKtT6jOmmnRVeMteaCET1WE7Am/QIS8syx0ZbPSj2UrXq0R7LzgjZOIlNNzfXdqEYEAFJ278qiJfIo1M+LTx49VolZY+g5DPxhvGcyvvll+q9hAg4aBZKtV1WxElC6DN2os0+SWFT/MQU87gex1CMo9Eve2Pjy1nomnl2/6/QnqKzcq5CLAAwFXlBRC5eYrrpLPT89FRMfbtT9mi5WTmScwyFnFLD77qvWuAM+t4EwK7wU/TmYAIY2nI+01h8KDmcvOrSKhKWdSZo0r47jILmSsHVnhblD3mr+bFHsWDYRS1Vecvd/bt01iI6PCoJVOMYQ1KBFwWtflwnFJtufmSLT468sdOvtYRhD+YBgfULid30dhw9Z97wtlmRFklfFytgTAosX4y5xxzxlwmf07lnBFJe3SXnlM7BGSjlLrgtxR3XXtVZYAMuF3xS/W17iGyGVJY76hTIlgxqt+HN815+/8UNivPqcTDcOREAvEd/Bz4z+HdjCMuNcw5GqXhgUuzuPfS38CnlKw51RJaukuMJ1YpJhYWQy4C1kiX+V0g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199015)(5660300002)(64756008)(83380400001)(33656002)(76116006)(316002)(26005)(8936002)(54906003)(122000001)(66556008)(7696005)(55016003)(66446008)(38070700005)(2906002)(86362001)(66946007)(38100700002)(71200400001)(6506007)(41300700001)(8676002)(478600001)(66476007)(107886003)(52536014)(9686003)(4326008)(186003)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?za6+PrTaGf7+YdVtuwdhydxfKfpCHUEqAvAioPdZO3C65UTwXbIqUuZX22RT?=
 =?us-ascii?Q?acchhFHmSPLWxYaoBgu5Ii8jsiElhqUaoIGO43TjkE/eQ9BOGCqK6U3pELuN?=
 =?us-ascii?Q?15d4gmsYiSF1BaYQ3JNxzriS1XwOjStlyRQmnWUokrtViUM+B21/HMxmc/Gn?=
 =?us-ascii?Q?2xby3UPUybI6yl/WDaoxp9tjBojyQZ42W8whjwTL2vzhikELWHOeszgP/k50?=
 =?us-ascii?Q?9JSeuGEVN2hmWMfrLrJotnmsKF5yGyUKduW5SZO5caopBzuupBipkqpFPEyd?=
 =?us-ascii?Q?ikD0uDqbHJdATSZQVsJtkX6K3ScFDC/hAzL3x9mG8T160wAxYL//f/+YT047?=
 =?us-ascii?Q?lQQiJSH5X8vdiJMQIb16DQu7mvdhrjcUTmIAz2ma99kGs5+txXQLz/We3fpT?=
 =?us-ascii?Q?r4iFLSbP5Gt8WT1ObIQs8ECEBbwXFteLmBXttZMZ/cD2EYAzdSBc0HPuT/MB?=
 =?us-ascii?Q?HEFfma7uzUfA84E1KyRW+iHnUx6nxmEsln/nJ3B4G4L4IHYRa2vkO1TUg4pu?=
 =?us-ascii?Q?m4KvsiZniI+NC/MzCuGDThRQU79hi2POtg/obtd+zAjZ6+8tLPi8p0ExLLTh?=
 =?us-ascii?Q?abce1eeMcV2w2EluYJqfDAmMNMr6z0UqDvxZNIRGfsA8zVIHOSvObcPZAkSv?=
 =?us-ascii?Q?Z/oNb25X/TkiB/7x01Ojul2VgSCk2ishYHRKXprTOhGSyMuqyvePZRNhxdYn?=
 =?us-ascii?Q?GbSBmWNkPO5u23a2R/t4BaHK0Sk99H/22/ck7d3PGAhSq6XLVubYzahha+vH?=
 =?us-ascii?Q?ZmMCJMDp/XVcLlsmeZZTwLlvVdTidHU6mx5N3SMRKar0Kq/16UbH2PdY+/li?=
 =?us-ascii?Q?mNbvuAczH9/ayyX2ABEmvxKLcZAvzwx7bWos4idIr7DNJp21FY17xcQNiroZ?=
 =?us-ascii?Q?3/iQO2FHNn9j7z2mx4DnxBYJumtO/KDL6F/J7ctRn5Kk5VhIlfUpYEiYGhho?=
 =?us-ascii?Q?YawaqO9RLtJlE4f8HJJSAy8KvlcNFJpAoMzxbjXQB5uz083mwZrIxoFE08cW?=
 =?us-ascii?Q?nCOn2oMKWLWdjlwdLJuINMD92iJ5AJP1LwfOCzVfNSNtFsYl4j1cf1mG/L2s?=
 =?us-ascii?Q?kJwe0Alds76RE5yFtzQC9s7d5eu5TJKPDWrk50VzIegBfGM2ud7AXtl76vQB?=
 =?us-ascii?Q?l/n38JQ8fCcynDq6k6zg5PaCgAUdxnon5BQ4u1448r3bYkozMRGHqZTW01A0?=
 =?us-ascii?Q?UmR0XP7Iweh9W82w1gpj/yQ2Be/8NVGh+esdFi2I1sKixgyn323ElfzIahI0?=
 =?us-ascii?Q?0oxoTEqbLxKj32tz6/eM9POWOuDn5KT/1qbic5TMXJQCq33lcZIfhz8o0XDq?=
 =?us-ascii?Q?jk991cdAxKc3th7t9Zm/kS7wX97nUajR+YbSZ8mg0p+o9c4/KWODJ+3Oa7Cd?=
 =?us-ascii?Q?umg/Re3S0meummdxrxb3udLaNPbyaf5xhf1+9oxtd0gM80A5CS9jIIUigggj?=
 =?us-ascii?Q?wVQQAjf+z7iIttUwVJwtiayWDnqOQ1He3dOwQLTxz+KDBCrnmKg9kJlBV1a8?=
 =?us-ascii?Q?feJQS9SuVMpZURH/2uiWdxDWFk8qjMsf2wU//hrT8/2hGhm836QO2V5ECWMd?=
 =?us-ascii?Q?EgoJ/ojxQnsHncNGbeg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcb6cf7-60d7-4296-0d1a-08da9a3d82eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 12:50:20.6315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WGt+g/dWx6yoXahM8mW+xVe5LNFhsEj9naa7do+vGQTUo8J6lMBpuroLoBdc/5ae5JVPGPVUZ2I2T7RwVlnmWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6638
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> +	/* Try to acquire the smbus gw lock before any reads of the GW register=
 since
> +	 * a read sets the lock.
> +	 */

Please use kernel multiline comment style.

Done.
> @@ -792,6 +824,8 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_pr=
iv *priv,
>  			priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_FSM);
>  	}

Dunno if this is taste, but I think it is easier to follow the locking when=
 we have central acquire and release points for it. So, I'd suggest to add =
something like

out_unlock:

here and then goto to this place from the other locations.

What do you think?

Sure!
> =20
> +	mlxbf_i2c_smbus_master_unlock(priv);
> +
>  	return ret;
