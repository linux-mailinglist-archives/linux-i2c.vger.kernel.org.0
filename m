Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8E787384FC
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jun 2023 15:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232572AbjFUN24 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jun 2023 09:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232569AbjFUN2v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jun 2023 09:28:51 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2138.outbound.protection.outlook.com [40.107.21.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3521998;
        Wed, 21 Jun 2023 06:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoLSqocOrwvzrYVBi2HQ51l8Tx+mAN0XFuSMYl6/M42PTBr3kUt2tqyGVA4hWDmjsD1qI33rM48Ep6j0EQ5ma/ZjctS3O8oLCO5U+pLX2EwIMX+xoUuoaszGfT1vSSx9C2ExZlAsOY5etkOOnPMzjw/iEXE2O7rRt7cImiMZlUIGqaAI8gQvsXFBBi7qJhVi786QR6NX1cRoRwuAb7KJEsZKrD1E8zA8zAd+GDpx3yMjVUqn5bdime/6i+UAxwEeqJEUVcgxn1razRVSHmIkbfapIXRwZtolJu0eN1WJ2mi7U8NK4s5m2F0hu6gcsAbFsgdZKxwifqBaHwSZ5LiJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWIHgjsj2Su0hQLjtNlAFWaXlhkWN8rxSwfV9gyv09M=;
 b=Lqr0MMGxmbFN8Bozyxr9tG2V0idruQY7kXlVo3wfYX/jrAgb9HZ/8IutwWi93C7s1DzSzhCmBMSrovkg1GUADrV1Mx2oNeu7IcBqAWq9ZpTB3lssaPplnwAfcD2YyxAEW4Ut18MEF9xSh725cNWWPBqxesdCKjtFd95NMGuC5LaEg8P1C9/w6WPSD8fpp8dJQRiCzfWD0cvj3OIECAGEj+wYJcuy7c6l8142tDTNfuv2/pZc9y3iTUVF1dYwiECZmU5236nTCCL8Nqyxi7gGF8tgUXYfeyc/cRmbr0P23+ayLgrPN/WECZQBSDsQaLN+aFkslE/3A5rrrmSuGl7y2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWIHgjsj2Su0hQLjtNlAFWaXlhkWN8rxSwfV9gyv09M=;
 b=CtaVX1ZMuIkJ0otRDJvst97bz0uB2pQsF1Rmj27SGiA/6MbRvqLsErq0ORQhQ50kjqy3ZxUt3gfXbxjsVgdBoti750rhJFqyG3RnlQMqUVE8ANedoVLdRaN1lCp8/Mrs0Y4fGwdlrfUbp3TL4ZVwF+UtYlRP32dhHfJRIn8yOWo=
Received: from AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:591::19)
 by AS4PR10MB5394.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 13:28:48 +0000
Received: from AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a069:8f48:135c:3f5f]) by AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a069:8f48:135c:3f5f%4]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 13:28:48 +0000
From:   Michael Brunner <michael.brunner@kontron.com>
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "acpica-devel@lists.linuxfoundation.org" 
        <acpica-devel@lists.linuxfoundation.org>,
        "lenb@kernel.org" <lenb@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "robert.moore@intel.com" <robert.moore@intel.com>
Subject: Re: [PATCH v1 1/2] ACPI: platform: Ignore SMB0001 only when it has
 resources
Thread-Topic: [PATCH v1 1/2] ACPI: platform: Ignore SMB0001 only when it has
 resources
Thread-Index: AQHZo5VI7IrE3xvC7kWrbR8c4raVtK+U4d6AgAAdIACAAD/9gIAAAneA
Date:   Wed, 21 Jun 2023 13:28:48 +0000
Message-ID: <fcee65cded553de501a4b22380e49c1914f63799.camel@kontron.com>
References: <20230620163534.1042-1-andriy.shevchenko@linux.intel.com>
         <b9af5a068cc0b5e785c8e2ddfc70d811fd5929cd.camel@kontron.com>
         <20230621093056.5qfa3kn7ldgwsyeg@intel.intel>
         <ZJL4/X1Z9gCdESxp@smile.fi.intel.com>
In-Reply-To: <ZJL4/X1Z9gCdESxp@smile.fi.intel.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7551:EE_|AS4PR10MB5394:EE_
x-ms-office365-filtering-correlation-id: 61b7b68f-88e2-4417-cd5d-08db725b71df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j7RLDliJ7wezAn2TS9V83OVpIWrzKnuiEAZc+yxdIqajC070IJ+gBM1x3o67SwhVji1z71Y77lLnwus4TZTGp/iyiHWSCy3VPIvpi3LnmA5d8MfrnW9etW97K9GhLZi/tUiUNPGXvKaJYPju+9ZJsB8RSAB+r0EAoQ0fdREjz/jqaQaf0KvBmzmQ+uOnxlaVvXDxCNvLKP4YU6qiR8GO75Zjm/y20plMwgPEo1wlg3AB4+vS+AKsEQpuDQvloBd7+SPzxZizYw4YT9n8f2Y14+OalNMyHEndEYcPImERpCDxgfTM/Y7agS7e+0jMq6GlHrZFQQmE65yoI2kBgS+jDvzRM9WsqNu5heyE5unsFYMHlKGNSJR3kv+BPiwFanD1Uum+u0TUNvLREvFtlUDhbLVGfLCtH9E9xATBLxG18TMaRfy7Y2eEh5tNLHEjukSMdvxSucRRbmGubVzVJj0DU+1veczy8JbbOLwQbkHuz7O5bqH6LvhTvwsn2t2ulw8o3NcOQLa9byMjbY8UfDr1YNWF6BJ6SHrz10SLrGEal71eX4yVeKHkUV2ZRnwavaEioIPGoFg+l4DCet9hSZyVHZQSxsyXFTd4fhrZQngoauo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199021)(76116006)(91956017)(71200400001)(64756008)(66946007)(66476007)(66556008)(66446008)(4326008)(122000001)(186003)(2616005)(38100700002)(86362001)(6512007)(38070700005)(26005)(6506007)(83380400001)(478600001)(45080400002)(36756003)(966005)(6486002)(110136005)(54906003)(44832011)(8676002)(8936002)(5660300002)(2906002)(7416002)(316002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?9ltTrb6GMAAMvBB0ofYKPGn7uLug6acFVzQPO/u0o6Mke+W/36qKlHPym?=
 =?iso-8859-15?Q?bOAqENpswPxFiWNNW7N+fsNsx8y8aA6F2Tw6RCo9wgiUQqAo1gL0j6Umm?=
 =?iso-8859-15?Q?fstyMcKj9Lno9o52M4JmkQ/MGUy13vxAFM6mmvPjDXwnhy5VKC5Xdp1lA?=
 =?iso-8859-15?Q?fLrIelr7HP61B27lfbr4uJcHLMlik9/N9r2piUJlphkIpqrOLeM8AHPog?=
 =?iso-8859-15?Q?PJowUZdU68d2Td+In5GGCMBlX6za20CeaOwzVxde0PxPlWw/Knk8Xz8+N?=
 =?iso-8859-15?Q?/eHXBDL+vnFPY/Bk/tZRLFUGwAJtooDQuE1uV7ecuDERGFP667lUx/g6L?=
 =?iso-8859-15?Q?mJqvXIUaii1YgUNZc7BUdI1/CHIiwkniSK0QfwPj9iWzmqRfHQABBV6+s?=
 =?iso-8859-15?Q?saXHPAf0vGH6KEndr8JJGugm35mz9f2iMHSORFyGDEDudaVwLhD3JfMWu?=
 =?iso-8859-15?Q?KfoMG7GRnsHIwtizWYZW4lFvaMfb8q6wVbacFNfjHlmTC6daN2KGBpSGx?=
 =?iso-8859-15?Q?6RHp1mAYF8pY7Y7E/bWy+rgREs0r4dvyHQ/sc9OfTBjcCeDIuETOW4p+t?=
 =?iso-8859-15?Q?7WF9uinGfaXghg8lt2YT50r6hQI9nZ6GeEifOk9t/HUCfmPbwWgJgCaZO?=
 =?iso-8859-15?Q?HnU3twf0tS0xYO1n2S7+T4pi10M8VLYECorOxdz+OoE4126UDoJlINIPa?=
 =?iso-8859-15?Q?jINMDbmdr/8kP9IA1W3Gd4QkyxfUS4pq4yjaicyxgq/epBQF+p8ti272L?=
 =?iso-8859-15?Q?oxtPDCKDFZZ4GOOwJzLJnupezsJ/XCwthzcEbJakHHzub6rlOdVFFSjmI?=
 =?iso-8859-15?Q?QM8MYod3Jtk5IpF7FTA5ZfLGh2324yY1JKsos+9XvaMfb/HWMW9H+otpg?=
 =?iso-8859-15?Q?q5jnhpKIWF4qc4xjfvkKw/idkdo4dhz+cbs0gQ64qtDyXI35Sy4NNWNkS?=
 =?iso-8859-15?Q?9GdqFQOt/gaZrDWVgCSyYDcR92TnDI/PLDrJmDD+3dqY2xjAnnJyq62o5?=
 =?iso-8859-15?Q?WSF538t8KDbwZ6QITbyHiQWb7Cc4aIlMyW3LWGgluHMr63OPIoI0IAKU5?=
 =?iso-8859-15?Q?qJyj50rjCEmAHmW11XYwtbxSs+dHfpGMqqjiNHDw8siYS4oZVycJMz2Oy?=
 =?iso-8859-15?Q?R1TEwIfTRIhH6RUEvMXoH2T+B/wGzJW0UtP9OumvzRlsBvshLIpM91Cry?=
 =?iso-8859-15?Q?f+n3Bvr7+b4pBGCAC7cwmHrvIRTrdJYhrHj40nXDrE4L+9GjLE0UQZrzS?=
 =?iso-8859-15?Q?b2/QbP6eJqUJE1ZK3Gwy6Scgj1ccYMwNxldbxlTVI13iIfFpiyw3XtTqH?=
 =?iso-8859-15?Q?dAfY2tGIaNyAMc6R3J13Gmz76QZ96ssw6R0ruDONY2B1ela/5Uzxl2rI1?=
 =?iso-8859-15?Q?wqyjvbueneJlIy/23Z59wtbQWTqb4W4U4EDOWZp0NN/tR1+MnMWd+vgsa?=
 =?iso-8859-15?Q?6j1f/l8TEc39EUHFOKGZC+zoeX8b4NSLgaugTtcpyC7GMBzX/tUc4Qmwn?=
 =?iso-8859-15?Q?2HFpa5DcawDntpqEoypNKd1BHbbOD0isZ2JGWNhLY+5ikf/IG9KJjeZ/M?=
 =?iso-8859-15?Q?k4rnFG4LXVo0R7PAAySZZSh2W1YsvHBiUR9f335zrQlc7jdB+lYFboXKu?=
 =?iso-8859-15?Q?ZvKgUpNkHwA4g3Q13hEE2iA3H/nMpBbbvj4CTtiwSdCMUXTWYgW6VnaqC?=
 =?iso-8859-15?Q?E9C1g8G01Kl+1yMnOQzBUDFMcPnIp8FXjBtbgxa1gDfPvjA=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <FA38881922A2C74B9499C211422F61AB@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b7b68f-88e2-4417-cd5d-08db725b71df
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 13:28:48.0915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mVRUkKcjuF2VvXJ20suLitRpdz5EYB0+LB5HV/0bB2YFKWPwaOvUj+2vAHG3+1jqq6EjvWjypB/FBLRjmLnLvPubBFeJ53+JOSmj9oMlADg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5394
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 2023-06-21 at 16:19 +0300, andriy.shevchenko@linux.intel.com
wrote:
> On Wed, Jun 21, 2023 at 11:30:56AM +0200, Andi Shyti wrote:
> > On Wed, Jun 21, 2023 at 07:46:42AM +0000, Michael Brunner wrote:
> > > On Tue, 2023-06-20 at 19:35 +0300, Andy Shevchenko wrote:
> > > > After switchind i2c-scmi driver to be a plaform one it stopped
> > > > being enumerated on number of Kontron platformsm, because it's
> > > > listed in the forbidden_id_list.
> > > >
> > > > To resolve the situation, split the list to generic one and
> > > > another that holds devices that has to be skiped if and only if
> > > > they have bogus resources attached (_CRS method returns some).
> > > >
> > > > Fixes: 03d4287add6e ("i2c: scmi: Convert to be a platform
> > > > driver")
> > > > Closes:
> > > > https://lore.kernel.org/r/60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.=
camel@kontron.com
> > > > Reported-by: Michael Brunner <michael.brunner@kontron.com>
> > > > Signed-off-by: Andy Shevchenko <
> > > > andriy.shevchenko@linux.intel.com>
> > >
> > > Works as expected - the SMB0001 device shows up as platform
> > > device and
> > > the i2c-scmi driver is enumerated again on the affected boards.
> > > Thanks a lot!
> >
> > is this a "Tested-by: Michael Brunner <michael.brunner@kontron.com>
> > " :)
>
> Michael, indeed, it would be nice to have a formal tag.
> After that I will send a v2 with tags and fixed typos
> as Andi noticed (thank you, Andi!).

No problem:

Tested-by: Michael Brunner <michael.brunner@kontron.com>

Best regards,
  Michael
