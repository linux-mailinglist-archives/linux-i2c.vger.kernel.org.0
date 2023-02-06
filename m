Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34FAC68B707
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 09:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjBFIDb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Feb 2023 03:03:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjBFIDa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Feb 2023 03:03:30 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38A010C3;
        Mon,  6 Feb 2023 00:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrQRXmHG52kwPC9eSOjwb8d2Luc89t+JPnsuuneQfkdMpGDGGNMSgEBw5EssnlSY97cw335q55mW2yqs8WZgpthJ4wEqcHJAfM1t30t/Dn5IVk1K+jZ5SQMGxF/l+auI8yFxDPT5aV6cdZZdA3e56Wsr12j3D1tNc6z8ZxaLIEtwMXWH1iMvqRLvKjfVhgNLJWhmngcihQ93nnJldbOskvcQR8EXLpTTReVxSmh34mlGmQlAC40dGJvzWsMGS95NIt/q2NcDaNJm9kEhuFHf9+7LRUQeUnqdrRdW8IEWdMez6MN6sjdcv08irWkwsMWlFWghXnyqs1Vese38XM8Gpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZzcE0TvkfNZh/6YOL6uHzuavC2bRqGnyscsFQWwRGE=;
 b=h7+zs8BUDxrzVTk2j7u/hR8pEcEHQ8kDX0JkLWdcK5t5I1a/UtiekQwE/iRk4MKZ0CChITHLHBF6PQJCn1iD0XD4lrVjwZGMu1tp1OYV9gLU2K8BD81E0C+zqBB3cvTjHxk1m52BsXr/13MseX7Jxh5MmF20TmtkFCfPThKNR2fCY84M1wpNIOTX0XhFokctBQ9Haa8W3JOVNzpOpGzw/GQOOzF1BKLip02EN7294d10gWvQWMug1ghYqfmXmk91DEjcJWVLqx4ZQoE200+WiMaZhipfryOhmrzcjw6kIGc49WjdssxtL9SLvl6WHLSg9iASDt/zj0q8+ogbbXaO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=metafoo.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZzcE0TvkfNZh/6YOL6uHzuavC2bRqGnyscsFQWwRGE=;
 b=rnliGfi/3eUIbG9LigG/w4u6qrcHS38bVF13SVjnVe/YKnrTRCo4ZVDWqtovfZuImW/OFRgeKGk70fOPzFlg36vmabl0tw9B/ZxIauZLgsXavQFljOUpiiiWMQGDW8PZZA8raFCVSW5fTMsNHLLBakcnae+phLAcx4MHhjoAndk=
Received: from MW4PR03CA0214.namprd03.prod.outlook.com (2603:10b6:303:b9::9)
 by PH0PR12MB7931.namprd12.prod.outlook.com (2603:10b6:510:289::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 08:03:26 +0000
Received: from CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::97) by MW4PR03CA0214.outlook.office365.com
 (2603:10b6:303:b9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 08:03:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT107.mail.protection.outlook.com (10.13.175.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.34 via Frontend Transport; Mon, 6 Feb 2023 08:03:26 +0000
Received: from [10.254.241.50] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 02:03:19 -0600
Message-ID: <813224a5-54c9-f6f1-4288-703a6388dab6@amd.com>
Date:   Mon, 6 Feb 2023 09:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
CC:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20230205230208.58355-1-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 1/2] i2c: cadence: Allow to specify the FIFO depth and
 maximum transfer length
In-Reply-To: <20230205230208.58355-1-lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT107:EE_|PH0PR12MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 7255786e-012b-40c6-4278-08db0818a02a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWFfqsvgk3RWbvoR72sYXbPbq0hChDZU0KCNkPfFEv5ITWts/i18XZ0C3mE16qNvpGTtVv9VEdOktj7hWh00XlaHt4yM3mEN4lQhKxP9Ap5u0eqsA1ktg8QkV0R1Kone5O/jvYjLhXol8Lu2YheFwc0KRDrWKCoWcq0T7bODVvt310Ah75NopO1uGrIPyg50iie9ZvYP/1TAAMncIQFVJsLLpRxoMCMtTMgopWp9fs0+jmmxoKP73OtuhWn0bNU7XfOdxUONdfcUAi/j1pHnGJGEyP9JBlsb8wZ04/8LslpwrpWtmO/IwZxH5w32z1AJa4DJLLJJRmEOU8O72IHupmncRyWDH5o/YH6TvTeCvtvuIDuBjZlNw57AfYrdxhzRAl2O6wjTp74Z65kdjbmz3n+R+Kk7HKUV4LV8D6KkJRxPiDPRhKryIICL8jfZMktRD7w/aHPzJ747oeSD9+CjP3Csi8w9WI3GTUiH1Nwbi3+4/YSFUM9JyD1eYIlPQ1DrGSWMoa12qDKsdChHY60kFBPUUw8nlab53ZDV4agg+Bd9oV/8D9Jj6P0496Xixc3BE/Awc6te4yYZEn1wJaIQ6egxqkT/SfPkmXqUZCT0Z3Ldn7EPkvHRvrtP8DzbrxaEqpjan7ivojRoDjHRae5kPgueToWyYHYlyk410+j1v9cw6ilAzebkUuT0r9s5aXMxY1WncF3g5jkeeh0lX2B6d6DcXU4G2J0nJCa30cNAX0NNH+UoLkkjzWrJSH6FuvrvV0OucTHAbeONTvGt5jamNw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199018)(40470700004)(46966006)(36840700001)(31686004)(36860700001)(41300700001)(316002)(70206006)(4326008)(16576012)(8676002)(110136005)(54906003)(8936002)(40460700003)(82740400003)(31696002)(356005)(81166007)(36756003)(86362001)(70586007)(6666004)(53546011)(16526019)(186003)(26005)(47076005)(426003)(40480700001)(44832011)(2616005)(5660300002)(83380400001)(478600001)(82310400005)(2906002)(336012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 08:03:26.0856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7255786e-012b-40c6-4278-08db0818a02a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7931
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2/6/23 00:02, Lars-Peter Clausen wrote:
> The FIFO depth and maximum transfer length are Synthesis configuration
> parameters of the Cadence I2C IP. Different SoCs will use different values
> for these parameters.
> 
> Currently the driver has the FIFO depth hardcoded to 16 and the maximum
> transfer length to 255. Trying to use the driver with an IP instance that
> uses smaller values for these will work for short transfers. But longer
> transfers will fail.
> 
> The maximum transfer length can easily be detected at runtime since the
> unused MSBs of the transfer length register are hardwired to 0. Writing
> 0xff and then reading back the value will give the maximum transfer length.

I think that these are pretty much two patches in one.
The first should target transfer length part and second fifo depth part.

> 
> This is unfortunately not possible for the FIFO depth. To handle this
> introduce a new devicetree property that allows to describe the FIFO depth
> of the I2C controller.
 > > These changes have been tested with
> 1) The Xilinx MPSoC for which this driver was originally written which has
>     the previous hardcoded settings of 16 and 255.
> 2) Another instance of the Cadence I2C IP with FIFO depth of 8 and maximum
>     transfer length of 16.
> 
> Without these changes the latter would fail for I2C transfers longer than
> 8. With the updated driver both work fine even for longer transfers.
> 
> Note that the IP core and driver support chaining multiple transfers into a
> single longer transfer using the HOLD bit. So the maximum transfer size is
> not the limit for the length of the I2C transfer, but the limit for how
> much data can be transferred without having to reprogram the control
> registers.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>   drivers/i2c/busses/i2c-cadence.c | 77 ++++++++++++++++++++++++--------
>   1 file changed, 58 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index b5d22e7282c2..25c0a8bacdd6 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -114,10 +114,10 @@
>   /* timeout for pm runtime autosuspend */
>   #define CNDS_I2C_PM_TIMEOUT		1000	/* ms */
>   
> -#define CDNS_I2C_FIFO_DEPTH		16
> +#define CDNS_I2C_FIFO_DEPTH_DEFAULT	16
>   #define CDNS_I2C_MAX_TRANSFER_SIZE	255
>   /* Transfer size in multiples of data interrupt depth */
> -#define CDNS_I2C_TRANSFER_SIZE	(CDNS_I2C_MAX_TRANSFER_SIZE - 3)
> +#define CDNS_I2C_TRANSFER_SIZE(max)	((max) - 3)
>   
>   #define DRIVER_NAME		"cdns-i2c"
>   
> @@ -211,6 +211,8 @@ struct cdns_i2c {
>   	enum cdns_i2c_mode dev_mode;
>   	enum cdns_i2c_slave_state slave_state;
>   #endif
> +	unsigned int fifo_depth;
> +	unsigned int transfer_size;

Please write also kernel-doc
drivers/i2c/busses/i2c-cadence.c:216: warning: Function parameter or member 
'rinfo' not described in 'cdns_i2c'
drivers/i2c/busses/i2c-cadence.c:216: warning: Function parameter or member 
'fifo_depth' not described in 'cdns_i2c'
drivers/i2c/busses/i2c-cadence.c:216: warning: Function parameter or member 
'transfer_size' not described in 'cdns_i2c'

>   };
>   
>   struct cdns_platform_data {
> @@ -236,7 +238,7 @@ static void cdns_i2c_clear_bus_hold(struct cdns_i2c *id)
>   static inline bool cdns_is_holdquirk(struct cdns_i2c *id, bool hold_wrkaround)
>   {
>   	return (hold_wrkaround &&
> -		(id->curr_recv_count == CDNS_I2C_FIFO_DEPTH + 1));
> +		(id->curr_recv_count == id->fifo_depth + 1));
>   }
>   
>   #if IS_ENABLED(CONFIG_I2C_SLAVE)
> @@ -431,7 +433,7 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
>   				 * if RX data left is less than or equal to
>   				 * FIFO DEPTH unless repeated start is selected
>   				 */
> -				if (id->recv_count <= CDNS_I2C_FIFO_DEPTH &&
> +				if (id->recv_count <= id->fifo_depth &&
>   				    !id->bus_hold_flag)
>   					cdns_i2c_clear_bus_hold(id);
>   
> @@ -456,22 +458,22 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
>   		if (cdns_is_holdquirk(id, updatetx)) {
>   			/* wait while fifo is full */
>   			while (cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET) !=
> -			       (id->curr_recv_count - CDNS_I2C_FIFO_DEPTH))
> +			       (id->curr_recv_count - id->fifo_depth))
>   				;
>   
>   			/*
>   			 * Check number of bytes to be received against maximum
>   			 * transfer size and update register accordingly.
>   			 */
> -			if (((int)(id->recv_count) - CDNS_I2C_FIFO_DEPTH) >
> -			    CDNS_I2C_TRANSFER_SIZE) {
> -				cdns_i2c_writereg(CDNS_I2C_TRANSFER_SIZE,
> +			if (((int)(id->recv_count) - id->fifo_depth) >
> +			    id->transfer_size) {
> +				cdns_i2c_writereg(id->transfer_size,
>   						  CDNS_I2C_XFER_SIZE_OFFSET);
> -				id->curr_recv_count = CDNS_I2C_TRANSFER_SIZE +
> -						      CDNS_I2C_FIFO_DEPTH;
> +				id->curr_recv_count = id->transfer_size +
> +						      id->fifo_depth;
>   			} else {
>   				cdns_i2c_writereg(id->recv_count -
> -						  CDNS_I2C_FIFO_DEPTH,
> +						  id->fifo_depth,
>   						  CDNS_I2C_XFER_SIZE_OFFSET);
>   				id->curr_recv_count = id->recv_count;
>   			}
> @@ -494,7 +496,7 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
>   		 * space available in FIFO and fill with that many bytes.
>   		 */
>   		if (id->send_count) {
> -			avail_bytes = CDNS_I2C_FIFO_DEPTH -
> +			avail_bytes = id->fifo_depth -
>   			    cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET);
>   			if (id->send_count > avail_bytes)
>   				bytes_to_send = avail_bytes;
> @@ -588,7 +590,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>   	 * Check for the message size against FIFO depth and set the
>   	 * 'hold bus' bit if it is greater than FIFO depth.
>   	 */
> -	if (id->recv_count > CDNS_I2C_FIFO_DEPTH)
> +	if (id->recv_count > id->fifo_depth)
>   		ctrl_reg |= CDNS_I2C_CR_HOLD;
>   
>   	cdns_i2c_writereg(ctrl_reg, CDNS_I2C_CR_OFFSET);
> @@ -603,16 +605,16 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>   	 * receive if it is less than transfer size and transfer size if
>   	 * it is more. Enable the interrupts.
>   	 */
> -	if (id->recv_count > CDNS_I2C_TRANSFER_SIZE) {
> -		cdns_i2c_writereg(CDNS_I2C_TRANSFER_SIZE,
> +	if (id->recv_count > id->transfer_size) {
> +		cdns_i2c_writereg(id->transfer_size,
>   				  CDNS_I2C_XFER_SIZE_OFFSET);
> -		id->curr_recv_count = CDNS_I2C_TRANSFER_SIZE;
> +		id->curr_recv_count = id->transfer_size;
>   	} else {
>   		cdns_i2c_writereg(id->recv_count, CDNS_I2C_XFER_SIZE_OFFSET);
>   	}
>   
>   	/* Determine hold_clear based on number of bytes to receive and hold flag */
> -	if (!id->bus_hold_flag && id->recv_count <= CDNS_I2C_FIFO_DEPTH) {
> +	if (!id->bus_hold_flag && id->recv_count <= id->fifo_depth) {
>   		if (cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & CDNS_I2C_CR_HOLD) {
>   			hold_clear = true;
>   			if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT)
> @@ -673,7 +675,7 @@ static void cdns_i2c_msend(struct cdns_i2c *id)
>   	 * Check for the message size against FIFO depth and set the
>   	 * 'hold bus' bit if it is greater than FIFO depth.
>   	 */
> -	if (id->send_count > CDNS_I2C_FIFO_DEPTH)
> +	if (id->send_count > id->fifo_depth)
>   		ctrl_reg |= CDNS_I2C_CR_HOLD;
>   	cdns_i2c_writereg(ctrl_reg, CDNS_I2C_CR_OFFSET);
>   
> @@ -686,7 +688,7 @@ static void cdns_i2c_msend(struct cdns_i2c *id)
>   	 * against the space available, and fill the FIFO accordingly.
>   	 * Enable the interrupts.
>   	 */
> -	avail_bytes = CDNS_I2C_FIFO_DEPTH -
> +	avail_bytes = id->fifo_depth -
>   				cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET);
>   
>   	if (id->send_count > avail_bytes)
> @@ -1226,6 +1228,36 @@ static const struct of_device_id cdns_i2c_of_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, cdns_i2c_of_match);
>   
> +/**
> + * cdns_i2c_detect_transfer_size - Detect the maximum transfer size supported
> + * @id:		Device private data structure
> + *
> + * Detect the maximum transfer size that is supported by this instance of the
> + * Cadence I2C controller.
> + */
> +static void cdns_i2c_detect_transfer_size(struct cdns_i2c *id)
> +{
> +	u32 val;
> +
> +	/*
> +	 * Writing to the transfer size register is only possible if these two bits
> +	 * are set in the control register.
> +	 */
> +	cdns_i2c_writereg(CDNS_I2C_CR_MS | CDNS_I2C_CR_RW, CDNS_I2C_CR_OFFSET);

nit: newline

> +	/*
> +	 * The number of writable bits of the transfer size register can be between
> +	 * 4 and 8. This is a controlled through a synthesis parameter of the IP
> +	 * core and can vary from instance to instance. The unused MSBs always read
> +	 * back as 0. Writing 0xff and then reading the value back will report the
> +	 * maximum supported transfer size.
> +	 */
> +	cdns_i2c_writereg(CDNS_I2C_MAX_TRANSFER_SIZE, CDNS_I2C_XFER_SIZE_OFFSET);
> +	val = cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET);
> +	id->transfer_size = CDNS_I2C_TRANSFER_SIZE(val);
> +	cdns_i2c_writereg(0, CDNS_I2C_XFER_SIZE_OFFSET);
> +	cdns_i2c_writereg(0, CDNS_I2C_CR_OFFSET);
> +}
> +
>   /**
>    * cdns_i2c_probe - Platform registration call
>    * @pdev:	Handle to the platform device structure
> @@ -1242,6 +1274,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   	struct cdns_i2c *id;
>   	int ret, irq;
>   	const struct of_device_id *match;
> +	u32 val;
>   
>   	id = devm_kzalloc(&pdev->dev, sizeof(*id), GFP_KERNEL);
>   	if (!id)
> @@ -1317,6 +1350,12 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   #endif
>   	id->ctrl_reg = CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | CDNS_I2C_CR_MS;
>   
> +	val = CDNS_I2C_FIFO_DEPTH_DEFAULT;

you can remove val completely.
id->fifo_depth = CDNS_I2C_FIFO_DEPTH_DEFAULT;
...


> +	of_property_read_u32(pdev->dev.of_node, "cdns,fifo-depth", &val);
> +	id->fifo_depth = val;
> +
> +	cdns_i2c_detect_transfer_size(id);
> +
>   	ret = cdns_i2c_setclk(id->input_clk, id);
>   	if (ret) {
>   		dev_err(&pdev->dev, "invalid SCL clock: %u Hz\n", id->i2c_clk);

In general changes looks good.

M
