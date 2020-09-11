Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2840E266557
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Sep 2020 18:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgIKQ70 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Sep 2020 12:59:26 -0400
Received: from mail-eopbgr30101.outbound.protection.outlook.com ([40.107.3.101]:7528
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726229AbgIKQ7N (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Sep 2020 12:59:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhAk+Ve//ZxLn0cdP+rbHaO9M8zleQFQxsNAP2Kbvpr5fTk28BJbyb7W1WbGm+fuRnJgFaCVYQJhuRHOtbihv4u1v1tsYdIKljnAxgLhv6u1jglyhneOL4zDKIJMQF04yKXhxy4LL5MFLPOWvVgzQcF4rYR1MeUta+aTCn3HrMK0rvPgskpBj2mthAwWjBv0d6FeUjxWTD06s/tNT+Hc2U3SPoN/HB14f8Y1SfygdaCwWFz8IS0R6/NTaQ9jfw07DGUIpLv7blyTupOeFtoRpouXuHUw7xxsFgfmfH6LW/g/WY3hFR1XZxEeDXXTelJBhO61n20vcikKOHPLuk0UOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VsHC+PH2kSasOk8sQehSXQzPMbjsA+SVap6jXAWOwY=;
 b=SMPi1bq5AVkENrvuZGa/84Yrg3odDsAZUWxvNXhplFd/vt7IcYBZY5nISrbypXV5/lVvYlWxuMFZouRZGMmVl+Uw3VMyrygh6K2jkS8LJsSwwd4LDyRf673Z/z38uqUDrT31Gw8cs3fgXo3Mi3UritwXEJDY/neJM7p4y0vvOxautISLoHgNtwQxHWNzW5j284smTDk3OjGpbD1U3uRCxOyLeM9snj9xh/Njf39S0CKu6B70b8im8V3swA10LeUyrqlO1F5Jy1WE34xsEXloBgkpjjH7iCuHJLHUcpaqmd6D/TEAtNpL3jWilWDfa4fxPv1CsnV7AfMEDShUP7epUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VsHC+PH2kSasOk8sQehSXQzPMbjsA+SVap6jXAWOwY=;
 b=wrW7kPu0GrQ+qCTx8I+ofAOX7rCyRDUvnIc8UvThL6yksgeYrpDwUj97k1kNuhmMWet7r0k0BTumL2O/j0nlsHxaL78RzA0VK9sQSB88a4HlBtb663SFJWW4KiIkq6h9TEMcuUCz5FoeS9inRgfq++0iYYet5KXAMeMkWlS4UOs=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=plvision.eu;
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:56::28) by
 HE1P190MB0089.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:c0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.17; Fri, 11 Sep 2020 16:59:10 +0000
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::c1ab:71de:6bc2:89fe]) by HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::c1ab:71de:6bc2:89fe%6]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 16:59:09 +0000
Date:   Fri, 11 Sep 2020 19:59:02 +0300
From:   Vadym Kochan <vadym.kochan@plvision.eu>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] nvmem: core: allow to register cells during nvmem
 registration
Message-ID: <20200911165902.GA20711@plvision.eu>
References: <20200831015539.26811-1-vadym.kochan@plvision.eu>
 <20200831015539.26811-2-vadym.kochan@plvision.eu>
 <6ab47f55-af66-f035-d8d9-82d0c831b5b8@linaro.org>
 <20200904112310.GD10654@plvision.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904112310.GD10654@plvision.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: AM6PR01CA0070.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::47) To HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:7:56::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plvision.eu (217.20.186.93) by AM6PR01CA0070.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 16:59:08 +0000
X-Originating-IP: [217.20.186.93]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96176d5f-f897-4e5d-976d-08d856740034
X-MS-TrafficTypeDiagnostic: HE1P190MB0089:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1P190MB0089484D9C0B557EBF7700FF95240@HE1P190MB0089.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qZdiQGYpULdk+Kaqw+h/HQ3DfulWfxmuHLtE+Fq2EQGz3IcaCqms8ffBQZGGHRzVeVx9D0NAyzfxRXsVb/BnSpKYwmkHOsmna/iig0gBBy7aoOyvZTwgSO6bFypYCLiq/TGkvRguaJdj1Qb70cSJe/GtkoOFhiZZIHMOnf0Jgd7aXPS29sGQnLPm17LYRzFcQkQByJPOeAyCtKvt4EcE2p2QJRj+Uoltf1Ib7UTJxKoSMThSyk33op2rR0MtqZBpEBGYexLT5GATgk5asQorKR8eR6mRAgOhN8wwfLrZqucMJpHr1VprZbrQiQEVr5wLJHRBqWQu1lDaPLUOZLcKMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0539.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(366004)(39830400003)(136003)(8936002)(54906003)(478600001)(316002)(956004)(55016002)(2616005)(2906002)(44832011)(8886007)(8676002)(83380400001)(5660300002)(6666004)(26005)(86362001)(4326008)(186003)(7696005)(52116002)(66946007)(6916009)(66476007)(66556008)(1076003)(36756003)(33656002)(16526019)(53546011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: DTJnaWvHqFkjnRm/7fuLuWzN2JUBFcaX4CkgEV/oWN1+zGJRBhglShLpWn0iiOnpTCgF+/wRshmnXmIq4+F0BodLhSjpcmRCeGcXR1KvJIryWFeeFclYx8DI7Xr2tNK54ATqQ005ye6bVK8WTcqgI5VACg+TiGv7s4LPchH3pr6riYSOkYmVDIaGLxcD36S6Ovb2AOU6TuXhvYeucTvdBWXZ0jt6FXRS8Ace+qx2lsarQ3MyQgxAVfSmcgmdG6xqJGnrVNaXKZ0sNr55TUKPYcVN1B0fC7r5cdCrendvtd+Iw/yy1Jqff3rY5HCE8V4ImdNBigPs+oX4DNzo1P1AUMOpqYJoFQAFt4CGyhj6kNMKbPAQlk+ZkNUjrKGixMwhQWparxq2MifvsC39qGF2qmdqj9ijCNnO9Dg68zjoamZx2lD7MtYzsu9q//msnrwrk/zUYns+Xj2t08Fdb9uvnNIx3jk1TO0OE5zVxEDlnHSo8Ri/Fl9AfqjGRfKE8MK9+Z3t5nPFF0+IPbqtOW52RP3nffo0oWINZ0xalapz9kDAUHKrdQXNlfjor3kK+IiJfBm22cD/9mOJi0N7GM7Bk/WpqhWHykP3V0fo0wmxY3t2mogErY91tEnMgfjFFg+6vEIA/fQy62TNrg+jHMc7gg==
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 96176d5f-f897-4e5d-976d-08d856740034
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 16:59:09.5665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuxS0qe/NoHtdDzRrYC7XHCRdyDa75M+RiNPfxBqWb70TfNXPra4YI/PvpXXygAGPiO3kySe4lM0h7PJF591th8KucxcamzWrnc2QxrZcvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P190MB0089
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Srinivas,

On Fri, Sep 04, 2020 at 02:23:10PM +0300, Vadym Kochan wrote:
> Hi Srinivas,
> 
> On Fri, Sep 04, 2020 at 12:02:40PM +0100, Srinivas Kandagatla wrote:
> > Hi Vadym,
> > 
> > Thanks for the patch,
> > On 31/08/2020 02:55, Vadym Kochan wrote:
> > > Add NVMEM_PRE_ADD notification step which is called before any cells
> > > binding - from lookup table or config, this allows to register cells
> > > in some specific layout (tlv) which should be parsed first and then
> > > registered. So there might be a cell parser driver which can register
> > > lookup table during this notification step.
> > > 
> > This is going in right direction but totally not correct way to do it.
> > 
> > 1> this is not scalable as any consumer that will register for this even
> > will have no idea of which what kind of parsing that provider needs.
> > It can work in your case but not really useful.
> > 
> > 2> this is a consumer API, not the provider api.
> > 
> > How about adding a "parse_cells" callback in struct nvmem_config along with
> > encoding type.
> > 
> > 
> > thanks,
> > srini
> > 
> 
> Looks like I missed main point here that this cells parser should be
> registered as nvmem provider. I will think on it.
> 
> Thanks,
> 

I am trying to re-work this approach, but still I need to clarify
something.

It looks strange that this cells parser should be a nvmem provider (or I
missed something) but I remember that you suggested about introducing
something like nvmem parser. And adding nvmem parser looks more clear
for me, because what it should do is just access the nvmem device during
its registration and provide list of cells, that's all:

struct nvmem_device *nvmem_register(const struct nvmem_config *config)
{
    struct nvmem_cell_table table = { };
...
    parser = find_nvmem_parser();
    /* I think that cell lookups may be added on the parser's probe
       statically */
    parser->parse_cells(parser->priv, nvmem, &table);
...
}

/* here I used struct nvmem_config, not sure it is a right way to
   mix nvmem's and parser's struct fields, so may be something like
   struct nvmem_parser_config might be introduced or fill the struct
   nvmem_parser directly by the driver and pass it to the registration func */
struct nvmem_parser *nvmem_parser_register(const struct nvmem_config *config)
{
...
}

void nvmem_parser_unregister(struct nvmem_parser *parser)
{
...
}

Regards,
Vadym Kochan
