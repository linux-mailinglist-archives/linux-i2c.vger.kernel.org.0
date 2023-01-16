Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD2B66C2C1
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 15:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjAPOx2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 09:53:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjAPOwc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 09:52:32 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA2222795
        for <linux-i2c@vger.kernel.org>; Mon, 16 Jan 2023 06:39:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIqPKM83FCbULu7nQyP/AgJWtlBRzgPKfts2nTFVTQZW2Dgb4jU5lNewYE1yqVPQjkZJIUqDBNTpCTv2jvQfjT3EC5DuMu0X4g6eRW3RupcG29uCl7gXWTMP0RqbFGfyyKrVbcsoh027UB18L89LEl8nEaoTOrhxAskMs80y/awLGx8QyyYEqTP4cySiU29rjMookZsZTOQ4E36CjzpyNL9+MClpUdSlrf1TW1hk1Of9hYernCTz3JZ4i3QCUwi8eWRV5E6yHivMs3iugqVjsHMPIP32XDgw+gD3639XIaVbNqwVhiVC0Fq6nbeDsrLLxL7ZkcDSUja5kXiO10PsuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZxOkPg0TFlR2lTvVsXd6/IHPhODbcJnhH2vFj5znL4=;
 b=ZpzjqvqvGGVECBDGGJqwA77CkWx9RUAd3QtSlzWiuIYqZ8Fvv8ZZb/rbF+YM10NThLx/TjWzgea5itcZ+FO77FuOeJYK9k6x37SVyRBxez4iQrLG2aXtRJs75IfgJ4J8xZ4MR9ulSH7asTCEIL11HxS9Evip74782xIlkHQPUjLeZ29E59rChLVC8Qu/WMXilnNkBd8uoiqohg3EgRXlW4RysiDDZ9TK8gzCDh7Kj+j4peCSexHWFlRQFZ6MtDMt7BtaL3w6hsnwiWNHR67d/a+CYy/yijyETvu+Vy+aFU5u0x4dE6BV0T4tFn7AvvwhcgUsrl65FgaRw+TEzr/N6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=metafoo.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZxOkPg0TFlR2lTvVsXd6/IHPhODbcJnhH2vFj5znL4=;
 b=GYQSNqiFWLYI3pifPXGNC+BBpgiLWOVXcS/EArSlqf4ccyeudDGLpXjtXUTDe4IOlEhA0WtKmJFR7jFRVgm54+yMkyr3uEDrdlIxpVySBp5CJhagAvDQsbj7gKvotyDjB35DVXz7f5iEGoFYJP4jQP6T6SHp8i3rNuv7IU/W94E=
Received: from BN1PR14CA0012.namprd14.prod.outlook.com (2603:10b6:408:e3::17)
 by PH7PR12MB6980.namprd12.prod.outlook.com (2603:10b6:510:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.22; Mon, 16 Jan
 2023 14:39:32 +0000
Received: from BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::b8) by BN1PR14CA0012.outlook.office365.com
 (2603:10b6:408:e3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:39:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT081.mail.protection.outlook.com (10.13.177.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:39:32 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 08:39:29 -0600
Message-ID: <8abe4f5b-67e6-22bd-eb11-f64a3d62ea28@amd.com>
Date:   Mon, 16 Jan 2023 15:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/5] i2c: cadence: Remove `irq` field from driver state
 struct
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
CC:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        <linux-i2c@vger.kernel.org>
References: <20230107211814.1179438-1-lars@metafoo.de>
 <20230107211814.1179438-3-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230107211814.1179438-3-lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT081:EE_|PH7PR12MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 988bab50-a5fc-4ec0-866b-08daf7cf7b08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yfJLuwHMy++Uixd0x7o3WhOG1nW+YvS3pGMKfUnkgI2stQECMS+TTy56Lzj54oRhpMKEaTaFhs05IcHkasbBnYj+Jht85A5D0dZP54xF+yTRDoUOTHJhjH2nSiVOGfHBiDCOHWBxlxl3it5GyYTNI3LMcIHTRzMtMMjE2scMB2bX9eZ47EuAP0yxJVsT9YvFBaiZtKraFB4V/fjEDO7QiTkTpMBaWjc+W80Fg+9OvE0XpqzaQy/uX3PyUtjwMjbLduQrY+xaIJIqiPQfblExQcXG5vEoCXgoa5W+o1Dv421Twsr/xAfT/98v6ziBjfZ5t5vSbED2T3SCkp3bnPSfeLsJcmoQFJFZd/IUSXidxDBGlsC/OBsZlfja2hQxtF8dpV0BHRcbuYeXgftyPvob7St9TRPdphd3LpZGqSt14kCUv/FFN+FA1jr5IelpXB+joT7kh/ZmF6w5gaWP+tceAXyLFcXSoXe3tvWCjlMYgI/qlLuBq5o/oPUgLiwIjLjVbuG65e1Afr3sv5Xya8wzLZ/y/NqLpojM9SYVRqV00QeU/Gq3kttQc8wb852L0InV+Zn40kJuC3bQ87cWdEJhCh53GQZXEmiUc+NgA7AnHlyQ46DsMtoYd7AScn+KWcQppu/GSU4NMQXzpIQjZ7gi7pEXieeRSZ9C+skiH8W91FRFzB8R3225yBg93/i3cLq9HXZct9J2iNzEB4apDiEfL2Zhp0lvEiHHOYE1g9GGQpUgeuTe5Owvw2MmmofznCLBaTwCgFMb9gMLh/dhqWdDYSoGnK7RSPG31VVsbFYgRIc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(31686004)(2906002)(44832011)(5660300002)(8936002)(8676002)(86362001)(83380400001)(70586007)(4326008)(36756003)(336012)(70206006)(316002)(110136005)(54906003)(16576012)(41300700001)(40460700003)(26005)(2616005)(31696002)(82310400005)(53546011)(16526019)(186003)(36860700001)(356005)(426003)(47076005)(81166007)(82740400003)(478600001)(40480700001)(81973001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:39:32.0324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 988bab50-a5fc-4ec0-866b-08daf7cf7b08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6980
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
> The irq field of the driver state struct is only used in the probe
> function. There is no need to keep it around. Remove it from the state
> struct and use a on-stack variable instead.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>   drivers/i2c/busses/i2c-cadence.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 71ea658f4bd3..e2a4cb694cfb 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -173,7 +173,6 @@ enum cdns_i2c_slave_state {
>    * @send_count:                Number of bytes still expected to send
>    * @recv_count:                Number of bytes still expected to receive
>    * @curr_recv_count:   Number of bytes to be received in current transfer
> - * @irq:               IRQ number
>    * @input_clk:         Input clock to I2C controller
>    * @i2c_clk:           Maximum I2C clock speed
>    * @bus_hold_flag:     Flag used in repeated start for clearing HOLD bit
> @@ -198,7 +197,6 @@ struct cdns_i2c {
>          unsigned int send_count;
>          unsigned int recv_count;
>          unsigned int curr_recv_count;
> -       int irq;
>          unsigned long input_clk;
>          unsigned int i2c_clk;
>          unsigned int bus_hold_flag;
> @@ -1244,7 +1242,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   {
>          struct resource *r_mem;
>          struct cdns_i2c *id;
> -       int ret;
> +       int ret, irq;
>          const struct of_device_id *match;
> 
>          id = devm_kzalloc(&pdev->dev, sizeof(*id), GFP_KERNEL);
> @@ -1275,10 +1273,9 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>          if (IS_ERR(id->membase))
>                  return PTR_ERR(id->membase);
> 
> -       ret = platform_get_irq(pdev, 0);
> -       if (ret < 0)
> -               return ret;
> -       id->irq = ret;
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;
> 
>          id->adap.owner = THIS_MODULE;
>          id->adap.dev.of_node = pdev->dev.of_node;
> @@ -1329,10 +1326,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>                  goto err_clk_dis;
>          }
> 
> -       ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
> +       ret = devm_request_irq(&pdev->dev, irq, cdns_i2c_isr, 0,
>                                   DRIVER_NAME, id);
>          if (ret) {
> -               dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
> +               dev_err(&pdev->dev, "cannot get irq %d\n", irq);
>                  goto err_clk_dis;
>          }
>          cdns_i2c_init(id);
> @@ -1342,7 +1339,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>                  goto err_clk_dis;
> 
>          dev_info(&pdev->dev, "%u kHz mmio %08lx irq %d\n",
> -                id->i2c_clk / 1000, (unsigned long)r_mem->start, id->irq);
> +                id->i2c_clk / 1000, (unsigned long)r_mem->start, irq);
> 
>          return 0;
> 
> --
> 2.30.2
> 

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
