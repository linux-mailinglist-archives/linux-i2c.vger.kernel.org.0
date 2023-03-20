Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39DDD6C0E54
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 11:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbjCTKL2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Mar 2023 06:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjCTKLY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Mar 2023 06:11:24 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36826185;
        Mon, 20 Mar 2023 03:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZ8NvTO1kBf80KH7BGvIBGIVBU8g47odRCrmSFP8R4VoFTfzcJVm+n4Rp0KnDz21yynJNrwTFjr5lkxA517kTN6ewNzdb1wlnf3K5Oq713cGNP8rwATwSRJYKMmNFJXNhqYn11KxIfqaoNrwM+cmnnSeH9eL9DLSXjCnpAfbd1/0/rBOBAe2zxXzc72S5sFTCGufpThIJKFa8VAJ2Cr0R+ahQbPjP7+yzw1Lx5wGaGhX3adQRB9gCzAIjMkT1kL/AErbPZQdNBILBcP3AYH89pwdnCvGfgJOUhhgM2/J/4fk7NNRRG81klpPb3ZqGB/bdGFGehqI6dkCGEjZXmn8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3atl4g4NqSd7xnd8Lb9NvlXkc1HY9xAxFCOy0ipXr4=;
 b=NAt1X79fAx0pVTUyJZyPpsSs8di9sH+1OQT4BQKx/7CSWcdZn0QHT4BaT5I8zEpdCxKWPNX2Tg0mE7mFiahw4s7FRmLD2bFdjWJqQI0eTOFKUJg3JKRlclbDVUKpJ3jrP3JNunxGPFsoHmVTvW0/C77alv1IjdR4zU5FwD4bIffXirdzH0jLuYobuKihmCElP26ULxs0KiqKRYXSekF+vGpLTweydpPL+sinRWsB8kFyzG6DySWllq7ttaLe7dhh3MxYW2tHg75OWDTP9pb4ipZ7umtNN6dwLhrNvafKZditCmRiUiGtrkkulkt7VPGSh+LrZPPzccptxoM4ecCbNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3atl4g4NqSd7xnd8Lb9NvlXkc1HY9xAxFCOy0ipXr4=;
 b=lxSsZxJpI8Xhxvzy5ZaTYBl1fAsZ00P0FjKJKnCdOPIbv+OXf54yZZfRBN89P7ep8PxIO4WewdbB5ps9GTMvL6sDcZes1l8GL27yGJP8uaYuTDs+bS7ujHlBe8Zu/BhMP9XtSFGV9gXawl4fbo2JoUt30xXLlF1m6hcn43dyVkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 10:11:18 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 10:11:18 +0000
Message-ID: <38eeee80-91f0-5d71-5148-272197e8bece@amd.com>
Date:   Mon, 20 Mar 2023 11:11:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/3] i2c: cadence: Allow to specify the FIFO depth
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Cc:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230317145441.156880-1-lars@metafoo.de>
 <20230317145441.156880-2-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230317145441.156880-2-lars@metafoo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b80fa8-382f-4aad-2fdb-08db292b726d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gHb86wDxSvov5hrUEFxy/MK6lkG2u8EaT7cmKcHxRB5+gqC2+gi7UOO6Q7cLhuDZQGad40rVPnKFw1W6JE/Ll9PcF6VwIpq8YZ+zq3e3LWhJ7HWMunOxxbk2CRMj2RT5+owXoM2HGRn/ueEo30TYlGDJ4Mg19F9zJpa/FblTvWiwAj+giiecJAzdaXme9ZK9eJVZiWun0NqPxOKqfgHHJ117bHB2X7Op4f6ix9lCgMi3LrX3VkBXV6SFv0D2/B6YBFgf2LNjpCyO/i/EWffBBBO+5y2jZZvdZhcESX3Et0MA89r+fS/R+1IfR0zysPZJ09zVOJJJpw1vnNDZJ5Qbpe5tZzuDnx14JXvm9hrHrPZ2V27QbKzJ/czU+u60Y7dU3iMRGnaO1RM9hthebanVUK8Fdd+InrIr4YAuY+/jya3fza9kKP9Z3agq8TkHXQYA0yqA3gtHujh4NEjMQZQnFJDvPCQoZHTjKq19LIYvknIZ+9zsQr1AkuH9DwOxxzUcr6QuSzTf9b5BC7tioO/HPJH5HN8zx33p7PuWnrlskj6EVOEr06cf157PAzrwTema4NbRCzbelJ0cUKw09/MZYlTDMO8Xyntu8v2KERPXwwpanpv5k/qxA8q8giidXDu7o0f8kgDrQ+mXNGySVq/vc3J2N2h7nKEGllRWo17e0fFYbNKpjsSUqedi2wfUvms+6QOoin8Fnnqu2gqI3hXajjv2wWpTBWT6Sxkb9bCnaVc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199018)(2616005)(186003)(6486002)(4326008)(53546011)(478600001)(83380400001)(6666004)(54906003)(316002)(110136005)(66946007)(66556008)(66476007)(6506007)(26005)(6512007)(31686004)(8676002)(41300700001)(8936002)(5660300002)(44832011)(38100700002)(2906002)(86362001)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUlUZ2pQYzQ1K2ZSeWNYL2xoeFozQkRRYlhuNXpDNHpkb2xBaFQ2eTdENjJm?=
 =?utf-8?B?RDBGbkw2aVMzUzJFbzFWZ3JMTS9DYnRrZWEyNTRkb0ZBYUU5MEM4UGJUNGhP?=
 =?utf-8?B?R3UxdzdIakFYcVI0OGxlTmFCSTNMRUhxNFJTZDViNnc3bnRIYjdVQTlKOVQ2?=
 =?utf-8?B?ZHNOQk05dkd6L0JCVjlVVFpuOTY5MjZYVVNpMXMzc3o5VkJDTUxVVWx3aWZZ?=
 =?utf-8?B?QjhQWG5tZytTK04rV1g3b3B4SVJQdFh4VElnUXQybVBqRGhsRE5vRStnN2w2?=
 =?utf-8?B?Yy9waG83TjAyWjBWUHpKSXNqL0NqdUhRaXE0WE9RT0hTZEJzaWs5MW9kSm5w?=
 =?utf-8?B?d2kxNGNrWTE0WjBSL1ZZMVZOWkIwV1ZUT2VqZEZ4UE5xN1dqL0U3VjhEdEp2?=
 =?utf-8?B?TVQ5Qkd4NW9DalJtSmJFRkpPUkFocEFjZHdqelhJbkxMbEdTaCtRdnlVOGov?=
 =?utf-8?B?THRzaHVLSjdjL24ydkZiWUFqNTdTaVY1bVpZdkNSMnkzOWs4T1B3MUhvSFZt?=
 =?utf-8?B?NFZLckdGUWVvVCtuYXZzdVQ2eit4d1dTdTFjSUpmNll4Z3lsUStDTmljeEhO?=
 =?utf-8?B?ODhFUmlSYXVBWnhGUW1TSXZmWi9iaGhSOER5bDhJdVZRd2ozdm01ZjBKR3Va?=
 =?utf-8?B?anBJWDIxVWJhclM5dFJOVWJWYmxMdHVkWmNPSDdpQUhCT2dUcFBGby9jOVZB?=
 =?utf-8?B?UG55MDBSeGo5L1l4MXBSWU1LcjY0SmZwSDFRVVZUemFMalJmU0ZINjJmSUFD?=
 =?utf-8?B?UUhPUTJVU2FDZExYRVYrUVNzZmdzTjNScUExYnM0SGF3aFhVRjZJZWNKSmVu?=
 =?utf-8?B?KzZiVFUyQWRlQXB3RzYwZmdpUXNvRnR2WjJwN0wwWm9FMkk0Vkw2djBvNXRt?=
 =?utf-8?B?cGNvNEFXU0ZuT29nV0p1TlAwMmFVWTJxSTRNVGRaVzBWd203Y0VTcHhkeEJi?=
 =?utf-8?B?Qjl5MjNpb1FjTEVsU0RtQlRERWNGeEp1K2Y5Vnh2YzhwNU90WE5NQnFvVVl5?=
 =?utf-8?B?NC82OVYwWEw5YkZWdmVOeFhsMzgwc3VTVHAwSEF1TFdoUlJESEFTMXppVzM5?=
 =?utf-8?B?WWh6RFZ4NVJWS0ZRRXpTem9VLy9iQkhoKzgveGx1N29WWUQ3NHZXbnl3aWg1?=
 =?utf-8?B?L3pCSHpNK1dNcGtobjAvMzJqZHRNbWpiZHh5bGhZYXJBczY1YjgyclFnR292?=
 =?utf-8?B?YzBCUFFwNm95akVhRjRjWm50UTZaOHUxSzZsbmFaMGY1V1ZoRGJONUxNWkJN?=
 =?utf-8?B?WVJwVjF6bUZSTnJPN3ZyL2UxSzc3Wm5LU2YwUFpUNXJjSEV3bE5RRVFNSXFL?=
 =?utf-8?B?MWpmRDVFQUdVRXlUL1gzRzRTUFgxcVJNWk9YeGFiV0U0QnNLaDJLR2lDNC9Y?=
 =?utf-8?B?blJsNStQNzFhSWJIZ1g2b1k4L2NVZjVkd05RbUMvbVlPZU8rNkpsUEY3aWlG?=
 =?utf-8?B?d1pSSGZKT0wrRnhVczdHY09hZW1uZ1pvVVlhVUh6U1g2R2svelg5Y0NIODFU?=
 =?utf-8?B?K2I0TmVFZmhUTUZGY3JQNzNsbzFrNTJzT0FkakFSam5lNGRFNXdLYm5aajNC?=
 =?utf-8?B?OHBPd3d4SStsRU1TZ2NTTThIeDZYcnlUcTBxSEYwOEp5S0hobVY0eE1sR2hV?=
 =?utf-8?B?bVZ4YVJQRDlsTmtqT1BOc1VEVU53eUQzRk0yczhMZlpVNnQzbzdnejBYckth?=
 =?utf-8?B?UlN6SzBGYmtoSGovbk9qcTFZUnVxY2ZxRmVrd1VldG50bGlVeEYrRGE3UWdC?=
 =?utf-8?B?RHVPRU9RMWxsanVRb3BEUlErU0piVDlDN0hVWHZiM1l6dm1lc0xMbEU0WU9t?=
 =?utf-8?B?QWMzajY5VERCbE1UbjR2S21wUXpCK3BNR04xYXpDMERwSkpuMm1rZlBxWG1B?=
 =?utf-8?B?NHZGZ2NDdWxxRkVrbmszOHo0TlNCcFk2Mlg3em01YUNYMGxMSEVVWjYwblpJ?=
 =?utf-8?B?VDl2UjhCdzRPNXBsOE91bXc4WG0yYk9teXJTUUJzU280d0ozaHZFeXd3djhW?=
 =?utf-8?B?dWxheWdKK2tpelpQL1E2QnN2S0JHUmp2TERrYkZYZzExWkFDdG1WMG1TTVpO?=
 =?utf-8?B?RVE5SjdkVjIzV29KZzJVWmdGS1N6c2l6SXZJZVF0MVFvRnlCMGdsQzJhQVNM?=
 =?utf-8?Q?D8yUyjL4bhCUZs1nRvX7QWFSx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b80fa8-382f-4aad-2fdb-08db292b726d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 10:11:18.4241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4Zcb4EGlLdr0SX38C/rt3NwryW5Le1N5IAisqyzKe0hVPkmfDSNebSYuEys8ppm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 3/17/23 15:54, Lars-Peter Clausen wrote:
> The FIFO depth is a synthesis configuration parameters of the Cadence I2C
> IP. Different SoCs might use different values for these parameters.
> 
> Currently the driver has the FIFO depth hardcoded to 16. Trying to use the
> driver with an IP instance that uses smaller values for these will work for
> short transfers. But longer transfers will fail.
> 
> Introduce a new devicetree property that allows to describe the FIFO depth
> of the I2C controller.
> 
> These changes have been tested with
> 1) The Xilinx MPSoC for which this driver was originally written which has
>     the previous hardcoded settings of 16 and 255.
> 2) Another instance of the Cadence I2C IP with FIFO depth of 8 and maximum
>     transfer length of 16.
> 
> Without these changes the latter would fail for I2C transfers longer than
> 8. With the updated driver both work fine even for longer transfers.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
> Changes since v1:
>   * Split dynamic FIFO depth and transaction size support into two patches
>   * Add kernel-doc for new struct members
>   * Make `fifo_depth` struct field u32 so it can be directly used with
>     `of_property_read_u32()` API
> ---
>   drivers/i2c/busses/i2c-cadence.c | 29 +++++++++++++++++------------
>   1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 93c6d0822468..0834e1ac9d03 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -114,7 +114,7 @@
>   /* timeout for pm runtime autosuspend */
>   #define CNDS_I2C_PM_TIMEOUT		1000	/* ms */
>   
> -#define CDNS_I2C_FIFO_DEPTH		16
> +#define CDNS_I2C_FIFO_DEPTH_DEFAULT	16
>   #define CDNS_I2C_MAX_TRANSFER_SIZE	255
>   /* Transfer size in multiples of data interrupt depth */
>   #define CDNS_I2C_TRANSFER_SIZE	(CDNS_I2C_MAX_TRANSFER_SIZE - 3)
> @@ -184,6 +184,7 @@ enum cdns_i2c_slave_state {
>    * @slave:		Registered slave instance.
>    * @dev_mode:		I2C operating role(master/slave).
>    * @slave_state:	I2C Slave state(idle/read/write).
> + * @fifo_depth:		The depth of the transfer FIFO
>    */
>   struct cdns_i2c {
>   	struct device		*dev;
> @@ -211,6 +212,7 @@ struct cdns_i2c {
>   	enum cdns_i2c_mode dev_mode;
>   	enum cdns_i2c_slave_state slave_state;
>   #endif
> +	u32 fifo_depth;
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
> +			if (((int)(id->recv_count) - id->fifo_depth) >
>   			    CDNS_I2C_TRANSFER_SIZE) {
>   				cdns_i2c_writereg(CDNS_I2C_TRANSFER_SIZE,
>   						  CDNS_I2C_XFER_SIZE_OFFSET);
>   				id->curr_recv_count = CDNS_I2C_TRANSFER_SIZE +
> -						      CDNS_I2C_FIFO_DEPTH;
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
> @@ -612,7 +614,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>   	}
>   
>   	/* Determine hold_clear based on number of bytes to receive and hold flag */
> -	if (!id->bus_hold_flag && id->recv_count <= CDNS_I2C_FIFO_DEPTH) {
> +	if (!id->bus_hold_flag && id->recv_count <= id->fifo_depth) {
>   		if (ctrl_reg & CDNS_I2C_CR_HOLD) {
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
> @@ -1316,6 +1318,9 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   #endif
>   	id->ctrl_reg = CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | CDNS_I2C_CR_MS;
>   
> +	id->fifo_depth = CDNS_I2C_FIFO_DEPTH_DEFAULT;
> +	of_property_read_u32(pdev->dev.of_node, "fifo-depth", &id->fifo_depth);
> +
>   	ret = cdns_i2c_setclk(id->input_clk, id);
>   	if (ret) {
>   		dev_err(&pdev->dev, "invalid SCL clock: %u Hz\n", id->i2c_clk);

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
