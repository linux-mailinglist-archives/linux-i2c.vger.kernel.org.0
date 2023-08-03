Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A546D76E003
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 08:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbjHCGFa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 02:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjHCGF2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 02:05:28 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2107.outbound.protection.outlook.com [40.107.114.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C491BFC;
        Wed,  2 Aug 2023 23:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJygFIuR5Mb0sL2EfQ3Ci9QqRlS8T9If1kv4XkSRWjn7p6WzgWXVjK1Dm4NHT3rwIsxNdFTF4AwV2DhBSAv72O+/93BzMy2MPHoQom9vhX/BYQiC0gr5bd7d7JGARi6q4B/fD+XYUAM78JTq6zPSSbBeQdbOX+MUkVYeFT8lFFOV6sqVTMrSBPWTUhXZQ/pltmuJjmrKPkJZaTyGgqz3r2ZJrCf0vp7BoKsFg3zUk6Cma8RHSEjEHyU/XeGnh9Q6XQq+TD3iPdGtFQLaTdJvy/EeauNlqzhlShmQC9r2ZQOeqRkvQgbj7j1JP6IJJbLSCLxW1QSzsAGnxDLgrdwO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TCZsqrQ8s0paGG4zmQYHbqQDRleJUmgQYlrwalbHDE=;
 b=fVbR5w3QBlTn7Ox0XvbX7+25MC+CCYPUm05VlZXnRDVMnEgum/OSuUdStOYv8vjdIbcrr18lMW28k3QwGBsdTwIpPfsBfW15QbZEoSVkhYvFcTvcsShkH+tDwc4ZHO1w7G0JozL73uaXe12tV3tZScV7qYj+TBHkmQHgiJvP3ES6RxnkUuqFPR5gAm0jEn99pC7CMqMEFatP36puexiIcwXh/FQUGN0Y9o1zvv2Ygug/rtHgao3aRlbtDLsz/PBs7yAnQ4xHOAKHj/YQIkdM9orN22squMHLLg2mV8aZJo8zRa5fbQjeXt+NbpUKxcgXAUztH8/Ktb3W1OUUOZ7v5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TCZsqrQ8s0paGG4zmQYHbqQDRleJUmgQYlrwalbHDE=;
 b=j1tjSoCHsn3Z7xdtobmrYQEjOSz430kV+ACEidagl3kPrAS5VJvAH0leg/D0ML9m6u6hh1SOYuoIcHAKDkFZ9ZEHTF1rc3/IcC7IvBREF/yymDlXdaRluDpUMqCPAcEXPM5as4aD2Lpg5IoZ6CWelaebbSmJGfYM4aWZB+MBfz8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5794.jpnprd01.prod.outlook.com (2603:1096:604:b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 06:05:25 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 06:05:25 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 3/3] i2c: Extend i2c_device_get_match_data() to support
 i2c sysfs
Thread-Topic: [PATCH v4 3/3] i2c: Extend i2c_device_get_match_data() to
 support i2c sysfs
Thread-Index: AQHZxTPGKVbxcn/JNk6+MhlvEp6rX6/XTCcAgADKJuA=
Date:   Thu, 3 Aug 2023 06:05:25 +0000
Message-ID: <OS0PR01MB5922D81A8BA612CFC33E004C8608A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230802112317.252745-1-biju.das.jz@bp.renesas.com>
 <20230802112317.252745-4-biju.das.jz@bp.renesas.com>
 <ZMqZ1oT8SZiEX4dG@google.com>
In-Reply-To: <ZMqZ1oT8SZiEX4dG@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5794:EE_
x-ms-office365-filtering-correlation-id: bcc33fe9-9c30-4512-6c31-08db93e7a106
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dEoRZv5v4Svt/olLrpsNvHk/m2Ld7O9Q6pSkPESbqhfZKiBsXsmHx2W3WwlSfOn6F39NZbVZ3lyLcXeJBiQKvRRvh7PFtswYYFQ8YxlBKatXgsDTPPmgZ188iiqXJ5l0TV+govU0PXi2E7zVXpL1BSKITdtvsSKbZsPFVtvSsaAftTj3u9HpJajFf5boqlkGoM33GViyqlrdtiNmpcZGf43YTsmNxQOFXqgfMyGQFhmrcwqIAIuOVGEz0g4QUKfSCtA0sicZ5Vrl9hS8BN0Jq2dLNOMlTA8rFTII0RqrYGswo0rbxVMry0lSZzuIVnebhkgPzEt2LxnF+HtoOKjQYnK9tAmtngsSCRDPTVEx0u6yo0O18T/mLQmLOkh9K4JtQL605qNIwxBBvFkwnp4PKYW7ljDdUzDEJ9Zf21OcxC1j38AQEwJZ/XgQ755EfP88Rgy5EAylZCWLwsouHLiCBz9E8/3bF2h6Z9honp0kp7HCXTrngm2dA05Mo3aQdzachyyLFOreSrH2SFBg5JKWgCHKIdJqtZDOEpS/5Dv6ma3/EWOCPbX0zvbfQm43mH6VQ4uLia6MeMWykPtGFsJZQQhyLUiHUWI7F59xR9yQIVQEM8XqHE3VszuqyXWnbi+u
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199021)(6506007)(26005)(186003)(4744005)(316002)(76116006)(2906002)(66946007)(4326008)(6916009)(64756008)(66446008)(66476007)(66556008)(5660300002)(52536014)(41300700001)(8676002)(8936002)(7696005)(71200400001)(9686003)(478600001)(54906003)(55016003)(38100700002)(122000001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AzbwUIPPY38Z5jKc9n60+l/pOSqd4HeVH8Ei+VG2Mb3s8yaR353nvdX12IWI?=
 =?us-ascii?Q?aZE7mcycazTQXyoTqQCaoNXFs6xqz2JFC8MnRUk4bCxGBUsrlJsW3nUMwJYu?=
 =?us-ascii?Q?9B4EnDHUcadp19bzZuRntwaM9huG6gfGFJfV7bSJb+mzU+i94PPU+0rNlXYU?=
 =?us-ascii?Q?DKJCAMbZEukK0r95vefFf1Z9qU5ornjd/qIMAcGYYY/PjW9S+yUTcuClNTW8?=
 =?us-ascii?Q?+LZAW+iVnEzUNV0/9Or+7B4PbEliERLUH2fyd4L/VXSCVDU3QgbGNMkPlbCa?=
 =?us-ascii?Q?IeO8fHBGgwSp1pSi1y1NtWCJrMStPkGq4D+IvCX6/G25hdEsCtxVqPiSQ5WI?=
 =?us-ascii?Q?GKpFrzTn/Ir9bo+jUCzNUblo9dV6Sn6KOa9Bj0N6w3B8vSR79o6rJAPju6aa?=
 =?us-ascii?Q?ZyHs2b1aZ0ZMGPZh8drw/tD4ZcDkRmXmH2Hznk1j5/OmzEFjIABxk3kb5SHg?=
 =?us-ascii?Q?diBLGbX+ONuJW/q5tlJqJ2e/DZwL9RbNB5w7r1wgqd/RT47wynjFjVMX+VPT?=
 =?us-ascii?Q?vnOaKLc1H2Wn1GeNtUxI+P+eRybohhMrmcKd7I8sBu+g+5n8rVDJnc6zPpug?=
 =?us-ascii?Q?RbW019PQcRpxy3S4TqcHp71yLyPBMJXslbx75JZFp0TcRDGFRD94N8DDZqc+?=
 =?us-ascii?Q?yb2RIWWcjeL99Z5q8eYTsKOR4ugdT7y7vGFqhrVIjJzQKfBTM/JbToRvc347?=
 =?us-ascii?Q?sZHht2ijQqUZEbf9tD99YH8CXYbqoyNxOH1f3QlpSlBFsoSZxzv2qb+VQfn5?=
 =?us-ascii?Q?HWHh00ZX6EuS/qZ2e+n/dZdIYJGqj7nQosnQ8ZpjQMuICvwVc1/Vl7CyLQeX?=
 =?us-ascii?Q?TnK0vcF0d+fSymfA4MUz5BKxNGGVLYGOLK5HaRHauPTOjbRnxNWXACAv9igH?=
 =?us-ascii?Q?LFtxY+pMK5+Dhsu1eToEKDMMfXj6zpQIgaNxK4/dcdplv65G55WN8yjsbmKn?=
 =?us-ascii?Q?hmoX7pFM4Mv2tk5CpnSqxacLQpz3kqt3sPf6/pyZtRtYIyFgr87iYYvh85UC?=
 =?us-ascii?Q?vVLA3Tud2B0GGmXS+GAjcjSpzwKjEz1zz91VkOkbXyPDgttXGXcaxmAV/FfR?=
 =?us-ascii?Q?mzqpzRKc4om62cJ9n1a+mbTBVe7PKouCjqu5B0GV3pR6Tbsqo1cawA8XWfjP?=
 =?us-ascii?Q?dWyNylBhEa3AHjiAVMPd/2EIPjGZ5V4StZL6btBGjRYSgJWV1MtZ3UnrFLpE?=
 =?us-ascii?Q?D5HzkwKaYgT6cfFHy9jtFFPONaGwOTcNVLHYshOulYBMk6Zv0TG7hrJ5fCOu?=
 =?us-ascii?Q?KHMPRAODt8nSerm80s++uilUXd+7h/3bzak5LMaj4FuAEXzEtfxxy44/fACb?=
 =?us-ascii?Q?F0PlEjzdz+EIW5g+ZSB5gILFtlrdT9uV9n9HOVOiHbMmy4xZOpS8Z48B3ESs?=
 =?us-ascii?Q?vozwFT2eoztotr8pu7NLQ/+cqYFcyhMNk3uWN4YustWzpBuFfaty93IHzApg?=
 =?us-ascii?Q?9Ll4RenoEMN7E5D2iu1hXaZe0O+W8+lTpjsfLj8vYiOvzhl3LzUj4i8xJvz/?=
 =?us-ascii?Q?Q+O4mlK+dt4CbfjcsqVkjKYXgw+WhYwb54UcUd2TL1BU6trEsRAfseE4jzhu?=
 =?us-ascii?Q?9F01AD6WHqPa2P6gQaNaY50J5h9ALPZ4OxlkQPYv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc33fe9-9c30-4512-6c31-08db93e7a106
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 06:05:25.0949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eEYdziv5Zxd8wycyrll5unVSaNcWYIU8zODzY6ZCqX1xymYXMg10457bRtm8Xa3VAGq3axV0qeDDdMW/xaNqtU9ai3a5QcOoa6dmo908Gqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5794
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Hi Dmitry Torokhov,

Thanks for the feedback.

> Subject: Re: [PATCH v4 3/3] i2c: Extend i2c_device_get_match_data() to
> support i2c sysfs
>=20
> Hi Niju,
>=20
> On Wed, Aug 02, 2023 at 12:23:17PM +0100, Biju Das wrote:
> > @@ -141,6 +141,7 @@ i2c_of_match_device_sysfs(const struct
> of_device_id *matches,
> >
> >  	return NULL;
> >  }
> > +EXPORT_SYMBOL_GPL(i2c_of_match_device_sysfs);
>=20
> This is private to i2c core, you do not need to export it to modules.

Agreed. Drop this export in next version.

Cheers,
Biju
