Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802CE6C0E6D
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 11:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjCTKN6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Mar 2023 06:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbjCTKN4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Mar 2023 06:13:56 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2379810AB7;
        Mon, 20 Mar 2023 03:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5GK/iBBjMiLYoF4b8Q+adNkpbeQUON0Ku/SNh70/jJ0J0w7fkhFAZ/VFhoVztmsEJsDetqtmj4dWqnvJ1ioTCkUOmm02mAhBQDmEhByIgPwQtcUxSR2vtpYg+WOPhTDUqQmyIco6W77lix4uQkuOQjLwCctvHhZuNzBBN855kGCD3YaJM718Q3D1ufuAIdhUzToRYXHV02w8AXfeB0ay7LvG7jincZuBgXX9vvYTWbJlN6hzsLoZz3n7E94D7KNWvFEmBd8FCCuoH79Y/E8jjvefMnRhI7SdJhBQBLLPDoDN1bmjy4EUZj+bhpFldNYdfIl2Iq+/d4JWqzPcwKxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SG+aSkO2ANTGgzIgXK5/jOposRNaDYMorFWD5D0nIMQ=;
 b=hNuwZJLAOWlbSEOjS9R0KwHyNVOYfg4lONlwynazBuHMAaGNQcjNDEqY7MeqZLJdnIfNGSAoamXOYGTaxklnpaTNKKWLGCl+tavhHMUHrdHvLMShPFNC8eIGVuav7SbEv6ZbHZCaxpIQJRX0p60uMkYfYbQ8afi8CU+e+47xXlOK0WMlkrlJTJZckT/de3QVBNS3yM3LMclfKylEYcZuOgy6M6q0bSJ1W0fIcDLNRYg83DV4GGRvuLyp9fsLwDnor9A5rh0N/qALxpBwp4a5386b3puejz6hnNgJreVPMRT4MQP0mVULQ2jUbuc7l8QP4HDgdV/IOE1xJgVrB3BDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SG+aSkO2ANTGgzIgXK5/jOposRNaDYMorFWD5D0nIMQ=;
 b=g+Cds/jEIoU+EFH3/E8BRcIf3fqLvQUv2HrzDuj/JgRa4+xO+R5wlDF4RIZpqV6gwZhiF+FOjmT98HuY5oRjyphPCKMdmW2tDIEwqqd1gJ3g9saPSxqYw0oB7lgn/LrUZ/jIbYK/8+giuwqfBnzeN8asLE/S2UxU03IRm2bfnls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 10:13:52 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::4d07:7f52:c833:9603%6]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 10:13:52 +0000
Message-ID: <b498e1d9-6080-4867-2a4f-f2ed13b5f3d6@amd.com>
Date:   Mon, 20 Mar 2023 11:13:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/3] i2c: cadence: Detect maximum transfer size
Content-Language: en-US
To:     Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Cc:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20230317145441.156880-1-lars@metafoo.de>
 <20230317145441.156880-3-lars@metafoo.de>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230317145441.156880-3-lars@metafoo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0901CA0089.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::15) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: e0616a03-4f6e-48cd-bbe1-08db292bce59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cJsHJQkVdz1w8hETYEZM9/vb+LcvH1lv1GwU2P9iIdvxkYTWmXlXrPEn1HuHcV0Sin2HyAD0vYgXnmknXeF2K2wXuoGIQYCQ4UAbJsiVR+pMw6k/Tv4I2x1w+7cynWTE5jCmNT9qOv54mNAOowNyiaYes7Bs4Cj4X5AFnEzAYqb21bot0YdsSxKdUdF6bxhSwJIGSeza8HgqjzK1jGDAT+ULUktnezcX35wHZru3rzOgdi/RccxNikfzKvVyRK9v5u/kE+v659C+10XA7G+VwczERZCQRUOW4n3bDclpjuCPWgPepeBGSrsIieW6WL0RVtQbuQA7rzKgjjqaO3EiGkwJZhxk0ZMBozV77zBOxyjUFQIqv2pnfPemyIgaR92TkqFgetEzEfxtLwhOOcAtzSLhjLk6orT4i3cwbD5ksHZMjPGxxFsTnnSIm5fiwLmUZeOv6nqMLfoaxGgtFLL9NK40iaImGGlHWJgWRmV7bk7p/PdGAak6N/yh8TcQBT1ZjHnfr5iJvVLng5n8PTfSsu3rjsQKoIw0jxlT4FopBR+fXMShFb8OySkAYXOJMjEIhWzeVtpePjsfF3U3SRKJ1FGzAYcop5uuERiKtCrxC9NRs6qMTpwaspOYddeucadrROOfYyp+0RqUohWTX6Wwn9vcxhvL6GMUlBfqXrZXIB9IR0k23cRftIq0CHED11IayixmhlVJ7CXdgO8/AuiDIvHVDeLUyFA2SFIJNawssYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199018)(2616005)(186003)(6486002)(4326008)(53546011)(478600001)(83380400001)(6666004)(54906003)(316002)(110136005)(66946007)(66556008)(66476007)(6506007)(26005)(6512007)(31686004)(8676002)(41300700001)(8936002)(5660300002)(44832011)(38100700002)(2906002)(86362001)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUZ1TGJITitHS0EwckZxQnhYeHlpTXluUVhKS0JxaDU4YVFkRi91WkhGeHU0?=
 =?utf-8?B?akVZbUNUQTVRR0owNitrbEZzZ3ZWKzBMbGYxd05TUERJT0xHQmF1YjJZQ2xw?=
 =?utf-8?B?bFBDZy8yaFI4aXM4by9zTjlHR21kenl6TjBOSFVUWU1ITXI5Mk1ZR3loZExD?=
 =?utf-8?B?RlhOckV0WVZkVlhpUXJmZmpjRVhqTVFsbW1yQUY5U0xpK3RSUDNKbWVjOGZK?=
 =?utf-8?B?amQyZG56a1VBZEVTZGxQR2p4bS9tRVdGU1dUR2FncWpRZGNadEVZTDJCNVda?=
 =?utf-8?B?UW9kYS9sWTZEMUVMTzd2Yk53RDhJd2FsMUtSUGhINUQ0VHQ5end0SUxWYUNP?=
 =?utf-8?B?SGV1RVR5dm5HcklVM2V4QjZWMWlkMGtMb1puMUxoMmV4NWRydHFTc3Z1Mjhn?=
 =?utf-8?B?SHVmMU05ZStkeFRtQkdFL0phUVVxbldHZnc5dXpuTDY3UXVlZjZJT3JWUmNF?=
 =?utf-8?B?NXQ0WFNCY1JxdmJyTWdaeVRPMWEyTG4zVlN4N0FsSHlzVWVkbVhKOXUweTJL?=
 =?utf-8?B?MnJBSzJwQzRuMFMrRkFCVWo3RFF1UUVvSDIwdHNuekFmbzlidTFxUGExTUlC?=
 =?utf-8?B?RjlpRnhVOCtPOGJDbFN4Y3d6OG1lM3hlajlBTXZBa2hoeFJTaUdPaU0rYjhp?=
 =?utf-8?B?bDR4TXlhY2ZQSTdwMmVBZ3BjUDljellDN3VOWUxuT1ZoTDVPUzAwS2NQdFZv?=
 =?utf-8?B?MUdibi84Y0hhOFNEYm84ZGN2WkZjZjFDN2NmcjhCT1BlbkExTTN3aEVKOGdt?=
 =?utf-8?B?RU9wamFuYUZ5clB4M2dlWkljUEVWamxrU2V4N251Mnc3dFh2a0lTM1A5czB1?=
 =?utf-8?B?MEVKL01IcElMR29LZkYyYUgweVZTbzhVcU56V0grcWowazRMaGxiUVIrUE5l?=
 =?utf-8?B?NDFCMXMwN2lKaG1kRjA2ek92cGRNdU15Ym5wRmtZclNCbnpNWXpIbXkxTFpx?=
 =?utf-8?B?bGlkMExQRFBiSFgzUUlpbzhzdDcwdzJsUjUwekpRZDk4a0xDaU5DOHZ2eWxO?=
 =?utf-8?B?RFNlbDU1MHNLR0ZUY1lLcy9WZ0RNYm9FVFFXVnRQZW05Ymh0YWJtazhDZklX?=
 =?utf-8?B?Y01PcFNUc3F6aHhZOUZXNUJUMWhzSjlTTEtjWEJaL2hwOE10dnNRRUlXc0lu?=
 =?utf-8?B?Z3RiY2pqZXVqR1ZBVVYwV24zQnlUSzlsblowRHkrMXM0cTEvbUJTK1FYSmVk?=
 =?utf-8?B?TE9HTnQvTG5PaWpoRjJtaUh1SXI0dkRHcHpoOEVmYnBUbUFCY2JWUzhnRldW?=
 =?utf-8?B?TUk2T3Voam14M21HcnV6anlYWHB3clFoOE5jc0dqWDFNNGdFQ1F3WHh4enRT?=
 =?utf-8?B?SXNvb2hRbDVoZkRUNTRxQlBITmI1M2hVMzMwM2o2WE01ZDRWOW11UFUydEpJ?=
 =?utf-8?B?RzRteGxKaVFQalAvblFwUUwyT3dXMGUwbVdoMlBTWFUyZXRHdkV4MHQxaHRo?=
 =?utf-8?B?cnd3WksyYTZQbG9JeTA3Y0JnUVhOZWUyQTAzYSt1UTFlY0djZzRGeTkvVmJC?=
 =?utf-8?B?dkZrUGxWWWplalhpNEVXeVNiSGhDSFdpUXBqZjV3ZEJ1dVUrRzk5Uk5Fek0v?=
 =?utf-8?B?V0dIZ1hWQnVoYWxjUnozcTNQajRvQlVCKzdESW1GdGEzNDNHU2E5dUtUSG9p?=
 =?utf-8?B?WWtLQzFrcjJiRDQ5dmkrWDFveU9mS2JCWmh1T3NXVHAxMDBOS2thT3kvc1l0?=
 =?utf-8?B?NVhjaG1uSTJya2xZWUVVQ0dTRGRUcThsdUxsZ3ViazhQU21IN0RmTS9qSEM0?=
 =?utf-8?B?TEI3cEdvTU5qaG9BSS9SUjdRbTJYM0hPRHZmV1hlVVdHNjdNSUNxdjJQdUZs?=
 =?utf-8?B?N01oNUg2ZmJyTHZ2L0lhc2J2Ym9kYjl1SFN6ZDA1a3ZTRi95WHlIOWsweGlw?=
 =?utf-8?B?S2RFYXVHQ1JsRDRSUTlnWDBwVUVkWXRpOUhrUXdPYzBtc2g0dU5QcFAvcUps?=
 =?utf-8?B?NmpNRUk0eDFwbmVrdHVPbjhQY2llbFFWV0o0bDRwZE5TMzdDYWI4b04yUmFy?=
 =?utf-8?B?bjBad3pXU0pzYWRCYzRYNkZSVytQSlZaMnd6dkhBYm55czdoZFFyTDQxQmd5?=
 =?utf-8?B?cDg5ZmdjMHVVeDlxcUpwdGlxOFhDYzliWEFTbEhsa1VoNVFKTDlvcER5NmtT?=
 =?utf-8?Q?183xEWDyd0eSTdBYlJRvMPt6+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0616a03-4f6e-48cd-bbe1-08db292bce59
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 10:13:52.6314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAU5tIrdaP7T7TEaL3Uk8rDFQ6IxM0RqGSrGuGhBEh+mYZUguNE1FQF5IO1ovFUi
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
> The maximum transfer length is a synthesis configuration parameters of the
> Cadence I2C IP. Different SoCs might use different values for these
> parameters.
> 
> Currently the driver has the maximum transfer length hardcoded to 255.
> Trying to use the driver with an IP instance that uses smaller values for
> these will work for short transfers. But longer transfers will fail.
> 
> The maximum transfer length can easily be detected at runtime since the
> unused MSBs of the transfer length register are hardwired to 0. Writing
> 0xff and then reading back the value will give the maximum transfer length.
> 
> These changes have been tested with
>    1) The Xilinx MPSoC for which this driver was originally written which
>        has the previous hardcoded settings of 16 and 255.
>    2) Another instance of the Cadence I2C IP with FIFO depth of 8 and
>       maximum transfer length of 16.
> 
> Without these changes the latter would fail for I2C transfers longer than
> 16. With the updated driver both work fine even for longer transfers.
> 
> Note that the IP core and driver support chaining multiple transfers into a
> single longer transfer using the HOLD bit. So the maximum transfer size is
> not the limit for the length of the I2C transfer, but the limit for how
> much data can be transferred without having to reprogram the control
> registers.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
> Changes since v1:
>   * Split dynamic FIFO depth and transaction size support into two patches
>   * Add kernel-doc for new struct members
> ---
>   drivers/i2c/busses/i2c-cadence.c | 49 +++++++++++++++++++++++++++-----
>   1 file changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 0834e1ac9d03..8f61a633c42c 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -117,7 +117,7 @@
>   #define CDNS_I2C_FIFO_DEPTH_DEFAULT	16
>   #define CDNS_I2C_MAX_TRANSFER_SIZE	255
>   /* Transfer size in multiples of data interrupt depth */
> -#define CDNS_I2C_TRANSFER_SIZE	(CDNS_I2C_MAX_TRANSFER_SIZE - 3)
> +#define CDNS_I2C_TRANSFER_SIZE(max)	((max) - 3)
>   
>   #define DRIVER_NAME		"cdns-i2c"
>   
> @@ -185,6 +185,7 @@ enum cdns_i2c_slave_state {
>    * @dev_mode:		I2C operating role(master/slave).
>    * @slave_state:	I2C Slave state(idle/read/write).
>    * @fifo_depth:		The depth of the transfer FIFO
> + * @transfer_size:	The maximum number of bytes in one transfer
>    */
>   struct cdns_i2c {
>   	struct device		*dev;
> @@ -213,6 +214,7 @@ struct cdns_i2c {
>   	enum cdns_i2c_slave_state slave_state;
>   #endif
>   	u32 fifo_depth;
> +	unsigned int transfer_size;
>   };
>   
>   struct cdns_platform_data {
> @@ -466,10 +468,10 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
>   			 * transfer size and update register accordingly.
>   			 */
>   			if (((int)(id->recv_count) - id->fifo_depth) >
> -			    CDNS_I2C_TRANSFER_SIZE) {
> -				cdns_i2c_writereg(CDNS_I2C_TRANSFER_SIZE,
> +			    id->transfer_size) {
> +				cdns_i2c_writereg(id->transfer_size,
>   						  CDNS_I2C_XFER_SIZE_OFFSET);
> -				id->curr_recv_count = CDNS_I2C_TRANSFER_SIZE +
> +				id->curr_recv_count = id->transfer_size +
>   						      id->fifo_depth;
>   			} else {
>   				cdns_i2c_writereg(id->recv_count -
> @@ -605,10 +607,10 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
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
> @@ -1227,6 +1229,37 @@ static const struct of_device_id cdns_i2c_of_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, cdns_i2c_of_match);
>   
> +/**
> + * cdns_i2c_detect_transfer_size - Detect the maximum transfer size supported
> + * @id: Device private data structure
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
> +
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
> @@ -1321,6 +1354,8 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>   	id->fifo_depth = CDNS_I2C_FIFO_DEPTH_DEFAULT;
>   	of_property_read_u32(pdev->dev.of_node, "fifo-depth", &id->fifo_depth);
>   
> +	cdns_i2c_detect_transfer_size(id);
> +
>   	ret = cdns_i2c_setclk(id->input_clk, id);
>   	if (ret) {
>   		dev_err(&pdev->dev, "invalid SCL clock: %u Hz\n", id->i2c_clk);


Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

