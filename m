Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54AC8538F69
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 13:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238251AbiEaLD7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 07:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233919AbiEaLD6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 07:03:58 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 453A2994D2
        for <linux-i2c@vger.kernel.org>; Tue, 31 May 2022 04:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIjMrPJ9G/B3Fewnm2hGAfxQXe3oiFBiBWzTM1k6xXnfj+jboyF3G/Fz/+o0XDFbrJnDxILUH/W/hWORNvbupRmZWvw65Wh5b8CvV8hsMuHzCWAJF3thHE309t8aME4rWbAuQqT3P6JSkQgA5YUxk9IPFdG7y9WKHGSGz0DqQKnXiMe+BCmmRLTMqcLs1ksBpxm/Wfv3TECKuRb8zg+0OZka3TUS72qTs6SgOeoDod46zj0hF8j4n6D9/3OTbJ5QdlkAHOIGcc9k5WSoCWCTdRCpm9AFfLuvmL7p9QgjtZTwxqP0UTINiSv0ht6r2z0+3tmeLXZoiZIu3eH67NDruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZ/L/UBqufVsiApOvTMcfLGTSzT40ZaZy9+WxmFAJcU=;
 b=XBgyFQDzwkf4kNBUAsFsivy17QxtE/eUnz18PrmjYmlBdwNhaesGNHqmmiIe9J/c0x6wxtmTZNlvL6zESUlt5HGYpmtTWY9qkI6hRvUdBjtPbMyGv/IkpThbdLBAvbQg4raEZonh2IHAuR/A1G9X5JOBN9Ah4FRpzRn2JE3vl2ApOD4/y5oZ/MSza4Pk2StcBhf53+wiaVB24ZU/B5PP7+0kt+q4Q8yABgbW0yFA/a6JbBQkHo08ELgiQKB5moj4e2MBjfDqhgg5iDRzM/zI7X4ZCe+FWNTUt0jOzFrAKSwzdRNGC1Z+8mKMlKr6ZpQjtHhJ3YaQwERrigPm08j93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZ/L/UBqufVsiApOvTMcfLGTSzT40ZaZy9+WxmFAJcU=;
 b=EXGeqhEetKiHrWOUgJTKqLe1NFU/qSDqrGEpBagWK6h2PBtjZIv0rtr1nP2k8mpdq4jq2EJWDrbAJPWHUvo1eGESuCECHXJVOxMo5pMBD1H5n9P+ONqdYOGSwRC+HcZfeZMX2K+tMJwMtQC1Kpt86OiVoJx9PP9fTwrNIYuOkVg=
Received: from BN6PR12CA0044.namprd12.prod.outlook.com (2603:10b6:405:70::30)
 by CY4PR02MB2552.namprd02.prod.outlook.com (2603:10b6:903:73::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 11:03:53 +0000
Received: from BN1NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:70:cafe::7a) by BN6PR12CA0044.outlook.office365.com
 (2603:10b6:405:70::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19 via Frontend
 Transport; Tue, 31 May 2022 11:03:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT040.mail.protection.outlook.com (10.13.2.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 11:03:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 31 May 2022 04:03:49 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 31 May 2022 04:03:49 -0700
Envelope-to: linux-i2c@vger.kernel.org
Received: from [10.254.241.50] (port=35252)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nvzfB-000GKM-AO; Tue, 31 May 2022 04:03:49 -0700
Message-ID: <ff7dd070-455f-3482-6176-400119f9af6b@xilinx.com>
Date:   Tue, 31 May 2022 13:03:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] i2c-xiic: Fix the type check for xiic_wakeup
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>
References: <20220526040914.4159495-1-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220526040914.4159495-1-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 977b8421-0a80-40fc-ba8f-08da42f53fb4
X-MS-TrafficTypeDiagnostic: CY4PR02MB2552:EE_
X-Microsoft-Antispam-PRVS: <CY4PR02MB2552B313DC8EA1DECDD5C9C0C6DC9@CY4PR02MB2552.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YgmVZkv87b+81YcruN++swemxDfswS9khFFZ8JmYSPn33a/t25srO6jtkFwC5+nUKXL6nAqiZV4B/dlHfUXzWAKxE1EkQ7JDqGDb3hPypj892+bkw6qfdz6vhUde1de/dKdoLYmAuMWCAX1fYOV979369lQN8I8GHV/dmMj/pBI+KlG02c4gC2RjYTsAWaq6mCcCJPAogjc/TtwaFD13uKtRcmTtWH8xznU47FAdvnZFs2Rpylev0CyWyDHHmKsYaZsRb619cS/ukJikFgdL0DUfJsS9vV8qa5g7v7730UsZfK7FyK3nJ+fUF0FhooMU3QvITR3MAAw1N6l0iv7TtS+L3FEioK495e+NaTRicWrEJx1JEDedsGzFXQEP5+sscd3QJjWmxN9CMj3qopW+w0HZXpukWNfsrbTWtqWM+XQHRuKmHXS5TD30x0PJEXu/JRtGrzmOUSUnViv9JZsFLATY4p2xK5Gpg8Yt4QKotqHsIxtzRxr7cFnKG5BZNZumXV1LIpTK8r8eMwVVrA8PaC8N9OeJlB4TJFwvnN+NPaIL/Wc15M5N+/PkUJFyIjhPMViKbyml0OEoieQcmgYvGyjm5D322g5MOu+Ev2euiPS1WvvVD12C4HUCPMkhw8yJtPVdKHtyIIZFH4PEexfVrpK51aucagqPBhDyFyaaFMM++d1A1nwTP09tRHoj+l0I3rv+FdmoA4Z++JomFlcL4nhumdEKHn05La166QgEKCc=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(40460700003)(26005)(356005)(508600001)(8676002)(53546011)(44832011)(316002)(5660300002)(110136005)(31686004)(83380400001)(36756003)(36860700001)(9786002)(8936002)(2906002)(426003)(336012)(82310400005)(2616005)(186003)(70206006)(70586007)(107886003)(31696002)(7636003)(47076005)(4326008)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 11:03:52.8169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 977b8421-0a80-40fc-ba8f-08da42f53fb4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT040.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2552
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/26/22 06:09, Shubhrajyoti Datta wrote:
> Fix the coverity warning
> mixed_enum_type: enumerated type mixed with another type
> 
> Enum is passed to xiic_wakeup, change the function parameter
> to reflect it.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> 
>   drivers/i2c/busses/i2c-xiic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 9a1c3f8b7048..2b6341f08d71 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -367,7 +367,7 @@ static void xiic_fill_tx_fifo(struct xiic_i2c *i2c)
>   	}
>   }
>   
> -static void xiic_wakeup(struct xiic_i2c *i2c, int code)
> +static void xiic_wakeup(struct xiic_i2c *i2c, enum xilinx_i2c_state code)
>   {
>   	i2c->tx_msg = NULL;
>   	i2c->rx_msg = NULL;


Change itself is fine but

wakeup_code in xiic_process should be also fixed because it is defined as int 
now and you are using initial value as 0.

It means your change and this one too.

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index ffefe3c482e9..b369b42fffd7 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -34,9 +34,9 @@
  #define DRIVER_NAME "xiic-i2c"

  enum xilinx_i2c_state {
-       STATE_DONE,
-       STATE_ERROR,
-       STATE_START
+       STATE_DONE = 0,
+       STATE_ERROR = 1,
+       STATE_START = 2
  };

  enum xiic_endian {
@@ -380,7 +380,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
         u32 clr = 0;
         int xfer_more = 0;
         int wakeup_req = 0;
-       int wakeup_code = 0;
+       enum xilinx_i2c_state wakeup_code = STATE_DONE;

         /* Get the interrupt Status from the IPIF. There is no clearing of
          * interrupts in the IPIF. Interrupts must be cleared at the source.

M
