Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35AC05B24CF
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 19:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbiIHRjA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 13:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbiIHRim (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 13:38:42 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49966EE525;
        Thu,  8 Sep 2022 10:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBLUouyCK1W1YvZy7PI3UCrsdSs2SAHMYR8Aw74NH7BOrWUdzul9t5G9Of1PFZ9hSfs0q3z8UuahEyn0PxfMYlzKJax3f/dAGpLzIUJpRNuJATvlx05AipjiNs1Gt+VDWj5/orYeXNUt2vAwT6UwNcVtJzN+4dJotdUUqM2Ow6no3VnOb7jfBEnq2JQOvVyB4YRKYbB4vaEuJm2bPCmHY6mknQMJCPTJhQtnqih5K2RHyANXONJlU7ShuPXeYa3Y1mPUtulrfAWVlMrwq6IbvchUWOGcwarmzzqi8NUTowoSv6Dad9znQxKi2gzEJadII6GzoX8qQROaY8jMP+BJsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asK73GYopg5oTfd70A4cI5Udab22JqaYesg603VVpIw=;
 b=mhsl/o9yMmmfrqeE1V9ruC3HLq6pXTgJIS6Qj0l+Z5diIY5dhgepzErLHxG24kPOKxBtiohDDdvTY9qTtNomK5tOktjBInLa+1Z0Sf76GFP8/3lq90pVGIWn1TA5k3ux4PbS2c4bubdZ1emuMQAB05+plgTZ9fyANWoMtTd9nJbL6CBeccNHTCR59yWwHAy4i8AAxDtmB8XGUevnA0lzOlDAbjk+KB6A0GajOna6hrNZ3BbkfDXG+ZlgzpCDEhuI20LLjFPOdUcswjg6it3vzIJhDSkeIA11kZPFplHrKjC1fuXVPlrpyraGQjl9mU8wKWw2WJE30W4Xbx4XKbQLBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asK73GYopg5oTfd70A4cI5Udab22JqaYesg603VVpIw=;
 b=DIzjzhWTTezYkNPzUxdWygWImFv0OkkNvJBzqfuRSveviU7GNupWqmn+125BFJs4hDcdTXfZXFZVpuDC3cCAF740Q5glVgS54DeWs066Fde0UIg6pAkv1JoZHtt7ainaUFb9I2TTFonSnwlNf+hrPTNDH/yNPU8XTiNR+hsG7wKMu7fgRA4LMm/rJIigDxUn/UEcBhzIhL6UVFW8wmmfqU5CrZaPJJPPvaXpHxcNqxVSERjBg5H2tW903Ezt2RZQMZYp1Uool22glCTwTH3l8ISMSTd/yt+5kwVgNLq8oMaZRpxxZ+RbF2l6SmMJEqp33qLiSjkuYWRcIKSN9i1UUQ==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by MN0PR12MB6197.namprd12.prod.outlook.com (2603:10b6:208:3c6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Thu, 8 Sep
 2022 17:38:11 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::25d3:32f3:4be5:da11%7]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 17:38:11 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "robh@kernel.org" <robh@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 0/9] i2c-mlxbf.c: bug fixes and new feature support
Thread-Topic: [PATCH v2 0/9] i2c-mlxbf.c: bug fixes and new feature support
Thread-Index: AQHYtmFspLN7eEXzUE2AAJMrZ0F9+63GXGUAgAAEL0CADjbMAIAAAHDQgAAE0wCAAUn6YA==
Date:   Thu, 8 Sep 2022 17:38:10 +0000
Message-ID: <CH2PR12MB38951C8AFD5780A2728CD910D7409@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220822195725.12656-1-asmaa@nvidia.com>
 <Yw0fNuOWtJbe/OT1@shikoro>
 <CH2PR12MB38951B9B8F189E1B991A7950D7769@CH2PR12MB3895.namprd12.prod.outlook.com>
 <YxkPKpPNXg8wEIDf@shikoro>
 <CH2PR12MB38951D3E64BCF82A2A0F3FFBD7419@CH2PR12MB3895.namprd12.prod.outlook.com>
 <YxkTlIJFczsEaL4w@shikoro>
In-Reply-To: <YxkTlIJFczsEaL4w@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75e847f0-bcb9-4d91-afa2-08da91c0e652
x-ms-traffictypediagnostic: MN0PR12MB6197:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ub3g15QASiL7QIZIXu/3mpNAfZOe9PctMiSv8W+6uG/dTZ2nRAbmjwKsbI9isffWaPYfawuwfAft7gNJQOv1kjGUzTnazl3FnTJ0kx4K+HfRRywo/onOrYlm04B82IqxRvamqQmjNA6B+wxscV3lrbQNBtBnWhd2AgMxoAnYPec5Slj0Bx5nihCzjC63TjG8xENLXB/2ve0nSWsJgbRJyTDLbkygiAAXmiPcGiK8kRCDCjqYyev9N9y2pMZh3lD03rNSTjRwCRsT4sawLmZ6/bT+6dngtedqcN3t2IY5CaHNfi97ngQxB80e6ySyct7+atB6wqZ/RrbsYIar/LqqBz6wpXjkCgjFNyjRUDXAKOWbBa+5pKSxediIw+NmZ8RKluY5GrD8rI8nmTBPd/h7hk7Mi4Zn6gGjSqQ9qpLAjdCNlU2mCF9VeNy8u8cXdMv2u2skR/xlL9apbBxWc2l3weh0N+SX30zNxfh0iEDkA5xxjNGTBvq7fyZdcthlxexnVDmNFVhbLpr/1Y9uVMTzho62zZd7X1dUHpcIn8aO0jCYADbyW55fL0l0L7zoyirvtqnrp/tTKPZPn2NrJKL+R9qH06zZ+6RlLiRi1B0on8zxHPSBtUZCPGNe/DRl8JheLn52Ixpa6Z2DU6spkC+fOe1o21xYXsk1tsv3igpbGn93cg/gGvjE8cXPFKIQVMZE+6dOIfh1UIBSy6vpmZxYsr4poagW+hPkT1PZ5OPGYk/JgtQ6vF4JDMKQ+8/TK46EPNbwFxEbucfEJdWRk2N23w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(54906003)(7696005)(38070700005)(38100700002)(55016003)(122000001)(66476007)(316002)(66556008)(76116006)(4326008)(66446008)(8676002)(66946007)(64756008)(2906002)(9686003)(8936002)(52536014)(6506007)(186003)(5660300002)(33656002)(478600001)(41300700001)(71200400001)(558084003)(86362001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ALZF9/fVKMVepo/Z/yPPtw/b6Q/vI99v+6HhcZEOAhgDCs4BHrJU9P5H5JJX?=
 =?us-ascii?Q?tAh3K+8WKtm4RmMDOTUvcHRPXc5ZR80moJ6YeEcrVop/uli5VPZKafe7OqRJ?=
 =?us-ascii?Q?/4dN59kfy93ZOLEFFA5AqmLAV2tdlvjaQCpkmd7iOXI6cOTVn7igUK65qJbK?=
 =?us-ascii?Q?LkEt+O08XsZIqYlAIIkPNsnINCgD4GTMWNL/VsopCbVwj6SCK+vMk2Umfk+b?=
 =?us-ascii?Q?UgNwx3RxOD+/Wk4p+eCWzsyIUcGC/KsLskcvFtF1fF2oLV5hcfaU8V69tFXK?=
 =?us-ascii?Q?bBN4aOg42oiMZXkgLdpiEDD2ctkedOSeNwReiFI6nuGgcAlF11U/K+4yJIBq?=
 =?us-ascii?Q?gZn8UbajaKFV6KIQYW/yHOyx2Zxlvce0vMpeWgrPsLaL6agM6TfktqsaGnD8?=
 =?us-ascii?Q?0r5Imw4v0gen5hOnOBzv1qCuE6fnlNeqaitNZQzhBr5EF0oACuoISEgGE5EC?=
 =?us-ascii?Q?iLgvnrs3qum+3Lv4JK/LAOCCrEUXm08p3zjReipTfC6IseutJ4fgdonzH6da?=
 =?us-ascii?Q?FFHRPLUThkAyONjLSUXz7cq9ulHAGZOvOEPN/mNv8omwnGO9Urnf8dj1dHmu?=
 =?us-ascii?Q?GH6wGxwKowpMdBykW3KGom5EztmYqK7nsadneCpMpfyjkCX1WDgisnRnnNHV?=
 =?us-ascii?Q?T9eVlLgeARosxIjWZdXye12qZuAUDTayTWtIx2gOcM1daAAUJys9pwVP9T2M?=
 =?us-ascii?Q?jnx9GjGwtY3bfcCkJltnVh6fcVg1meJbLL76CrbLPVGnkK9cEc/vRU+GzlWR?=
 =?us-ascii?Q?g3bBzwk0fWiU/81LM1a5+A7plWoEh7wrMVEE/X+kbg3W1L8fXaedU0m2nZdJ?=
 =?us-ascii?Q?D3okXmfo+Yq0kpPD8GZNzAsQZ8awdZk1HOxLrnCpRYU4dyrrFLxGHbu3zPsB?=
 =?us-ascii?Q?J1HgTTpMgrU1jnvHZptlk/U5D/x9njLN6Bfufi6wRH3O9dbSXojTk5D+t33Z?=
 =?us-ascii?Q?NCxyWLs8IiAono7Tqgmp4uR/S2NySFMCOBOcKMrMzO88sHAjJ7lUwdIYZi0H?=
 =?us-ascii?Q?I4C0IbLNsFTr2DR3eKsvW7CkaHT5CJwkp4tqV0Xuiyr6zH51yAO8/thlZwLw?=
 =?us-ascii?Q?pZ600HBBC56qZxU3vmxN0h7p1JmZ4wc0+cVFQ9ThPglovu+2YUlU+RP4J+3Z?=
 =?us-ascii?Q?T56Dn6c8+Zh6tehtscXWvMqCdF3FLH8Cq7zkR0bxVDQvtxHJ/J9qhdg6Q8T3?=
 =?us-ascii?Q?wNyPHWqvcM/13GlooiDIxnbs/A2y0gjFzioOirx1+3jpfxwBUSI44cTy8xho?=
 =?us-ascii?Q?lITboqnh04w5t9u9PFVE4Ecyt6xKUHpQ1iCG2IC3xmiz+Sw2+w7YDIabvSPO?=
 =?us-ascii?Q?gGy5lPlha1r5qx5G19McyJLywmQTOE/0+h5H7w6S1JqKYzYE5vUomYEGt8y2?=
 =?us-ascii?Q?IO5yhIwC1Yrjy57klC7NkbfS/bNMeumB9fU5DuwwkD12fCNmwRhLxM1lw/eg?=
 =?us-ascii?Q?CoqT/no3z6ZOEO817BsXZAlIea7luKD5EzH/aa9e9FYgHovX9j7NA9lmb9zD?=
 =?us-ascii?Q?vD/Sg3EqkI08wuRcY7J/aBoELzofbbqCMeQDWi/F8lEH2+PgL2+eYcFCO+YM?=
 =?us-ascii?Q?sK6dp/EeU4cJCAgQgqY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e847f0-bcb9-4d91-afa2-08da91c0e652
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 17:38:11.0117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0jIf9eSQfDKpsfu0K1oKWQwZ2bH8BPttDBzOExSQ8NW+sG6itGzUe58DqobvYIYU9XQD9t6YWGhMmGuEJ1JeJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6197
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> I was going to send a v3 patch after I get some feedback on the other=20
> patches unless you'd prefer I send it now?

Your choice. You can wait for some more comments if you want. But frankly, =
I don't really expect more comments.

Ok! Sent v3!
