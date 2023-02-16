Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 094A7698F6C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 10:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjBPJNI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 04:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjBPJNH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 04:13:07 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2065.outbound.protection.outlook.com [40.107.102.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2035D13D61;
        Thu, 16 Feb 2023 01:13:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDU/nsHagMRmZIIWSF0pR11X4rVeIv7YBD+JwVad6sncv6qzJvZ6JqUoSjY+NDV68WO3V9Dmy6VWrvZy4nVZsXdzjmdw2QGm1/dWMGlH3gTNsJjWv3kqMIcNZBh5xXjdoQgxvlmXzLUnGjJrlsQ8iuOHabrB6z1rU6a2hRRBAoeFTDgwfPsBYRQOjyah1+yFa0al6l/mwGS0n3CqS9Sq6cLPOpQ1546u8/qlGD+gOopWjG4orUow3E++Hszbde2qfYgyI5gxXHzdHIIMCFweeD3p8gdvfOnQ2Gu7ZVaiOWK99DnUeFfXw/HYNLa+w02rXGpxYy4caR/6+5cSMEkjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klV0qTySTJ3ALfy+/Vq5u2Y+rjoQM8Pvf4C5WzfoIa4=;
 b=B6Nmb7o/BU463p6CVdNrhqH/Z0FYVkKpnmp2A7v37aGhmD+85yezkPnNUHuhOER9xcJlkQb3c+ZE1UDKjOq6yXQ431VmK2PE2jPZOGsgf+JRjECfPm0wXKij/ylVv79fQ3V37buMiBXoALS11KVSjoUZCpBQJPT4tkJloFfxxDjVuqMJ3L0VzNVr0ms/7LZY29CSVNSAN7DWmZPC9lZwj/AnZSqIvvJWZU3nok8FmT/V0h4i6aOlzuhsT0JDZ9Gt/39pt5EmZtkKnJYIhRaXSvJBVx7uzaJFZOhT/ATfQ9P2qESwTBBb/J9Qyf+qCJHq4aG/H/oPZuRAvSfFDYEQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=wanadoo.fr smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klV0qTySTJ3ALfy+/Vq5u2Y+rjoQM8Pvf4C5WzfoIa4=;
 b=fJWJ9seQ4ByT7zhlciU23PlqEiA3aLQRbDZQQHqX4OUOPnN3QCKkN6vJXBsOelZKi1m1n8GYcxU07y11+S9hOmgOF+2LutTPQFfun4qpIaOC66iH5NCO8tDfkxgwHWAyr/8dHOH+bnn2upZUQXWZRju/iRDjXFZbFcWnfGp820w=
Received: from BN7PR06CA0048.namprd06.prod.outlook.com (2603:10b6:408:34::25)
 by CH0PR12MB5073.namprd12.prod.outlook.com (2603:10b6:610:e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 09:13:03 +0000
Received: from BN8NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::ac) by BN7PR06CA0048.outlook.office365.com
 (2603:10b6:408:34::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Thu, 16 Feb 2023 09:13:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT100.mail.protection.outlook.com (10.13.177.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 09:13:03 +0000
Received: from [10.254.241.51] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 16 Feb
 2023 03:13:00 -0600
Message-ID: <0bc626c8-492b-78ab-b054-0ae9f40cb967@amd.com>
Date:   Thu, 16 Feb 2023 10:12:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] i2c: xiic: Remove some dead code
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Michal Simek <michal.simek@xilinx.com>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>
References: <9d36938de98dc491425a51a9c07367dd9e448e60.1676457464.git.christophe.jaillet@wanadoo.fr>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <9d36938de98dc491425a51a9c07367dd9e448e60.1676457464.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT100:EE_|CH0PR12MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 280f2d5f-b161-4e25-bb46-08db0ffe01f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5xvy8Kl9YaxR6Ym2Ja26Xx7zbaqcBIGcQZPmDeQk8s5oGF/fkWcqKi0UCVw4934WfD5GcHiMv5uRIrTH4GZgzNP+nkyir0LQHN0ALAqTJF6DyiuQTHPSe0JOG3bNWibTWld0g21ezG14eh8vwRr9hqdf8v5D5ZuzERBecyb+L4aK0iLyvLcdkmnw2uTwZrZTC/C87f1E0XNXOD2u968RKIL0PYF8kdfRBBDrBY/3lNVj1IlRmlyM+Y17VNm1SjZuT9XvvDac5PFG4SsO2Apl42aCym4+0+bD7Uj9/2bBBo5kUhKFI1sosWsOWXdNqqfi/s4f6SNx7enITsXjIfByoZC0h+HG7mtcf5lITPmORjh8pHZf9VmJZ4VhBSOTelRRJ/fb7iWMEzR6T74fiI/oNTtn43pctmkV3qEcaS1z8RocZrdy5CtGmtVXmVYYM5GRIaJldeC9VMOSnPw477183o2eLTado4LFN5VWv4XGW0V6HGDKlX5fr9IPO6AQCtbgLz/twZZvGVBUmvSH1HMG1J04S2gdyH3jUGXfFX3Ps7xIv9gw6LSev6Cz4E91JhaeGh4gK3e1K9+Jr/a6HPqgMbs4jW6dQvmpNvSG7lOOaixXcJSC7hqJdmcXBdUZaNGto4CpAOMTtEYjrZOVoaJHbrLH2ldnpkrTIHkJFBN/LWRdES5lA4nK8Lto+izANfl9zh2w75X5NLfRq6vjT3+AezOPxMjvbinGjqJqZ2izpJ1rHhRyz4u0S1EjebbsTdkPBYQCGn3bdYYTwdCqTWs+TQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199018)(40470700004)(36840700001)(46966006)(110136005)(5660300002)(44832011)(4744005)(36860700001)(31696002)(2906002)(86362001)(40460700003)(6666004)(40480700001)(36756003)(53546011)(186003)(26005)(16526019)(478600001)(2616005)(336012)(82310400005)(70586007)(4326008)(356005)(8676002)(41300700001)(82740400003)(31686004)(81166007)(83380400001)(54906003)(70206006)(8936002)(316002)(47076005)(16576012)(426003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 09:13:03.1514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 280f2d5f-b161-4e25-bb46-08db0ffe01f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5073
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2/15/23 11:38, Christophe JAILLET wrote:
> 
> wait_for_completion_timeout() never returns negative value.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/i2c/busses/i2c-xiic.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 8503b5016aaf..5543f372ae60 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1038,10 +1038,6 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>                  i2c->rx_msg = NULL;
>                  i2c->nmsgs = 0;
>                  err = -ETIMEDOUT;
> -       } else if (err < 0) {   /* Completion error */
> -               i2c->tx_msg = NULL;
> -               i2c->rx_msg = NULL;
> -               i2c->nmsgs = 0;
>          } else {
>                  err = (i2c->state == STATE_DONE) ? num : -EIO;
>          }
> --
> 2.34.1
> 

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
