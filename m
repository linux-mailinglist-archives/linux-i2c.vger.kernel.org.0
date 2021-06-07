Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37F7639DEBA
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 16:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhFGOam (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 10:30:42 -0400
Received: from mail-bn7nam10on2057.outbound.protection.outlook.com ([40.107.92.57]:26464
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230203AbhFGOal (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 10:30:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fi1D5WFdKt75uVCmSgoDB3PeI/BOuzbdmW4xhIYvdgDzuFvsOb0kKR/zCdjXbHiKucj0HVWmrOExjdhPNjpgAgPL6WhJxV1ip37j0vCeCQrYe4esvbjKvH6pVSTkU1sSppVKXtS3omWdmpnXqMKJ3dra1sFpCTyCt4UvOB7JUL8qYX0hG8E9aXb7MJ7eZhE5gDlnROR0xlW2+EoTO9JOlzvGQ0BfqZHTvI1YaTZp6kjZrnQESzQJuAf4gGuHL7thAW8rvBVpClppytNlEzhwQGv69feA8HKnJjyyttoFcK09HyHy9zrz8t6wt8UrVx83o1L+/7hOF/4PCQac850RoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8Ff2upB7hXJAcNugwwmTORHiPFt5IyggTm4oCFt2B4=;
 b=f9Nku15xknglDsrT+BQOZ+jhpLSZmLOepLb2eicHgVaq7cIrzokT+jZozs4uxslKL9rA3RrqsqzX6OsbloyLJihDbLEgKe0QZonYwZsZAVCnuinBFFWdUFH90hExXwjCtxMeAp3p0UvnXBlgnKYdCKEE0wyAOz9X7dDd/4peSW+LdUcvZFrQt74NTh6W7mAnxdZ8BYEDvddU4c/+/mB4F0xJ87rVujYETq/cQU6aybOfKFd0mHRL0Eji2LK8irYkU91BEBrXna31pQL1uU/ZVD5NJbQ+NQLbblKN5bbZB1dieDboPHq3gkIbDWdwpV2Q5pteukvck3JLGpKiEtplgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8Ff2upB7hXJAcNugwwmTORHiPFt5IyggTm4oCFt2B4=;
 b=DTl7MwWwUMo9TdtMndI3V8e313uRVySScm38zLiSDgYqqteLJyY4nCl7RxRrOoUvIEjaWgTtiQ944KKQBtY+Hc+64gPn3CoHsqlxqaMMcBnkYwIi3/5VV1wnO13BWX8e8mXuHfUMMCTJrSs/gnk8unugdISOx4c5aLtzhUy2nCgjLrmu+5MfGdwshy6vPVL5GsIhmYqK3D5p8wCFw8eLXOsC8WvGRNl2FKhxo1GF80niW5rdTYSrTvOKc+q6J1SSlWyRkTj7c8+v5q4SI3dcorPHvXPaYqqRy9PgZ4TUld2vpWOwsqquCgItKpWRWWJ44PLe89UaAr74rzZ9AAWnkw==
Received: from BN9PR03CA0880.namprd03.prod.outlook.com (2603:10b6:408:13c::15)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 14:28:49 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::a4) by BN9PR03CA0880.outlook.office365.com
 (2603:10b6:408:13c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend
 Transport; Mon, 7 Jun 2021 14:28:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 14:28:49 +0000
Received: from [10.26.49.10] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Jun
 2021 14:28:47 +0000
Subject: Re: [PATCH] eeprom: at24: Support custom device names for AT24
 EEPROMs
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Fomichev <fomichev.ru@gmail.com>
CC:     linux-i2c <linux-i2c@vger.kernel.org>, <linux@yadro.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
References: <20210602170823.vnshp2gfrcay35nx@yadro.com>
 <CAMpxmJWa0ZXN--2S84B-Un0WSKM16eKAiWUtKD4V_szZPEi+gg@mail.gmail.com>
 <b2b7be69-eebb-b325-1962-4d45e6d5f088@nvidia.com>
 <CAMpxmJUnn1e-grUxiMm4T84xBYRi7jQOtOODfSoiBtLmsSjodA@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4ed2ae95-f2f8-0852-2606-d6315ed4cd4b@nvidia.com>
Date:   Mon, 7 Jun 2021 15:28:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMpxmJUnn1e-grUxiMm4T84xBYRi7jQOtOODfSoiBtLmsSjodA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c9804f7-10aa-403a-48a8-08d929c09108
X-MS-TrafficTypeDiagnostic: MN2PR12MB4094:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4094602D64F04D0BF5BCBD4ED9389@MN2PR12MB4094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OC2rhk4y72eftKOyUGtMXXDJ5VsjwrDBHrrqaX1VyaSMcaZI4vmqMhqP+D2QBp1x+DRNg/QjGUtv6VocGv3iW1L4HS+l6iumFWZ8iSpGP6S6Eu5dTOXlOvd8oFZu9NTjkdhU6cL4E7d51DcTfv4xnlr4tECZ3DNs45sMG9ki0iydCD47X9OnDkvSaO9Zq1iq2/SnxOoc/JOUTonh+J8h/paoU1o5ZBI6f1VJNgmuPgfVYULlzhS9u29Fx93t39/SHYt7qQ6NMiJFPAwr4pPPinBcUzZESxeXZ5fSFKk4NPEAVvpj4bgRfUERPBGSCo0dxhWPICNhW6b7qRuNkTgy14mJg7aBdNSBwajoNlvLnpt8XPvQPqZmzmaDmnEc+EPJuvpUSHlghNfuF6BjK8OfdSBD5/Fa8aih/ltfU5ZuvBmc1aADY0q6wE4dllHb3FXmnhpyZUVID/HBJU3qE9pLFc05BMZPTOgPXF2MllFQRwG4rZFggX2GnZRbXOihbuEjFqQdu235V8f0DE/JCckafOoVVQrevg45FPzMfhaYxhsoo49bYKCBaOFKc1aN2SXOhit6+nNZDWGUh5bSP/VMHlUMc7kg4TNTQdgezzZ4KKr0pZUC8SusAg2ONRUpsPVu+lLpVnZUX2lsnL5gX/IcpMpGW/2iFQriYC5lgehbv1bI03E48rrY41uXeyUKG8Jk
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(36840700001)(46966006)(16576012)(82740400003)(8936002)(316002)(107886003)(31696002)(26005)(4744005)(426003)(16526019)(82310400003)(186003)(47076005)(70206006)(70586007)(36756003)(356005)(478600001)(36860700001)(4326008)(110136005)(54906003)(5660300002)(86362001)(2906002)(53546011)(36906005)(336012)(8676002)(2616005)(31686004)(7636003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 14:28:49.1473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9804f7-10aa-403a-48a8-08d929c09108
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 07/06/2021 14:31, Bartosz Golaszewski wrote:

...

>> I would need to check if appending a suffix then has ramifications for
>> what we were trying to achieve.
> 
> One alternative would be to use the label "as is" for the first device
> and then append ".x" for each subsequent device with a repeating
> label. Does this make sense?


Sounds like a good option to me (assuming this is really needed).

Jon

-- 
nvpublic
