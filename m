Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 347B366C2E2
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 15:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbjAPO4O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 09:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbjAPOzm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 09:55:42 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5D42684A
        for <linux-i2c@vger.kernel.org>; Mon, 16 Jan 2023 06:44:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcE3Rx/uTeuzR4oEBQQqpAa6V5TDTAXu7GCTSNezDYqiVKDAqOxTXGLuAjtMh+mdehQcpbf8hHeAyAiyG1ScMQOa94J8aZLZsJiahd14Tci+/0CVQrVwQPcrhM5urhNO2qN9duyP2tyfMtnBXpOVh4T7OjupLp+jt0j1HlpEfe7nUbfRP3r0oSwWhi17XApv7hHO7ZSEhZiwf/NTMngFH6H9YZ17+KWKmkCXXun0fuec2VpXiFmW1i6eI1VHgRAXkMXYrxDAkp2OZXr/UpO3Nlp7wdJWht9GgQJ+ur4RKSCGUtlFawbouSTkDO4yRCsNB7QEIszZQZgA7aN1FJK0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJALn8na6a3HeEc8GatNSIts0L9buX0GDHPB6NnELxM=;
 b=CJV/GH4rU38QNwhZeKmGWwPXkQPK09nA/lBT+bg2vM/PklXaFP/GNVk3/wKYGxDOfDaWEFcE7X0KCInQO2nqGOWOk+lGE1S6gGpLjhO3q0sISP+vcncDqBUqaoxlUfHKUwCcP6gq/lB/BsgI0e7Byjdn+kdz/SVLIH+Yi7H6iWcjx7el0vOuYxUBosextSIA73EmngJxVOUU3n615gQnoMmxW5cilXLVEiklUkM1D0DtLaajNjmd9QB8ZNViczU4dgck/fRd6DA5hXLIyebXIFwgYLapVHWoAr/nTbbbwN1OnFb3oVFQDg9V4ho/8uFzD3mW7AFFrBlO1O4hEd5xdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=metafoo.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJALn8na6a3HeEc8GatNSIts0L9buX0GDHPB6NnELxM=;
 b=T09LwYDCvywFm2P9BRiXJ/GN1zyjCx3sHQKow3Z4O1oFxYinjiaz285fDXwki8kHtUqg9m+3Kqalq1w3rzXRj3T9QxRW9wdbWHW25rcTG4NvB5/ycOm0TCZoja+wocQU1aHc9MNtH2hG/9YbrxFfWStzaeETILwtBu1xm6/KoZ4=
Received: from MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::34)
 by DS0PR12MB7995.namprd12.prod.outlook.com (2603:10b6:8:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 14:44:43 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::aa) by MW4P222CA0029.outlook.office365.com
 (2603:10b6:303:114::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:44:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:44:42 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 08:44:39 -0600
Message-ID: <b23d9c8f-5d40-94e2-6f82-6ff053d3606e@amd.com>
Date:   Mon, 16 Jan 2023 15:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/5] i2c: cadence: Remove redundant expression in if
 clause
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
CC:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        <linux-i2c@vger.kernel.org>
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-4-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230107211814.1179438-4-lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT045:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc401a6-3be8-4510-8696-08daf7d0345c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xGdNy1YPtSILBNDYl63sht6veDfzuxmMxqV9+B9M7Yj3xPj2luksNMAZTuK4Zhgz/2AaM6M05mlXcGtSHRRDHYJvF+BSDbIJVGLityMJZNuH3XV/mxBJuKo7dNYCeCuyRjIsZUfwnDCYbngWoumdeJnC39D9ifm9An1ckOQD1sM1KSmDSS1OAseCBTj+y+K2XaH+OgMrpbaGXXnciRcN6sNllwx+tTWN7zqT23eKQjKuXTAkprdokH1cQu1RbRzDpORWXnYjAkWNYHdDYLchbp320B7FuqYHekdsChi4nyVE0Jn62jNilXHdLfndhSbtggfDwTXPv6/1aAPLwBF844NsHD1seTBTEXZK+J46vMJb4AVOrpMGCvslhhpMeI/HgrFj3ORVdBDl+ADT/N9PLfmY87R/5qOmgiKYf3iv2em2gT2yK0R9jxqS/H1aTUB7mz/x0GnTm3/EqcvwpY7NN8CnYVRumJxnMRbhexyTlwG9VcPDv4uFzX5fawU3zMHbkdeF8/2w1JLQFRM7oTKMXp+jUvjet4Prlg4wTB8PyTNiUS6/1EozHJAHW9sJRV9sMHL28Xrl3mtuaveBhiZ2ZBHagdJ+xiSs9uFy10XPLNqwk0QJRnjWfFlzqQbVlly4x3seEAtFaW8hQb3eZ1QHRICVGC62b08NhUEOVxEsCYqUYuS5e5S7b7EGUfy8+PRpoK2hiATPF+oxavGwr6KwzfYFxQ/gW7PlOo043DT1FiePLcWH3nPODrJK2C9nwj39jn7bhhvB+ZvROwrMcsKXBw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(70206006)(31686004)(70586007)(41300700001)(8676002)(8936002)(4326008)(36756003)(110136005)(26005)(54906003)(316002)(44832011)(2616005)(82310400005)(40460700003)(16576012)(5660300002)(2906002)(31696002)(40480700001)(186003)(478600001)(16526019)(82740400003)(86362001)(356005)(53546011)(81166007)(336012)(36860700001)(83380400001)(426003)(47076005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:44:42.8521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc401a6-3be8-4510-8696-08daf7d0345c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/7/23 22:18, Lars-Peter Clausen wrote:
> 
> 
> In the mrecv() function the Cadence I2C driver has the following expression
> in an if clause.
> 
>          ((id->p_msg->flags & I2C_M_RECV_LEN) != I2C_M_RECV_LEN) &&
>           (id->recv_count <= CDNS_I2C_FIFO_DEPTH))
> 
> Earlier in the same function when I2C_M_RECV_LEN is set the recv_count is
> initialized to a value that is larger than CDNS_I2C_FIFO_DEPTH. This means
> if the first expression is false the second expression is also false.
> Checking the first expression is thus redundant and can be removed.
> 
> This slightly simplifies the logic.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>   drivers/i2c/busses/i2c-cadence.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index e2a4cb694cfb..b5d22e7282c2 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -612,9 +612,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>          }
> 
>          /* Determine hold_clear based on number of bytes to receive and hold flag */
> -       if (!id->bus_hold_flag &&
> -           ((id->p_msg->flags & I2C_M_RECV_LEN) != I2C_M_RECV_LEN) &&
> -           (id->recv_count <= CDNS_I2C_FIFO_DEPTH)) {
> +       if (!id->bus_hold_flag && id->recv_count <= CDNS_I2C_FIFO_DEPTH) {
>                  if (cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & CDNS_I2C_CR_HOLD) {
>                          hold_clear = true;
>                          if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT)
> --
> 2.30.2
> 

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
